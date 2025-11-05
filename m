Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3066AC35D46
	for <lists+linux-stm32@lfdr.de>; Wed, 05 Nov 2025 14:27:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32B7BC62ED5;
	Wed,  5 Nov 2025 13:27:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8AFEC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Nov 2025 13:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7vJAkYgDYja28W9+m7ImQv3XKVEjSe37hg9qICz9dao=; b=clylRTLn0FWM3qn0pWTxxY7NO/
 L7x5ZjmAfERGsEFaLrQ5ybgvj7QNVrPiEyhNphNM2w1hXwMo/yGtmoi0a977dlid/fcZasPCFTv+6
 CP3Ee1SGBns/Myph/gYgmK/j60UwtNL/2ZWPX7RvSweeWtHLb8leC7hGcDLTtMyiu8elyqkANv0gU
 raFB7upy1P5unlecHR5rLULHXTMk3HjK2tboR4FTjwUa2jmj7xvrIov2z/zZgmiTLKohG3m1R2Xml
 vhVVerTZky7Fti9+lH3YCRZpaNVLLZBkvJJ0wGG8UsQMhy+bADMpfkmoQNmfIppInlgLrj41QX2Tz
 XnIyf3zg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50732 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGdXQ-000000003UM-3swe;
 Wed, 05 Nov 2025 13:27:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGdXP-0000000CloH-0FW9; Wed, 05 Nov 2025 13:26:59 +0000
In-Reply-To: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGdXP-0000000CloH-0FW9@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Nov 2025 13:26:59 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: ingenic: pass
 ingenic_mac struct rather than plat_dat
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

It no longer makes sense to pass a pointer to struct
plat_stmmacenet_data when calling the set_mode() methods to only use it
to get a pointer to the ingenic_mac structure that we already had in
the caller. Simplify this by passing the struct ingenic_mac pointer.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 98fd4c31a694..5ea26ee8e9d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -64,15 +64,13 @@ struct ingenic_soc_info {
 	enum ingenic_mac_version version;
 	u32 mask;
 
-	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
+	int (*set_mode)(struct ingenic_mac *mac, u8 phy_intf_sel);
 
 	u8 valid_phy_intf_sel;
 };
 
-static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			       u8 phy_intf_sel)
+static int jz4775_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
@@ -82,19 +80,14 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
-
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
 }
 
-static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1600_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
@@ -103,10 +96,8 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1830_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
@@ -116,10 +107,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
@@ -165,7 +154,7 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
 			phy_modes(interface));
 
-		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
+		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
 		if (ret)
 			return ret;
 	}
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
