Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC60C39AF4
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 09:57:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128A2C36B3C;
	Thu,  6 Nov 2025 08:57:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 057E7C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hvK0aiK/u0dbGVPNchj5l12C2OQtVqNUwVkeZsgcupA=; b=v1b0leahPK2xfJFfhlcXo2xVAt
 dr9hSMDgj75oTEnjoEMgUS8J1E3IbPMj2MSs53+HXyeTC0V8A3IhyoFmrNgTf6PhmM5FFNL8rjCPl
 KbtRr94tfR9C85N0rbd5jxbAd7EXc1oFPALIaqM7mBTp9h7k3Fz5X1bDlfxs/SOVKkOqogyJ+pEY7
 Rukacw3l1vcToSNoFj/jDhg8qkJTYcI6ieQfsQdysJi48pjzA/tvQ9sJX22ocyQSMBsM6t73J0hnN
 p2e9MUHi1Vq0E+3G8aFqiPYqPQitKmLdDDChE9Fcsyw6Ru2wKZak56cldOae78EhhbOnYlmpG57J2
 rAWJrT2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44182 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGvoL-000000004YD-0vRZ;
 Thu, 06 Nov 2025 08:57:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGvoK-0000000DWoh-15Ge; Thu, 06 Nov 2025 08:57:40 +0000
In-Reply-To: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGvoK-0000000DWoh-15Ge@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 08:57:40 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 05/11] net: stmmac: ingenic: prep
 PHY_INTF_SEL_x field after switch()
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

Move the preparation of the PHY_INTF_SEL_x bitfield out of the switch()
statement such that it only appears once.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 34 +++++++++++++------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index b56d7ada1939..6680f7d3a469 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -71,20 +71,21 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
+	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_GMII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_RMII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -92,7 +93,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
 		break;
 
@@ -102,7 +103,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		return -EINVAL;
 	}
 
-	val |= FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
+	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
+	      FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
 
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
@@ -131,10 +133,11 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
+	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -144,6 +147,8 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		return -EINVAL;
 	}
 
+	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
+
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
@@ -152,11 +157,12 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
+	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
-		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
-			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
+		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -166,6 +172,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		return -EINVAL;
 	}
 
+	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
+
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
@@ -174,12 +182,13 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
+	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
-			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
-			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
+			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -187,7 +196,8 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
+		val = 0;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 
 		if (mac->tx_delay == 0)
 			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
@@ -210,6 +220,8 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		return -EINVAL;
 	}
 
+	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
+
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
