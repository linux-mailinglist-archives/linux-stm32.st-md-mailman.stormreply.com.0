Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD911C362
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 03:42:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51D4EC36B0E;
	Thu, 12 Dec 2019 02:42:16 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ED8AC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 02:42:13 +0000 (UTC)
X-UUID: 49be14c84ce946e7bee7f3ddfcb08bfd-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gJIOv/AINP2oPlEBoJSoZwQ465CauMnNdU2csE2E0pQ=; 
 b=p/udZ5qzlT3hsQp2FKfl+yyH3SpbVDOZff2q+fT1lrBOubbryXhWiPeIb1KdZktoxUBluYDjuwyxzCe6SYYgm36xXQBMC8FOPRGYkDI6UCoreaKJeUy0kolXBEOgGWtHNVm/vMGeCWhrQ4L+8DmTRMefcfVqGVahj7MH+wODNOY=;
X-UUID: 49be14c84ce946e7bee7f3ddfcb08bfd-20191212
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1591258915; Thu, 12 Dec 2019 10:42:08 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 10:41:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 10:42:03 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 12 Dec 2019 10:41:44 +0800
Message-ID: <20191212024145.21752-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191212024145.21752-1-biao.huang@mediatek.com>
References: <20191212024145.21752-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C35C7151B8083C092FE073C2C47996ED59A6B3EF44C7EEC93DB7245D0F38379A2000:8
X-MTK: N
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] net-next: stmmac: mediatek: add more
	suuport for RMII
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

MT2712 SoC can provide the rmii reference clock, and the clock
will output from TXC pin only, which means ref_clk pin of external
PHY should connect to TXC pin in this case.
Add corresponding clock and timing settings.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 85 +++++++++++++------
 1 file changed, 60 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index bdb80421acac..af24954c7654 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -51,10 +51,12 @@ struct mediatek_dwmac_plat_data {
 	const struct mediatek_dwmac_variant *variant;
 	struct mac_delay_struct mac_delay;
 	struct clk_bulk_data *clks;
+	struct clk *mac_rmii_clk;
 	struct device_node *np;
 	struct regmap *peri_regmap;
 	struct device *dev;
 	phy_interface_t phy_mode;
+	bool rmii_clk_from_mac;
 	bool rmii_rxc;
 };
 
@@ -78,6 +80,7 @@ static const char * const mt2712_dwmac_clk_l[] = {
 
 static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
 {
+	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
 	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
 	u32 intf_val = 0;
 
@@ -87,7 +90,7 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
 		intf_val |= PHY_INTF_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= (PHY_INTF_RMII | rmii_rxc);
+		intf_val |= (PHY_INTF_RMII | rmii_rxc | rmii_clk_from_mac);
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
@@ -173,35 +176,50 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 		delay_val |= FIELD_PREP(ETH_DLY_RXC_INV, mac_delay->rx_inv);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		/* the rmii reference clock is from external phy,
-		 * and the property "rmii_rxc" indicates which pin(TXC/RXC)
-		 * the reference clk is connected to. The reference clock is a
-		 * received signal, so rx_delay/rx_inv are used to indicate
-		 * the reference clock timing adjustment
-		 */
-		if (plat->rmii_rxc) {
-			/* the rmii reference clock from outside is connected
-			 * to RXC pin, the reference clock will be adjusted
-			 * by RXC delay macro circuit.
-			 */
-			delay_val |= FIELD_PREP(ETH_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
-			delay_val |= FIELD_PREP(ETH_DLY_RXC_STAGES, mac_delay->rx_delay);
-			delay_val |= FIELD_PREP(ETH_DLY_RXC_INV, mac_delay->rx_inv);
-		} else {
-			/* the rmii reference clock from outside is connected
-			 * to TXC pin, the reference clock will be adjusted
-			 * by TXC delay macro circuit.
+		if (plat->rmii_clk_from_mac) {
+			/* case 1: mac provides the rmii reference clock,
+			 * and the clock output to TXC pin.
+			 * The egress timing can be adjusted by GTXC delay macro circuit.
+			 * The ingress timing can be adjusted by TXC delay macro circuit.
 			 */
 			delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay->rx_delay);
 			delay_val |= FIELD_PREP(ETH_DLY_TXC_STAGES, mac_delay->rx_delay);
 			delay_val |= FIELD_PREP(ETH_DLY_TXC_INV, mac_delay->rx_inv);
+
+			delay_val |= FIELD_PREP(ETH_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
+			delay_val |= FIELD_PREP(ETH_DLY_GTXC_STAGES, mac_delay->tx_delay);
+			delay_val |= FIELD_PREP(ETH_DLY_GTXC_INV, mac_delay->tx_inv);
+		} else {
+			/* case 2: the rmii reference clock is from external phy,
+			 * and the property "rmii_rxc" indicates which pin(TXC/RXC)
+			 * the reference clk is connected to. The reference clock is a
+			 * received signal, so rx_delay/rx_inv are used to indicate
+			 * the reference clock timing adjustment
+			 */
+			if (plat->rmii_rxc) {
+				/* the rmii reference clock from outside is connected
+				 * to RXC pin, the reference clock will be adjusted
+				 * by RXC delay macro circuit.
+				 */
+				delay_val |= FIELD_PREP(ETH_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
+				delay_val |= FIELD_PREP(ETH_DLY_RXC_STAGES, mac_delay->rx_delay);
+				delay_val |= FIELD_PREP(ETH_DLY_RXC_INV, mac_delay->rx_inv);
+			} else {
+				/* the rmii reference clock from outside is connected
+				 * to TXC pin, the reference clock will be adjusted
+				 * by TXC delay macro circuit.
+				 */
+				delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay->rx_delay);
+				delay_val |= FIELD_PREP(ETH_DLY_TXC_STAGES, mac_delay->rx_delay);
+				delay_val |= FIELD_PREP(ETH_DLY_TXC_INV, mac_delay->rx_inv);
+			}
+			/* tx_inv will inverse the tx clock inside mac relateive to
+			 * reference clock from external phy,
+			 * and this bit is located in the same register with fine-tune
+			 */
+			if (mac_delay->tx_inv)
+				fine_val = ETH_RMII_DLY_TX_INV;
 		}
-		/* tx_inv will inverse the tx clock inside mac relateive to
-		 * reference clock from external phy,
-		 * and this bit is located in the same register with fine-tune
-		 */
-		if (mac_delay->tx_inv)
-			fine_val = ETH_RMII_DLY_TX_INV;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
@@ -278,6 +296,7 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
 	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
 	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");
+	plat->rmii_clk_from_mac = of_property_read_bool(plat->np, "mediatek,rmii-clk-from-mac");
 
 	return 0;
 }
@@ -287,6 +306,16 @@ static int mediatek_dwmac_clk_init(struct mediatek_dwmac_plat_data *plat)
 	const struct mediatek_dwmac_variant *variant = plat->variant;
 	int i, num = variant->num_clks;
 
+	plat->mac_rmii_clk = NULL;
+	if (plat->phy_mode == PHY_INTERFACE_MODE_RMII &&
+	    plat->rmii_clk_from_mac) {
+		plat->mac_rmii_clk = devm_clk_get(plat->dev, "rmii_internal");
+		if (IS_ERR(plat->mac_rmii_clk)) {
+			dev_err(plat->dev, "Failed to get reference clk from MAC\n");
+			return PTR_ERR(plat->mac_rmii_clk);
+		}
+	}
+
 	plat->clks = devm_kcalloc(plat->dev, num, sizeof(*plat->clks), GFP_KERNEL);
 	if (!plat->clks)
 		return -ENOMEM;
@@ -327,6 +356,9 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 		return ret;
 	}
 
+	if (plat->mac_rmii_clk)
+		clk_prepare_enable(plat->mac_rmii_clk);
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 
@@ -338,6 +370,9 @@ static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
 	struct mediatek_dwmac_plat_data *plat = priv;
 	const struct mediatek_dwmac_variant *variant = plat->variant;
 
+	if (plat->mac_rmii_clk)
+		clk_disable_unprepare(plat->mac_rmii_clk);
+
 	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
 
 	pm_runtime_put_sync(&pdev->dev);
-- 
2.18.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
