Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800BC97EBC
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 15:52:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F8EC628DA;
	Mon,  1 Dec 2025 14:52:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28A9FC628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 14:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YIpsiEtfxO18wU0FXFwRSJS3ZpStnO8aBeZP1eLSkcg=; b=mNq5K6YhDlOoKFWm0S3sNjDFP3
 nIUvqmVzmHEk6pKEVOkU/9F6SDxSaz6/F4DDiJROJi/xu4LgxueZq8hXmnrIpd9wtdPKuyXKi8Zyh
 WqlzaV1QkACCN1T1BMo2mNMg0gYPJYsg44PUapPI2fffv9628H7AhiceMpP1eiGdrs93tfaGezM/b
 YXFrcMDxPDdUU7LrqF+l0y9dpIbWPMz0Xby0NJqh0H+dEhWku0+Fm7kEzmr0TGn0rYdDPByBrcqYi
 lwPFFATPHW73Pp8d/v7j1bEs0rZp9gjw9+rTgugMto4iP8YaKIa3OIFkg5DimX00MH7rdKfJdrx3p
 oaBP4piQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60522 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vQ5FZ-000000000hf-2SnP;
 Mon, 01 Dec 2025 14:51:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vQ5FV-0000000GNwO-3br0; Mon, 01 Dec 2025 14:51:33 +0000
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vQ5FV-0000000GNwO-3br0@rmk-PC.armlinux.org.uk>
Date: Mon, 01 Dec 2025 14:51:33 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 10/15] net: stmmac: rk: move
 speed register into bsp_priv
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
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 169 ++++--------------
 1 file changed, 34 insertions(+), 135 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a77ce36e0da6..c26bd22658c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -140,43 +140,6 @@ static u32 rk_encode_wm16(u16 val, u16 mask)
 	return reg_val;
 }
 
-static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	struct regmap *regmap;
-	unsigned int val;
-	int ret;
-
-	if (phy_interface_mode_is_rgmii(interface)) {
-		ret = rk_gmac_rgmii_clk_div(speed);
-		if (ret < 0)
-			return ret;
-
-		val = rk_encode_wm16(ret, bsp_priv->gmii_clk_sel_mask);
-	} else if (interface == PHY_INTERFACE_MODE_RMII) {
-		val = rk_encode_wm16(speed == SPEED_100,
-				     bsp_priv->mac_speed_mask) |
-		      rk_encode_wm16(speed == SPEED_100,
-				     bsp_priv->rmii_clk_sel_mask);
-	} else {
-		/* This should never happen, as .get_interfaces() limits
-		 * the interface modes that are supported to RGMII and/or
-		 * RMII.
-		 */
-		return -EINVAL;
-	}
-
-	if (bsp_priv->ops->speed_reg_php_grf)
-		regmap = bsp_priv->php_grf;
-	else
-		regmap = bsp_priv->grf;
-
-	regmap_write(regmap, bsp_priv->speed_grf_reg, val);
-
-	return 0;
-
-}
-
 static int rk_set_clk_mac_speed(struct rk_priv_data *bsp_priv,
 				phy_interface_t interface, int speed)
 {
@@ -347,16 +310,9 @@ static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3128_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static const struct rk_gmac_ops rk3128_ops = {
 	.set_to_rgmii = rk3128_set_to_rgmii,
 	.set_to_rmii = rk3128_set_to_rmii,
-	.set_speed = rk3128_set_speed,
 
 	.phy_intf_sel_grf_reg = RK3128_GRF_MAC_CON1,
 	.phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -405,12 +361,6 @@ static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
 	regmap_write(bsp_priv->grf, RK3228_GRF_MAC_CON1, GRF_BIT(11));
 }
 
-static int rk3228_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static void rk3228_integrated_phy_powerup(struct rk_priv_data *priv)
 {
 	regmap_write(priv->grf, RK3228_GRF_CON_MUX,
@@ -422,7 +372,6 @@ static void rk3228_integrated_phy_powerup(struct rk_priv_data *priv)
 static const struct rk_gmac_ops rk3228_ops = {
 	.set_to_rgmii = rk3228_set_to_rgmii,
 	.set_to_rmii = rk3228_set_to_rmii,
-	.set_speed = rk3228_set_speed,
 	.integrated_phy_powerup = rk3228_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 
@@ -464,16 +413,9 @@ static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3288_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static const struct rk_gmac_ops rk3288_ops = {
 	.set_to_rgmii = rk3288_set_to_rgmii,
 	.set_to_rmii = rk3288_set_to_rmii,
-	.set_speed = rk3288_set_speed,
 
 	.phy_intf_sel_grf_reg = RK3288_GRF_SOC_CON1,
 	.phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -495,19 +437,8 @@ static void rk3308_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static const struct rk_reg_speed_data rk3308_reg_speed_data = {
-};
-
-static int rk3308_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, &rk3308_reg_speed_data,
-				interface, speed);
-}
-
 static const struct rk_gmac_ops rk3308_ops = {
 	.set_to_rmii = rk3308_set_to_rmii,
-	.set_speed = rk3308_set_speed,
 
 	.phy_intf_sel_grf_reg = RK3308_GRF_MAC_CON0,
 	.phy_intf_sel_mask = GENMASK_U16(4, 2),
@@ -569,12 +500,6 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3328_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static void rk3328_integrated_phy_powerup(struct rk_priv_data *priv)
 {
 	regmap_write(priv->grf, RK3328_GRF_MACPHY_CON1,
@@ -587,7 +512,6 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.init = rk3328_init,
 	.set_to_rgmii = rk3328_set_to_rgmii,
 	.set_to_rmii = rk3328_set_to_rmii,
-	.set_speed = rk3328_set_speed,
 	.integrated_phy_powerup = rk3328_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 
@@ -633,16 +557,9 @@ static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3366_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static const struct rk_gmac_ops rk3366_ops = {
 	.set_to_rgmii = rk3366_set_to_rgmii,
 	.set_to_rmii = rk3366_set_to_rmii,
-	.set_speed = rk3366_set_speed,
 
 	.phy_intf_sel_grf_reg = RK3366_GRF_SOC_CON6,
 	.phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -682,16 +599,9 @@ static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3368_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static const struct rk_gmac_ops rk3368_ops = {
 	.set_to_rgmii = rk3368_set_to_rgmii,
 	.set_to_rmii = rk3368_set_to_rmii,
-	.set_speed = rk3368_set_speed,
 
 	.phy_intf_sel_grf_reg = RK3368_GRF_SOC_CON15,
 	.phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -731,16 +641,9 @@ static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3399_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static const struct rk_gmac_ops rk3399_ops = {
 	.set_to_rgmii = rk3399_set_to_rgmii,
 	.set_to_rmii = rk3399_set_to_rmii,
-	.set_speed = rk3399_set_speed,
 
 	.phy_intf_sel_grf_reg = RK3399_GRF_SOC_CON5,
 	.phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -787,12 +690,6 @@ static void rk3506_set_to_rmii(struct rk_priv_data *bsp_priv)
 	regmap_write(bsp_priv->grf, offset, RK3506_GMAC_RMII_MODE);
 }
 
-static int rk3506_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static void rk3506_set_clock_selection(struct rk_priv_data *bsp_priv,
 				       bool input, bool enable)
 {
@@ -810,7 +707,6 @@ static void rk3506_set_clock_selection(struct rk_priv_data *bsp_priv,
 static const struct rk_gmac_ops rk3506_ops = {
 	.init = rk3506_init,
 	.set_to_rmii = rk3506_set_to_rmii,
-	.set_speed = rk3506_set_speed,
 	.set_clock_selection = rk3506_set_clock_selection,
 
 	.rmii_clk_sel_mask = BIT_U16(3),
@@ -893,12 +789,6 @@ static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
 			     RK3528_GMAC0_CLK_RMII_DIV2);
 }
 
-static int rk3528_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static void rk3528_set_clock_selection(struct rk_priv_data *bsp_priv,
 				       bool input, bool enable)
 {
@@ -931,7 +821,6 @@ static const struct rk_gmac_ops rk3528_ops = {
 	.init = rk3528_init,
 	.set_to_rgmii = rk3528_set_to_rgmii,
 	.set_to_rmii = rk3528_set_to_rmii,
-	.set_speed = rk3528_set_speed,
 	.set_clock_selection = rk3528_set_clock_selection,
 	.integrated_phy_powerup = rk3528_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk3528_integrated_phy_powerdown,
@@ -1084,12 +973,6 @@ static void rk3576_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3576_set_gmac_speed(struct rk_priv_data *bsp_priv,
-				 phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static void rk3576_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
 				       bool enable)
 {
@@ -1110,7 +993,6 @@ static const struct rk_gmac_ops rk3576_ops = {
 	.init = rk3576_init,
 	.set_to_rgmii = rk3576_set_to_rgmii,
 	.set_to_rmii = rk3576_set_to_rmii,
-	.set_speed = rk3576_set_gmac_speed,
 	.set_clock_selection = rk3576_set_clock_selection,
 
 	.rmii_mode_mask = BIT_U16(3),
@@ -1199,12 +1081,6 @@ static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     RK3588_GMAC_CLK_RMII_MODE(bsp_priv->id));
 }
 
-static int rk3588_set_gmac_speed(struct rk_priv_data *bsp_priv,
-				 phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
 				       bool enable)
 {
@@ -1221,7 +1097,6 @@ static const struct rk_gmac_ops rk3588_ops = {
 	.init = rk3588_init,
 	.set_to_rgmii = rk3588_set_to_rgmii,
 	.set_to_rmii = rk3588_set_to_rmii,
-	.set_speed = rk3588_set_gmac_speed,
 	.set_clock_selection = rk3588_set_clock_selection,
 
 	.phy_intf_sel_grf_reg = RK3588_GRF_GMAC_CON0,
@@ -1248,15 +1123,8 @@ static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rv1108_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static const struct rk_gmac_ops rv1108_ops = {
 	.set_to_rmii = rv1108_set_to_rmii,
-	.set_speed = rv1108_set_speed,
 
 	.phy_intf_sel_grf_reg = RV1108_GRF_GMAC_CON0,
 	.phy_intf_sel_mask = GENMASK_U16(6, 4),
@@ -1681,11 +1549,42 @@ static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
 			      phy_interface_t interface, int speed)
 {
 	struct rk_priv_data *bsp_priv = bsp_priv_;
+	struct regmap *regmap;
+	int ret = -EINVAL;
+	bool is_100m;
+	u32 val;
 
-	if (bsp_priv->ops->set_speed)
-		return bsp_priv->ops->set_speed(bsp_priv, interface, speed);
+	if (bsp_priv->ops->set_speed) {
+		ret = bsp_priv->ops->set_speed(bsp_priv, interface, speed);
+		if (ret < 0)
+			return ret;
+	}
 
-	return -EINVAL;
+	if (bsp_priv->ops->speed_reg_php_grf)
+		regmap = bsp_priv->php_grf;
+	else
+		regmap = bsp_priv->grf;
+
+	if (phy_interface_mode_is_rgmii(interface) &&
+	    bsp_priv->gmii_clk_sel_mask) {
+		ret = rk_gmac_rgmii_clk_div(speed);
+		if (ret < 0)
+			return ret;
+
+		val = rk_encode_wm16(ret, bsp_priv->gmii_clk_sel_mask);
+
+		ret = regmap_write(regmap, bsp_priv->speed_grf_reg, val);
+	} else if (interface == PHY_INTERFACE_MODE_RMII &&
+		   (bsp_priv->rmii_clk_sel_mask ||
+		    bsp_priv->mac_speed_mask)) {
+		is_100m = speed == SPEED_100;
+		val = rk_encode_wm16(is_100m, bsp_priv->mac_speed_mask) |
+		      rk_encode_wm16(is_100m, bsp_priv->rmii_clk_sel_mask);
+
+		ret = regmap_write(regmap, bsp_priv->speed_grf_reg, val);
+	}
+
+	return ret;
 }
 
 static int rk_gmac_suspend(struct device *dev, void *bsp_priv_)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
