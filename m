Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38690C97EA7
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 15:51:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08816C628D3;
	Mon,  1 Dec 2025 14:51:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E1AC628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FhmmRjdDtmJV4C3ijnr66bOrJiMhqUMCllvcugFiWUI=; b=NZXQr10nz+dQKEjozvgOIkf112
 zp3l0Mi7j2gLDpfGmvV3sqDbmW0qiXtp+bVJtzsFkrHZSeEC/+g6vcW+lJq2KP1E0TINCENTPrJ2f
 EA/k4fYb6A/3I1Q0RozB84NM7l+EUtc/EMZY4UlJIkzIpuF1cCXtcHrVzY1XV6MHx8BAMPDFVQ0oD
 W1zqy5E0wfBiSGkqBlmAbrwbX3fJqVgklD6vkXuAAgaUwagxpkQUC3MqCfHzCuZ4eiUi1IPiQA3Ot
 sSoxuU3mgOwbxewMnmI64VgdAYR2fxESGeGRa391p5A8mFuNvEZn9I0N2sIzJe3wdSOKkkHv3Ctfp
 ku13Rd6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50474 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vQ5FN-000000000gz-1Z3d;
 Mon, 01 Dec 2025 14:51:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vQ5FL-0000000GNwB-2ckX; Mon, 01 Dec 2025 14:51:23 +0000
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vQ5FL-0000000GNwB-2ckX@rmk-PC.armlinux.org.uk>
Date: Mon, 01 Dec 2025 14:51:23 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 08/15] net: stmmac: rk: use
 rk_encode_wm16() for RMII speed
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 71 +++++++++----------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index d11a58d7f24b..5f586782d595 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -49,6 +49,7 @@ struct rk_gmac_ops {
 
 	u16 speed_grf_reg;
 	u16 gmii_clk_sel_mask;
+	u16 mac_speed_mask;
 
 	bool speed_reg_php_grf;
 	bool php_grf_required;
@@ -103,6 +104,7 @@ struct rk_priv_data {
 
 	u16 speed_grf_reg;
 	u16 gmii_clk_sel_mask;
+	u16 mac_speed_mask;
 };
 
 #define GMAC_CLK_DIV1_125M		0
@@ -156,10 +158,12 @@ static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 
 		val = rk_encode_wm16(ret, bsp_priv->gmii_clk_sel_mask);
 	} else if (interface == PHY_INTERFACE_MODE_RMII) {
+		val = rk_encode_wm16(speed == SPEED_100,
+				     bsp_priv->mac_speed_mask);
 		if (speed == SPEED_10) {
-			val = rsd->rmii_10;
+			val |= rsd->rmii_10;
 		} else if (speed == SPEED_100) {
-			val = rsd->rmii_100;
+			val |= rsd->rmii_100;
 		} else {
 			/* Phylink will not allow inappropriate speeds for
 			 * interface modes, so this should never happen.
@@ -341,8 +345,6 @@ static const struct rk_gmac_ops px30_ops = {
 /* RK3128_GRF_MAC_CON1 */
 #define RK3128_GMAC_FLOW_CTRL          GRF_BIT(9)
 #define RK3128_GMAC_FLOW_CTRL_CLR      GRF_CLR_BIT(9)
-#define RK3128_GMAC_SPEED_10M          GRF_CLR_BIT(10)
-#define RK3128_GMAC_SPEED_100M         GRF_BIT(10)
 #define RK3128_GMAC_RMII_CLK_25M       GRF_BIT(11)
 #define RK3128_GMAC_RMII_CLK_2_5M      GRF_CLR_BIT(11)
 
@@ -360,8 +362,8 @@ static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3128_reg_speed_data = {
-	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M | RK3128_GMAC_SPEED_10M,
-	.rmii_100 = RK3128_GMAC_RMII_CLK_25M | RK3128_GMAC_SPEED_100M,
+	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3128_GMAC_RMII_CLK_25M,
 };
 
 static int rk3128_set_speed(struct rk_priv_data *bsp_priv,
@@ -382,6 +384,7 @@ static const struct rk_gmac_ops rk3128_ops = {
 
 	.speed_grf_reg = RK3128_GRF_MAC_CON1,
 	.gmii_clk_sel_mask = GENMASK_U16(13, 12),
+	.mac_speed_mask = BIT_U16(10),
 };
 
 #define RK3228_GRF_MAC_CON0	0x0900
@@ -396,8 +399,6 @@ static const struct rk_gmac_ops rk3128_ops = {
 /* RK3228_GRF_MAC_CON1 */
 #define RK3228_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3228_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3228_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RK3228_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3228_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3228_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 #define RK3228_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -426,8 +427,8 @@ static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3228_reg_speed_data = {
-	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M | RK3228_GMAC_SPEED_10M,
-	.rmii_100 = RK3228_GMAC_RMII_CLK_25M | RK3228_GMAC_SPEED_100M,
+	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3228_GMAC_RMII_CLK_25M,
 };
 
 static int rk3228_set_speed(struct rk_priv_data *bsp_priv,
@@ -458,6 +459,7 @@ static const struct rk_gmac_ops rk3228_ops = {
 
 	.speed_grf_reg = RK3228_GRF_MAC_CON1,
 	.gmii_clk_sel_mask = GENMASK_U16(9, 8),
+	.mac_speed_mask = BIT_U16(2),
 };
 
 #define RK3288_GRF_SOC_CON1	0x0248
@@ -466,8 +468,6 @@ static const struct rk_gmac_ops rk3228_ops = {
 /*RK3288_GRF_SOC_CON1*/
 #define RK3288_GMAC_FLOW_CTRL		GRF_BIT(9)
 #define RK3288_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(9)
-#define RK3288_GMAC_SPEED_10M		GRF_CLR_BIT(10)
-#define RK3288_GMAC_SPEED_100M		GRF_BIT(10)
 #define RK3288_GMAC_RMII_CLK_25M	GRF_BIT(11)
 #define RK3288_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(11)
 
@@ -493,8 +493,8 @@ static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3288_reg_speed_data = {
-	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M | RK3288_GMAC_SPEED_10M,
-	.rmii_100 = RK3288_GMAC_RMII_CLK_25M | RK3288_GMAC_SPEED_100M,
+	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3288_GMAC_RMII_CLK_25M,
 };
 
 static int rk3288_set_speed(struct rk_priv_data *bsp_priv,
@@ -515,6 +515,7 @@ static const struct rk_gmac_ops rk3288_ops = {
 
 	.speed_grf_reg = RK3288_GRF_SOC_CON1,
 	.gmii_clk_sel_mask = GENMASK_U16(13, 12),
+	.mac_speed_mask = BIT_U16(10),
 };
 
 #define RK3308_GRF_MAC_CON0		0x04a0
@@ -522,16 +523,12 @@ static const struct rk_gmac_ops rk3288_ops = {
 /* RK3308_GRF_MAC_CON0 */
 #define RK3308_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3308_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3308_GMAC_SPEED_10M		GRF_CLR_BIT(0)
-#define RK3308_GMAC_SPEED_100M		GRF_BIT(0)
 
 static void rk3308_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
 static const struct rk_reg_speed_data rk3308_reg_speed_data = {
-	.rmii_10 = RK3308_GMAC_SPEED_10M,
-	.rmii_100 = RK3308_GMAC_SPEED_100M,
 };
 
 static int rk3308_set_speed(struct rk_priv_data *bsp_priv,
@@ -549,6 +546,7 @@ static const struct rk_gmac_ops rk3308_ops = {
 	.phy_intf_sel_mask = GENMASK_U16(4, 2),
 
 	.speed_grf_reg = RK3308_GRF_MAC_CON0,
+	.mac_speed_mask = BIT_U16(0),
 };
 
 #define RK3328_GRF_MAC_CON0	0x0900
@@ -563,8 +561,6 @@ static const struct rk_gmac_ops rk3308_ops = {
 /* RK3328_GRF_MAC_CON1 */
 #define RK3328_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3328_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3328_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RK3328_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3328_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3328_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 #define RK3328_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -609,8 +605,8 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3328_reg_speed_data = {
-	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M | RK3328_GMAC_SPEED_10M,
-	.rmii_100 = RK3328_GMAC_RMII_CLK_25M | RK3328_GMAC_SPEED_100M,
+	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3328_GMAC_RMII_CLK_25M,
 };
 
 static int rk3328_set_speed(struct rk_priv_data *bsp_priv,
@@ -639,6 +635,8 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.phy_intf_sel_mask = GENMASK_U16(6, 4),
 	.rmii_mode_mask = BIT_U16(9),
 
+	.mac_speed_mask = BIT_U16(2),
+
 	.regs_valid = true,
 	.regs = {
 		0xff540000, /* gmac2io */
@@ -653,8 +651,6 @@ static const struct rk_gmac_ops rk3328_ops = {
 /* RK3366_GRF_SOC_CON6 */
 #define RK3366_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3366_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3366_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3366_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3366_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3366_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -680,8 +676,8 @@ static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3366_reg_speed_data = {
-	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M | RK3366_GMAC_SPEED_10M,
-	.rmii_100 = RK3366_GMAC_RMII_CLK_25M | RK3366_GMAC_SPEED_100M,
+	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3366_GMAC_RMII_CLK_25M,
 };
 
 static int rk3366_set_speed(struct rk_priv_data *bsp_priv,
@@ -702,6 +698,7 @@ static const struct rk_gmac_ops rk3366_ops = {
 
 	.speed_grf_reg = RK3366_GRF_SOC_CON6,
 	.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3368_GRF_SOC_CON15	0x043c
@@ -710,8 +707,6 @@ static const struct rk_gmac_ops rk3366_ops = {
 /* RK3368_GRF_SOC_CON15 */
 #define RK3368_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3368_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3368_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3368_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3368_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3368_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -737,8 +732,8 @@ static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3368_reg_speed_data = {
-	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M | RK3368_GMAC_SPEED_10M,
-	.rmii_100 = RK3368_GMAC_RMII_CLK_25M | RK3368_GMAC_SPEED_100M,
+	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3368_GMAC_RMII_CLK_25M,
 };
 
 static int rk3368_set_speed(struct rk_priv_data *bsp_priv,
@@ -759,6 +754,7 @@ static const struct rk_gmac_ops rk3368_ops = {
 
 	.speed_grf_reg = RK3368_GRF_SOC_CON15,
 	.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3399_GRF_SOC_CON5	0xc214
@@ -767,8 +763,6 @@ static const struct rk_gmac_ops rk3368_ops = {
 /* RK3399_GRF_SOC_CON5 */
 #define RK3399_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3399_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3399_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3399_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3399_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3399_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -794,8 +788,8 @@ static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3399_reg_speed_data = {
-	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M | RK3399_GMAC_SPEED_10M,
-	.rmii_100 = RK3399_GMAC_RMII_CLK_25M | RK3399_GMAC_SPEED_100M,
+	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3399_GMAC_RMII_CLK_25M,
 };
 
 static int rk3399_set_speed(struct rk_priv_data *bsp_priv,
@@ -816,6 +810,7 @@ static const struct rk_gmac_ops rk3399_ops = {
 
 	.speed_grf_reg = RK3399_GRF_SOC_CON5,
 	.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3506_GRF_SOC_CON8		0x0020
@@ -1361,8 +1356,6 @@ static const struct rk_gmac_ops rk3588_ops = {
 /* RV1108_GRF_GMAC_CON0 */
 #define RV1108_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RV1108_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RV1108_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RV1108_GMAC_SPEED_100M		GRF_BIT(2)
 #define RV1108_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RV1108_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 
@@ -1371,8 +1364,8 @@ static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rv1108_reg_speed_data = {
-	.rmii_10 = RV1108_GMAC_RMII_CLK_2_5M | RV1108_GMAC_SPEED_10M,
-	.rmii_100 = RV1108_GMAC_RMII_CLK_25M | RV1108_GMAC_SPEED_100M,
+	.rmii_10 = RV1108_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RV1108_GMAC_RMII_CLK_25M,
 };
 
 static int rv1108_set_speed(struct rk_priv_data *bsp_priv,
@@ -1390,6 +1383,7 @@ static const struct rk_gmac_ops rv1108_ops = {
 	.phy_intf_sel_mask = GENMASK_U16(6, 4),
 
 	.speed_grf_reg = RV1108_GRF_GMAC_CON0,
+	.mac_speed_mask = BIT_U16(2),
 };
 
 #define RV1126_GRF_GMAC_CON0		0X0070
@@ -1672,6 +1666,7 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	/* Set the default speed related parameters */
 	bsp_priv->speed_grf_reg = ops->speed_grf_reg;
 	bsp_priv->gmii_clk_sel_mask = ops->gmii_clk_sel_mask;
+	bsp_priv->mac_speed_mask = ops->mac_speed_mask;
 
 	if (ops->init) {
 		ret = ops->init(bsp_priv);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
