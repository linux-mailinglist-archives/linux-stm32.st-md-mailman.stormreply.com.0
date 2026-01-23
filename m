Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmwOAhVc2mSuwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 12:01:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C516574B4F
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 12:01:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 866B7C8F26A;
	Fri, 23 Jan 2026 11:01:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58AD3C8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C9X93ngFdepZJ7tlo3uK6JHD/4lpqLqmjUTQoYX79KQ=; b=nvQh7NG1A+rE9MGH1ZNoosBYsC
 aqOn+JbCxR+IQaruD+m8hdWlfo2zCjLA+a6wQpIfggw7GIir9FFMEkhKmhTyOg1vQpWQLtrdtTt0n
 mPSHZbZQ3nOJ53+05kyVCBt6OvaYqCSnP0H3F9aGLM21CUzPMg2CO9TCeqUZIZS6c4vQ1c3X3Ky0q
 rnjokF82F9sYjbUgPz0IV+QCnPZw2KRCebFmc0kCKVaqYarox6V+OHSBAS8XDNMdo1npCS9jzapD9
 wQ81AzRsuWO+k+7SBYcP8pKwfyCyG6MJ+yp1BGx+mLrvx8/gQ5PZP9LXoMYc4X+1u1vnErLaaW7Sg
 ueb+m4iQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42140 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vjEuh-000000001pF-2LNz;
 Fri, 23 Jan 2026 11:01:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vjEuf-00000005ggc-3vy3; Fri, 23 Jan 2026 11:01:13 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vjEuf-00000005ggc-3vy3@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:13 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/21] net: stmmac: rk: use
 rk_encode_wm16() for RGMII clocks
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
	NEURAL_HAM(-0.00)[-0.023];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: C516574B4F
X-Rspamd-Action: no action

As all of the RGMII clock selection bitfields (gmii_clk_sel) use the
same encoding, parameterise this by providing the bitfield mask in
the BSP private data.

This is the last user of GRF_FIELD_CONST(), so remove that definition
as well.

One additional change is for RK3328 - as only gmac2io supports RGMII,
only initialise the mask for this instance.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 100 +++++++-----------
 1 file changed, 36 insertions(+), 64 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index f2b7917b6a30..0f94304e721a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -26,10 +26,11 @@
 
 struct rk_priv_data;
 
+struct rk_clock_fields {
+	u16 gmii_clk_sel_mask;
+};
+
 struct rk_reg_speed_data {
-	unsigned int rgmii_10;
-	unsigned int rgmii_100;
-	unsigned int rgmii_1000;
 	unsigned int rmii_10;
 	unsigned int rmii_100;
 };
@@ -51,6 +52,7 @@ struct rk_gmac_ops {
 	u16 gmac_rmii_mode_mask;
 
 	u16 clock_grf_reg;
+	struct rk_clock_fields clock;
 
 	bool clock_grf_reg_in_php;
 	bool php_grf_required;
@@ -104,12 +106,24 @@ struct rk_priv_data {
 	u16 gmac_rmii_mode_mask;
 
 	u16 clock_grf_reg;
+	struct rk_clock_fields clock;
 };
 
 #define GMAC_CLK_DIV1_125M		0
 #define GMAC_CLK_DIV50_2_5M		2
 #define GMAC_CLK_DIV5_25M		3
 
+static int rk_gmac_rgmii_clk_div(int speed)
+{
+	if (speed == SPEED_10)
+		return GMAC_CLK_DIV50_2_5M;
+	if (speed == SPEED_100)
+		return GMAC_CLK_DIV5_25M;
+	if (speed == SPEED_1000)
+		return GMAC_CLK_DIV1_125M;
+	return -EINVAL;
+}
+
 static int rk_get_phy_intf_sel(phy_interface_t interface)
 {
 	int ret = stmmac_get_phy_intf_sel(interface);
@@ -148,20 +162,14 @@ static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	unsigned int val;
+	int ret;
 
 	if (phy_interface_mode_is_rgmii(interface)) {
-		if (speed == SPEED_10) {
-			val = rsd->rgmii_10;
-		} else if (speed == SPEED_100) {
-			val = rsd->rgmii_100;
-		} else if (speed == SPEED_1000) {
-			val = rsd->rgmii_1000;
-		} else {
-			/* Phylink will not allow inappropriate speeds for
-			 * interface modes, so this should never happen.
-			 */
-			return -EINVAL;
-		}
+		ret = rk_gmac_rgmii_clk_div(speed);
+		if (ret < 0)
+			return ret;
+
+		val = rk_encode_wm16(ret, bsp_priv->clock.gmii_clk_sel_mask);
 	} else if (interface == PHY_INTERFACE_MODE_RMII) {
 		if (speed == SPEED_10) {
 			val = rsd->rmii_10;
@@ -202,8 +210,6 @@ static int rk_set_clk_mac_speed(struct rk_priv_data *bsp_priv,
 
 #define GRF_FIELD(hi, lo, val)		\
 	FIELD_PREP_WM16(GENMASK_U16(hi, lo), val)
-#define GRF_FIELD_CONST(hi, lo, val)	\
-	FIELD_PREP_WM16_CONST(GENMASK_U16(hi, lo), val)
 
 #define GRF_BIT(nr)			(BIT(nr) | BIT(nr+16))
 #define GRF_CLR_BIT(nr)			(BIT(nr+16))
@@ -349,7 +355,6 @@ static const struct rk_gmac_ops px30_ops = {
 #define RK3128_GMAC_SPEED_100M         GRF_BIT(10)
 #define RK3128_GMAC_RMII_CLK_25M       GRF_BIT(11)
 #define RK3128_GMAC_RMII_CLK_2_5M      GRF_CLR_BIT(11)
-#define RK3128_GMAC_CLK(val)           GRF_FIELD_CONST(13, 12, val)
 
 static void rk3128_set_to_rgmii(struct rk_priv_data *bsp_priv,
 				int tx_delay, int rx_delay)
@@ -365,9 +370,6 @@ static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3128_reg_speed_data = {
-	.rgmii_10 = RK3128_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3128_GMAC_CLK(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3128_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M | RK3128_GMAC_SPEED_10M,
 	.rmii_100 = RK3128_GMAC_RMII_CLK_25M | RK3128_GMAC_SPEED_100M,
 };
@@ -389,6 +391,7 @@ static const struct rk_gmac_ops rk3128_ops = {
 	.gmac_rmii_mode_mask = BIT_U16(14),
 
 	.clock_grf_reg = RK3128_GRF_MAC_CON1,
+	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
 };
 
 #define RK3228_GRF_MAC_CON0	0x0900
@@ -407,7 +410,6 @@ static const struct rk_gmac_ops rk3128_ops = {
 #define RK3228_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3228_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3228_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
-#define RK3228_GMAC_CLK(val)		GRF_FIELD_CONST(9, 8, val)
 #define RK3228_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
 #define RK3228_GMAC_TXCLK_DLY_DISABLE	GRF_CLR_BIT(0)
 #define RK3228_GMAC_RXCLK_DLY_ENABLE	GRF_BIT(1)
@@ -434,9 +436,6 @@ static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3228_reg_speed_data = {
-	.rgmii_10 = RK3228_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3228_GMAC_CLK(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3228_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M | RK3228_GMAC_SPEED_10M,
 	.rmii_100 = RK3228_GMAC_RMII_CLK_25M | RK3228_GMAC_SPEED_100M,
 };
@@ -468,6 +467,7 @@ static const struct rk_gmac_ops rk3228_ops = {
 	.gmac_rmii_mode_mask = BIT_U16(10),
 
 	.clock_grf_reg = RK3228_GRF_MAC_CON1,
+	.clock.gmii_clk_sel_mask = GENMASK_U16(9, 8),
 };
 
 #define RK3288_GRF_SOC_CON1	0x0248
@@ -480,7 +480,6 @@ static const struct rk_gmac_ops rk3228_ops = {
 #define RK3288_GMAC_SPEED_100M		GRF_BIT(10)
 #define RK3288_GMAC_RMII_CLK_25M	GRF_BIT(11)
 #define RK3288_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(11)
-#define RK3288_GMAC_CLK(val)		GRF_FIELD_CONST(13, 12, val)
 
 /*RK3288_GRF_SOC_CON3*/
 #define RK3288_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(14)
@@ -504,9 +503,6 @@ static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3288_reg_speed_data = {
-	.rgmii_10 = RK3288_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3288_GMAC_CLK(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3288_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M | RK3288_GMAC_SPEED_10M,
 	.rmii_100 = RK3288_GMAC_RMII_CLK_25M | RK3288_GMAC_SPEED_100M,
 };
@@ -528,6 +524,7 @@ static const struct rk_gmac_ops rk3288_ops = {
 	.gmac_rmii_mode_mask = BIT_U16(14),
 
 	.clock_grf_reg = RK3288_GRF_SOC_CON1,
+	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
 };
 
 #define RK3308_GRF_MAC_CON0		0x04a0
@@ -580,7 +577,6 @@ static const struct rk_gmac_ops rk3308_ops = {
 #define RK3328_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3328_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3328_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
-#define RK3328_GMAC_CLK(val)		GRF_FIELD_CONST(12, 11, val)
 #define RK3328_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
 #define RK3328_GMAC_RXCLK_DLY_ENABLE	GRF_BIT(1)
 
@@ -593,6 +589,7 @@ static int rk3328_init(struct rk_priv_data *bsp_priv)
 	case 0: /* gmac2io */
 		bsp_priv->gmac_grf_reg = RK3328_GRF_MAC_CON1;
 		bsp_priv->clock_grf_reg = RK3328_GRF_MAC_CON1;
+		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(12, 11);
 		return 0;
 
 	case 1: /* gmac2phy */
@@ -622,9 +619,6 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3328_reg_speed_data = {
-	.rgmii_10 = RK3328_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3328_GMAC_CLK(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3328_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M | RK3328_GMAC_SPEED_10M,
 	.rmii_100 = RK3328_GMAC_RMII_CLK_25M | RK3328_GMAC_SPEED_100M,
 };
@@ -673,7 +667,6 @@ static const struct rk_gmac_ops rk3328_ops = {
 #define RK3366_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3366_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3366_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
-#define RK3366_GMAC_CLK(val)		GRF_FIELD_CONST(5, 4, val)
 
 /* RK3366_GRF_SOC_CON7 */
 #define RK3366_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(7)
@@ -697,9 +690,6 @@ static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3366_reg_speed_data = {
-	.rgmii_10 = RK3366_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3366_GMAC_CLK(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3366_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M | RK3366_GMAC_SPEED_10M,
 	.rmii_100 = RK3366_GMAC_RMII_CLK_25M | RK3366_GMAC_SPEED_100M,
 };
@@ -721,6 +711,7 @@ static const struct rk_gmac_ops rk3366_ops = {
 	.gmac_rmii_mode_mask = BIT_U16(6),
 
 	.clock_grf_reg = RK3366_GRF_SOC_CON6,
+	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 };
 
 #define RK3368_GRF_SOC_CON15	0x043c
@@ -733,7 +724,6 @@ static const struct rk_gmac_ops rk3366_ops = {
 #define RK3368_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3368_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3368_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
-#define RK3368_GMAC_CLK(val)		GRF_FIELD_CONST(5, 4, val)
 
 /* RK3368_GRF_SOC_CON16 */
 #define RK3368_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(7)
@@ -757,9 +747,6 @@ static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3368_reg_speed_data = {
-	.rgmii_10 = RK3368_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3368_GMAC_CLK(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3368_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M | RK3368_GMAC_SPEED_10M,
 	.rmii_100 = RK3368_GMAC_RMII_CLK_25M | RK3368_GMAC_SPEED_100M,
 };
@@ -781,6 +768,7 @@ static const struct rk_gmac_ops rk3368_ops = {
 	.gmac_rmii_mode_mask = BIT_U16(6),
 
 	.clock_grf_reg = RK3368_GRF_SOC_CON15,
+	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 };
 
 #define RK3399_GRF_SOC_CON5	0xc214
@@ -793,7 +781,6 @@ static const struct rk_gmac_ops rk3368_ops = {
 #define RK3399_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3399_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3399_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
-#define RK3399_GMAC_CLK(val)		GRF_FIELD_CONST(5, 4, val)
 
 /* RK3399_GRF_SOC_CON6 */
 #define RK3399_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(7)
@@ -817,9 +804,6 @@ static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3399_reg_speed_data = {
-	.rgmii_10 = RK3399_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3399_GMAC_CLK(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3399_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M | RK3399_GMAC_SPEED_10M,
 	.rmii_100 = RK3399_GMAC_RMII_CLK_25M | RK3399_GMAC_SPEED_100M,
 };
@@ -841,6 +825,7 @@ static const struct rk_gmac_ops rk3399_ops = {
 	.gmac_rmii_mode_mask = BIT_U16(6),
 
 	.clock_grf_reg = RK3399_GRF_SOC_CON5,
+	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
 };
 
 #define RK3506_GRF_SOC_CON8		0x0020
@@ -946,8 +931,6 @@ static const struct rk_gmac_ops rk3506_ops = {
 #define RK3528_GMAC1_CLK_RMII_DIV2	GRF_BIT(10)
 #define RK3528_GMAC1_CLK_RMII_DIV20	GRF_CLR_BIT(10)
 
-#define RK3528_GMAC1_CLK_RGMII(val)	GRF_FIELD_CONST(11, 10, val)
-
 #define RK3528_GMAC0_CLK_RMII_GATE	GRF_BIT(2)
 #define RK3528_GMAC0_CLK_RMII_NOGATE	GRF_CLR_BIT(2)
 #define RK3528_GMAC1_CLK_RMII_GATE	GRF_BIT(9)
@@ -962,6 +945,7 @@ static int rk3528_init(struct rk_priv_data *bsp_priv)
 
 	case 1:
 		bsp_priv->clock_grf_reg = RK3528_VPU_GRF_GMAC_CON5;
+		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(11, 10);
 		return 0;
 
 	default:
@@ -999,9 +983,6 @@ static const struct rk_reg_speed_data rk3528_gmac0_reg_speed_data = {
 };
 
 static const struct rk_reg_speed_data rk3528_gmac1_reg_speed_data = {
-	.rgmii_10 = RK3528_GMAC1_CLK_RGMII(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3528_GMAC1_CLK_RGMII(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3528_GMAC1_CLK_RGMII(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3528_GMAC1_CLK_RMII_DIV20,
 	.rmii_100 = RK3528_GMAC1_CLK_RMII_DIV2,
 };
@@ -1159,8 +1140,6 @@ static const struct rk_gmac_ops rk3568_ops = {
 #define RK3576_GMAC_CLK_RMII_DIV2		GRF_BIT(5)
 #define RK3576_GMAC_CLK_RMII_DIV20		GRF_CLR_BIT(5)
 
-#define RK3576_GMAC_CLK_RGMII(val)		GRF_FIELD_CONST(6, 5, val)
-
 #define RK3576_GMAC_CLK_RMII_GATE		GRF_BIT(4)
 #define RK3576_GMAC_CLK_RMII_NOGATE		GRF_CLR_BIT(4)
 
@@ -1210,9 +1189,6 @@ static void rk3576_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3578_reg_speed_data = {
-	.rgmii_10 = RK3576_GMAC_CLK_RGMII(GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3576_GMAC_CLK_RGMII(GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3576_GMAC_CLK_RGMII(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3576_GMAC_CLK_RMII_DIV20,
 	.rmii_100 = RK3576_GMAC_CLK_RMII_DIV2,
 };
@@ -1249,6 +1225,8 @@ static const struct rk_gmac_ops rk3576_ops = {
 
 	.gmac_rmii_mode_mask = BIT_U16(3),
 
+	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
+
 	.php_grf_required = true,
 	.regs_valid = true,
 	.regs = {
@@ -1284,9 +1262,6 @@ static const struct rk_gmac_ops rk3576_ops = {
 #define RK3588_GMA_CLK_RMII_DIV2(id)		GRF_BIT(5 * (id) + 2)
 #define RK3588_GMA_CLK_RMII_DIV20(id)		GRF_CLR_BIT(5 * (id) + 2)
 
-#define RK3588_GMAC_CLK_RGMII(id, val)		\
-	(GRF_FIELD_CONST(3, 2, val) << ((id) * 5))
-
 #define RK3588_GMAC_CLK_RMII_GATE(id)		GRF_BIT(5 * (id) + 1)
 #define RK3588_GMAC_CLK_RMII_NOGATE(id)		GRF_CLR_BIT(5 * (id) + 1)
 
@@ -1295,10 +1270,12 @@ static int rk3588_init(struct rk_priv_data *bsp_priv)
 	switch (bsp_priv->id) {
 	case 0:
 		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(5, 3);
+		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(3, 2);
 		return 0;
 
 	case 1:
 		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(11, 9);
+		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(8, 7);
 		return 0;
 
 	default:
@@ -1333,17 +1310,11 @@ static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3588_gmac0_speed_data = {
-	.rgmii_10 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3588_GMA_CLK_RMII_DIV20(0),
 	.rmii_100 = RK3588_GMA_CLK_RMII_DIV2(0),
 };
 
 static const struct rk_reg_speed_data rk3588_gmac1_speed_data = {
-	.rgmii_10 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV50_2_5M),
-	.rgmii_100 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV5_25M),
-	.rgmii_1000 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3588_GMA_CLK_RMII_DIV20(1),
 	.rmii_100 = RK3588_GMA_CLK_RMII_DIV2(1),
 };
@@ -1712,6 +1683,7 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 
 	/* Set the default clock control register related parameters */
 	bsp_priv->clock_grf_reg = ops->clock_grf_reg;
+	bsp_priv->clock = ops->clock;
 
 	if (ops->init) {
 		ret = ops->init(bsp_priv);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
