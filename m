Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLhlFvhTd2nMeAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 12:46:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E6087C43
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 12:46:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10DAFC8F26F;
	Mon, 26 Jan 2026 11:46:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01547C8F269
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Q6c8citotFNz5NVcBpc24Lya4NTXIqomAwdpmQQyEM=; b=YxtBBEa1+TTIxLXx+BY/ifOruq
 HAkWg3TjK+kXNPlDK62SAh2z3wVttgQnVASz6AzprYT5J7WJWMoJaVijbKNCia8ASiiED0byRMlZj
 7iubg2nDIB3zZHVJJRaoKYitEQ6sbO/AJwOXSStBkcI1L4GVauu1ZGtP7/rQtfV+Eo+So2QNA9A+V
 igV6D23EzPNnFEt+t4u32d5MBjlLXcOvfd9NMLkVzwn9MCDtN12141b1l6HiDMQvFCT1dB7WdLDY8
 uGPMlR23mmN54gAthZ0nV/j/ti0KQ6KvuAofl+EDDkZ/rc6AtfTzDBmdTBuwrWkLoJ4X0zNQzD+97
 a77pUJeg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36664 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vkL2U-000000004gA-1JYE;
 Mon, 26 Jan 2026 11:45:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vkL2T-00000005ut6-0rnf; Mon, 26 Jan 2026 11:45:49 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vkL2T-00000005ut6-0rnf@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:49 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 10/22] net: stmmac: rk: convert
 rk3588 to rk_set_reg_speed()
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 45E6087C43
X-Rspamd-Action: no action

Update rk_set_reg_speed() to use either the grf or php_grf regmap
depending on the SoC's requirements and convert rk3588, removing
its custom code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 63 ++++++++++---------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index cdeb77aee642..baf41d15eea3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -53,6 +53,7 @@ struct rk_gmac_ops {
 	u16 clock_grf_reg;
 
 	bool gmac_grf_reg_in_php;
+	bool clock_grf_reg_in_php;
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -145,7 +146,14 @@ static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
 
 static int rk_write_clock_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
 {
-	return regmap_write(bsp_priv->grf, bsp_priv->clock_grf_reg, val);
+	struct regmap *regmap;
+
+	if (bsp_priv->ops->clock_grf_reg_in_php)
+		regmap = bsp_priv->php_grf;
+	else
+		regmap = bsp_priv->grf;
+
+	return regmap_write(regmap, bsp_priv->clock_grf_reg, val);
 }
 
 static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
@@ -1338,39 +1346,33 @@ static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     RK3588_GMAC_CLK_RMII_MODE(bsp_priv->id));
 }
 
+static const struct rk_reg_speed_data rk3588_gmac0_speed_data = {
+	.rgmii_10 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV1_125M),
+	.rmii_10 = RK3588_GMA_CLK_RMII_DIV20(0),
+	.rmii_100 = RK3588_GMA_CLK_RMII_DIV2(0),
+};
+
+static const struct rk_reg_speed_data rk3588_gmac1_speed_data = {
+	.rgmii_10 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV1_125M),
+	.rmii_10 = RK3588_GMA_CLK_RMII_DIV20(1),
+	.rmii_100 = RK3588_GMA_CLK_RMII_DIV2(1),
+};
+
 static int rk3588_set_gmac_speed(struct rk_priv_data *bsp_priv,
 				 phy_interface_t interface, int speed)
 {
-	unsigned int val = 0, id = bsp_priv->id;
-
-	switch (speed) {
-	case 10:
-		if (interface == PHY_INTERFACE_MODE_RMII)
-			val = RK3588_GMA_CLK_RMII_DIV20(id);
-		else
-			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV50_2_5M);
-		break;
-	case 100:
-		if (interface == PHY_INTERFACE_MODE_RMII)
-			val = RK3588_GMA_CLK_RMII_DIV2(id);
-		else
-			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV5_25M);
-		break;
-	case 1000:
-		if (interface != PHY_INTERFACE_MODE_RMII)
-			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV1_125M);
-		else
-			goto err;
-		break;
-	default:
-		goto err;
-	}
+	const struct rk_reg_speed_data *rsd;
 
-	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1, val);
+	if (bsp_priv->id == 0)
+		rsd = &rk3588_gmac0_speed_data;
+	else
+		rsd = &rk3588_gmac1_speed_data;
 
-	return 0;
-err:
-	return -EINVAL;
+	return rk_set_reg_speed(bsp_priv, rsd, interface, speed);
 }
 
 static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
@@ -1395,6 +1397,9 @@ static const struct rk_gmac_ops rk3588_ops = {
 	.gmac_grf_reg_in_php = true,
 	.gmac_grf_reg = RK3588_GRF_GMAC_CON0,
 
+	.clock_grf_reg_in_php = true,
+	.clock_grf_reg = RK3588_GRF_CLK_CON1,
+
 	.php_grf_required = true,
 	.regs_valid = true,
 	.regs = {
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
