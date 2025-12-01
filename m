Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F09C97EE9
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 15:58:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F15A5C628D3;
	Mon,  1 Dec 2025 14:58:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28A2CC628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 14:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3jRvtkVw87jmhh6YhUoOXEndpCbNrDMhhtkQJisPGAs=; b=LMHqG5sykw82exRiJoCH74/sSL
 vfkYileQdtcvUXc4wIRVWQLdX6YjmX6dJYMOSvw4zyZlgPk5SE2Q8mi+d5GdhDv94AK/JRBrfcF4F
 7oJaU+o1fNLtXeiJByvu9cJyLU7JwOcp7TGx6yOtYDYh3UwVQMz54b/RCi3TkZ1aqVa0mds3fLsS3
 SIwcFl9lFa0Fsm6GqMC1hjsHch39A5B5yOp9UO/afzWb+qGQQmnTSZBhhAR/gLaqaPSnFCu08t53s
 xU5GGsTQq/1pnJOSvrfTACGUPCm8UEpwanGQLAVq29xcn8ZRsFHs98zCCQOkuksPBjzkHXGQn8+Sc
 WhR5i6Lw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46770 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vQ5Fs-000000000i6-0n8d;
 Mon, 01 Dec 2025 14:51:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vQ5Fl-0000000GNwf-16ec; Mon, 01 Dec 2025 14:51:49 +0000
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vQ5Fl-0000000GNwf-16ec@rmk-PC.armlinux.org.uk>
Date: Mon, 01 Dec 2025 14:51:49 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 13/15] net: stmmac: rk: replace
 empty set_to_rmii() with supports_rmii
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

Rather than providing a now-empty set_to_rmii() method to indicate
that RMII is supported, switch to setting ops->supports_rmii instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 86 ++++++-------------
 1 file changed, 24 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index fbc0e50519f6..c9a915b2cb84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -241,12 +241,7 @@ static void rk_gmac_integrated_fephy_powerdown(struct rk_priv_data *priv,
 
 #define PX30_GRF_GMAC_CON1		0x0904
 
-static void px30_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops px30_ops = {
-	.set_to_rmii = px30_set_to_rmii,
 	.set_speed = rk_set_clk_mac_speed,
 
 	.phy_intf_sel_grf_reg = PX30_GRF_GMAC_CON1,
@@ -254,6 +249,8 @@ static const struct rk_gmac_ops px30_ops = {
 
 	.speed_grf_reg = PX30_GRF_GMAC_CON1,
 	.mac_speed_mask = BIT_U16(2),
+
+	.supports_rmii = true,
 };
 
 #define RK3128_GRF_MAC_CON0	0x0168
@@ -280,13 +277,8 @@ static void rk3128_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3128_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3128_ops = {
 	.set_to_rgmii = rk3128_set_to_rgmii,
-	.set_to_rmii = rk3128_set_to_rmii,
 
 	.phy_intf_sel_grf_reg = RK3128_GRF_MAC_CON1,
 	.phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -296,6 +288,8 @@ static const struct rk_gmac_ops rk3128_ops = {
 	.gmii_clk_sel_mask = GENMASK_U16(13, 12),
 	.rmii_clk_sel_mask = BIT_U16(11),
 	.mac_speed_mask = BIT_U16(10),
+
+	.supports_rmii = true,
 };
 
 #define RK3228_GRF_MAC_CON0	0x0900
@@ -383,13 +377,8 @@ static void rk3288_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3288_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3288_ops = {
 	.set_to_rgmii = rk3288_set_to_rgmii,
-	.set_to_rmii = rk3288_set_to_rmii,
 
 	.phy_intf_sel_grf_reg = RK3288_GRF_SOC_CON1,
 	.phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -399,6 +388,8 @@ static const struct rk_gmac_ops rk3288_ops = {
 	.gmii_clk_sel_mask = GENMASK_U16(13, 12),
 	.rmii_clk_sel_mask = BIT_U16(11),
 	.mac_speed_mask = BIT_U16(10),
+
+	.supports_rmii = true,
 };
 
 #define RK3308_GRF_MAC_CON0		0x04a0
@@ -407,18 +398,14 @@ static const struct rk_gmac_ops rk3288_ops = {
 #define RK3308_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3308_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
 
-static void rk3308_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3308_ops = {
-	.set_to_rmii = rk3308_set_to_rmii,
-
 	.phy_intf_sel_grf_reg = RK3308_GRF_MAC_CON0,
 	.phy_intf_sel_mask = GENMASK_U16(4, 2),
 
 	.speed_grf_reg = RK3308_GRF_MAC_CON0,
 	.mac_speed_mask = BIT_U16(0),
+
+	.supports_rmii = true,
 };
 
 #define RK3328_GRF_MAC_CON0	0x0900
@@ -470,10 +457,6 @@ static void rk3328_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3328_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static void rk3328_integrated_phy_powerup(struct rk_priv_data *priv)
 {
 	regmap_write(priv->grf, RK3328_GRF_MACPHY_CON1,
@@ -485,7 +468,6 @@ static void rk3328_integrated_phy_powerup(struct rk_priv_data *priv)
 static const struct rk_gmac_ops rk3328_ops = {
 	.init = rk3328_init,
 	.set_to_rgmii = rk3328_set_to_rgmii,
-	.set_to_rmii = rk3328_set_to_rmii,
 	.integrated_phy_powerup = rk3328_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 
@@ -495,6 +477,8 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.rmii_clk_sel_mask = BIT_U16(7),
 	.mac_speed_mask = BIT_U16(2),
 
+	.supports_rmii = true,
+
 	.regs_valid = true,
 	.regs = {
 		0xff540000, /* gmac2io */
@@ -527,13 +511,8 @@ static void rk3366_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3366_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3366_ops = {
 	.set_to_rgmii = rk3366_set_to_rgmii,
-	.set_to_rmii = rk3366_set_to_rmii,
 
 	.phy_intf_sel_grf_reg = RK3366_GRF_SOC_CON6,
 	.phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -543,6 +522,8 @@ static const struct rk_gmac_ops rk3366_ops = {
 	.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 	.rmii_clk_sel_mask = BIT_U16(3),
 	.mac_speed_mask = BIT_U16(7),
+
+	.supports_rmii = true,
 };
 
 #define RK3368_GRF_SOC_CON15	0x043c
@@ -569,13 +550,8 @@ static void rk3368_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3368_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3368_ops = {
 	.set_to_rgmii = rk3368_set_to_rgmii,
-	.set_to_rmii = rk3368_set_to_rmii,
 
 	.phy_intf_sel_grf_reg = RK3368_GRF_SOC_CON15,
 	.phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -585,6 +561,8 @@ static const struct rk_gmac_ops rk3368_ops = {
 	.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 	.rmii_clk_sel_mask = BIT_U16(3),
 	.mac_speed_mask = BIT_U16(7),
+
+	.supports_rmii = true,
 };
 
 #define RK3399_GRF_SOC_CON5	0xc214
@@ -611,13 +589,8 @@ static void rk3399_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3399_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3399_ops = {
 	.set_to_rgmii = rk3399_set_to_rgmii,
-	.set_to_rmii = rk3399_set_to_rmii,
 
 	.phy_intf_sel_grf_reg = RK3399_GRF_SOC_CON5,
 	.phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -627,6 +600,8 @@ static const struct rk_gmac_ops rk3399_ops = {
 	.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 	.rmii_clk_sel_mask = BIT_U16(3),
 	.mac_speed_mask = BIT_U16(7),
+
+	.supports_rmii = true,
 };
 
 #define RK3506_GRF_SOC_CON8		0x0020
@@ -858,18 +833,15 @@ static void rk3568_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3568_GMAC_TXCLK_DLY_ENABLE);
 }
 
-static void rk3568_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3568_ops = {
 	.init = rk3568_init,
 	.set_to_rgmii = rk3568_set_to_rgmii,
-	.set_to_rmii = rk3568_set_to_rmii,
 	.set_speed = rk_set_clk_mac_speed,
 
 	.phy_intf_sel_mask = GENMASK_U16(6, 4),
 
+	.supports_rmii = true,
+
 	.regs_valid = true,
 	.regs = {
 		0xfe2a0000, /* gmac0 */
@@ -943,10 +915,6 @@ static void rk3576_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3576_GMAC_CLK_RX_DL_CFG(rx_delay));
 }
 
-static void rk3576_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static void rk3576_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
 				       bool enable)
 {
@@ -966,7 +934,6 @@ static void rk3576_set_clock_selection(struct rk_priv_data *bsp_priv, bool input
 static const struct rk_gmac_ops rk3576_ops = {
 	.init = rk3576_init,
 	.set_to_rgmii = rk3576_set_to_rgmii,
-	.set_to_rmii = rk3576_set_to_rmii,
 	.set_clock_selection = rk3576_set_clock_selection,
 
 	.rmii_mode_mask = BIT_U16(3),
@@ -974,6 +941,8 @@ static const struct rk_gmac_ops rk3576_ops = {
 	.gmii_clk_sel_mask = GENMASK_U16(6, 5),
 	.rmii_clk_sel_mask = BIT_U16(5),
 
+	.supports_rmii = true,
+
 	.php_grf_required = true,
 	.regs_valid = true,
 	.regs = {
@@ -1093,19 +1062,15 @@ static const struct rk_gmac_ops rk3588_ops = {
 #define RV1108_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RV1108_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
 
-static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rv1108_ops = {
-	.set_to_rmii = rv1108_set_to_rmii,
-
 	.phy_intf_sel_grf_reg = RV1108_GRF_GMAC_CON0,
 	.phy_intf_sel_mask = GENMASK_U16(6, 4),
 
 	.speed_grf_reg = RV1108_GRF_GMAC_CON0,
 	.rmii_clk_sel_mask = BIT_U16(7),
 	.mac_speed_mask = BIT_U16(2),
+
+	.supports_rmii = true,
 };
 
 #define RV1126_GRF_GMAC_CON0		0X0070
@@ -1149,17 +1114,14 @@ static void rv1126_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RV1126_GMAC_M1_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rv1126_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rv1126_ops = {
 	.set_to_rgmii = rv1126_set_to_rgmii,
-	.set_to_rmii = rv1126_set_to_rmii,
 	.set_speed = rk_set_clk_mac_speed,
 
 	.phy_intf_sel_grf_reg = RV1126_GRF_GMAC_CON0,
 	.phy_intf_sel_mask = GENMASK_U16(6, 4),
+
+	.supports_rmii = true,
 };
 
 static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
