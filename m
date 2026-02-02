Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGknM8R2gGmo8gIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Feb 2026 11:04:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 744EBCA747
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Feb 2026 11:04:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BE7AC87EC7;
	Mon,  2 Feb 2026 10:04:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F89DC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Feb 2026 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yLDuHVbeh2aXrvnOU3La46TQXr0IW/lqaOeSpZ/j4WA=; b=iF+MA4zfJ9tMG0dJN5Opl5Lqqm
 ajwr5JTzfqHxH9p70c5I2q83cLNytxiy3NsZFWSkmhva8r/2I96beKhLhA20TMi5Y8YbRlxKLvBmx
 C3UtKJbl+F/jKMobTUpkZJJQ1fYpnFSJwyT7IO9Lsi+8paCuny1wZedeIimhb28ehx21SxWYQISep
 OTvyialw6InMgZ4Qc5/HJe+r0ufn1nfD62FDPZb7KR62tFuo7jmF0RyCHLUuo9DnWI+zML3nj40D3
 wQwHrRTV2WYQGdYyngcikOmfog/1fNM2wSPAHxdr7oRssKY3956GHu3qDWpP6OYSwh+5Y0R7AEZEA
 gK7O97YQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35140 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vmqnO-000000003oJ-1IUE;
 Mon, 02 Feb 2026 10:04:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vmqnM-00000007VD8-1xWo; Mon, 02 Feb 2026 10:04:36 +0000
In-Reply-To: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
References: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vmqnM-00000007VD8-1xWo@rmk-PC.armlinux.org.uk>
Date: Mon, 02 Feb 2026 10:04:36 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 09/10] net: stmmac: rk: remove
 need for ->set_speed() method
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
	NEURAL_HAM(-0.00)[-0.989];
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
X-Rspamd-Queue-Id: 744EBCA747
X-Rspamd-Action: no action

As we can detect whether the SoC provides the parameters necessary for
rk_set_reg_speed(), we don't need to have explicit calls to this.
Instead, we can move the contents of this function to
rk_set_clk_tx_rate().

This remsoves all the .set_speed() implementations that merely go on to
invoke rk_set_reg_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 154 ++++--------------
 1 file changed, 29 insertions(+), 125 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 9c845562c79f..d74c32365a33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -167,37 +167,6 @@ static int rk_write_clock_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
 	return regmap_write(regmap, bsp_priv->clock_grf_reg, val);
 }
 
-static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	unsigned int val;
-	int ret;
-
-	if (phy_interface_mode_is_rgmii(interface)) {
-		ret = rk_gmac_rgmii_clk_div(speed);
-		if (ret < 0)
-			return ret;
-
-		val = rk_encode_wm16(ret, bsp_priv->clock.gmii_clk_sel_mask);
-	} else if (interface == PHY_INTERFACE_MODE_RMII) {
-		val = rk_encode_wm16(speed == SPEED_100,
-				     bsp_priv->clock.mac_speed_mask) |
-		      rk_encode_wm16(speed == SPEED_100,
-				     bsp_priv->clock.rmii_clk_sel_mask);
-	} else {
-		/* This should never happen, as .get_interfaces() limits
-		 * the interface modes that are supported to RGMII and/or
-		 * RMII.
-		 */
-		return -EINVAL;
-	}
-
-	rk_write_clock_grf_reg(bsp_priv, val);
-
-	return 0;
-
-}
-
 static int rk_set_clk_mac_speed(struct rk_priv_data *bsp_priv,
 				phy_interface_t interface, int speed)
 {
@@ -368,16 +337,9 @@ static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
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
 
 	.gmac_grf_reg = RK3128_GRF_MAC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -426,12 +388,6 @@ static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
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
@@ -443,7 +399,6 @@ static void rk3228_integrated_phy_powerup(struct rk_priv_data *priv)
 static const struct rk_gmac_ops rk3228_ops = {
 	.set_to_rgmii = rk3228_set_to_rgmii,
 	.set_to_rmii = rk3228_set_to_rmii,
-	.set_speed = rk3228_set_speed,
 	.integrated_phy_powerup = rk3228_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 
@@ -485,16 +440,9 @@ static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
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
 
 	.gmac_grf_reg = RK3288_GRF_SOC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(8, 6),
@@ -516,15 +464,8 @@ static void rk3308_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int rk3308_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface, int speed)
-{
-	return rk_set_reg_speed(bsp_priv, interface, speed);
-}
-
 static const struct rk_gmac_ops rk3308_ops = {
 	.set_to_rmii = rk3308_set_to_rmii,
-	.set_speed = rk3308_set_speed,
 
 	.gmac_grf_reg = RK3308_GRF_MAC_CON0,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(4, 2),
@@ -586,12 +527,6 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
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
@@ -604,7 +539,6 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.init = rk3328_init,
 	.set_to_rgmii = rk3328_set_to_rgmii,
 	.set_to_rmii = rk3328_set_to_rmii,
-	.set_speed = rk3328_set_speed,
 	.integrated_phy_powerup = rk3328_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 
@@ -650,16 +584,9 @@ static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
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
 
 	.gmac_grf_reg = RK3366_GRF_SOC_CON6,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -699,16 +626,9 @@ static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
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
 
 	.gmac_grf_reg = RK3368_GRF_SOC_CON15,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -748,16 +668,9 @@ static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
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
 
 	.gmac_grf_reg = RK3399_GRF_SOC_CON5,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
@@ -804,12 +717,6 @@ static void rk3506_set_to_rmii(struct rk_priv_data *bsp_priv)
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
@@ -827,7 +734,6 @@ static void rk3506_set_clock_selection(struct rk_priv_data *bsp_priv,
 static const struct rk_gmac_ops rk3506_ops = {
 	.init = rk3506_init,
 	.set_to_rmii = rk3506_set_to_rmii,
-	.set_speed = rk3506_set_speed,
 	.set_clock_selection = rk3506_set_clock_selection,
 
 	.clock.rmii_clk_sel_mask = BIT_U16(3),
@@ -909,12 +815,6 @@ static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
 			     RK3528_GMAC0_PHY_INTF_SEL_RMII);
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
@@ -947,7 +847,6 @@ static const struct rk_gmac_ops rk3528_ops = {
 	.init = rk3528_init,
 	.set_to_rgmii = rk3528_set_to_rgmii,
 	.set_to_rmii = rk3528_set_to_rmii,
-	.set_speed = rk3528_set_speed,
 	.set_clock_selection = rk3528_set_clock_selection,
 	.integrated_phy_powerup = rk3528_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk3528_integrated_phy_powerdown,
@@ -1100,12 +999,6 @@ static void rk3576_set_to_rmii(struct rk_priv_data *bsp_priv)
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
@@ -1126,7 +1019,6 @@ static const struct rk_gmac_ops rk3576_ops = {
 	.init = rk3576_init,
 	.set_to_rgmii = rk3576_set_to_rgmii,
 	.set_to_rmii = rk3576_set_to_rmii,
-	.set_speed = rk3576_set_gmac_speed,
 	.set_clock_selection = rk3576_set_clock_selection,
 
 	.gmac_rmii_mode_mask = BIT_U16(3),
@@ -1215,12 +1107,6 @@ static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
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
@@ -1237,7 +1123,6 @@ static const struct rk_gmac_ops rk3588_ops = {
 	.init = rk3588_init,
 	.set_to_rgmii = rk3588_set_to_rgmii,
 	.set_to_rmii = rk3588_set_to_rmii,
-	.set_speed = rk3588_set_gmac_speed,
 	.set_clock_selection = rk3588_set_clock_selection,
 
 	.gmac_grf_reg_in_php = true,
@@ -1265,15 +1150,8 @@ static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
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
 
 	.gmac_grf_reg = RV1108_GRF_GMAC_CON0,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
@@ -1705,11 +1583,37 @@ static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
 			      phy_interface_t interface, int speed)
 {
 	struct rk_priv_data *bsp_priv = bsp_priv_;
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
+	if (phy_interface_mode_is_rgmii(interface) &&
+	    bsp_priv->clock.gmii_clk_sel_mask) {
+		ret = rk_gmac_rgmii_clk_div(speed);
+		if (ret < 0)
+			return ret;
+
+		val = rk_encode_wm16(ret, bsp_priv->clock.gmii_clk_sel_mask);
+
+		ret = rk_write_clock_grf_reg(bsp_priv, val);
+	} else if (interface == PHY_INTERFACE_MODE_RMII &&
+		   (bsp_priv->clock.rmii_clk_sel_mask ||
+		    bsp_priv->clock.mac_speed_mask)) {
+		is_100m = speed == SPEED_100;
+		val = rk_encode_wm16(is_100m, bsp_priv->clock.mac_speed_mask) |
+		      rk_encode_wm16(is_100m,
+				     bsp_priv->clock.rmii_clk_sel_mask);
+
+		ret = rk_write_clock_grf_reg(bsp_priv, val);
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
