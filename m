Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F26C35D33
	for <lists+linux-stm32@lfdr.de>; Wed, 05 Nov 2025 14:26:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AACF4C62D8F;
	Wed,  5 Nov 2025 13:26:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D43EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Nov 2025 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O6L37IfWLpw3XmFJPzh2Xp4Lg92ac6ev5CyukuTT6as=; b=hS6FUT9v5Fx6hDW5BiQZo06J4F
 71DH3TXe+KBBFGowf9GWRT7jOi5aoRNPFGOu6zr0prNNAI4I8NZ+7Qro6X1Fq8J9dj77SP7wvnLI1
 eqft23FOylWdapZ58H6f8COKAmluHz1j9/gGqO8Lt5dngp9Y7do2bdTdzoMkc0VOXMqKGCnrtzbUs
 Dx2tzSlEShCmmZscgfJDnuK5lIDlUIkGf6cRbqvw5zKDQYEjzpPWXCnZEBpbsAsN51h77n9Mvdd1O
 RIOh5B8CT3tYTUtseP7wYUqnzePF/DJO6bwhOd5Lu1zHSY7WSe3nabUgl3cGeOGF9Xt9qw3maxBsm
 pvuW+V7Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58270 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGdWv-000000003SR-2uLV;
 Wed, 05 Nov 2025 13:26:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGdWu-0000000Clng-1c42; Wed, 05 Nov 2025 13:26:28 +0000
In-Reply-To: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGdWu-0000000Clng-1c42@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Nov 2025 13:26:28 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/11] net: stmmac: ingenic: use
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

Use the PHY_INTF_SEL_x values directly in each of the mac_set_mode
methods rather than the driver private MACPHYC_PHY_INFT_x definitions.
Remove the MACPHYC_PHY_INFT_x definitions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 5de2bd984d34..b56d7ada1939 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -35,10 +35,6 @@
 #define MACPHYC_RX_DELAY_MASK		GENMASK(10, 4)
 #define MACPHYC_SOFT_RST_MASK		GENMASK(3, 3)
 #define MACPHYC_PHY_INFT_MASK		GENMASK(2, 0)
-#define MACPHYC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
-#define MACPHYC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
-#define MACPHYC_PHY_INFT_GMII		PHY_INTF_SEL_GMII_MII
-#define MACPHYC_PHY_INFT_MII		PHY_INTF_SEL_GMII_MII
 
 #define MACPHYC_TX_DELAY_PS_MAX		2496
 #define MACPHYC_TX_DELAY_PS_MIN		20
@@ -78,17 +74,17 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_MII);
+		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_GMII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_GMII);
+		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_RMII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
+		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -96,7 +92,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
+		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
 		break;
 
@@ -138,7 +134,7 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
+		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -160,7 +156,7 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
-			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
+			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -183,7 +179,7 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
 			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
-			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
+			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -191,7 +187,7 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
+		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
 
 		if (mac->tx_delay == 0)
 			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
