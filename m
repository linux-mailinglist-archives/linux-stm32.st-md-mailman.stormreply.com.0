Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A4C3A89B
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 12:23:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 083A8C36B3C;
	Thu,  6 Nov 2025 11:23:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21980C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TBl80ntOVSw5ZoCrR85twsw0/NxyN3XF7nXCwTrs0C8=; b=moOzjbagfA5GbRgRUfYVAkVFTn
 kfs0aq3a6+hNmskzb/1EqkDEukHwSpFaw7a7y2TpiPYisrNL0zuHDGygtkl++okhBytopvcoeWe3o
 bmznlyV4SwcARL32ejVD5E3oQ/5Th6s7gZzyiJ5qh04gooGdUkUiT2Bfit+JYdns+mxoYDzkAqBu+
 ZaL//EUrOLoKSfYDV7yDR8sUGgp7bSsZtYL877XBDvNreej2JLb63a4EoCUHKSRxSUC12F6jWD7s+
 ElRP+ZXhZImUYl/4o2By1TCXDLp7Qf2zrROavm/3MHWVU7gTujpMm9X0Yuo4LpBdZbdSYwt3xbSAq
 lgs3XmyQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48248 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGy5f-000000004w8-25Qr;
 Thu, 06 Nov 2025 11:23:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGy5e-0000000DhQb-2B7I; Thu, 06 Nov 2025 11:23:42 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGy5e-0000000DhQb-2B7I@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:42 +0000
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 7/9] net: stmmac: sti: use
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
ETH_PHY_SEL_x values. Move the FIELD_PREP() into sti_dwmac_set_mode().
Use dwmac->interface directly.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 1e8769a81d77..c97535824be0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -81,11 +81,6 @@
  */
 #define MII_PHY_SEL_MASK	GENMASK(4, 2)
 #define MII_PHY_SEL_VAL(val)	FIELD_PREP_CONST(MII_PHY_SEL_MASK, val)
-#define ETH_PHY_SEL_RMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RMII)
-#define ETH_PHY_SEL_SGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_SGMII)
-#define ETH_PHY_SEL_RGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RGMII)
-#define ETH_PHY_SEL_GMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
-#define ETH_PHY_SEL_MII		MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
 
 struct sti_dwmac {
 	phy_interface_t interface;	/* MII interface */
@@ -104,13 +99,13 @@ struct sti_dwmac_of_data {
 	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
 };
 
-static u32 phy_intf_sels[] = {
-	[PHY_INTERFACE_MODE_MII] = ETH_PHY_SEL_MII,
-	[PHY_INTERFACE_MODE_GMII] = ETH_PHY_SEL_GMII,
-	[PHY_INTERFACE_MODE_RGMII] = ETH_PHY_SEL_RGMII,
-	[PHY_INTERFACE_MODE_RGMII_ID] = ETH_PHY_SEL_RGMII,
-	[PHY_INTERFACE_MODE_SGMII] = ETH_PHY_SEL_SGMII,
-	[PHY_INTERFACE_MODE_RMII] = ETH_PHY_SEL_RMII,
+static u8 phy_intf_sels[] = {
+	[PHY_INTERFACE_MODE_MII] = PHY_INTF_SEL_GMII_MII,
+	[PHY_INTERFACE_MODE_GMII] = PHY_INTF_SEL_GMII_MII,
+	[PHY_INTERFACE_MODE_RGMII] = PHY_INTF_SEL_RGMII,
+	[PHY_INTERFACE_MODE_RGMII_ID] = PHY_INTF_SEL_RGMII,
+	[PHY_INTERFACE_MODE_SGMII] = PHY_INTF_SEL_SGMII,
+	[PHY_INTERFACE_MODE_RMII] = PHY_INTF_SEL_RMII,
 };
 
 enum {
@@ -164,16 +159,18 @@ static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
 static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
 {
 	struct regmap *regmap = dwmac->regmap;
-	int iface = dwmac->interface;
 	u32 reg = dwmac->ctrl_reg;
+	u8 phy_intf_sel;
 	u32 val;
 
 	if (dwmac->gmac_en)
 		regmap_update_bits(regmap, reg, EN_MASK, EN);
 
-	regmap_update_bits(regmap, reg, MII_PHY_SEL_MASK, phy_intf_sels[iface]);
+	phy_intf_sel = phy_intf_sels[dwmac->interface];
+	regmap_update_bits(regmap, reg, MII_PHY_SEL_MASK,
+			   FIELD_PREP(MII_PHY_SEL_MASK, phy_intf_sel));
 
-	val = (iface == PHY_INTERFACE_MODE_REVMII) ? 0 : ENMII;
+	val = (dwmac->interface == PHY_INTERFACE_MODE_REVMII) ? 0 : ENMII;
 	regmap_update_bits(regmap, reg, ENMII_MASK, val);
 
 	dwmac->fix_retime_src(dwmac, dwmac->speed, 0);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
