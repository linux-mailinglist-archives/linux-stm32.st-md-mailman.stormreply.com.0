Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F05A4592
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 10:58:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5260C57B6C;
	Mon, 29 Aug 2022 08:58:26 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0C8DC035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 06:54:01 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 12so6899502pga.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=u6R40n8MPoARVm3Mtks2apAeDMP4MZtDTuXM3b5bDPA=;
 b=eWHaczqLrzgoEHImGmPZ94RG4Z6HNHjYySRyrtbvt+VMSj9GgY04Dxl3peOnUMbERM
 T0wxrzo2EvmsBZmntKsbHO/63kZHcX4rpqsUn9G8neYsYGMct3J3ZO3lp6v5WspmCJFV
 iD6CVqTySLQKsoHLzKglTu1dJKce/Jf7/baFS/3t+o1l3siQjN3AjG+dPZAaOfHGwS9V
 E+Zxmy57ACr0LBFW1d2+WUw+CX0eo2CMWE3avHdyWM1+bPrqGX9PDJR/IxYGS3ZlsOY6
 3NgVEEtXpguVkaN4/e8aii685vpB/rr5zZdaGprhqMQU/Z2n3gS81+htckrizvEXgTsa
 4jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u6R40n8MPoARVm3Mtks2apAeDMP4MZtDTuXM3b5bDPA=;
 b=FbNaXt9ehCfqBUYJHfVGVpoB4JrFtKnd5IMV7qjg7AknnW5xZn1c6VdtnZGW57YBdX
 1ByQMKI0c0wBlhXJIr0ctAlRm6EqenaIj1V1dQdGNHKaeGYWeaVF9jPvIQVB8WUfZfVy
 oJ9Wg3n57rDXYrRoF2CSIXVw6ZeJz58OySGOt8tJZFe8kYUim6AYks2eRovMheke6fcQ
 Ves6EhOn03czatXwjI89gT5CUBq/kjQpyyvcUMO6hktqWWbjvhyUq93OndnZYW00f07W
 DiMJs5XBXqdGS6VvafEYcFcVvDcsgw5GCHO/Knjz6tp2kNyUAKOKE0skFfqM4CzZ8n2I
 YO4w==
X-Gm-Message-State: ACgBeo3WOIjBQQqVlDjJiaITorgwiHcBGhQxaCYkoLx53D51d/yavXUu
 wxHnp1a8El+NAjwYBhgmIOj3ww==
X-Google-Smtp-Source: AA6agR50cryByjgHlJMx73H+k8NWoxtPwbincNgW2C4keQjTpRA+15aCO/PZwkF3DzqNIeBhukYV9g==
X-Received: by 2002:a63:d00a:0:b0:42a:3d80:10a with SMTP id
 z10-20020a63d00a000000b0042a3d80010amr12459203pgf.288.1661756040268; 
 Sun, 28 Aug 2022 23:54:00 -0700 (PDT)
Received: from archl-hc1b.. ([103.51.72.9]) by smtp.gmail.com with ESMTPSA id
 k3-20020aa79d03000000b00537d4a3aec9sm5687314pfp.104.2022.08.28.23.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 23:54:00 -0700 (PDT)
From: Anand Moon <anand@edgeble.ai>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 29 Aug 2022 06:50:42 +0000
Message-Id: <20220829065044.1736-2-anand@edgeble.ai>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829065044.1736-1-anand@edgeble.ai>
References: <20220829065044.1736-1-anand@edgeble.ai>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Aug 2022 08:58:25 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@edgeble.ai>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 David Wu <david.wu@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net: ethernet: stmicro: stmmac: dwmac-rk:
	Add rv1126 support
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

Rockchip RV1126 has GMAC 10/100/1000M ethernet controller
via RGMII and RMII interfaces are configured via M0 and M1 pinmux.

This patch adds rv1126 support by adding delay lines of M0 and M1
simultaneously.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Anand Moon <anand@edgeble.ai>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index c469abc91fa1..93be3efb5fff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1153,6 +1153,130 @@ static const struct rk_gmac_ops rv1108_ops = {
 	.set_rmii_speed = rv1108_set_rmii_speed,
 };
 
+#define RV1126_GRF_GMAC_CON0		0X0070
+#define RV1126_GRF_GMAC_CON1		0X0074
+#define RV1126_GRF_GMAC_CON2		0X0078
+
+/* RV1126_GRF_GMAC_CON0 */
+#define RV1126_GMAC_PHY_INTF_SEL_RGMII	\
+		(GRF_BIT(4) | GRF_CLR_BIT(5) | GRF_CLR_BIT(6))
+#define RV1126_GMAC_PHY_INTF_SEL_RMII	\
+		(GRF_CLR_BIT(4) | GRF_CLR_BIT(5) | GRF_BIT(6))
+#define RV1126_GMAC_FLOW_CTRL			GRF_BIT(7)
+#define RV1126_GMAC_FLOW_CTRL_CLR		GRF_CLR_BIT(7)
+#define RV1126_GMAC_M0_RXCLK_DLY_ENABLE		GRF_BIT(1)
+#define RV1126_GMAC_M0_RXCLK_DLY_DISABLE	GRF_CLR_BIT(1)
+#define RV1126_GMAC_M0_TXCLK_DLY_ENABLE		GRF_BIT(0)
+#define RV1126_GMAC_M0_TXCLK_DLY_DISABLE	GRF_CLR_BIT(0)
+#define RV1126_GMAC_M1_RXCLK_DLY_ENABLE		GRF_BIT(3)
+#define RV1126_GMAC_M1_RXCLK_DLY_DISABLE	GRF_CLR_BIT(3)
+#define RV1126_GMAC_M1_TXCLK_DLY_ENABLE		GRF_BIT(2)
+#define RV1126_GMAC_M1_TXCLK_DLY_DISABLE	GRF_CLR_BIT(2)
+
+/* RV1126_GRF_GMAC_CON1 */
+#define RV1126_GMAC_M0_CLK_RX_DL_CFG(val)	HIWORD_UPDATE(val, 0x7F, 8)
+#define RV1126_GMAC_M0_CLK_TX_DL_CFG(val)	HIWORD_UPDATE(val, 0x7F, 0)
+/* RV1126_GRF_GMAC_CON2 */
+#define RV1126_GMAC_M1_CLK_RX_DL_CFG(val)	HIWORD_UPDATE(val, 0x7F, 8)
+#define RV1126_GMAC_M1_CLK_TX_DL_CFG(val)	HIWORD_UPDATE(val, 0x7F, 0)
+
+static void rv1126_set_to_rgmii(struct rk_priv_data *bsp_priv,
+				int tx_delay, int rx_delay)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+
+	if (IS_ERR(bsp_priv->grf)) {
+		dev_err(dev, "Missing rockchip,grf property\n");
+		return;
+	}
+
+	regmap_write(bsp_priv->grf, RV1126_GRF_GMAC_CON0,
+		     RV1126_GMAC_PHY_INTF_SEL_RGMII |
+		     RV1126_GMAC_M0_RXCLK_DLY_ENABLE |
+		     RV1126_GMAC_M0_TXCLK_DLY_ENABLE |
+		     RV1126_GMAC_M1_RXCLK_DLY_ENABLE |
+		     RV1126_GMAC_M1_TXCLK_DLY_ENABLE);
+
+	regmap_write(bsp_priv->grf, RV1126_GRF_GMAC_CON1,
+		     RV1126_GMAC_M0_CLK_RX_DL_CFG(rx_delay) |
+		     RV1126_GMAC_M0_CLK_TX_DL_CFG(tx_delay));
+
+	regmap_write(bsp_priv->grf, RV1126_GRF_GMAC_CON2,
+		     RV1126_GMAC_M1_CLK_RX_DL_CFG(rx_delay) |
+		     RV1126_GMAC_M1_CLK_TX_DL_CFG(tx_delay));
+}
+
+static void rv1126_set_to_rmii(struct rk_priv_data *bsp_priv)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+
+	if (IS_ERR(bsp_priv->grf)) {
+		dev_err(dev, "%s: Missing rockchip,grf property\n", __func__);
+		return;
+	}
+
+	regmap_write(bsp_priv->grf, RV1126_GRF_GMAC_CON0,
+		     RV1126_GMAC_PHY_INTF_SEL_RMII);
+}
+
+static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+	unsigned long rate;
+	int ret;
+
+	switch (speed) {
+	case 10:
+		rate = 2500000;
+		break;
+	case 100:
+		rate = 25000000;
+		break;
+	case 1000:
+		rate = 125000000;
+		break;
+	default:
+		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
+		return;
+	}
+
+	ret = clk_set_rate(bsp_priv->clk_mac_speed, rate);
+	if (ret)
+		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
+			__func__, rate, ret);
+}
+
+static void rv1126_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+	unsigned long rate;
+	int ret;
+
+	switch (speed) {
+	case 10:
+		rate = 2500000;
+		break;
+	case 100:
+		rate = 25000000;
+		break;
+	default:
+		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
+		return;
+	}
+
+	ret = clk_set_rate(bsp_priv->clk_mac_speed, rate);
+	if (ret)
+		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
+			__func__, rate, ret);
+}
+
+static const struct rk_gmac_ops rv1126_ops = {
+	.set_to_rgmii = rv1126_set_to_rgmii,
+	.set_to_rmii = rv1126_set_to_rmii,
+	.set_rgmii_speed = rv1126_set_rgmii_speed,
+	.set_rmii_speed = rv1126_set_rmii_speed,
+};
+
 #define RK_GRF_MACPHY_CON0		0xb00
 #define RK_GRF_MACPHY_CON1		0xb04
 #define RK_GRF_MACPHY_CON2		0xb08
@@ -1681,6 +1805,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3399-gmac", .data = &rk3399_ops },
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
 	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },
+	{ .compatible = "rockchip,rv1126-gmac", .data = &rv1126_ops },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rk_gmac_dwmac_match);
-- 
2.37.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
