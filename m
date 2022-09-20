Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4515BE825
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 16:10:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A63BEC640F2;
	Tue, 20 Sep 2022 14:10:15 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A62C5C62D6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 14:10:13 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso2574114pjm.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DSNp/uharmpReYy+YC5O0owair4IDAzJu/dQoMj9EuE=;
 b=JGndOtlikbTpSUbPqg2ojZV/PXcChJ3VizuBebT9Sawr5R1L0a/3IKUD+C46gPVshH
 /wQ1wlvkXfiT5X2OdpVJMDYv9ZealAuYXOQXYt9B18G/vmiE+aTapx769Uuj8yEV7TAO
 XasE/nQj5UZaPTG40sHhoZo3tA2mTvzMWuXVnZ3JfKfxZv03I8yIurRHtFuXVep0J9QS
 OVmj9HHW3QQcXqDmfW8cgGyFFtOosKlnaJCDXFE/eX04ih7Ob/DY58jASG4w15FEjukz
 C/XkGWhfQ1RgwyLRpk46pcOtLGZVA8bY4Z1IFmLSLs+KxPCieueXyhi+XQbrWXvA1U/M
 TXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DSNp/uharmpReYy+YC5O0owair4IDAzJu/dQoMj9EuE=;
 b=O0Zr+jc73JiCHpDoyKiNyhqKZpgSLCdg05rsy6/8w3HCSRkWWFIf6DBYu6S++I07qJ
 AlzoDWqdNhoMlYxKbEBAZ9CuFxxDYC60Iyc0g2+CUCn/RUUwaATjGMFTapfkj3SuR16b
 rWCiQTvbgQSN8I+VK6hyoK9jI7otV9eLa8yKP3WTnxnaEgkFSv8RbB8RQ+TktTsIN9nc
 +Nc9T5BI+xCVqCwk5JMQnbWb/6En+x5D4C2zkg5ZjKIy6OR6WBlrxQypJqSIMu7M1WPu
 zAlE7+6qimwOvN+e6DjskH2u49dgxNH4us6ALCftsRzpIUMV7pqC9LVk61CaUtRIa2m+
 4ysg==
X-Gm-Message-State: ACrzQf06imNKDlpydU+7ARzim6316GmlO/FDG2fcBwP7F8IdFfLEHUuM
 Sn/d5Gy0bz6CZxHYCe4n0LWIHg==
X-Google-Smtp-Source: AMsMyM7OQv10cWPYv1yYSPX4pu91pIFT6zRmq1k7wLZMkluTirdpzLCp+HN/D/iOxhB09n7MRWX0Ig==
X-Received: by 2002:a17:902:6542:b0:172:95d8:a777 with SMTP id
 d2-20020a170902654200b0017295d8a777mr4917335pln.61.1663683012286; 
 Tue, 20 Sep 2022 07:10:12 -0700 (PDT)
Received: from archl-hc1b.. ([103.51.75.120]) by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b001782a0d3eeasm1499858plg.115.2022.09.20.07.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 07:10:11 -0700 (PDT)
From: Anand Moon <anand@edgeble.ai>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 20 Sep 2022 14:09:41 +0000
Message-Id: <20220920140944.2535-2-anand@edgeble.ai>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920140944.2535-1-anand@edgeble.ai>
References: <20220920140944.2535-1-anand@edgeble.ai>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anand Moon <anand@edgeble.ai>, Jagan Teki <jagan@edgeble.ai>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 David Wu <david.wu@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/2] net: ethernet: stmicro:
	stmmac: dwmac-rk: Add rv1126 support
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
v3: changes none
    rebased on linux-net-next
v2: changes none
---
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 15dea1f2a90a..f7269d79a385 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1297,6 +1297,130 @@ static const struct rk_gmac_ops rv1108_ops = {
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
@@ -1836,6 +1960,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
 	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },
+	{ .compatible = "rockchip,rv1126-gmac", .data = &rv1126_ops },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rk_gmac_dwmac_match);
-- 
2.37.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
