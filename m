Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3588AC752
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 10:46:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0DEAC7128A;
	Mon, 22 Apr 2024 08:46:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5B50C7128C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 08:46:31 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=ratatoskr.trumtrar.info)
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1rypJg-0000ML-DO; Mon, 22 Apr 2024 10:46:24 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 22 Apr 2024 10:46:19 +0200
MIME-Version: 1.0
Message-Id: <20240422-v6-9-topic-imx93-eqos-rmii-v1-3-30151fca43d2@pengutronix.de>
References: <20240422-v6-9-topic-imx93-eqos-rmii-v1-0-30151fca43d2@pengutronix.de>
In-Reply-To: <20240422-v6-9-topic-imx93-eqos-rmii-v1-0-30151fca43d2@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Clark Wang <xiaoning.wang@nxp.com>, 
 Linux Team <linux-imx@nxp.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.13.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] net: stmicro: imx: set TX_CLK direction
	in RMII mode
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

In case of RMII connection, the TX_CLK must be set to output direction.
Parse the register and offset from the devicetree and set the direction
of the TX_CLK when the property was provided.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 6b65420e11b5c..0fc81a626a664 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -37,6 +37,9 @@
 #define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
 
+#define MX93_GPR_ENET_QOS_TX_CLK_SEL_MASK	GENMASK(1, 1)
+#define MX93_GPR_ENET_QOS_TX_CLK_SEL		(0x1 << 1)
+
 #define DMA_BUS_MODE			0x00001000
 #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
 #define RMII_RESET_SPEED		(0x3 << 14)
@@ -57,7 +60,9 @@ struct imx_priv_data {
 	struct clk *clk_tx;
 	struct clk *clk_mem;
 	struct regmap *intf_regmap;
+	struct regmap *enet_clk_regmap;
 	u32 intf_reg_off;
+	u32 enet_clk_reg_off;
 	bool rmii_refclk_ext;
 	void __iomem *base_addr;
 
@@ -116,6 +121,18 @@ static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = MX93_GPR_ENET_QOS_INTF_SEL_RMII;
+
+		/* According to NXP AN14149, the direction of the
+		 * TX_CLK must be set to output in RMII mode.
+		 */
+		if (dwmac->enet_clk_regmap)
+			regmap_update_bits(dwmac->enet_clk_regmap,
+					   dwmac->enet_clk_reg_off,
+					   MX93_GPR_ENET_QOS_TX_CLK_SEL_MASK,
+					   MX93_GPR_ENET_QOS_TX_CLK_SEL);
+		else
+			dev_warn(dwmac->dev, "TX_CLK can't be set to output mode.\n");
+
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -310,6 +327,16 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 			dev_err(dev, "Can't get intf mode reg offset (%d)\n", err);
 			return err;
 		}
+
+		dwmac->enet_clk_regmap = syscon_regmap_lookup_by_phandle(np, "enet_clk_sel");
+		if (IS_ERR(dwmac->enet_clk_regmap))
+			return PTR_ERR(dwmac->enet_clk_regmap);
+
+		err = of_property_read_u32_index(np, "enet_clk_sel", 1, &dwmac->enet_clk_reg_off);
+		if (err) {
+			dev_err(dev, "Can't get enet clk sel reg offset (%d)\n", err);
+			return err;
+		}
 	}
 
 	return err;

-- 
2.43.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
