Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B4C40587
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 15:28:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E215DC60466;
	Fri,  7 Nov 2025 14:28:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85771C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HuEqlECWDCaNWgWH8z84uCmKw/NZbDZ8phBddxEwuWo=; b=Eu24rjwoegTIr2lQixyt7hGW59
 xFe3xP/ES/IuTB3Fszh4unq/1OlPqQJxWUay82NJfvZmrPDBUbzmr9Vl9VmV80HIj0LSfILZFGLtc
 IsdoPiA80bG7YiuSfLonkvQcalIm8lSQQ4skWzgy1BS30bEGaSj+N5TX1T9ebLnMx3AE7uRSuIBEA
 iBuDFe1Bu5kFKmaFDQK9ywVeqmUYBNcEkDLw1TKBn4WJZYaEbdtQodOTT1yIN/BwD5BNoJzt9AG77
 R4cH9MR9gCUFtsGK6AmEn089P5lYpZ2HIUdePGwje/NWz8PQV99V+g2THv2qRBtlxTHpa0gORM2oq
 9jJjV+mg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49696 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHNRy-000000006g7-070K;
 Fri, 07 Nov 2025 14:28:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHNRw-0000000DkSJ-2AQ2; Fri, 07 Nov 2025 14:28:24 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNRw-0000000DkSJ-2AQ2@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:24 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 05/16] net: stmmac: mediatek: use
 stmmac_get_phy_intf_sel()
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

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result, and pass that into the
implementation specific ->dwmac_set_phy_interface() method. Use this
to configure the PHY interface selection field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 43 +++++++++++--------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index dcdf28418fec..0f32732efb75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -85,7 +85,8 @@ struct mediatek_dwmac_plat_data {
 };
 
 struct mediatek_dwmac_variant {
-	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
+	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat,
+				       u8 phy_intf_sel);
 	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
 
 	/* clock ids to be requested */
@@ -106,25 +107,25 @@ static const char * const mt8195_dwmac_clk_l[] = {
 	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
 };
 
-static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
+static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
+				u8 phy_intf_sel)
 {
 	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
 	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
-	u32 intf_val = 0;
+	u32 intf_val;
+
+	intf_val = phy_intf_sel;
 
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_MII:
-		intf_val |= PHY_INTF_SEL_GMII_MII;
-		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
+		intf_val |= rmii_rxc | rmii_clk_from_mac;
 		break;
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= PHY_INTF_SEL_RGMII;
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -285,27 +286,25 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 		.tx_delay_max = 17600,
 };
 
-static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
+static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
+				u8 phy_intf_sel)
 {
 	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
 	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
-	u32 intf_val = 0;
+	u32 intf_val;
+
+	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
 
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_MII:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
-				       PHY_INTF_SEL_GMII_MII);
-		break;
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
 		break;
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -525,10 +524,18 @@ static int mediatek_dwmac_init(struct device *dev, void *priv)
 {
 	struct mediatek_dwmac_plat_data *plat = priv;
 	const struct mediatek_dwmac_variant *variant = plat->variant;
-	int ret;
+	int phy_intf_sel, ret;
 
 	if (variant->dwmac_set_phy_interface) {
-		ret = variant->dwmac_set_phy_interface(plat);
+		phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_mode);
+		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+		    phy_intf_sel != PHY_INTF_SEL_RMII) {
+			dev_err(plat->dev, "phy interface not supported\n");
+			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+		}
+
+		ret = variant->dwmac_set_phy_interface(plat, phy_intf_sel);
 		if (ret) {
 			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
 			return ret;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
