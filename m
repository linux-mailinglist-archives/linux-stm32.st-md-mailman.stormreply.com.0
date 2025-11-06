Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A9C3A89E
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 12:23:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14937C36B3C;
	Thu,  6 Nov 2025 11:23:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DEC5C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SdMM7KkXcfysHjh2oOZyk9CSNG82qeeBAIml5f+qIcw=; b=kg1cyJicC3zE2o3HFvYFpRxC7H
 G96xRdmqleIdbP4gB1OikZ2YjqRLrJb6/W5ay8oAy5Pg/T+Q3LZerXacKxmHn39rTDjE/TFjpZW68
 u3ForGr8eIRgOev4Z7DLyYxHKqV6PCJJp2MhwgGjdLdhnJ1+2SLGmi3kfdSvXd+QDyfdqi2WnCLl/
 HvyzoB5FXFXxICaY2tglnocCY+6+TXN/EIIaQCthFZjOr362zmQoUbapn0eDYqQswqaY11MoS8leS
 BE0GUNq84He377qCsZHwr5cXz0vfM/+U0uee7ctJaDFjETEsZUHOCwHvcJ5JAp0+fUcKww9fQmR32
 xDikETyA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48252 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGy5k-000000004wR-23Q9;
 Thu, 06 Nov 2025 11:23:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGy5j-0000000DhQh-2e0x; Thu, 06 Nov 2025 11:23:47 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGy5j-0000000DhQh-2e0x@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:47 +0000
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 8/9] net: stmmac: sti: use
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

Note that when an unsupported interface mode is used, the array would
decode this to PHY_INTF_SEL_GMII_MII, so preserve this behaviour.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 22 ++++++++-----------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index c97535824be0..593e154b5957 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -77,10 +77,9 @@
  *	001-RGMII
  *	010-SGMII
  *	100-RMII
- * These are the DW MAC phy_intf_sel values
+ * These are the DW MAC phy_intf_sel values.
  */
 #define MII_PHY_SEL_MASK	GENMASK(4, 2)
-#define MII_PHY_SEL_VAL(val)	FIELD_PREP_CONST(MII_PHY_SEL_MASK, val)
 
 struct sti_dwmac {
 	phy_interface_t interface;	/* MII interface */
@@ -99,15 +98,6 @@ struct sti_dwmac_of_data {
 	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
 };
 
-static u8 phy_intf_sels[] = {
-	[PHY_INTERFACE_MODE_MII] = PHY_INTF_SEL_GMII_MII,
-	[PHY_INTERFACE_MODE_GMII] = PHY_INTF_SEL_GMII_MII,
-	[PHY_INTERFACE_MODE_RGMII] = PHY_INTF_SEL_RGMII,
-	[PHY_INTERFACE_MODE_RGMII_ID] = PHY_INTF_SEL_RGMII,
-	[PHY_INTERFACE_MODE_SGMII] = PHY_INTF_SEL_SGMII,
-	[PHY_INTERFACE_MODE_RMII] = PHY_INTF_SEL_RMII,
-};
-
 enum {
 	TX_RETIME_SRC_NA = 0,
 	TX_RETIME_SRC_TXCLK = 1,
@@ -160,13 +150,19 @@ static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
 {
 	struct regmap *regmap = dwmac->regmap;
 	u32 reg = dwmac->ctrl_reg;
-	u8 phy_intf_sel;
+	int phy_intf_sel;
 	u32 val;
 
 	if (dwmac->gmac_en)
 		regmap_update_bits(regmap, reg, EN_MASK, EN);
 
-	phy_intf_sel = phy_intf_sels[dwmac->interface];
+	phy_intf_sel = stmmac_get_phy_intf_sel(dwmac->interface);
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_SGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII)
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
+
 	regmap_update_bits(regmap, reg, MII_PHY_SEL_MASK,
 			   FIELD_PREP(MII_PHY_SEL_MASK, phy_intf_sel));
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
