Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E25N/UNg2k+hAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 10:14:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF6E3A44
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 10:14:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72C76C87ECC;
	Wed,  4 Feb 2026 09:14:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16945C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 09:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWgrmUmG3QKiIHwR77XuEdfzIWVqUd7IqmY5aMiaSFU=; b=pT4BOjWx/cDxX/30kj4vXYfvUD
 hgaghujRdL6c4LQbEmld0KTZBtn3/FejJhyx1lsrmRd5ZN/ZRqYrOQKCsPvO2j35cKTvSN9zSqsBi
 9vuxq8Y7FwMAHnVQBkJ6d6aP3J0iYjvKe6vrx/uxps4HOI3iNaaCVSx12Y0dzKkoCdhrsfvPW0c28
 Omqbp4vRkGLbKsaYMS4TVRkBbSW7h7VCD5DvjPt/Oq/lHGEec/YEav9gK1/56cWQR7uVOptPamke0
 z1cOrLynYM1cBQQCdDdjS4TaM55aJjflNGGSuZDFuFarIOKYN7NJCfm4iIAXtMqpZqmnm4TCS89mr
 AMcdzxZw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38676 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vnYxr-0000000066b-3MsY;
 Wed, 04 Feb 2026 09:14:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vnYxq-00000007hor-3yXt; Wed, 04 Feb 2026 09:14:22 +0000
In-Reply-To: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vnYxq-00000007hor-3yXt@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Feb 2026 09:14:22 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: rk: replace empty
 set_to_rmii() with supports_rmii
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C1AF6E3A44
X-Rspamd-Action: no action

Rather than providing a now-empty set_to_rmii() method to indicate
that RMII is supported, switch to setting ops->supports_rmii instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 86 ++++++-------------
 1 file changed, 24 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 73d471844022..25ad8600e9e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -268,12 +268,7 @@ static void rk_gmac_integrated_fephy_powerdown(struct rk_priv_data *priv,
 
 #define PX30_GRF_GMAC_CON1		0x0904
 
-static void px30_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops px30_ops = {
-	.set_to_rmii = px30_set_to_rmii,
 	.set_speed = rk_set_clk_mac_speed,
 
 	.gmac_grf_reg = PX30_GRF_GMAC_CON1,
@@ -281,6 +276,8 @@ static const struct rk_gmac_ops px30_ops = {
 
 	.clock_grf_reg = PX30_GRF_GMAC_CON1,
 	.clock.mac_speed_mask = BIT_U16(2),
+
+	.supports_rmii = true,
 };
 
 #define RK3128_GRF_MAC_CON0	0x0168
@@ -307,13 +304,8 @@ static void rk3128_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3128_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3128_ops = {
 	.set_to_rgmii = rk3128_set_to_rgmii,
-	.set_to_rmii = rk3128_set_to_rmii,
 
 	.gmac_grf_reg = RK3128_GRF_MAC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -323,6 +315,8 @@ static const struct rk_gmac_ops rk3128_ops = {
 	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
 	.clock.rmii_clk_sel_mask = BIT_U16(11),
 	.clock.mac_speed_mask = BIT_U16(10),
+
+	.supports_rmii = true,
 };
 
 #define RK3228_GRF_MAC_CON0	0x0900
@@ -410,13 +404,8 @@ static void rk3288_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3288_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3288_ops = {
 	.set_to_rgmii = rk3288_set_to_rgmii,
-	.set_to_rmii = rk3288_set_to_rmii,
 
 	.gmac_grf_reg = RK3288_GRF_SOC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -426,6 +415,8 @@ static const struct rk_gmac_ops rk3288_ops = {
 	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
 	.clock.rmii_clk_sel_mask = BIT_U16(11),
 	.clock.mac_speed_mask = BIT_U16(10),
+
+	.supports_rmii = true,
 };
 
 #define RK3308_GRF_MAC_CON0		0x04a0
@@ -434,18 +425,14 @@ static const struct rk_gmac_ops rk3288_ops = {
 #define RK3308_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3308_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
 
-static void rk3308_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3308_ops = {
-	.set_to_rmii = rk3308_set_to_rmii,
-
 	.gmac_grf_reg = RK3308_GRF_MAC_CON0,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(4, 2),
 
 	.clock_grf_reg = RK3308_GRF_MAC_CON0,
 	.clock.mac_speed_mask = BIT_U16(0),
+
+	.supports_rmii = true,
 };
 
 #define RK3328_GRF_MAC_CON0	0x0900
@@ -497,10 +484,6 @@ static void rk3328_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3328_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static void rk3328_integrated_phy_powerup(struct rk_priv_data *priv)
 {
 	regmap_write(priv->grf, RK3328_GRF_MACPHY_CON1,
@@ -512,7 +495,6 @@ static void rk3328_integrated_phy_powerup(struct rk_priv_data *priv)
 static const struct rk_gmac_ops rk3328_ops = {
 	.init = rk3328_init,
 	.set_to_rgmii = rk3328_set_to_rgmii,
-	.set_to_rmii = rk3328_set_to_rmii,
 	.integrated_phy_powerup = rk3328_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 
@@ -522,6 +504,8 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.clock.rmii_clk_sel_mask = BIT_U16(7),
 	.clock.mac_speed_mask = BIT_U16(2),
 
+	.supports_rmii = true,
+
 	.regs_valid = true,
 	.regs = {
 		0xff540000, /* gmac2io */
@@ -554,13 +538,8 @@ static void rk3366_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3366_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3366_ops = {
 	.set_to_rgmii = rk3366_set_to_rgmii,
-	.set_to_rmii = rk3366_set_to_rmii,
 
 	.gmac_grf_reg = RK3366_GRF_SOC_CON6,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -570,6 +549,8 @@ static const struct rk_gmac_ops rk3366_ops = {
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 	.clock.rmii_clk_sel_mask = BIT_U16(3),
 	.clock.mac_speed_mask = BIT_U16(7),
+
+	.supports_rmii = true,
 };
 
 #define RK3368_GRF_SOC_CON15	0x043c
@@ -596,13 +577,8 @@ static void rk3368_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3368_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3368_ops = {
 	.set_to_rgmii = rk3368_set_to_rgmii,
-	.set_to_rmii = rk3368_set_to_rmii,
 
 	.gmac_grf_reg = RK3368_GRF_SOC_CON15,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -612,6 +588,8 @@ static const struct rk_gmac_ops rk3368_ops = {
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 	.clock.rmii_clk_sel_mask = BIT_U16(3),
 	.clock.mac_speed_mask = BIT_U16(7),
+
+	.supports_rmii = true,
 };
 
 #define RK3399_GRF_SOC_CON5	0xc214
@@ -638,13 +616,8 @@ static void rk3399_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3399_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rk3399_ops = {
 	.set_to_rgmii = rk3399_set_to_rgmii,
-	.set_to_rmii = rk3399_set_to_rmii,
 
 	.gmac_grf_reg = RK3399_GRF_SOC_CON5,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -654,6 +627,8 @@ static const struct rk_gmac_ops rk3399_ops = {
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 	.clock.rmii_clk_sel_mask = BIT_U16(3),
 	.clock.mac_speed_mask = BIT_U16(7),
+
+	.supports_rmii = true,
 };
 
 #define RK3506_GRF_SOC_CON8		0x0020
@@ -884,18 +859,15 @@ static void rk3568_set_to_rgmii(struct rk_priv_data *bsp_priv,
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
 
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 
+	.supports_rmii = true,
+
 	.regs_valid = true,
 	.regs = {
 		0xfe2a0000, /* gmac0 */
@@ -969,10 +941,6 @@ static void rk3576_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3576_GMAC_CLK_RX_DL_CFG(rx_delay));
 }
 
-static void rk3576_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static void rk3576_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
 				       bool enable)
 {
@@ -992,7 +960,6 @@ static void rk3576_set_clock_selection(struct rk_priv_data *bsp_priv, bool input
 static const struct rk_gmac_ops rk3576_ops = {
 	.init = rk3576_init,
 	.set_to_rgmii = rk3576_set_to_rgmii,
-	.set_to_rmii = rk3576_set_to_rmii,
 	.set_clock_selection = rk3576_set_clock_selection,
 
 	.gmac_rmii_mode_mask = BIT_U16(3),
@@ -1000,6 +967,8 @@ static const struct rk_gmac_ops rk3576_ops = {
 	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
 	.clock.rmii_clk_sel_mask = BIT_U16(5),
 
+	.supports_rmii = true,
+
 	.php_grf_required = true,
 	.regs_valid = true,
 	.regs = {
@@ -1120,19 +1089,15 @@ static const struct rk_gmac_ops rk3588_ops = {
 #define RV1108_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RV1108_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
 
-static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-}
-
 static const struct rk_gmac_ops rv1108_ops = {
-	.set_to_rmii = rv1108_set_to_rmii,
-
 	.gmac_grf_reg = RV1108_GRF_GMAC_CON0,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 
 	.clock_grf_reg = RV1108_GRF_GMAC_CON0,
 	.clock.rmii_clk_sel_mask = BIT_U16(7),
 	.clock.mac_speed_mask = BIT_U16(2),
+
+	.supports_rmii = true,
 };
 
 #define RV1126_GRF_GMAC_CON0		0X0070
@@ -1176,17 +1141,14 @@ static void rv1126_set_to_rgmii(struct rk_priv_data *bsp_priv,
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
 
 	.gmac_grf_reg = RV1126_GRF_GMAC_CON0,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
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
