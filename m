Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0034A8C3786
	for <lists+linux-stm32@lfdr.de>; Sun, 12 May 2024 18:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1B88C6B476;
	Sun, 12 May 2024 16:29:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32891C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 May 2024 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sS6VC+UNjlkKaDm7D3Me3REuv4/vfd5M4mMq34NylO4=; b=F183WuSPpVH6tXON3LnM7O8xer
 aG5KSwvnOV6K2nDpOBMEGl1mhR54bxIzQDHizdATdNDAU7w1+Dj/zS9XIOnJdI1D/nMWZDD/rSRbv
 oQkU3eDlyC85gBRoiS3ksZRHYvcoIYW56qR+dcuHnVFhVIZbKxiSOc6EghONcAW2LYG8htd8CI9a5
 daXCqrIabokteTrNcp/nzXTeaqojiq4iLwB1KWc52whz8mSjcCfctliqpI0QqKTxdUo79u3Q9MYHy
 K5s9e1Mms6xXIZRzaapAtTaD3Ax9xIw3MU0IHS4VwIIuEaXIxlgCnzjMlaFAAYbJjEerhmwxHix93
 OsUjctXQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41668 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1s6C4b-0000u0-3D;
 Sun, 12 May 2024 17:29:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1s6C4d-00Ck6h-Kp; Sun, 12 May 2024 17:29:19 +0100
In-Reply-To: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1s6C4d-00Ck6h-Kp@rmk-PC.armlinux.org.uk>
Date: Sun, 12 May 2024 17:29:19 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 5/6] net: stmmac: remove
 pcs_get_adv_lp() method and associated code
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

The pcs_get_adv_lp() method is no longer required as phylink handles
the state via the pcs_get_state() method. Remove this now redundant
code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  6 ----
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  8 -----
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  2 --
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  4 ---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 30 -------------------
 5 files changed, 50 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 05907fb5b0aa..05143fa7aa6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -401,11 +401,6 @@ static void dwmac1000_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + LPI_TIMER_CTRL);
 }
 
-static void dwmac1000_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
-{
-	dwmac_get_adv_lp(ioaddr, GMAC_PCS_BASE, adv);
-}
-
 static int dwmac1000_mii_pcs_validate(struct phylink_pcs *pcs,
 				      unsigned long *supported,
 				      const struct phylink_link_state *state)
@@ -577,7 +572,6 @@ const struct stmmac_ops dwmac1000_ops = {
 	.set_eee_timer = dwmac1000_set_eee_timer,
 	.set_eee_pls = dwmac1000_set_eee_pls,
 	.debug = dwmac1000_debug,
-	.pcs_get_adv_lp = dwmac1000_get_adv_lp,
 	.set_mac_loopback = dwmac1000_set_mac_loopback,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index dfe5aa41224c..e70cca85548a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -753,11 +753,6 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 	}
 }
 
-static void dwmac4_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
-{
-	dwmac_get_adv_lp(ioaddr, GMAC_PCS_BASE, adv);
-}
-
 /* RGMII or SMII interface */
 static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
@@ -1278,7 +1273,6 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
@@ -1322,7 +1316,6 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.flex_pps_config = dwmac5_flex_pps_config,
@@ -1370,7 +1363,6 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.safety_feat_config = dwmac5_safety_feat_config,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index a818ba3e336e..6a987cf598e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1554,7 +1554,6 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
-	.pcs_get_adv_lp = NULL,
 	.debug = NULL,
 	.set_filter = dwxgmac2_set_filter,
 	.safety_feat_config = dwxgmac3_safety_feat_config,
@@ -1612,7 +1611,6 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
-	.pcs_get_adv_lp = NULL,
 	.debug = NULL,
 	.set_filter = dwxgmac2_set_filter,
 	.safety_feat_config = dwxgmac3_safety_feat_config,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 2ccb9de250d1..31b7e390853d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -375,8 +375,6 @@ struct stmmac_ops {
 	void (*debug)(struct stmmac_priv *priv, void __iomem *ioaddr,
 		      struct stmmac_extra_stats *x, u32 rx_queues,
 		      u32 tx_queues);
-	/* PCS calls */
-	void (*pcs_get_adv_lp)(void __iomem *ioaddr, struct rgmii_adv *adv);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
 				  struct stmmac_safety_feature_cfg *safety_cfg);
@@ -491,8 +489,6 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, set_eee_pls, __args)
 #define stmmac_mac_debug(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
-#define stmmac_pcs_get_adv_lp(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, pcs_get_adv_lp, __args)
 #define stmmac_safety_feat_config(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, safety_feat_config, __args)
 #define stmmac_safety_feat_irq_status(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index a1770461b891..fc321582f0dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -74,36 +74,6 @@ static inline void dwmac_pcs_isr(void __iomem *ioaddr, u32 reg,
 	}
 }
 
-/**
- * dwmac_get_adv_lp - Get ADV and LP cap
- * @ioaddr: IO registers pointer
- * @reg: Base address of the AN Control Register.
- * @adv_lp: structure to store the adv,lp status
- * Description: this is to expose the ANE advertisement and Link partner ability
- * status to ethtool support.
- */
-static inline void dwmac_get_adv_lp(void __iomem *ioaddr, u32 reg,
-				    struct rgmii_adv *adv_lp)
-{
-	u32 value = readl(ioaddr + GMAC_ANE_ADV(reg));
-
-	if (value & GMAC_ANE_FD)
-		adv_lp->duplex = DUPLEX_FULL;
-	if (value & GMAC_ANE_HD)
-		adv_lp->duplex |= DUPLEX_HALF;
-
-	adv_lp->pause = (value & GMAC_ANE_PSE) >> GMAC_ANE_PSE_SHIFT;
-
-	value = readl(ioaddr + GMAC_ANE_LPA(reg));
-
-	if (value & GMAC_ANE_FD)
-		adv_lp->lp_duplex = DUPLEX_FULL;
-	if (value & GMAC_ANE_HD)
-		adv_lp->lp_duplex = DUPLEX_HALF;
-
-	adv_lp->lp_pause = (value & GMAC_ANE_PSE) >> GMAC_ANE_PSE_SHIFT;
-}
-
 int dwmac_pcs_config(struct mac_device_info *hw,
 		     const unsigned long *advertising,
 		     unsigned int reg_base);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
