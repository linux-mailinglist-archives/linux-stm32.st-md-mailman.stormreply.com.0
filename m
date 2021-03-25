Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D034985E
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 18:39:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52021C57B78;
	Thu, 25 Mar 2021 17:39:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F80FC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 17:39:32 +0000 (UTC)
IronPort-SDR: KMHHvwoh20bl7i8XwYeEkREuEozNdrzn3J2GdVr0FRVB7/DodVRkTmQNkbIeiHOirtflItLI+Q
 wIkOJ/VDeaTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="187681968"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="187681968"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 10:39:31 -0700
IronPort-SDR: idDEw6/SLDRBSfuUo9zkdddEyF/KbB7bFcOQUOTvCGZqB1Nc1z3SDIM3+voY4f2L1dDS5byivf
 bPb0NwBbKuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="416112312"
Received: from climb.png.intel.com ([10.221.118.165])
 by orsmga008.jf.intel.com with ESMTP; 25 Mar 2021 10:39:28 -0700
From: Voon Weifeng <weifeng.voon@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 26 Mar 2021 01:39:14 +0800
Message-Id: <20210325173916.13203-4-weifeng.voon@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325173916.13203-1-weifeng.voon@intel.com>
References: <20210325173916.13203-1-weifeng.voon@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 3/5] net: stmmac: introduce MSI
	Interrupt routines for mac, safety, RX & TX
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Ong Boon Leong <boon.leong.ong@intel.com>

Now we introduce MSI interrupt service routines and hook these routines
up if stmmac_open() sees valid irq line being requested:-

stmmac_mac_interrupt()    :- MAC (dev->irq), WOL (wol_irq), LPI (lpi_irq)
stmmac_safety_interrupt() :- Safety Feat Correctible Error (sfty_ce_irq)
                             & Uncorrectible Error (sfty_ue_irq)
stmmac_msi_intr_rx()      :- For all RX MSI irq (rx_irq)
stmmac_msi_intr_tx()      :- For all TX MSI irq (tx_irq)

Each of IRQs will have its unique name so that we can differentiate
them easily under /proc/interrupts.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
---
Changes:
v1 -> v2
 - Refactor out a huge if statement into separate subfunctions.
 - Removed the netdev_info for every successful request of IRQs.
 - Return 0 for each successful request of IRQs.
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  15 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 437 ++++++++++++++++--
 include/linux/stmmac.h                        |   8 +
 4 files changed, 431 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 5afb36a5c94c..c54a56b732b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -259,6 +259,9 @@ struct stmmac_safety_stats {
 #define DMA_HW_FEAT_ACTPHYIF	0x70000000	/* Active/selected PHY iface */
 #define DEFAULT_DMA_PBL		8
 
+/* MSI defines */
+#define STMMAC_MSI_VEC_MAX	32
+
 /* PCS status and mask defines */
 #define	PCS_ANE_IRQ		BIT(2)	/* PCS Auto-Negotiation */
 #define	PCS_LINK_IRQ		BIT(1)	/* PCS Link */
@@ -315,6 +318,18 @@ enum dma_irq_dir {
 	DMA_DIR_RXTX = 0x3,
 };
 
+enum request_irq_err {
+	REQ_IRQ_ERR_ALL,
+	REQ_IRQ_ERR_TX,
+	REQ_IRQ_ERR_RX,
+	REQ_IRQ_ERR_SFTY_UE,
+	REQ_IRQ_ERR_SFTY_CE,
+	REQ_IRQ_ERR_LPI,
+	REQ_IRQ_ERR_WOL,
+	REQ_IRQ_ERR_MAC,
+	REQ_IRQ_ERR_NO,
+};
+
 /* EEE and LPI defines */
 #define	CORE_IRQ_TX_PATH_IN_LPI_MODE	(1 << 0)
 #define	CORE_IRQ_TX_PATH_EXIT_LPI_MODE	(1 << 1)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4faad331a4ca..9966f6f10905 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -30,6 +30,10 @@ struct stmmac_resources {
 	int wol_irq;
 	int lpi_irq;
 	int irq;
+	int sfty_ce_irq;
+	int sfty_ue_irq;
+	int rx_irq[MTL_MAX_RX_QUEUES];
+	int tx_irq[MTL_MAX_TX_QUEUES];
 };
 
 struct stmmac_tx_info {
@@ -225,6 +229,18 @@ struct stmmac_priv {
 	void __iomem *mmcaddr;
 	void __iomem *ptpaddr;
 	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
+	int sfty_ce_irq;
+	int sfty_ue_irq;
+	int rx_irq[MTL_MAX_RX_QUEUES];
+	int tx_irq[MTL_MAX_TX_QUEUES];
+	/*irq name */
+	char int_name_mac[IFNAMSIZ + 9];
+	char int_name_wol[IFNAMSIZ + 9];
+	char int_name_lpi[IFNAMSIZ + 9];
+	char int_name_sfty_ce[IFNAMSIZ + 10];
+	char int_name_sfty_ue[IFNAMSIZ + 10];
+	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
+	char int_name_tx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 18];
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dbgfs_dir;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index abe990b9b07b..459477db455c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -105,6 +105,11 @@ module_param(chain_mode, int, 0444);
 MODULE_PARM_DESC(chain_mode, "To use chain instead of ring mode");
 
 static irqreturn_t stmmac_interrupt(int irq, void *dev_id);
+/* For MSI interrupts handling */
+static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id);
+static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id);
+static irqreturn_t stmmac_msi_intr_tx(int irq, void *data);
+static irqreturn_t stmmac_msi_intr_rx(int irq, void *data);
 
 #ifdef CONFIG_DEBUG_FS
 static const struct net_device_ops stmmac_netdev_ops;
@@ -2986,6 +2991,260 @@ static void stmmac_hw_teardown(struct net_device *dev)
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
 
+static void stmmac_free_irq(struct net_device *dev,
+			    enum request_irq_err irq_err, int irq_idx)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int j;
+
+	switch (irq_err) {
+	case REQ_IRQ_ERR_ALL:
+		irq_idx = priv->plat->tx_queues_to_use;
+		fallthrough;
+	case REQ_IRQ_ERR_TX:
+		for (j = irq_idx - 1; j >= 0; j--) {
+			if (priv->tx_irq[j] > 0)
+				free_irq(priv->tx_irq[j], &priv->tx_queue[j]);
+		}
+		irq_idx = priv->plat->rx_queues_to_use;
+		fallthrough;
+	case REQ_IRQ_ERR_RX:
+		for (j = irq_idx - 1; j >= 0; j--) {
+			if (priv->rx_irq[j] > 0)
+				free_irq(priv->rx_irq[j], &priv->rx_queue[j]);
+		}
+
+		if (priv->sfty_ue_irq > 0 && priv->sfty_ue_irq != dev->irq)
+			free_irq(priv->sfty_ue_irq, dev);
+		fallthrough;
+	case REQ_IRQ_ERR_SFTY_UE:
+		if (priv->sfty_ce_irq > 0 && priv->sfty_ce_irq != dev->irq)
+			free_irq(priv->sfty_ce_irq, dev);
+		fallthrough;
+	case REQ_IRQ_ERR_SFTY_CE:
+		if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq)
+			free_irq(priv->lpi_irq, dev);
+		fallthrough;
+	case REQ_IRQ_ERR_LPI:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
+	case REQ_IRQ_ERR_WOL:
+		free_irq(dev->irq, dev);
+		fallthrough;
+	case REQ_IRQ_ERR_MAC:
+	case REQ_IRQ_ERR_NO:
+		/* If MAC IRQ request error, no more IRQ to free */
+		break;
+	}
+}
+
+static int stmmac_request_irq_multi_msi(struct net_device *dev)
+{
+	enum request_irq_err irq_err = REQ_IRQ_ERR_NO;
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int irq_idx = 0;
+	char *int_name;
+	int ret;
+	int i;
+
+	/* For common interrupt */
+	int_name = priv->int_name_mac;
+	sprintf(int_name, "%s:%s", dev->name, "mac");
+	ret = request_irq(dev->irq, stmmac_mac_interrupt,
+			  0, int_name, dev);
+	if (unlikely(ret < 0)) {
+		netdev_err(priv->dev,
+			   "%s: alloc mac MSI %d (error: %d)\n",
+			   __func__, dev->irq, ret);
+		irq_err = REQ_IRQ_ERR_MAC;
+		goto irq_error;
+	}
+
+	/* Request the Wake IRQ in case of another line
+	 * is used for WoL
+	 */
+	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
+		int_name = priv->int_name_wol;
+		sprintf(int_name, "%s:%s", dev->name, "wol");
+		ret = request_irq(priv->wol_irq,
+				  stmmac_mac_interrupt,
+				  0, int_name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc wol MSI %d (error: %d)\n",
+				   __func__, priv->wol_irq, ret);
+			irq_err = REQ_IRQ_ERR_WOL;
+			goto irq_error;
+		}
+	}
+
+	/* Request the LPI IRQ in case of another line
+	 * is used for LPI
+	 */
+	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
+		int_name = priv->int_name_lpi;
+		sprintf(int_name, "%s:%s", dev->name, "lpi");
+		ret = request_irq(priv->lpi_irq,
+				  stmmac_mac_interrupt,
+				  0, int_name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc lpi MSI %d (error: %d)\n",
+				   __func__, priv->lpi_irq, ret);
+			irq_err = REQ_IRQ_ERR_LPI;
+			goto irq_error;
+		}
+	}
+
+	/* Request the Safety Feature Correctible Error line in
+	 * case of another line is used
+	 */
+	if (priv->sfty_ce_irq > 0 && priv->sfty_ce_irq != dev->irq) {
+		int_name = priv->int_name_sfty_ce;
+		sprintf(int_name, "%s:%s", dev->name, "safety-ce");
+		ret = request_irq(priv->sfty_ce_irq,
+				  stmmac_safety_interrupt,
+				  0, int_name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc sfty ce MSI %d (error: %d)\n",
+				   __func__, priv->sfty_ce_irq, ret);
+			irq_err = REQ_IRQ_ERR_SFTY_CE;
+			goto irq_error;
+		}
+	}
+
+	/* Request the Safety Feature Uncorrectible Error line in
+	 * case of another line is used
+	 */
+	if (priv->sfty_ue_irq > 0 && priv->sfty_ue_irq != dev->irq) {
+		int_name = priv->int_name_sfty_ue;
+		sprintf(int_name, "%s:%s", dev->name, "safety-ue");
+		ret = request_irq(priv->sfty_ue_irq,
+				  stmmac_safety_interrupt,
+				  0, int_name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc sfty ue MSI %d (error: %d)\n",
+				   __func__, priv->sfty_ue_irq, ret);
+			irq_err = REQ_IRQ_ERR_SFTY_UE;
+			goto irq_error;
+		}
+	}
+
+	/* Request Rx MSI irq */
+	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
+		if (priv->rx_irq[i] == 0)
+			continue;
+
+		int_name = priv->int_name_rx_irq[i];
+		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
+		ret = request_irq(priv->rx_irq[i],
+				  stmmac_msi_intr_rx,
+				  0, int_name, &priv->rx_queue[i]);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc rx-%d  MSI %d (error: %d)\n",
+				   __func__, i, priv->rx_irq[i], ret);
+			irq_err = REQ_IRQ_ERR_RX;
+			irq_idx = i;
+			goto irq_error;
+		}
+	}
+
+	/* Request Tx MSI irq */
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		if (priv->tx_irq[i] == 0)
+			continue;
+
+		int_name = priv->int_name_tx_irq[i];
+		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
+		ret = request_irq(priv->tx_irq[i],
+				  stmmac_msi_intr_tx,
+				  0, int_name, &priv->tx_queue[i]);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc tx-%d  MSI %d (error: %d)\n",
+				   __func__, i, priv->tx_irq[i], ret);
+			irq_err = REQ_IRQ_ERR_TX;
+			irq_idx = i;
+			goto irq_error;
+		}
+	}
+
+	return 0;
+
+irq_error:
+	stmmac_free_irq(dev, irq_err, irq_idx);
+	return ret;
+}
+
+static int stmmac_request_irq_single(struct net_device *dev)
+{
+	enum request_irq_err irq_err = REQ_IRQ_ERR_NO;
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int ret;
+
+	ret = request_irq(dev->irq, stmmac_interrupt,
+			  IRQF_SHARED, dev->name, dev);
+	if (unlikely(ret < 0)) {
+		netdev_err(priv->dev,
+			   "%s: ERROR: allocating the IRQ %d (error: %d)\n",
+			   __func__, dev->irq, ret);
+		irq_err = REQ_IRQ_ERR_MAC;
+		return ret;
+	}
+
+	/* Request the Wake IRQ in case of another line
+	 * is used for WoL
+	 */
+	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
+		ret = request_irq(priv->wol_irq, stmmac_interrupt,
+				  IRQF_SHARED, dev->name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: ERROR: allocating the WoL IRQ %d (%d)\n",
+				   __func__, priv->wol_irq, ret);
+			irq_err = REQ_IRQ_ERR_WOL;
+			return ret;
+		}
+	}
+
+	/* Request the IRQ lines */
+	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
+		ret = request_irq(priv->lpi_irq, stmmac_interrupt,
+				  IRQF_SHARED, dev->name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
+				   __func__, priv->lpi_irq, ret);
+			irq_err = REQ_IRQ_ERR_LPI;
+			goto irq_error;
+		}
+	}
+
+	return 0;
+
+irq_error:
+	stmmac_free_irq(dev, irq_err, 0);
+	return ret;
+}
+
+static int stmmac_request_irq(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int ret;
+
+	/* Request the IRQ lines */
+	if (priv->plat->multi_msi_en)
+		ret = stmmac_request_irq_multi_msi(dev);
+	else
+		ret = stmmac_request_irq_single(dev);
+
+	return ret;
+}
+
 /**
  *  stmmac_open - open entry point of the driver
  *  @dev : pointer to the device structure.
@@ -3077,50 +3336,15 @@ static int stmmac_open(struct net_device *dev)
 	/* We may have called phylink_speed_down before */
 	phylink_speed_up(priv->phylink);
 
-	/* Request the IRQ lines */
-	ret = request_irq(dev->irq, stmmac_interrupt,
-			  IRQF_SHARED, dev->name, dev);
-	if (unlikely(ret < 0)) {
-		netdev_err(priv->dev,
-			   "%s: ERROR: allocating the IRQ %d (error: %d)\n",
-			   __func__, dev->irq, ret);
+	ret = stmmac_request_irq(dev);
+	if (ret)
 		goto irq_error;
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
 
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 
 	return 0;
 
-lpiirq_error:
-	if (priv->wol_irq != dev->irq)
-		free_irq(priv->wol_irq, dev);
-wolirq_error:
-	free_irq(dev->irq, dev);
 irq_error:
 	phylink_stop(priv->phylink);
 
@@ -3170,11 +3394,7 @@ static int stmmac_release(struct net_device *dev)
 		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
 
 	/* Free the IRQ lines */
-	free_irq(dev->irq, dev);
-	if (priv->wol_irq != dev->irq)
-		free_irq(priv->wol_irq, dev);
-	if (priv->lpi_irq > 0)
-		free_irq(priv->lpi_irq, dev);
+	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
 	if (priv->eee_enabled) {
 		priv->tx_path_in_lpi_mode = false;
@@ -4477,15 +4697,136 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
+{
+	struct net_device *dev = (struct net_device *)dev_id;
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	if (unlikely(!dev)) {
+		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
+		return IRQ_NONE;
+	}
+
+	/* Check if adapter is up */
+	if (test_bit(STMMAC_DOWN, &priv->state))
+		return IRQ_HANDLED;
+
+	/* To handle Common interrupts */
+	stmmac_common_interrupt(priv);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id)
+{
+	struct net_device *dev = (struct net_device *)dev_id;
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	if (unlikely(!dev)) {
+		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
+		return IRQ_NONE;
+	}
+
+	/* Check if adapter is up */
+	if (test_bit(STMMAC_DOWN, &priv->state))
+		return IRQ_HANDLED;
+
+	/* Check if a fatal error happened */
+	stmmac_safety_feat_interrupt(priv);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
+{
+	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)data;
+	int chan = tx_q->queue_index;
+	struct stmmac_priv *priv;
+	int status;
+
+	priv = container_of(tx_q, struct stmmac_priv, tx_queue[chan]);
+
+	if (unlikely(!data)) {
+		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
+		return IRQ_NONE;
+	}
+
+	/* Check if adapter is up */
+	if (test_bit(STMMAC_DOWN, &priv->state))
+		return IRQ_HANDLED;
+
+	status = stmmac_napi_check(priv, chan, DMA_DIR_TX);
+
+	if (unlikely(status & tx_hard_error_bump_tc)) {
+		/* Try to bump up the dma threshold on this failure */
+		if (unlikely(priv->xstats.threshold != SF_DMA_MODE) &&
+		    tc <= 256) {
+			tc += 64;
+			if (priv->plat->force_thresh_dma_mode)
+				stmmac_set_dma_operation_mode(priv,
+							      tc,
+							      tc,
+							      chan);
+			else
+				stmmac_set_dma_operation_mode(priv,
+							      tc,
+							      SF_DMA_MODE,
+							      chan);
+			priv->xstats.threshold = tc;
+		}
+	} else if (unlikely(status == tx_hard_error)) {
+		stmmac_tx_err(priv, chan);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
+{
+	struct stmmac_rx_queue *rx_q = (struct stmmac_rx_queue *)data;
+	int chan = rx_q->queue_index;
+	struct stmmac_priv *priv;
+
+	priv = container_of(rx_q, struct stmmac_priv, rx_queue[chan]);
+
+	if (unlikely(!data)) {
+		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
+		return IRQ_NONE;
+	}
+
+	/* Check if adapter is up */
+	if (test_bit(STMMAC_DOWN, &priv->state))
+		return IRQ_HANDLED;
+
+	stmmac_napi_check(priv, chan, DMA_DIR_RX);
+
+	return IRQ_HANDLED;
+}
+
 #ifdef CONFIG_NET_POLL_CONTROLLER
 /* Polling receive - used by NETCONSOLE and other diagnostic tools
  * to allow network I/O with interrupts disabled.
  */
 static void stmmac_poll_controller(struct net_device *dev)
 {
-	disable_irq(dev->irq);
-	stmmac_interrupt(dev->irq, dev);
-	enable_irq(dev->irq);
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int i;
+
+	/* If adapter is down, do nothing */
+	if (test_bit(STMMAC_DOWN, &priv->state))
+		return;
+
+	if (priv->plat->multi_msi_en) {
+		for (i = 0; i < priv->plat->rx_queues_to_use; i++)
+			stmmac_msi_intr_rx(0, &priv->rx_queue[i]);
+
+		for (i = 0; i < priv->plat->tx_queues_to_use; i++)
+			stmmac_msi_intr_tx(0, &priv->tx_queue[i]);
+	} else {
+		disable_irq(dev->irq);
+		stmmac_interrupt(dev->irq, dev);
+		enable_irq(dev->irq);
+	}
 }
 #endif
 
@@ -5283,6 +5624,12 @@ int stmmac_dvr_probe(struct device *device,
 	priv->dev->irq = res->irq;
 	priv->wol_irq = res->wol_irq;
 	priv->lpi_irq = res->lpi_irq;
+	priv->sfty_ce_irq = res->sfty_ce_irq;
+	priv->sfty_ue_irq = res->sfty_ue_irq;
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+		priv->rx_irq[i] = res->rx_irq[i];
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
+		priv->tx_irq[i] = res->tx_irq[i];
 
 	if (!IS_ERR_OR_NULL(res->mac))
 		memcpy(priv->dev->dev_addr, res->mac, ETH_ALEN);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index febdb43d27e5..afc12b9385db 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -237,5 +237,13 @@ struct plat_stmmacenet_data {
 	struct pci_dev *pdev;
 	bool has_crossts;
 	int int_snapshot_num;
+	bool multi_msi_en;
+	int msi_mac_vec;
+	int msi_wol_vec;
+	int msi_lpi_vec;
+	int msi_sfty_ce_vec;
+	int msi_sfty_ue_vec;
+	int msi_rx_base_vec;
+	int msi_tx_base_vec;
 };
 #endif
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
