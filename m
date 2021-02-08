Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81585313486
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:08:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38406C57B63;
	Mon,  8 Feb 2021 14:08:38 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 222D4C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:08:34 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:08:17 +0300
Message-ID: <20210208140820.10410-14-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 13/16] net: stmmac: Request IRQs at device
	probe stage
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Normally all DW *MAC IRQs are signalled by a single lane called
sbd_intr_o. It is used to raise MAC, DMA, MMC, PMT, GPIO, etc interrupts.
Most of those IRQs are connected with the networking activity of the
controller, so it's ok to have the IRQs setup only while the network is up
and running. But DW MAC GPIOs in general act as an independent signalling
interface, so its interrupts must be handled no matter whether the NIC is
configured or not. In that case the IRQs must be configured on the probe
stage (before DW MAC GPIO chip is registered), which has been provided in
the framework of this commit.

This modification requires a more careful work with the DW MAC network-
related interrupts. They have to be enabled only while the network
interface is opened, and disabled otherwise. Moreover since the interrupts
can be raised by some unrelated source via GPIs, which could be also
marked as system-wake capable, PMT/WoL events are allowed to be
forwarded to the PM-subsystem only when the STMMAC_UP flag is set.

Note by moving the IRQs setup procedure to the probe method we not only
make the code cleaner but also speed up the network interface
initialization/de-initialization process.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 157 +++++++++++-------
 1 file changed, 96 insertions(+), 61 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c4c41b554c6a..d75c851721f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2810,9 +2810,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
 	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
 
-	/* Enable MAC/MTL/DMA/etc IRQs */
-	stmmac_enable_irq(priv);
-
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
@@ -2825,8 +2822,6 @@ static void stmmac_hw_teardown(struct net_device *dev)
 
 	stmmac_stop_all_dma(priv);
 
-	stmmac_disable_irq(priv);
-
 	stmmac_release_ptp(priv);
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
@@ -2929,57 +2924,13 @@ static int stmmac_open(struct net_device *dev)
 	/* We may have called phylink_speed_down before */
 	phylink_speed_up(priv->phylink);
 
-	/* Request the IRQ lines */
-	ret = request_irq(dev->irq, stmmac_interrupt,
-			  IRQF_SHARED, dev->name, dev);
-	if (unlikely(ret < 0)) {
-		netdev_err(priv->dev,
-			   "%s: ERROR: allocating the IRQ %d (error: %d)\n",
-			   __func__, dev->irq, ret);
-		goto irq_error;
-	}
-
-	/* Request the Wake IRQ in case of another line is used for WoL */
-	if (priv->wol_irq != dev->irq) {
-		ret = request_irq(priv->wol_irq, stmmac_interrupt,
-				  IRQF_SHARED, dev->name, dev);
-		if (unlikely(ret < 0)) {
-			netdev_err(priv->dev,
-				   "%s: ERROR: allocating the WoL IRQ %d (%d)\n",
-				   __func__, priv->wol_irq, ret);
-			goto wolirq_error;
-		}
-	}
-
-	/* Request the IRQ lines */
-	if (priv->lpi_irq > 0) {
-		ret = request_irq(priv->lpi_irq, stmmac_interrupt, IRQF_SHARED,
-				  dev->name, dev);
-		if (unlikely(ret < 0)) {
-			netdev_err(priv->dev,
-				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
-				   __func__, priv->lpi_irq, ret);
-			goto lpiirq_error;
-		}
-	}
+	stmmac_enable_irq(priv);
 
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 
 	return 0;
 
-lpiirq_error:
-	if (priv->wol_irq != dev->irq)
-		free_irq(priv->wol_irq, dev);
-wolirq_error:
-	free_irq(dev->irq, dev);
-irq_error:
-	phylink_stop(priv->phylink);
-
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
-
-	stmmac_hw_teardown(dev);
 init_error:
 	free_dma_desc_resources(priv);
 dma_desc_error:
@@ -3009,12 +2960,8 @@ static int stmmac_release(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
 
-	/* Free the IRQ lines */
-	free_irq(dev->irq, dev);
-	if (priv->wol_irq != dev->irq)
-		free_irq(priv->wol_irq, dev);
-	if (priv->lpi_irq > 0)
-		free_irq(priv->lpi_irq, dev);
+	/* Disable the network IRQs */
+	stmmac_disable_irq(priv);
 
 	if (priv->eee_enabled) {
 		priv->tx_path_in_lpi_mode = false;
@@ -4252,19 +4199,21 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 	u32 queue;
 	bool xmac;
 
-	xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
-	queues_count = (rx_cnt > tx_cnt) ? rx_cnt : tx_cnt;
+	/* Check if adapter is up */
+	if (!stmmac_is_up(priv))
+		return IRQ_HANDLED;
 
+	/* Wake up the system if PMT is available and has been enabled */
 	if (priv->irq_wake)
 		pm_wakeup_event(priv->device, 0);
 
-	/* Check if adapter is up */
-	if (!stmmac_is_up(priv))
-		return IRQ_HANDLED;
 	/* Check if a fatal error happened */
 	if (stmmac_safety_feat_interrupt(priv))
 		return IRQ_HANDLED;
 
+	xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
+	queues_count = (rx_cnt > tx_cnt) ? rx_cnt : tx_cnt;
+
 	/* To handle GMAC own interrupts */
 	if ((priv->plat->has_gmac) || xmac) {
 		int status = stmmac_host_irq_status(priv, priv->hw, &priv->xstats);
@@ -4306,6 +4255,76 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/**
+ * stmmac_request_irq - request DW MAC IRQs
+ * @priv: driver private structure
+ * Description : setup the ISR for all available interrupt signals.
+ *  Return value:
+ *  0 on success and an appropriate (-)ve integer as defined in errno.h
+ *  file on failure.
+ */
+static int stmmac_request_irq(struct stmmac_priv *priv)
+{
+	struct net_device *dev = priv->dev;
+	int ret;
+
+	ret = request_irq(dev->irq, stmmac_interrupt,
+			  IRQF_SHARED, dev->name, dev);
+	if (unlikely(ret < 0)) {
+		netdev_err(priv->dev,
+			   "%s: ERROR: allocating the IRQ %d (error: %d)\n",
+			   __func__, dev->irq, ret);
+		return ret;
+	}
+
+	if (priv->wol_irq != dev->irq) {
+		ret = request_irq(priv->wol_irq, stmmac_interrupt,
+				  IRQF_SHARED, dev->name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: ERROR: allocating the WoL IRQ %d (%d)\n",
+				   __func__, priv->wol_irq, ret);
+			goto wolirq_error;
+		}
+	}
+
+	if (priv->lpi_irq > 0) {
+		ret = request_irq(priv->lpi_irq, stmmac_interrupt, IRQF_SHARED,
+				  dev->name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
+				   __func__, priv->lpi_irq, ret);
+			goto lpiirq_error;
+		}
+	}
+
+	return 0;
+
+lpiirq_error:
+	if (priv->wol_irq != dev->irq)
+		free_irq(priv->wol_irq, dev);
+
+wolirq_error:
+	free_irq(dev->irq, dev);
+
+	return ret;
+}
+
+/**
+ * stmmac_request_irq - free DW MAC IRQs
+ * @priv: driver private structure
+ * Description : free the main/WoL/LPI IRQs.
+ */
+static void stmmac_free_irq(struct stmmac_priv *priv)
+{
+	free_irq(priv->dev->irq, priv->dev);
+	if (priv->wol_irq != priv->dev->irq)
+		free_irq(priv->wol_irq, priv->dev);
+	if (priv->lpi_irq > 0)
+		free_irq(priv->lpi_irq, priv->dev);
+}
+
 #ifdef CONFIG_NET_POLL_CONTROLLER
 /* Polling receive - used by NETCONSOLE and other diagnostic tools
  * to allow network I/O with interrupts disabled.
@@ -4906,6 +4925,13 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			 "Enable RX Mitigation via HW Watchdog Timer\n");
 	}
 
+	/* Disable all the device IRQs on HW initialization stage in case if
+	 * the NIC has been used by another software before the kernel and
+	 * the reset control capability isn't provided so further IRQs setup
+	 * wouldn't end up with handling spurious interrupts.
+	 */
+	stmmac_disable_irq(priv);
+
 	return 0;
 }
 
@@ -5190,6 +5216,10 @@ int stmmac_dvr_probe(struct device *device,
 
 	stmmac_check_pcs_mode(priv);
 
+	ret = stmmac_request_irq(priv);
+	if (ret)
+		goto error_request_irq;
+
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI) {
 		/* MDIO bus Registration */
@@ -5238,6 +5268,8 @@ int stmmac_dvr_probe(struct device *device,
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
 error_mdio_register:
+	stmmac_free_irq(priv);
+error_request_irq:
 	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);
@@ -5274,6 +5306,7 @@ int stmmac_dvr_remove(struct device *dev)
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
+	stmmac_free_irq(priv);
 	reset_control_assert(priv->plat->stmmac_rst);
 	destroy_workqueue(priv->wq);
 	mutex_destroy(&priv->lock);
@@ -5440,6 +5473,8 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
 
+	stmmac_enable_irq(priv);
+
 	stmmac_enable_all_queues(priv);
 
 	mutex_unlock(&priv->lock);
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
