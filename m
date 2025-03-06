Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B0A56171
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 08:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26A05C78F9F;
	Fri,  7 Mar 2025 07:05:09 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E48AC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 22:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741299270; bh=bOC8WbiFRMmQ2t5uzX1HETVDEhXpaqLAKBxWpaNaFx0=;
 b=T9Bs2mU//YePRsK3zacjT4kd6o/cqHfk6j0jBLjelQ4ljFvkJ2R6LD3M67z7dJFpXW42T0qA7
 pque0niOknwDojjpsrjAbtVwnOTYovK8yZaBId4kX2wRAPSnd67j2W0pd29aB4L/bVIzHm2vLFg
 LHCeqY2qkNe7z/ymdD/ZagNC5eMBfgHvc7ATgR3U4KtZIeCnAjmq6ug6YSd80nfQjDaidubkNjq
 XyEPndx4itNnE8RmFGP98G03QMows00KHWxUHPcqonYo0a5eUCkOjB02POgdpkBA6tueJO6l/dT
 AtdAtGxonc+McMiobtCVkXMkxa6xrTzibnvz/qD9ZpvQ==
X-Forward-Email-ID: 67ca1e39c1763851c065c013
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
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu,  6 Mar 2025 22:13:55 +0000
Message-ID: <20250306221402.1704196-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306221402.1704196-1-jonas@kwiboo.se>
References: <20250306221402.1704196-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Mar 2025 07:05:06 +0000
Cc: devicetree@vger.kernel.org, Yao Zi <ziyao@disroot.org>,
 Jonas Karlman <jonas@kwiboo.se>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 David Wu <david.wu@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] ethernet: stmmac: dwmac-rk: Add GMAC
	support for RK3528
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

From: David Wu <david.wu@rock-chips.com>

Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
Ethernet QoS IP.

Add initial support for the RK3528 variants.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
This does not include power on/off support for the integrated PHY.
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index ba1cd079adf2..0ae3ffacb794 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -830,6 +830,137 @@ static const struct rk_gmac_ops rk3399_ops = {
 	.set_rmii_speed = rk3399_set_rmii_speed,
 };
 
+#define RK3528_VO_GRF_GMAC_CON		0x0018
+#define RK3528_VO_GRF_MACPHY_CON0	0x001c
+#define RK3528_VO_GRF_MACPHY_CON1	0x0020
+#define RK3528_VPU_GRF_GMAC_CON5	0x0018
+#define RK3528_VPU_GRF_GMAC_CON6	0x001c
+
+#define RK3528_GMAC_RXCLK_DLY_ENABLE	GRF_BIT(15)
+#define RK3528_GMAC_RXCLK_DLY_DISABLE	GRF_CLR_BIT(15)
+#define RK3528_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(14)
+#define RK3528_GMAC_TXCLK_DLY_DISABLE	GRF_CLR_BIT(14)
+
+#define RK3528_GMAC_CLK_RX_DL_CFG(val)	HIWORD_UPDATE(val, 0xFF, 8)
+#define RK3528_GMAC_CLK_TX_DL_CFG(val)	HIWORD_UPDATE(val, 0xFF, 0)
+
+#define RK3528_GMAC0_PHY_INTF_SEL_RMII	GRF_BIT(1)
+#define RK3528_GMAC1_PHY_INTF_SEL_RGMII	GRF_CLR_BIT(8)
+#define RK3528_GMAC1_PHY_INTF_SEL_RMII	GRF_BIT(8)
+
+#define RK3528_GMAC1_CLK_SELECT_CRU	GRF_CLR_BIT(12)
+#define RK3528_GMAC1_CLK_SELECT_IO	GRF_BIT(12)
+
+#define RK3528_GMAC0_CLK_RMII_DIV2	GRF_BIT(3)
+#define RK3528_GMAC0_CLK_RMII_DIV20	GRF_CLR_BIT(3)
+#define RK3528_GMAC1_CLK_RMII_DIV2	GRF_BIT(10)
+#define RK3528_GMAC1_CLK_RMII_DIV20	GRF_CLR_BIT(10)
+
+#define RK3528_GMAC1_CLK_RGMII_DIV1	(GRF_CLR_BIT(11) | GRF_CLR_BIT(10))
+#define RK3528_GMAC1_CLK_RGMII_DIV5	(GRF_BIT(11) | GRF_BIT(10))
+#define RK3528_GMAC1_CLK_RGMII_DIV50	(GRF_BIT(11) | GRF_CLR_BIT(10))
+
+#define RK3528_GMAC0_CLK_RMII_GATE	GRF_BIT(2)
+#define RK3528_GMAC0_CLK_RMII_NOGATE	GRF_CLR_BIT(2)
+#define RK3528_GMAC1_CLK_RMII_GATE	GRF_BIT(9)
+#define RK3528_GMAC1_CLK_RMII_NOGATE	GRF_CLR_BIT(9)
+
+static void rk3528_set_to_rgmii(struct rk_priv_data *bsp_priv,
+				int tx_delay, int rx_delay)
+{
+	regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
+		     RK3528_GMAC1_PHY_INTF_SEL_RGMII);
+
+	regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
+		     DELAY_ENABLE(RK3528, tx_delay, rx_delay));
+
+	regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON6,
+		     RK3528_GMAC_CLK_RX_DL_CFG(rx_delay) |
+		     RK3528_GMAC_CLK_TX_DL_CFG(tx_delay));
+}
+
+static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
+{
+	if (bsp_priv->id == 1)
+		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
+			     RK3528_GMAC1_PHY_INTF_SEL_RMII);
+	else
+		regmap_write(bsp_priv->grf, RK3528_VO_GRF_GMAC_CON,
+			     RK3528_GMAC0_PHY_INTF_SEL_RMII |
+			     RK3528_GMAC0_CLK_RMII_DIV2);
+}
+
+static void rk3528_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+
+	if (speed == 10)
+		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
+			     RK3528_GMAC1_CLK_RGMII_DIV50);
+	else if (speed == 100)
+		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
+			     RK3528_GMAC1_CLK_RGMII_DIV5);
+	else if (speed == 1000)
+		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
+			     RK3528_GMAC1_CLK_RGMII_DIV1);
+	else
+		dev_err(dev, "unknown speed value for RGMII! speed=%d", speed);
+}
+
+static void rk3528_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+	unsigned int reg, val;
+
+	if (speed == 10)
+		val = bsp_priv->id == 1 ? RK3528_GMAC1_CLK_RMII_DIV20 :
+					  RK3528_GMAC0_CLK_RMII_DIV20;
+	else if (speed == 100)
+		val = bsp_priv->id == 1 ? RK3528_GMAC1_CLK_RMII_DIV2 :
+					  RK3528_GMAC0_CLK_RMII_DIV2;
+	else {
+		dev_err(dev, "unknown speed value for RMII! speed=%d", speed);
+		return;
+	}
+
+	reg = bsp_priv->id == 1 ? RK3528_VPU_GRF_GMAC_CON5 :
+				  RK3528_VO_GRF_GMAC_CON;
+
+	regmap_write(bsp_priv->grf, reg, val);
+}
+
+static void rk3528_set_clock_selection(struct rk_priv_data *bsp_priv,
+				       bool input, bool enable)
+{
+	unsigned int val;
+
+	if (bsp_priv->id == 1) {
+		val = input ? RK3528_GMAC1_CLK_SELECT_IO :
+			      RK3528_GMAC1_CLK_SELECT_CRU;
+		val |= enable ? RK3528_GMAC1_CLK_RMII_NOGATE :
+				RK3528_GMAC1_CLK_RMII_GATE;
+		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5, val);
+	} else {
+		val = enable ? RK3528_GMAC0_CLK_RMII_NOGATE :
+			       RK3528_GMAC0_CLK_RMII_GATE;
+		regmap_write(bsp_priv->grf, RK3528_VO_GRF_GMAC_CON, val);
+	}
+}
+
+static const struct rk_gmac_ops rk3528_ops = {
+	.set_to_rgmii = rk3528_set_to_rgmii,
+	.set_to_rmii = rk3528_set_to_rmii,
+	.set_rgmii_speed = rk3528_set_rgmii_speed,
+	.set_rmii_speed = rk3528_set_rmii_speed,
+	.set_clock_selection = rk3528_set_clock_selection,
+	.regs_valid = true,
+	.regs = {
+		0xffbd0000, /* gmac0 */
+		0xffbe0000, /* gmac1 */
+		0x0, /* sentinel */
+	},
+};
+
 #define RK3568_GRF_GMAC0_CON0		0x0380
 #define RK3568_GRF_GMAC0_CON1		0x0384
 #define RK3568_GRF_GMAC1_CON0		0x0388
@@ -1816,6 +1947,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3366-gmac", .data = &rk3366_ops },
 	{ .compatible = "rockchip,rk3368-gmac", .data = &rk3368_ops },
 	{ .compatible = "rockchip,rk3399-gmac", .data = &rk3399_ops },
+	{ .compatible = "rockchip,rk3528-gmac", .data = &rk3528_ops },
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
 	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
