Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219533C92B
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 23:15:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BB6DC57B78;
	Mon, 15 Mar 2021 22:15:11 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 048DFC57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 22:15:09 +0000 (UTC)
IronPort-SDR: lON2KgLEdfg+LyMUayZhyCsVZyHcp5oq1RZn9n3MIwXpHbMbVE5m399OBNz/fwKOUzSVj7Uygf
 x+rvRda4TNbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="253178667"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="253178667"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 15:15:09 -0700
IronPort-SDR: 4EIjiw5db6QKY0/0KjwBtB7uBroAbWiaMMjgVoqoV79jnzBdKNrpfyV8J2aCKDAClmpg3nHdpv
 AveR4M8ean7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="410807105"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.82])
 by orsmga007.jf.intel.com with ESMTP; 15 Mar 2021 15:15:05 -0700
From: mohammad.athari.ismail@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 16 Mar 2021 06:14:09 +0800
Message-Id: <20210315221409.3867-3-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315221409.3867-1-mohammad.athari.ismail@intel.com>
References: <20210315221409.3867-1-mohammad.athari.ismail@intel.com>
Cc: Voon Weifeng <weifeng.voon@intel.com>, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mohammad.athari.ismail@intel.com, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: Add EST errors into
	ethtool statistic
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

Below EST errors are added into ethtool statistic:
1) Constant Gate Control Error (CGCE):
   The counter "mtl_est_cgce" increases everytime CGCE interrupt is
   triggered.

2) Head-of-Line Blocking due to Scheduling (HLBS):
   The counter "mtl_est_hlbs" increases everytime HLBS interrupt is
   triggered.

3) Head-of-Line Blocking due to Frame Size (HLBF):
   The counter "mtl_est_hlbf" increases everytime HLBF interrupt is
   triggered.

4) Base Time Register error (BTRE):
   The counter "mtl_est_btre" increases everytime BTRE interrupt is
   triggered but BTRL not reaches maximum value of 15.

5) Base Time Register Error Loop Count (BTRL) reaches maximum value:
   The counter "mtl_est_btrlm" increases everytime BTRE interrupt is
   triggered and BTRL value reaches maximum value of 15.

Please refer to MTL_EST_STATUS register in DesignWare Cores Ethernet
Quality-of-Service Databook for more detail explanation.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Co-developed-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h        |  6 ++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c        | 13 ++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c    |  6 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   |  3 ++-
 6 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 6f271c46368d..1c0c60bdf854 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -182,6 +182,12 @@ struct stmmac_extra_stats {
 	/* TSO */
 	unsigned long tx_tso_frames;
 	unsigned long tx_tso_nfrags;
+	/* EST */
+	unsigned long mtl_est_cgce;
+	unsigned long mtl_est_hlbs;
+	unsigned long mtl_est_hlbf;
+	unsigned long mtl_est_btre;
+	unsigned long mtl_est_btrlm;
 };
 
 /* Safety Feature statistics exposed by ethtool */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index b47190fc8d83..b5ff47299b29 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -608,7 +608,7 @@ int dwmac5_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
 }
 
 int dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
-			  u32 txqcnt)
+			  struct stmmac_extra_stats *x, u32 txqcnt)
 {
 	u32 status, value, feqn, hbfq, hbfs, btrl;
 	u32 txqcnt_mask = (1 << txqcnt) - 1;
@@ -624,12 +624,16 @@ int dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
 	if (status & CGCE) {
 		/* Clear Interrupt */
 		writel(CGCE, ioaddr + MTL_EST_STATUS);
+
+		x->mtl_est_cgce++;
 	}
 
 	if (status & HLBS) {
 		value = readl(ioaddr + MTL_EST_SCH_ERR);
 		value &= txqcnt_mask;
 
+		x->mtl_est_hlbs++;
+
 		/* Clear Interrupt */
 		writel(value, ioaddr + MTL_EST_SCH_ERR);
 
@@ -649,6 +653,8 @@ int dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
 		hbfq = (value & SZ_CAP_HBFQ_MASK(txqcnt)) >> SZ_CAP_HBFQ_SHIFT;
 		hbfs = value & SZ_CAP_HBFS_MASK;
 
+		x->mtl_est_hlbf++;
+
 		/* Clear Interrupt */
 		writel(feqn, ioaddr + MTL_EST_FRM_SZ_ERR);
 
@@ -658,6 +664,11 @@ int dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
 	}
 
 	if (status & BTRE) {
+		if ((status & BTRL) == BTRL_MAX)
+			x->mtl_est_btrlm++;
+		else
+			x->mtl_est_btre++;
+
 		btrl = (status & BTRL) >> BTRL_SHIFT;
 
 		if (net_ratelimit())
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index 51d9ed24622f..dcd679597676 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -142,7 +142,7 @@ int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 int dwmac5_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
 			 unsigned int ptp_rate);
 int dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
-			  u32 txqcnt);
+			  struct stmmac_extra_stats *x, u32 txqcnt);
 void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
 			  bool enable);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 78a677a86914..e49d934ea435 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -394,7 +394,7 @@ struct stmmac_ops {
 	int (*est_configure)(void __iomem *ioaddr, struct stmmac_est *cfg,
 			     unsigned int ptp_rate);
 	int (*est_irq_status)(void __iomem *ioaddr, struct net_device *dev,
-			      u32 txqcnt);
+			      struct stmmac_extra_stats *x, u32 txqcnt);
 	void (*fpe_configure)(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
 			      bool enable);
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index c5642985ef95..00595b7552bc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -158,6 +158,12 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
 	/* TSO */
 	STMMAC_STAT(tx_tso_frames),
 	STMMAC_STAT(tx_tso_nfrags),
+	/* EST */
+	STMMAC_STAT(mtl_est_cgce),
+	STMMAC_STAT(mtl_est_hlbs),
+	STMMAC_STAT(mtl_est_hlbf),
+	STMMAC_STAT(mtl_est_btre),
+	STMMAC_STAT(mtl_est_btrlm),
 };
 #define STMMAC_STATS_LEN ARRAY_SIZE(stmmac_gstrings_stats)
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24b9212c7566..502eaff0828b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4242,7 +4242,8 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 		return IRQ_HANDLED;
 
 	if (priv->dma_cap.estsel)
-		stmmac_est_irq_status(priv, priv->ioaddr, priv->dev, tx_cnt);
+		stmmac_est_irq_status(priv, priv->ioaddr, priv->dev,
+				      &priv->xstats, tx_cnt);
 
 	/* To handle GMAC own interrupts */
 	if ((priv->plat->has_gmac) || xmac) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
