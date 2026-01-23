Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GChjEQ9Vc2kDuwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 12:01:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E774B66
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 12:01:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB38FC8F26A;
	Fri, 23 Jan 2026 11:01:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 812B1C8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pAMmV06WpTBpCMnulw6ANqIkvdXlb2C/XPgyVldDps=; b=Pf8Pk5Gd0ZvF/1sYeTFDn/SnJJ
 4+8CMGILcOgQqd00g6ekLouax+SUGvMFrsy/miCb2qiC3SarF4zYU8LyHCzRbLuf8PP8/43X53Arm
 M2g8TIg8zORqRJ8u5VNOQWWvobFTkBLvAOSu6dBtdfgJODLvatzr1B7kDYELEnf/CtvDPqBMYqFjl
 NUgH8SwUHJyi6hQfTcE0hYDP9CHQcxPJPU8dCfiuIKp9aDdZP6Th93Soa/WUvqkjZvqAxVgRCaYoa
 5Xr6Y29490aOkLqTZys2g0Ff3/PnEuNdaNLZS49YqGTW/RnmIMgbNAIrYzaRQfN/3tkfzEkErgeGt
 T2uicy2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50526 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vjEuo-000000001pb-16OS;
 Fri, 23 Jan 2026 11:01:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vjEul-00000005ggi-0CAA; Fri, 23 Jan 2026 11:01:19 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vjEul-00000005ggi-0CAA@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:19 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 12/21] net: stmmac: rk: use
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
	NEURAL_HAM(-0.00)[-0.038];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: E69E774B66
X-Rspamd-Action: no action

The RMII speed configuration is encoded as a single bit, which is set
for 100M and clean for 10M. Provide the bitfield definition in
struct rk_clock_fields, moving it out of struct rk_reg_speed_data's
rmii_10 and rmii_100 initialisers. Update rk_set_reg_speed() to handle
the new definition location of this bit.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 69 +++++++++----------
 1 file changed, 31 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 0f94304e721a..48852054390d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -28,6 +28,7 @@ struct rk_priv_data;
 
 struct rk_clock_fields {
 	u16 gmii_clk_sel_mask;
+	u16 mac_speed_mask;
 };
 
 struct rk_reg_speed_data {
@@ -171,10 +172,12 @@ static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 
 		val = rk_encode_wm16(ret, bsp_priv->clock.gmii_clk_sel_mask);
 	} else if (interface == PHY_INTERFACE_MODE_RMII) {
+		val = rk_encode_wm16(speed == SPEED_100,
+				     bsp_priv->clock.mac_speed_mask);
 		if (speed == SPEED_10) {
-			val = rsd->rmii_10;
+			val |= rsd->rmii_10;
 		} else if (speed == SPEED_100) {
-			val = rsd->rmii_100;
+			val |= rsd->rmii_100;
 		} else {
 			/* Phylink will not allow inappropriate speeds for
 			 * interface modes, so this should never happen.
@@ -351,8 +354,6 @@ static const struct rk_gmac_ops px30_ops = {
 /* RK3128_GRF_MAC_CON1 */
 #define RK3128_GMAC_FLOW_CTRL          GRF_BIT(9)
 #define RK3128_GMAC_FLOW_CTRL_CLR      GRF_CLR_BIT(9)
-#define RK3128_GMAC_SPEED_10M          GRF_CLR_BIT(10)
-#define RK3128_GMAC_SPEED_100M         GRF_BIT(10)
 #define RK3128_GMAC_RMII_CLK_25M       GRF_BIT(11)
 #define RK3128_GMAC_RMII_CLK_2_5M      GRF_CLR_BIT(11)
 
@@ -370,8 +371,8 @@ static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3128_reg_speed_data = {
-	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M | RK3128_GMAC_SPEED_10M,
-	.rmii_100 = RK3128_GMAC_RMII_CLK_25M | RK3128_GMAC_SPEED_100M,
+	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3128_GMAC_RMII_CLK_25M,
 };
 
 static int rk3128_set_speed(struct rk_priv_data *bsp_priv,
@@ -392,6 +393,7 @@ static const struct rk_gmac_ops rk3128_ops = {
 
 	.clock_grf_reg = RK3128_GRF_MAC_CON1,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
+	.clock.mac_speed_mask = BIT_U16(10),
 };
 
 #define RK3228_GRF_MAC_CON0	0x0900
@@ -406,8 +408,6 @@ static const struct rk_gmac_ops rk3128_ops = {
 /* RK3228_GRF_MAC_CON1 */
 #define RK3228_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3228_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3228_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RK3228_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3228_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3228_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 #define RK3228_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -436,8 +436,8 @@ static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3228_reg_speed_data = {
-	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M | RK3228_GMAC_SPEED_10M,
-	.rmii_100 = RK3228_GMAC_RMII_CLK_25M | RK3228_GMAC_SPEED_100M,
+	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3228_GMAC_RMII_CLK_25M,
 };
 
 static int rk3228_set_speed(struct rk_priv_data *bsp_priv,
@@ -468,6 +468,7 @@ static const struct rk_gmac_ops rk3228_ops = {
 
 	.clock_grf_reg = RK3228_GRF_MAC_CON1,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(9, 8),
+	.clock.mac_speed_mask = BIT_U16(2),
 };
 
 #define RK3288_GRF_SOC_CON1	0x0248
@@ -476,8 +477,6 @@ static const struct rk_gmac_ops rk3228_ops = {
 /*RK3288_GRF_SOC_CON1*/
 #define RK3288_GMAC_FLOW_CTRL		GRF_BIT(9)
 #define RK3288_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(9)
-#define RK3288_GMAC_SPEED_10M		GRF_CLR_BIT(10)
-#define RK3288_GMAC_SPEED_100M		GRF_BIT(10)
 #define RK3288_GMAC_RMII_CLK_25M	GRF_BIT(11)
 #define RK3288_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(11)
 
@@ -503,8 +502,8 @@ static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3288_reg_speed_data = {
-	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M | RK3288_GMAC_SPEED_10M,
-	.rmii_100 = RK3288_GMAC_RMII_CLK_25M | RK3288_GMAC_SPEED_100M,
+	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3288_GMAC_RMII_CLK_25M,
 };
 
 static int rk3288_set_speed(struct rk_priv_data *bsp_priv,
@@ -525,6 +524,7 @@ static const struct rk_gmac_ops rk3288_ops = {
 
 	.clock_grf_reg = RK3288_GRF_SOC_CON1,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
+	.clock.mac_speed_mask = BIT_U16(10),
 };
 
 #define RK3308_GRF_MAC_CON0		0x04a0
@@ -532,16 +532,12 @@ static const struct rk_gmac_ops rk3288_ops = {
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
@@ -559,6 +555,7 @@ static const struct rk_gmac_ops rk3308_ops = {
 	.gmac_phy_intf_sel_mask = GENMASK_U16(4, 2),
 
 	.clock_grf_reg = RK3308_GRF_MAC_CON0,
+	.clock.mac_speed_mask = BIT_U16(0),
 };
 
 #define RK3328_GRF_MAC_CON0	0x0900
@@ -573,8 +570,6 @@ static const struct rk_gmac_ops rk3308_ops = {
 /* RK3328_GRF_MAC_CON1 */
 #define RK3328_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3328_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3328_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RK3328_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3328_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3328_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 #define RK3328_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -619,8 +614,8 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3328_reg_speed_data = {
-	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M | RK3328_GMAC_SPEED_10M,
-	.rmii_100 = RK3328_GMAC_RMII_CLK_25M | RK3328_GMAC_SPEED_100M,
+	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3328_GMAC_RMII_CLK_25M,
 };
 
 static int rk3328_set_speed(struct rk_priv_data *bsp_priv,
@@ -649,6 +644,8 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 	.gmac_rmii_mode_mask = BIT_U16(9),
 
+	.clock.mac_speed_mask = BIT_U16(2),
+
 	.regs_valid = true,
 	.regs = {
 		0xff540000, /* gmac2io */
@@ -663,8 +660,6 @@ static const struct rk_gmac_ops rk3328_ops = {
 /* RK3366_GRF_SOC_CON6 */
 #define RK3366_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3366_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3366_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3366_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3366_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3366_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -690,8 +685,8 @@ static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3366_reg_speed_data = {
-	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M | RK3366_GMAC_SPEED_10M,
-	.rmii_100 = RK3366_GMAC_RMII_CLK_25M | RK3366_GMAC_SPEED_100M,
+	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3366_GMAC_RMII_CLK_25M,
 };
 
 static int rk3366_set_speed(struct rk_priv_data *bsp_priv,
@@ -712,6 +707,7 @@ static const struct rk_gmac_ops rk3366_ops = {
 
 	.clock_grf_reg = RK3366_GRF_SOC_CON6,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.clock.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3368_GRF_SOC_CON15	0x043c
@@ -720,8 +716,6 @@ static const struct rk_gmac_ops rk3366_ops = {
 /* RK3368_GRF_SOC_CON15 */
 #define RK3368_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3368_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3368_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3368_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3368_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3368_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -747,8 +741,8 @@ static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3368_reg_speed_data = {
-	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M | RK3368_GMAC_SPEED_10M,
-	.rmii_100 = RK3368_GMAC_RMII_CLK_25M | RK3368_GMAC_SPEED_100M,
+	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3368_GMAC_RMII_CLK_25M,
 };
 
 static int rk3368_set_speed(struct rk_priv_data *bsp_priv,
@@ -769,6 +763,7 @@ static const struct rk_gmac_ops rk3368_ops = {
 
 	.clock_grf_reg = RK3368_GRF_SOC_CON15,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.clock.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3399_GRF_SOC_CON5	0xc214
@@ -777,8 +772,6 @@ static const struct rk_gmac_ops rk3368_ops = {
 /* RK3399_GRF_SOC_CON5 */
 #define RK3399_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3399_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3399_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3399_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3399_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3399_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -804,8 +797,8 @@ static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3399_reg_speed_data = {
-	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M | RK3399_GMAC_SPEED_10M,
-	.rmii_100 = RK3399_GMAC_RMII_CLK_25M | RK3399_GMAC_SPEED_100M,
+	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3399_GMAC_RMII_CLK_25M,
 };
 
 static int rk3399_set_speed(struct rk_priv_data *bsp_priv,
@@ -826,6 +819,7 @@ static const struct rk_gmac_ops rk3399_ops = {
 
 	.clock_grf_reg = RK3399_GRF_SOC_CON5,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.clock.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3506_GRF_SOC_CON8		0x0020
@@ -1370,8 +1364,6 @@ static const struct rk_gmac_ops rk3588_ops = {
 /* RV1108_GRF_GMAC_CON0 */
 #define RV1108_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RV1108_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RV1108_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RV1108_GMAC_SPEED_100M		GRF_BIT(2)
 #define RV1108_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RV1108_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 
@@ -1380,8 +1372,8 @@ static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rv1108_reg_speed_data = {
-	.rmii_10 = RV1108_GMAC_RMII_CLK_2_5M | RV1108_GMAC_SPEED_10M,
-	.rmii_100 = RV1108_GMAC_RMII_CLK_25M | RV1108_GMAC_SPEED_100M,
+	.rmii_10 = RV1108_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RV1108_GMAC_RMII_CLK_25M,
 };
 
 static int rv1108_set_speed(struct rk_priv_data *bsp_priv,
@@ -1399,6 +1391,7 @@ static const struct rk_gmac_ops rv1108_ops = {
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 
 	.clock_grf_reg = RV1108_GRF_GMAC_CON0,
+	.clock.mac_speed_mask = BIT_U16(2),
 };
 
 #define RV1126_GRF_GMAC_CON0		0X0070
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
