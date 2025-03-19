Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C931A69B18
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 22:45:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51A73C78F61;
	Wed, 19 Mar 2025 21:45:03 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B3E0C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 21:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1742420700; bh=L6J1WZQlQ4jkkHrsEJmiDwnkEgm0ftZ58Eh+fnNyjbU=;
 b=Bbo6+hkEs4kdagKW+XAHNuJnIGxuAqYE59naa+krvs6zpVZMd6vkZRqyLFnYNcdDg4r2Qe06T
 7CVxDnbVIx7ghbggYayx6sbEFju03j9eBWQe1TA22D0Dj8LUw1vKB2zrMH+MYnqyX8LSAfl/BeS
 usR4t960s4j0VtZPWXTvuvTAfFan75ul6d5TAzBjZJMxTQ5PYygq5E021krrXQj8xCuVBGUZlB+
 sgPvCbRwm7gtjD56M/BhYD70hHIVxKERbEkpWIsrdZKUeNHvrpWlMW6SQpbk88Q1s8lVUwa9HEL
 hc4NNOUcE9vVeDNgvv0riz3ZU/aKIwFhMOHOtX5InLMQ==
X-Forward-Email-ID: 67db3acecf4d592372b99442
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 19 Mar 2025 21:44:09 +0000
Message-ID: <20250319214415.3086027-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214415.3086027-1-jonas@kwiboo.se>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, David Wu <david.wu@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 5/5] net: stmmac: dwmac-rk: Add
	initial support for RK3528 integrated PHY
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

Add operations to powerup/down the integrated PHY found in RK3528.
Use helpers that can be used by other GMAC variants in the future.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- No change
Changes in v2:
- New patch

This is enough to power up the integrated PHY on RK3528 for MDIO/MII.
However, a PHY driver is still missing and I do not have any RK3528
board that make use of this MAC and PHY, so something that can be
improved upon in the future.
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 3673abd65302..700858ff6f7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -134,6 +134,35 @@ static void rk_gmac_integrated_ephy_powerdown(struct rk_priv_data *priv)
 		reset_control_assert(priv->phy_reset);
 }
 
+#define RK_FEPHY_SHUTDOWN		GRF_BIT(1)
+#define RK_FEPHY_POWERUP		GRF_CLR_BIT(1)
+#define RK_FEPHY_INTERNAL_RMII_SEL	GRF_BIT(6)
+#define RK_FEPHY_24M_CLK_SEL		(GRF_BIT(8) | GRF_BIT(9))
+#define RK_FEPHY_PHY_ID			GRF_BIT(11)
+
+static void rk_gmac_integrated_fephy_powerup(struct rk_priv_data *priv,
+					     unsigned int reg)
+{
+	reset_control_assert(priv->phy_reset);
+	usleep_range(20, 30);
+
+	regmap_write(priv->grf, reg,
+		     RK_FEPHY_POWERUP |
+		     RK_FEPHY_INTERNAL_RMII_SEL |
+		     RK_FEPHY_24M_CLK_SEL |
+		     RK_FEPHY_PHY_ID);
+	usleep_range(10000, 12000);
+
+	reset_control_deassert(priv->phy_reset);
+	usleep_range(50000, 60000);
+}
+
+static void rk_gmac_integrated_fephy_powerdown(struct rk_priv_data *priv,
+					       unsigned int reg)
+{
+	regmap_write(priv->grf, reg, RK_FEPHY_SHUTDOWN);
+}
+
 #define PX30_GRF_GMAC_CON1		0x0904
 
 /* PX30_GRF_GMAC_CON1 */
@@ -993,12 +1022,24 @@ static void rk3528_set_clock_selection(struct rk_priv_data *bsp_priv,
 	}
 }
 
+static void rk3528_integrated_phy_powerup(struct rk_priv_data *bsp_priv)
+{
+	rk_gmac_integrated_fephy_powerup(bsp_priv, RK3528_VO_GRF_MACPHY_CON0);
+}
+
+static void rk3528_integrated_phy_powerdown(struct rk_priv_data *bsp_priv)
+{
+	rk_gmac_integrated_fephy_powerdown(bsp_priv, RK3528_VO_GRF_MACPHY_CON0);
+}
+
 static const struct rk_gmac_ops rk3528_ops = {
 	.set_to_rgmii = rk3528_set_to_rgmii,
 	.set_to_rmii = rk3528_set_to_rmii,
 	.set_rgmii_speed = rk3528_set_rgmii_speed,
 	.set_rmii_speed = rk3528_set_rmii_speed,
 	.set_clock_selection = rk3528_set_clock_selection,
+	.integrated_phy_powerup = rk3528_integrated_phy_powerup,
+	.integrated_phy_powerdown = rk3528_integrated_phy_powerdown,
 	.regs_valid = true,
 	.regs = {
 		0xffbd0000, /* gmac0 */
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
