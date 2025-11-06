Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D8C3A87D
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 12:23:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98596C36B3C;
	Thu,  6 Nov 2025 11:23:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 249BDC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+qNx0Ni/kc8SkhRMYGZFqBomWjfjeFGuoDaPz2DpBLg=; b=HCDmMuFWVCBxIY/eIwflhjO8q7
 W4SwitUKmyqnX+gbgti54PyNSxS0k/H/Z0//RLLlRZGsf84qDi4XL5ghrUWxMCdIzXAHQUGjkTn+R
 2qU+JU/bZ6xabiRp/TE8H+s5nIhTcPVMoHG48rdjj2GvGmKWx86bMpJCl/71hlxOJxZ/vXNvWCSfB
 2DsH73sjpJP2wxzDraT34Zck/sfmqavnIH/tf4DM3Y4nAZBAk26gNMtyc58uY+1f3tE7/kY8ab0uZ
 29tgwARwYR7uNOQxVK7F67X1NIR3lIo48CcppS6Bqp3jUlHkMgVvOFedN5Zt5jMpAhLffh2VwNnYh
 EZgh5U/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44978 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGy5F-000000004uQ-2bXZ;
 Thu, 06 Nov 2025 11:23:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGy5E-0000000DhQ7-3cuy; Thu, 06 Nov 2025 11:23:16 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGy5E-0000000DhQ7-3cuy@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:16 +0000
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/9] net: stmmac: lpc18xx: use
 PHY_INTF_SEL_x directly
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

Use the PHY_INTF_SEL_x values directly rather than the driver private
LPC18XX_CREG_CREG6_ETHMODE_x definitions, and convert
LPC18XX_CREG_CREG6_ETHMODE_MASK to use GENMASK().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index 66c309a7afb3..895d16dc0a4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -21,9 +21,7 @@
 
 /* Register defines for CREG syscon */
 #define LPC18XX_CREG_CREG6			0x12c
-# define LPC18XX_CREG_CREG6_ETHMODE_MASK	0x7
-# define LPC18XX_CREG_CREG6_ETHMODE_MII		PHY_INTF_SEL_GMII_MII
-# define LPC18XX_CREG_CREG6_ETHMODE_RMII	PHY_INTF_SEL_RMII
+# define LPC18XX_CREG_CREG6_ETHMODE_MASK	GENMASK(2, 0)
 
 static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 {
@@ -50,9 +48,9 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	}
 
 	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_MII) {
-		ethmode = LPC18XX_CREG_CREG6_ETHMODE_MII;
+		ethmode = PHY_INTF_SEL_GMII_MII;
 	} else if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) {
-		ethmode = LPC18XX_CREG_CREG6_ETHMODE_RMII;
+		ethmode = PHY_INTF_SEL_RMII;
 	} else {
 		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
 		return -EINVAL;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
