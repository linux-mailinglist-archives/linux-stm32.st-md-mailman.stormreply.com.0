Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D8C4058D
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 15:28:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00D3DC60466;
	Fri,  7 Nov 2025 14:28:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A385C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PFE3B2zI6klI6SRA/oXZVGK2iS2fB+KV+Dt1LE2U+Qc=; b=PIDmanvkpDtQH4av+5LuYbPJyi
 CmcGqJZHzOD/LlIZpPaT642N6H8nCHQEzJJoQKpBwM7IBhYKo7a9BXKM7Rzb7bvxm9LvXHfqikfMO
 rhi1K/53ySQo9p03FJ+cmivA7HKmXbc66N5QzJUI75aVjeCbKkc0aK43GdArUHjqbZ3RNVzWkn1cP
 MdkoDCIz9ZPEST7u0zrH31fOKuTWj/+FqxneTijR436q4Iz/NkRbxP+bNnQ+yQFucBoKb2BPrCcUg
 cbElPaL3e2o1EhFiQycYRzxWJ81VBrNPVulq8wigVPRCMVhY4i0PHEAsQJkHgHMBYo+xhNtTjNAqG
 W3YGvjVQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37090 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHNS4-000000006gV-1pzI;
 Fri, 07 Nov 2025 14:28:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHNS1-0000000DkSP-2gnP; Fri, 07 Nov 2025 14:28:29 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNS1-0000000DkSP-2gnP@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:29 +0000
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
Subject: [Linux-stm32] [PATCH net-next 06/16] net: stmmac: mediatek:
 simplify set_interface() methods
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

Use the phy_intf_sel field value when deciding what other options to
apply for the configuration register.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 50 +++++--------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 0f32732efb75..1f2d7d19ca56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -110,26 +110,13 @@ static const char * const mt8195_dwmac_clk_l[] = {
 static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
-	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
-	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
-	u32 intf_val;
+	u32 intf_val = phy_intf_sel;
 
-	intf_val = phy_intf_sel;
-
-	/* select phy interface in top control domain */
-	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-		break;
-	default:
-		dev_err(plat->dev, "phy interface not supported\n");
-		return -EINVAL;
+	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		if (plat->rmii_clk_from_mac)
+			intf_val |= RMII_CLK_SRC_INTERNAL;
+		if (plat->rmii_rxc)
+			intf_val |= RMII_CLK_SRC_RXC;
 	}
 
 	regmap_write(plat->peri_regmap, PERI_ETH_PHY_INTF_SEL, intf_val);
@@ -289,26 +276,13 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
-	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
-	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
-	u32 intf_val;
+	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
 
-	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
-
-	/* select phy interface in top control domain */
-	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-		break;
-	default:
-		dev_err(plat->dev, "phy interface not supported\n");
-		return -EINVAL;
+	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		if (plat->rmii_clk_from_mac)
+			intf_val |= MT8195_RMII_CLK_SRC_INTERNAL;
+		if (plat->rmii_rxc)
+			intf_val |= MT8195_RMII_CLK_SRC_RXC;
 	}
 
 	/* MT8195 only support external PHY */
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
