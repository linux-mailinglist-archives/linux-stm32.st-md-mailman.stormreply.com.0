Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FEF9D979A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:53:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32705C78023;
	Tue, 26 Nov 2024 12:53:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52112C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SIGrobl+zw4EUSXA7yR//sEKBwcDdAfhGwCW2sSjPHY=; b=xvmWnGOSqAY/N/M4Tft8V/Weym
 sKUVXARe0oFEF+zoBJoEcwlH/8LlGxHFIqIuBp/DYJ/SwmGnBl4Bt9jfHOdVpdrnz+9OpLK53rBe6
 3eihJO11ESJ2bPiLy9sp80zLOACy8DmEyABWSzV8n8v7sWPNFoEcarJG2RRgPMdOlcij2dyiNRTMk
 3Vdqf4h0Weqyn+NW1uzsDsy2m/hLdQIHATWiWIf8i2JM5ZHTqGJIb5U6LFklUfvbDoGMb5tcDmlqu
 PeSs1MOtwZESXnENdfws9agZDDSlZwL5GX2CFuD5XfN/P3BkVqUoLnXlIt6mg1gwAHWRHMd7TQvQ0
 eb5h3Sug==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47328 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv4B-0006vK-0Y;
 Tue, 26 Nov 2024 12:53:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv49-005yiX-Hw; Tue, 26 Nov 2024 12:53:17 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv49-005yiX-Hw@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:17 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 13/23] net: mvneta: only allow
 EEE to be used in "SGMII" modes
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

The Armada 388 manual states that EEE is only supported in "SGMII"
modes. As mvneta only supports serdes modes and RGMII, we can
satisfy this by excluding it for RGMII.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/marvell/mvneta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 976ce8d6dabf..01bedf0a55f6 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5551,7 +5551,9 @@ static int mvneta_probe(struct platform_device *pdev)
 	pp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_10 |
 		MAC_100 | MAC_1000FD | MAC_2500FD;
 
-	/* Setup EEE.  Choose 250us idle. */
+	/* Setup EEE. Choose 250us idle. Only supported in SGMII modes. */
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, pp->phylink_config.lpi_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, pp->phylink_config.lpi_interfaces);
 	pp->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	pp->phylink_config.lpi_timer_limit_us = 255;
 	pp->phylink_config.lpi_timer_default = 250;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
