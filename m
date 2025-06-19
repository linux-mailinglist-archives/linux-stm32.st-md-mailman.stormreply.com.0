Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F9AE0202
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 11:48:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F3DEC36B3A;
	Thu, 19 Jun 2025 09:48:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80511C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AApn2ot00InFaDW5pjrmd9wr1a+/4qJM2q8x8u9VFeM=; b=fdRbQF6MGkCqD0lNx0zAhb1Dqz
 W0tjVHZaO82AfU5sMTZ3dCl0inJV9nwPOx0IW42nB3xqZfYC1Mve+iKAYTU46+V2hMQ6xXHNEpNGt
 TZPtEfLnRZMDLTEdSQIjR5GgxcKB6rKMfgvxPAtCNMvOTeEoYm4Hjk8aQS/pI0Nxn7eaKhJJZIIlp
 V+vW3PAl0K6CoRtA2Pd2C1BndrqbF33ov76LDDxqhNbKfiRPbh+tnwFeIhKiybTaaBkoPnyX59PlR
 JyZh7hVsMQzH05c+d8QJ85xR8cH7zd0yO3YMN0sT//qZb/FlszBqolVK3yolSZGkjSrXFaaEEk7f6
 Gh7KVPTg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51446 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uSBsM-0007jW-3D;
 Thu, 19 Jun 2025 10:48:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uSBri-004fL5-FI; Thu, 19 Jun 2025 10:47:26 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
Date: Thu, 19 Jun 2025 10:47:26 +0100
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: lpc18xx: use
	plat_dat->phy_interface
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

lpc18xx uses plat_dat->mac_interface, despite wanting to validate the
PHY interface. Checking the DT files (arch/arm/boot/dts/nxp/lpc/), none
of them specify mac-mode which means mac_interface and phy_interface
will be identical.

mac_interface is only used when there is some kind of MII converter
between the DesignWare MAC and PHY, and describes the interface mode
that the DW MAC needs to use, whereas phy_interface describes the
interface mode that the PHY uses.

Noting that lpc18xx only supports MII and RMII interface modes, switch
this glue driver to use plat_dat->phy_interface, and to mark that the
mac_interface is not used, explicitly set it to PHY_INTERFACE_MODE_NA.
The latter is safe as the only user of mac_interface for this platform
would be in stmmac_check_pcs_mode(), which only checks for RGMII or
SGMII.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index 22653ffd2a04..c0c44916f849 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -41,6 +41,7 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	plat_dat->mac_interface = PHY_INTERFACE_MODE_NA;
 	plat_dat->has_gmac = true;
 
 	reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
@@ -49,9 +50,9 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 	}
 
-	if (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII) {
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_MII) {
 		ethmode = LPC18XX_CREG_CREG6_ETHMODE_MII;
-	} else if (plat_dat->mac_interface == PHY_INTERFACE_MODE_RMII) {
+	} else if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) {
 		ethmode = LPC18XX_CREG_CREG6_ETHMODE_RMII;
 	} else {
 		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
