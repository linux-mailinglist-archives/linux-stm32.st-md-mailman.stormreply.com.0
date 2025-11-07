Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9518C405A8
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 15:29:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70F1FC60466;
	Fri,  7 Nov 2025 14:29:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 987C5C60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3ZIYGa1rkGLeqBaW2ZFq+/8bPsde0U0HeYhfNeYbJA=; b=g3xfDKkvCe7jAjYZ4ET+EPsq2Y
 x/Y8GAz65y33m0shVSuuOW43UXNHiw/nkQvMD9t5D3brS//qxis7w1GPVBQDLI7UeBUqdDHLllKk1
 VVtduMWY2k5nO1WLS6j/Coxy4DgI0JoYsFeql/2Y6LpPJPJwydapmG8tnbyYSkKTXaT4JOEpY4vy9
 LMJj0OggURw0uIG6H+1/5AX0xm6w2I7vdB1Qy/C5wjaBhdsRLhCOyANYukuFEFJup0pnbUr7aqwYK
 cPzoxGT+hinNpEJGJbX9CF9Rrek8S1fVeEcPxRbS6AMK1uWt3pbmRnFSoT2pnclI4tgs2ybbAWRZz
 CcmWbaTA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43246 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHNSU-000000006iK-1fM3;
 Fri, 07 Nov 2025 14:28:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHNSR-0000000DkSt-0wDu; Fri, 07 Nov 2025 14:28:55 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:55 +0000
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
Subject: [Linux-stm32] [PATCH net-next 11/16] net: stmmac: starfive: use
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
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 1ef72576c6f1..00078b7a6486 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
 	struct regmap *regmap;
 	unsigned int args[2];
-	unsigned int mode;
+	int phy_intf_sel;
 	int err;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		mode = STARFIVE_DWMAC_PHY_INFT_RMII;
-		break;
-
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
-		break;
-
-	default:
+	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
+	if (phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(dwmac->dev, "unsupported interface %s\n",
 			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
+		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
 	}
 
 	regmap = syscon_regmap_lookup_by_phandle_args(dwmac->dev->of_node,
@@ -65,7 +55,7 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	/* args[0]:offset  args[1]: shift */
 	err = regmap_update_bits(regmap, args[0],
 				 STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
-				 mode << args[1]);
+				 phy_intf_sel << args[1]);
 	if (err)
 		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
