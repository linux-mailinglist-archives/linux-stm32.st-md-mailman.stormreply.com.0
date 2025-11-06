Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B2C3A880
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 12:23:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7FE5C36B3C;
	Thu,  6 Nov 2025 11:23:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 788FDC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UbI1YBkNbkL1m3nH9wF/7sSHdhGhbNg4Qx8ET2/j3FI=; b=fD3K16jRRcrTp8UhND0cnnSVeo
 34NHVQlN4J0QmzSCMFE+yoGPJWwSY18YLL2EZZArFUocRnekA2QMmvMCrs+JWXdAX+tEPIMW/Eey3
 nsA6v9IC9kERa6a4KXcH5+ZLNoxBU1+2a69K2HxplK02WI8tjOZLMjNiHM21W+wOyfE91OV6+XaSV
 22ZRmrIKcDHFVKUCaHTzlpg3dTmz8qheBtcfCc8wErbyH/iDCJKnKqEn1DExUpteAmE604O4aPfQh
 a837y3CQHWHJdrz6XgXiKytpXIHTrY8FmUNvZTE8reRGMNyoMIsEd2Yjk205xCCUi/irp4Cz0Eluy
 eK7rpzDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52982 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGy5K-000000004uk-3Kvp;
 Thu, 06 Nov 2025 11:23:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGy5J-0000000DhQD-46Ob; Thu, 06 Nov 2025 11:23:22 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGy5J-0000000DhQD-46Ob@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:21 +0000
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/9] net: stmmac: lpc18xx: use
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
phy_intf_sel value, and use the result to program the ethernet mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index 895d16dc0a4b..0f6be2a17e65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -47,15 +47,14 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 	}
 
-	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_MII) {
-		ethmode = PHY_INTF_SEL_GMII_MII;
-	} else if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) {
-		ethmode = PHY_INTF_SEL_RMII;
-	} else {
+	if (plat_dat->phy_interface != PHY_INTERFACE_MODE_MII &&
+	    plat_dat->phy_interface != PHY_INTERFACE_MODE_RMII) {
 		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
 		return -EINVAL;
 	}
 
+	ethmode = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
+
 	regmap_update_bits(reg, LPC18XX_CREG_CREG6,
 			   LPC18XX_CREG_CREG6_ETHMODE_MASK, ethmode);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
