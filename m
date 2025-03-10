Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE49A593C4
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 13:11:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3383C78F96;
	Mon, 10 Mar 2025 12:11:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A3EC78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mt2YgBWZEUT0iG0aW0svGoQUDQefZBeHbVh7XZ/Ckxo=; b=cfsfbkHnMPo81oyupsD05mhfb0
 i16j/27Y/Yb4O/djV8MbdjiVMADgjxVT4cCbQGEwemaKPGpBnfHD2pxYjOLrxSCoNhET+1BqM02ng
 ikDvTiTI5FBSYLPSFnwlxEk9VHrHQPWGsafXOBrMYeW1MPaFez2CyPIKU4Nsd3jmhWLe7ut7XO77o
 dn134AYTko5CGT5ME6WW/YR/quKXuzZ/BcD/aPHDhtnEFLgwTtyU5opaPuOPKVWFS2ECIw+SeaUWo
 znwuWwELLyLyuaE77Jcs0nDceavWVcxkB9Iqu26KnSeaMA/86EHFJAnkyYzOTKSPRLLqB++mcctcM
 T3sTN3jA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46328 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1trbyS-0002Zq-25;
 Mon, 10 Mar 2025 12:11:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1trby5-005qYY-Dp; Mon, 10 Mar 2025 12:10:49 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1trby5-005qYY-Dp@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:49 +0000
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 7/9] net: stmmac: sti: remove
	of_get_phy_mode()
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Pass plat_dat into sti_dwmac_parse_data(), and set dwmac->interface
from plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 13b9c2a51fce..be57c6c12c1c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -185,7 +185,8 @@ static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
 }
 
 static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
-				struct platform_device *pdev)
+				struct platform_device *pdev,
+				struct plat_stmmacenet_data *plat_dat)
 {
 	struct resource *res;
 	struct device *dev = &pdev->dev;
@@ -204,12 +205,7 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	err = of_get_phy_mode(np, &dwmac->interface);
-	if (err && err != -ENODEV) {
-		dev_err(dev, "Can't get phy-mode\n");
-		return err;
-	}
-
+	dwmac->interface = plat_dat->phy_interface;
 	dwmac->regmap = regmap;
 	dwmac->gmac_en = of_property_read_bool(np, "st,gmac_en");
 	dwmac->ext_phyclk = of_property_read_bool(np, "st,ext-phyclk");
@@ -268,7 +264,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
-	ret = sti_dwmac_parse_data(dwmac, pdev);
+	ret = sti_dwmac_parse_data(dwmac, pdev, plat_dat);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to parse OF data\n");
 		return ret;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
