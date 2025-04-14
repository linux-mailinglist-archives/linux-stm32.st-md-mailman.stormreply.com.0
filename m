Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BDA87B71
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 11:06:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2715CC78028;
	Mon, 14 Apr 2025 09:06:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AAE1C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wOqlWtFSPV7O6xwum69lDdpSmcDreIi287vOPBtUK1g=; b=ud6F4mT5ycwwzMR0SWj57hOdK0
 eJrhqgZZR0WcP7CX1KTr0T44rMI875/x5gmuu+UXquOYe7nSF+wTH/+j8ka4v47mN92CTgY/UJ+Kf
 S9DF/5zXIZlyjJYNHgIk4Ov01r01aZbIW+LnUcsHp+Hi9lEuaWz5HzG6N2vdCw1qDfx1HvoOZuV/y
 vsvrZGwcGZuImWPKlfLoKHksUL6PBE5o6oyox8baN8O/Zjkifh94J+S4fN7PcYeJz/4xdWTMa5jNQ
 k63oTHVgWbhBpbTWkgT7j2kW1PAGXp/UPyPuPBoC60MiWPk04/TpRScnU2Zn4vBKnbVGLS3+imZqe
 CRMruvSQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41504 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4Fm6-0006Cb-1r;
 Mon, 14 Apr 2025 10:06:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4FlV-000XjG-83; Mon, 14 Apr 2025 10:06:05 +0100
In-Reply-To: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
References: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4FlV-000XjG-83@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 10:06:05 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: anarion: clean
 up interface parsing
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

anarion_config_dt() used a switch statement to check for the RGMII
modes, complete with an unnecessary "fallthrough", and also printed
the numerical value of the PHY interface mode on error. Clean this
up using the phy_interface_mode_is_rgmii() helper, and print the
English version of the PHY interface mode on error.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 232aae752690..941ea724c643 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -79,17 +79,11 @@ anarion_config_dt(struct platform_device *pdev,
 
 	gmac->ctl_block = ctl_block;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RGMII:
-		fallthrough;
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
+	if (phy_interface_mode_is_rgmii(plat_dat->phy_interface)) {
 		gmac->phy_intf_sel = GMAC_CONFIG_INTF_RGMII;
-		break;
-	default:
-		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n",
-			plat_dat->phy_interface);
+	} else {
+		dev_err(&pdev->dev, "Unsupported phy-mode (%s)\n",
+			phy_modes(plat_dat->phy_interface));
 		return ERR_PTR(-ENOTSUPP);
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
