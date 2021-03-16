Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB033D3A3
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 13:18:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C528C57B79;
	Tue, 16 Mar 2021 12:18:39 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9738AC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 12:18:36 +0000 (UTC)
IronPort-SDR: ka+RsxOqEi3BfHv28zRnN6EFu/hbsHM9kxwC4Trwxq9sNQR+1giVVcfWNlxbkgq2B7PTOO8hHz
 cOcpkGUaWroQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="176379036"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="176379036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 05:18:36 -0700
IronPort-SDR: aVUEUAMqVN56QXbNGhmmfrSAi/YulYPIaRHqBg9qMrD9XTAG4hh1gjlIvprSIByHWF2B+3UeyS
 sLAR07KzOmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="449703405"
Received: from climb.png.intel.com ([10.221.118.165])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2021 05:18:33 -0700
From: Voon Weifeng <weifeng.voon@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 16 Mar 2021 20:18:20 +0800
Message-Id: <20210316121823.18659-3-weifeng.voon@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316121823.18659-1-weifeng.voon@intel.com>
References: <20210316121823.18659-1-weifeng.voon@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND v1 net-next 2/5] net: stmmac: make
	stmmac_interrupt() function more friendly to MSI
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

Refactor stmmac_interrupt() by introducing stmmac_common_interrupt()
so that we prepare the ISR operation to be friendly to MSI later.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 59 +++++++++++--------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 53da3c855cba..741b100c8971 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4253,21 +4253,8 @@ static int stmmac_set_features(struct net_device *netdev,
 	return 0;
 }
 
-/**
- *  stmmac_interrupt - main ISR
- *  @irq: interrupt number.
- *  @dev_id: to pass the net device pointer (must be valid).
- *  Description: this is the main driver interrupt service routine.
- *  It can call:
- *  o DMA service routine (to manage incoming frame reception and transmission
- *    status)
- *  o Core interrupts to manage: remote wake-up, management counter, LPI
- *    interrupts.
- */
-static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
+static void stmmac_common_interrupt(struct stmmac_priv *priv)
 {
-	struct net_device *dev = (struct net_device *)dev_id;
-	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
 	u32 queues_count;
@@ -4280,13 +4267,6 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 	if (priv->irq_wake)
 		pm_wakeup_event(priv->device, 0);
 
-	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
-		return IRQ_HANDLED;
-	/* Check if a fatal error happened */
-	if (stmmac_safety_feat_interrupt(priv))
-		return IRQ_HANDLED;
-
 	/* To handle GMAC own interrupts */
 	if ((priv->plat->has_gmac) || xmac) {
 		int status = stmmac_host_irq_status(priv, priv->hw, &priv->xstats);
@@ -4317,11 +4297,44 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 		/* PCS link status */
 		if (priv->hw->pcs) {
 			if (priv->xstats.pcs_link)
-				netif_carrier_on(dev);
+				netif_carrier_on(priv->dev);
 			else
-				netif_carrier_off(dev);
+				netif_carrier_off(priv->dev);
 		}
 	}
+}
+
+/**
+ *  stmmac_interrupt - main ISR
+ *  @irq: interrupt number.
+ *  @dev_id: to pass the net device pointer.
+ *  Description: this is the main driver interrupt service routine.
+ *  It can call:
+ *  o DMA service routine (to manage incoming frame reception and transmission
+ *    status)
+ *  o Core interrupts to manage: remote wake-up, management counter, LPI
+ *    interrupts.
+ */
+static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
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
+	if (stmmac_safety_feat_interrupt(priv))
+		return IRQ_HANDLED;
+
+	/* To handle Common interrupts */
+	stmmac_common_interrupt(priv);
 
 	/* To handle DMA interrupts */
 	stmmac_dma_interrupt(priv);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
