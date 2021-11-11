Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4EC44D865
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 15:34:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCB64C5EC72;
	Thu, 11 Nov 2021 14:34:39 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7F99C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 14:34:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="256624653"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="256624653"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492560933"
Received: from glass.png.intel.com ([10.158.65.203])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:34:29 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alexandre.torgue@foss.st.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Thu, 11 Nov 2021 22:39:49 +0800
Message-Id: <20211111143949.2806049-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enhance XDP ZC
	driver level switching performance
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

The previous stmmac_xdp_set_prog() implementation uses stmmac_release()
and stmmac_open() which tear down the PHY device and causes undesirable
autonegotiation which causes a delay whenever AFXDP ZC is setup.

This patch introduces two new functions that just sufficiently tear
down DMA descriptors, buffer, NAPI process, and IRQs and reestablish
them accordingly in both stmmac_xdp_release() and stammac_xdp_open().

As the results of this enhancement, we get rid of transient state
introduced by the link auto-negotiation:

$ ./xdpsock -i eth0 -t -z

 sock0@eth0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 634444         634560

 sock0@eth0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 632330         1267072

 sock0@eth0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 632438         1899584

 sock0@eth0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 632502         2532160

Reported-by: Kurt Kanzenbach <kurt@linutronix.de>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 137 +++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   4 +-
 3 files changed, 139 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 43eead726886..dd7adf9b2537 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -316,8 +316,8 @@ void stmmac_set_ethtool_ops(struct net_device *netdev);
 
 void stmmac_ptp_register(struct stmmac_priv *priv);
 void stmmac_ptp_unregister(struct stmmac_priv *priv);
-int stmmac_open(struct net_device *dev);
-int stmmac_release(struct net_device *dev);
+int stmmac_xdp_open(struct net_device *dev);
+void stmmac_xdp_release(struct net_device *dev);
 int stmmac_resume(struct device *dev);
 int stmmac_suspend(struct device *dev);
 int stmmac_dvr_remove(struct device *dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d3f350c25b9b..033c35c09a54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3643,7 +3643,7 @@ static int stmmac_request_irq(struct net_device *dev)
  *  0 on success and an appropriate (-)ve integer as defined in errno.h
  *  file on failure.
  */
-int stmmac_open(struct net_device *dev)
+static int stmmac_open(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int mode = priv->plat->phy_interface;
@@ -3767,7 +3767,7 @@ static void stmmac_fpe_stop_wq(struct stmmac_priv *priv)
  *  Description:
  *  This is the stop entry point of the driver.
  */
-int stmmac_release(struct net_device *dev)
+static int stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
@@ -6429,6 +6429,139 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 	spin_unlock_irqrestore(&ch->lock, flags);
 }
 
+void stmmac_xdp_release(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u32 chan;
+
+	/* Disable NAPI process */
+	stmmac_disable_all_queues(priv);
+
+	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
+
+	/* Free the IRQ lines */
+	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+
+	/* Stop TX/RX DMA channels */
+	stmmac_stop_all_dma(priv);
+
+	/* Release and free the Rx/Tx resources */
+	free_dma_desc_resources(priv);
+
+	/* Disable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, false);
+
+	/* set trans_start so we don't get spurious
+	 * watchdogs during reset
+	 */
+	netif_trans_update(dev);
+	netif_carrier_off(dev);
+}
+
+int stmmac_xdp_open(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u32 rx_cnt = priv->plat->rx_queues_to_use;
+	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	u32 dma_csr_ch = max(rx_cnt, tx_cnt);
+	struct stmmac_rx_queue *rx_q;
+	struct stmmac_tx_queue *tx_q;
+	u32 buf_size;
+	bool sph_en;
+	u32 chan;
+	int ret;
+
+	ret = alloc_dma_desc_resources(priv);
+	if (ret < 0) {
+		netdev_err(dev, "%s: DMA descriptors allocation failed\n",
+			   __func__);
+		goto dma_desc_error;
+	}
+
+	ret = init_dma_desc_rings(dev, GFP_KERNEL);
+	if (ret < 0) {
+		netdev_err(dev, "%s: DMA descriptors initialization failed\n",
+			   __func__);
+		goto init_error;
+	}
+
+	/* DMA CSR Channel configuration */
+	for (chan = 0; chan < dma_csr_ch; chan++)
+		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
+
+	/* Adjust Split header */
+	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
+
+	/* DMA RX Channel Configuration */
+	for (chan = 0; chan < rx_cnt; chan++) {
+		rx_q = &priv->rx_queue[chan];
+
+		stmmac_init_rx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
+				    rx_q->dma_rx_phy, chan);
+
+		rx_q->rx_tail_addr = rx_q->dma_rx_phy +
+				     (rx_q->buf_alloc_num *
+				      sizeof(struct dma_desc));
+		stmmac_set_rx_tail_ptr(priv, priv->ioaddr,
+				       rx_q->rx_tail_addr, chan);
+
+		if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
+			buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
+			stmmac_set_dma_bfsize(priv, priv->ioaddr,
+					      buf_size,
+					      rx_q->queue_index);
+		} else {
+			stmmac_set_dma_bfsize(priv, priv->ioaddr,
+					      priv->dma_buf_sz,
+					      rx_q->queue_index);
+		}
+
+		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
+	}
+
+	/* DMA TX Channel Configuration */
+	for (chan = 0; chan < tx_cnt; chan++) {
+		tx_q = &priv->tx_queue[chan];
+
+		stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
+				    tx_q->dma_tx_phy, chan);
+
+		tx_q->tx_tail_addr = tx_q->dma_tx_phy;
+		stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
+				       tx_q->tx_tail_addr, chan);
+	}
+
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
+	/* Start Rx & Tx DMA Channels */
+	stmmac_start_all_dma(priv);
+
+	stmmac_init_coalesce(priv);
+
+	ret = stmmac_request_irq(dev);
+	if (ret)
+		goto irq_error;
+
+	/* Enable NAPI process*/
+	stmmac_enable_all_queues(priv);
+	netif_carrier_on(dev);
+	netif_tx_start_all_queues(dev);
+
+	return 0;
+
+irq_error:
+	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
+
+	stmmac_hw_teardown(dev);
+init_error:
+	free_dma_desc_resources(priv);
+dma_desc_error:
+	return ret;
+}
+
 int stmmac_xsk_wakeup(struct net_device *dev, u32 queue, u32 flags)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index 2a616c6f7cd0..9d4d8c3dad0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -119,7 +119,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 
 	need_update = !!priv->xdp_prog != !!prog;
 	if (if_running && need_update)
-		stmmac_release(dev);
+		stmmac_xdp_release(dev);
 
 	old_prog = xchg(&priv->xdp_prog, prog);
 	if (old_prog)
@@ -129,7 +129,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 	priv->sph = priv->sph_cap && !stmmac_xdp_is_enabled(priv);
 
 	if (if_running && need_update)
-		stmmac_open(dev);
+		stmmac_xdp_open(dev);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
