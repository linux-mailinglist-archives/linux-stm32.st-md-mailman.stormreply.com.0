Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNEABg8Og2k+hAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 10:14:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02554E3A72
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 10:14:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C05E8C87ECD;
	Wed,  4 Feb 2026 09:14:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FC26C87ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y6dlgoRHjx66lgZqNMuli3rgvrxz6BUSIrWxPeT/c5s=; b=O2Q3jVKeL/jgZ8S120Os91RI91
 4gEw8lqRQMCx6E6ZfDfbYslapbH680WdHMur0zF+bFtPR2aLSztWy7h0UJci9UvwGCaEMgcUZ6C+r
 Hk5zenUfAh6EBBgAp3dSaGPN3zYtcoDRm+9ZCGbbGBzKXxuQL1Eaiis43w4Cg7wRDJPQMITexhohH
 qjsnK+ABTA9MbzkeVqBW4bsh6LK/9HfnamfVWjJkhRRPCQ/jgNQpBdJZJyFZlcqbwbyXlhPGV1Sb5
 txyZJm4Ea0w0ycFKisFq6GWwF2z0fpyg2iB/64+J2t+Sj2W2VV/yG+E9v6IvrH7fZbBE9sv5Z3P6r
 djRfqaQA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33844 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vnYyD-0000000067o-0stw;
 Wed, 04 Feb 2026 09:14:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vnYyB-00000007hpF-1dwK; Wed, 04 Feb 2026 09:14:43 +0000
In-Reply-To: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vnYyB-00000007hpF-1dwK@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Feb 2026 09:14:43 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/6] net: stmmac: rk: rk3506,
 rk3528 and rk3588 have rmii_mode in clock register
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 02554E3A72
X-Rspamd-Action: no action

rk3506, rk3528 and rk3588 have the rmii_mode bit in the clock GRF
register rather than the gmac GRF register. Provide a mask for this
field in the clock register, and convert these SoCs to use this.
Add the necessary code in rk_gmac_powerup() to write this field.

This allows us to get rid of these SoCs set_to_rmii() function. As
such, we need to mark these SoCs as supporting RMII mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 64 +++++++------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index ed9adac70f0a..b0441a368cb1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -38,6 +38,7 @@ struct rk_clock_fields {
 	u16 gmii_clk_sel_mask;
 	u16 rmii_clk_sel_mask;
 	u16 rmii_gate_en_mask;
+	u16 rmii_mode_mask;
 	u16 mac_speed_mask;
 };
 
@@ -708,21 +709,15 @@ static int rk3506_init(struct rk_priv_data *bsp_priv)
 	}
 }
 
-static void rk3506_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-	unsigned int id = bsp_priv->id, offset;
-
-	offset = (id == 1) ? RK3506_GRF_SOC_CON11 : RK3506_GRF_SOC_CON8;
-	regmap_write(bsp_priv->grf, offset, RK3506_GMAC_RMII_MODE);
-}
-
 static const struct rk_gmac_ops rk3506_ops = {
 	.init = rk3506_init,
-	.set_to_rmii = rk3506_set_to_rmii,
 
 	.clock.io_clksel_io_mask = BIT_U16(5),
 	.clock.rmii_clk_sel_mask = BIT_U16(3),
 	.clock.rmii_gate_en_mask = BIT_U16(2),
+	.clock.rmii_mode_mask = BIT_U16(1),
+
+	.supports_rmii = true,
 
 	.regs_valid = true,
 	.regs = {
@@ -746,10 +741,6 @@ static const struct rk_gmac_ops rk3506_ops = {
 #define RK3528_GMAC_CLK_RX_DL_CFG(val)	GRF_FIELD(15, 8, val)
 #define RK3528_GMAC_CLK_TX_DL_CFG(val)	GRF_FIELD(7, 0, val)
 
-#define RK3528_GMAC0_PHY_INTF_SEL_RMII	GRF_BIT(1)
-#define RK3528_GMAC1_PHY_INTF_SEL_RGMII	GRF_CLR_BIT(8)
-#define RK3528_GMAC1_PHY_INTF_SEL_RMII	GRF_BIT(8)
-
 static int rk3528_init(struct rk_priv_data *bsp_priv)
 {
 	switch (bsp_priv->id) {
@@ -757,6 +748,7 @@ static int rk3528_init(struct rk_priv_data *bsp_priv)
 		bsp_priv->clock_grf_reg = RK3528_VO_GRF_GMAC_CON;
 		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(3);
 		bsp_priv->clock.rmii_gate_en_mask = BIT_U16(2);
+		bsp_priv->clock.rmii_mode_mask = BIT_U16(1);
 		bsp_priv->supports_rgmii = false;
 		return 0;
 
@@ -766,6 +758,7 @@ static int rk3528_init(struct rk_priv_data *bsp_priv)
 		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(11, 10);
 		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(10);
 		bsp_priv->clock.rmii_gate_en_mask = BIT_U16(9);
+		bsp_priv->clock.rmii_mode_mask = BIT_U16(8);
 		return 0;
 
 	default:
@@ -776,9 +769,6 @@ static int rk3528_init(struct rk_priv_data *bsp_priv)
 static void rk3528_set_to_rgmii(struct rk_priv_data *bsp_priv,
 				int tx_delay, int rx_delay)
 {
-	regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
-		     RK3528_GMAC1_PHY_INTF_SEL_RGMII);
-
 	regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
 		     DELAY_ENABLE(RK3528, tx_delay, rx_delay));
 
@@ -787,16 +777,6 @@ static void rk3528_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3528_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-	if (bsp_priv->id == 1)
-		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
-			     RK3528_GMAC1_PHY_INTF_SEL_RMII);
-	else
-		regmap_write(bsp_priv->grf, RK3528_VO_GRF_GMAC_CON,
-			     RK3528_GMAC0_PHY_INTF_SEL_RMII);
-}
-
 static void rk3528_integrated_phy_powerup(struct rk_priv_data *bsp_priv)
 {
 	rk_gmac_integrated_fephy_powerup(bsp_priv, RK3528_VO_GRF_MACPHY_CON0);
@@ -810,9 +790,11 @@ static void rk3528_integrated_phy_powerdown(struct rk_priv_data *bsp_priv)
 static const struct rk_gmac_ops rk3528_ops = {
 	.init = rk3528_init,
 	.set_to_rgmii = rk3528_set_to_rgmii,
-	.set_to_rmii = rk3528_set_to_rmii,
 	.integrated_phy_powerup = rk3528_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk3528_integrated_phy_powerdown,
+
+	.supports_rmii = true,
+
 	.regs_valid = true,
 	.regs = {
 		0xffbd0000, /* gmac0 */
@@ -988,9 +970,6 @@ static const struct rk_gmac_ops rk3576_ops = {
 #define RK3588_GRF_GMAC_CON0			0X0008
 #define RK3588_GRF_CLK_CON1			0X0070
 
-#define RK3588_GMAC_CLK_RMII_MODE(id)		GRF_BIT(5 * (id))
-#define RK3588_GMAC_CLK_RGMII_MODE(id)		GRF_CLR_BIT(5 * (id))
-
 static int rk3588_init(struct rk_priv_data *bsp_priv)
 {
 	switch (bsp_priv->id) {
@@ -1000,6 +979,7 @@ static int rk3588_init(struct rk_priv_data *bsp_priv)
 		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(3, 2);
 		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(2);
 		bsp_priv->clock.rmii_gate_en_mask = BIT_U16(1);
+		bsp_priv->clock.rmii_mode_mask = BIT_U16(0);
 		return 0;
 
 	case 1:
@@ -1008,6 +988,7 @@ static int rk3588_init(struct rk_priv_data *bsp_priv)
 		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(8, 7);
 		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(7);
 		bsp_priv->clock.rmii_gate_en_mask = BIT_U16(6);
+		bsp_priv->clock.rmii_mode_mask = BIT_U16(5);
 		return 0;
 
 	default:
@@ -1023,9 +1004,6 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
 	offset_con = bsp_priv->id == 1 ? RK3588_GRF_GMAC_CON9 :
 					 RK3588_GRF_GMAC_CON8;
 
-	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1,
-		     RK3588_GMAC_CLK_RGMII_MODE(id));
-
 	regmap_write(bsp_priv->grf, RK3588_GRF_GMAC_CON7,
 		     RK3588_GMAC_RXCLK_DLY_ENABLE(id) |
 		     RK3588_GMAC_TXCLK_DLY_ENABLE(id));
@@ -1035,16 +1013,9 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3588_GMAC_CLK_TX_DL_CFG(tx_delay));
 }
 
-static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
-{
-	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1,
-		     RK3588_GMAC_CLK_RMII_MODE(bsp_priv->id));
-}
-
 static const struct rk_gmac_ops rk3588_ops = {
 	.init = rk3588_init,
 	.set_to_rgmii = rk3588_set_to_rgmii,
-	.set_to_rmii = rk3588_set_to_rmii,
 
 	.gmac_grf_reg_in_php = true,
 	.gmac_grf_reg = RK3588_GRF_GMAC_CON0,
@@ -1052,6 +1023,8 @@ static const struct rk_gmac_ops rk3588_ops = {
 	.clock_grf_reg_in_php = true,
 	.clock_grf_reg = RK3588_GRF_CLK_CON1,
 
+	.supports_rmii = true,
+
 	.php_grf_required = true,
 	.regs_valid = true,
 	.regs = {
@@ -1432,6 +1405,17 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		}
 	}
 
+	if (bsp_priv->clock.rmii_mode_mask) {
+		val = rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
+				     bsp_priv->clock.rmii_mode_mask);
+
+		ret = rk_write_clock_grf_reg(bsp_priv, val);
+		if (ret < 0) {
+			gmac_clk_enable(bsp_priv, false);
+			return ret;
+		}
+	}
+
 	/*rmii or rgmii*/
 	switch (bsp_priv->phy_iface) {
 	case PHY_INTERFACE_MODE_RGMII:
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
