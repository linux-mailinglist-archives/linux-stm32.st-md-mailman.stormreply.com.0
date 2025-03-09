Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822FA58938
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 00:26:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B820C78F75;
	Sun,  9 Mar 2025 23:26:54 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29E94C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Mar 2025 23:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741562811; bh=g1vzbhos5OwaddvUHip/yFVK9gBZxHa1+o/ob3Y9bs8=;
 b=rvaedNT+eI20nRbyXMADr/pEMYsylMSrMh2X9qKeTKwzTsQ0zLttc0p05/mXN2Me4Ni33fSXG
 YTbL1b1LTrs2BH9/Y+p39ub3D0/Pj4tdFRffcaSiGX0zFbrnIlk1oBTjAQs9wYuOz2y/5w4p5L1
 G9VqFVKVvlKI6qcz+1WaCOEGItuoEnom/onsTaBmra3Za2WozDwRd/Ijl8O5U6zVBv/HXNUmn1A
 jHsvZWKDApKVIq+JsnBn1RF2/ejyK26ReCq/BrwV0ONMH9O/7Svv0BLzJfJLl1i0j4hxfvTckwA
 T7yjW50f45uifJr5hG2YKXC6fc5iAnRSEZZ6cDmBA0vA==
X-Forward-Email-ID: 67ce23b85209992d7c670ead
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun,  9 Mar 2025 23:26:14 +0000
Message-ID: <20250309232622.1498084-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309232622.1498084-1-jonas@kwiboo.se>
References: <20250309232622.1498084-1-jonas@kwiboo.se>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, David Wu <david.wu@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/5] net: stmmac: dwmac-rk: Add
	integrated_phy_powerdown operation
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

Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
the integrated PHY on RK3228/RK3328. Current powerup/down operation is
not compatible with the integrated PHY found in these newer SoCs.

Add a new integrated_phy_powerdown operation and change the call chain
for integrated_phy_powerup to prepare support for the integrated PHY
found in these newer SoCs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- New patch
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 31f4b7eb3718..3f096b3ccee8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -33,6 +33,7 @@ struct rk_gmac_ops {
 	void (*set_clock_selection)(struct rk_priv_data *bsp_priv, bool input,
 				    bool enable);
 	void (*integrated_phy_powerup)(struct rk_priv_data *bsp_priv);
+	void (*integrated_phy_powerdown)(struct rk_priv_data *bsp_priv);
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -104,11 +105,8 @@ struct rk_priv_data {
 #define RK_GRF_CON2_MACPHY_ID		HIWORD_UPDATE(0x1234, 0xffff, 0)
 #define RK_GRF_CON3_MACPHY_ID		HIWORD_UPDATE(0x35, 0x3f, 0)
 
-static void rk_gmac_integrated_phy_powerup(struct rk_priv_data *priv)
+static void rk_gmac_integrated_ephy_powerup(struct rk_priv_data *priv)
 {
-	if (priv->ops->integrated_phy_powerup)
-		priv->ops->integrated_phy_powerup(priv);
-
 	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_MACPHY_CFG_CLK_50M);
 	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_GMAC2PHY_RMII_MODE);
 
@@ -129,7 +127,7 @@ static void rk_gmac_integrated_phy_powerup(struct rk_priv_data *priv)
 	}
 }
 
-static void rk_gmac_integrated_phy_powerdown(struct rk_priv_data *priv)
+static void rk_gmac_integrated_ephy_powerdown(struct rk_priv_data *priv)
 {
 	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_MACPHY_DISABLE);
 	if (priv->phy_reset)
@@ -368,6 +366,8 @@ static void rk3228_integrated_phy_powerup(struct rk_priv_data *priv)
 {
 	regmap_write(priv->grf, RK3228_GRF_CON_MUX,
 		     RK3228_GRF_CON_MUX_GMAC_INTEGRATED_PHY);
+
+	rk_gmac_integrated_ephy_powerup(priv);
 }
 
 static const struct rk_gmac_ops rk3228_ops = {
@@ -375,7 +375,8 @@ static const struct rk_gmac_ops rk3228_ops = {
 	.set_to_rmii = rk3228_set_to_rmii,
 	.set_rgmii_speed = rk3228_set_rgmii_speed,
 	.set_rmii_speed = rk3228_set_rmii_speed,
-	.integrated_phy_powerup =  rk3228_integrated_phy_powerup,
+	.integrated_phy_powerup = rk3228_integrated_phy_powerup,
+	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 };
 
 #define RK3288_GRF_SOC_CON1	0x0248
@@ -601,6 +602,8 @@ static void rk3328_integrated_phy_powerup(struct rk_priv_data *priv)
 {
 	regmap_write(priv->grf, RK3328_GRF_MACPHY_CON1,
 		     RK3328_MACPHY_RMII_MODE);
+
+	rk_gmac_integrated_ephy_powerup(priv);
 }
 
 static const struct rk_gmac_ops rk3328_ops = {
@@ -608,7 +611,8 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.set_to_rmii = rk3328_set_to_rmii,
 	.set_rgmii_speed = rk3328_set_rgmii_speed,
 	.set_rmii_speed = rk3328_set_rmii_speed,
-	.integrated_phy_powerup =  rk3328_integrated_phy_powerup,
+	.integrated_phy_powerup = rk3328_integrated_phy_powerup,
+	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
 };
 
 #define RK3366_GRF_SOC_CON6	0x0418
@@ -1802,16 +1806,16 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 
 	pm_runtime_get_sync(dev);
 
-	if (bsp_priv->integrated_phy)
-		rk_gmac_integrated_phy_powerup(bsp_priv);
+	if (bsp_priv->integrated_phy && bsp_priv->ops->integrated_phy_powerup)
+		bsp_priv->ops->integrated_phy_powerup(bsp_priv);
 
 	return 0;
 }
 
 static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 {
-	if (gmac->integrated_phy)
-		rk_gmac_integrated_phy_powerdown(gmac);
+	if (gmac->integrated_phy && gmac->ops->integrated_phy_powerdown)
+		gmac->ops->integrated_phy_powerdown(gmac);
 
 	pm_runtime_put_sync(&gmac->pdev->dev);
 
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
