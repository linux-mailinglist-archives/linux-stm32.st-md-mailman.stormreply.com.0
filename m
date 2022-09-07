Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B685B0EDA
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Sep 2022 23:07:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D06C63326;
	Wed,  7 Sep 2022 21:07:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A173C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 21:07:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id b144so11047443pfb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Sep 2022 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5+9F9s6fqktfVWWnNP7qsVf3iRyUlMd31YYvVoKbstM=;
 b=lwys78D/HG7Xwd4d0necb6nRcqc5E1q9SjJs4QTgDuy6eQ1zpoS73iwBjTvnMRSRRh
 LR2426cwvek//WF5ATYTbe277Pur4c9wtNFpHx0RuVLGXnhBZiomBVoTJ4sjAjuCZGoF
 QUf2k4jNHQ+aqr1+VRcLlv8AJ/Z8KOw2t7SHR7nLkwImyfTP3RL9Ep5K6J/SGkVh2QMV
 dcIJOnImyq7NGbdaTbNXRhabysXWdWpdf5+Y9QRhtST49VOun7Nr8S7f+j06vL8frHL2
 UWw5HRfuvi/g1WsRYooW/L4idWz6k7NdhI/36THQpcz6owGynCMtci9sT0vft204Vg2c
 1MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5+9F9s6fqktfVWWnNP7qsVf3iRyUlMd31YYvVoKbstM=;
 b=ap+Iq612TQ+6SvXITUsCOcRV/SSMVS2IZoWThXWVJti3LF/eJ2fEz/gzfEhRsis0h7
 AI2mUO0/ruz6aGk9sRY3RLIa7i9ASD57BbFPC0FcnhYHLP4RNTQj30o21/DezO3dEWUs
 kj8kBiijb4psJEGTfxXq7qX+Ym2jtRNbM60dKNVG6xOhLexszT2RiqwSnkU93MmGBKHM
 /iGcJATxzwK/fU1AcG0Ejqm94F2OmeILa9/Iy7C/0TJYXPZlVydC43zLYmku3d8MMOjS
 fpugAIeNjnaDz/gstyNIyfaJkmn4hZRDYAcHPJXfT9YiwvpU9Al5tAGyLoUtLLjkauoT
 eSdA==
X-Gm-Message-State: ACgBeo3RZTLKRoizalC7BPO6YX3hVxoCduUJARIaJf8b5/u1VZFxCgIT
 ei8crlwffXveg356xLsNncWggA==
X-Google-Smtp-Source: AA6agR4cgVPEFnVhaIJEEurJwgmCq+2nwpPUqVsp66zTe62Ksue24nV/8ZHLnKsECXAx+jj7/jJ8vQ==
X-Received: by 2002:aa7:8e05:0:b0:536:5dda:e634 with SMTP id
 c5-20020aa78e05000000b005365ddae634mr5519906pfr.35.1662584830196; 
 Wed, 07 Sep 2022 14:07:10 -0700 (PDT)
Received: from archl-hc1b.. ([103.51.75.56]) by smtp.gmail.com with ESMTPSA id
 c23-20020a63d517000000b0042ba1a95235sm10999198pgg.86.2022.09.07.14.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 14:07:09 -0700 (PDT)
From: Anand Moon <anand@edgeble.ai>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed,  7 Sep 2022 21:06:46 +0000
Message-Id: <20220907210649.12447-2-anand@edgeble.ai>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907210649.12447-1-anand@edgeble.ai>
References: <20220907210649.12447-1-anand@edgeble.ai>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anand Moon <anand@edgeble.ai>, Jagan Teki <jagan@edgeble.ai>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, David Wu <david.wu@rock-chips.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [v2 2/2] net: ethernet: stmicro: stmmac: dwmac-rk:
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
v2: changes none
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
2.37.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
