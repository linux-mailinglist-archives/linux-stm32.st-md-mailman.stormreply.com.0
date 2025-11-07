Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7FDC3EF40
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 09:29:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37717C60468;
	Fri,  7 Nov 2025 08:29:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2EADC60466
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 08:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w3jBS0tqT/QRg8rL1xz4Merr6UrN32I0S/6JlGlut68=; b=0SkXv3R0vlJHj5NRJb97peBUIk
 RZt2eK40J6dFiPrKFHP43tFZ4UzH8V45A1H8/MB8myPwwBxUchPsaVJOT4KJh0nuCBH5nZ4nJ9BHn
 XfHtXMTh0biTWW4ijGalP/pIimRzSl2Czx1Y1bprvWug4cBEeovUagKpsdzVssk8oEkXcwVCKCb1Z
 Ba99IipfE2tLZ3qimuo5iT174X9CymCw5GeD4QMU+6IO7x7KzGKIqF/Ul4N4yAGtjNALcyognSiAE
 DCnunqKucZUpLgcq/vjuRNXe3+zbGFgi1d6VHNu4IScTzNvLDYs+N8oO8hifUo2k9rHuHoLJ8bk4v
 mdK3VVGg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41494 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHHqA-000000006A2-3SPM;
 Fri, 07 Nov 2025 08:29:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHHq8-0000000DjrJ-2NRK; Fri, 07 Nov 2025 08:29:00 +0000
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHHq8-0000000DjrJ-2NRK@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 08:29:00 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 06/11] net: stmmac: ingenic: use
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
phy_intf_sel value, validate the result against the SoC specific
supported phy_intf_sel values, and pass into the SoC specific
set_mode() methods, replacing the local phy_intf_sel variable. This
provides the value for the MACPHYC_PHY_INFT_MASK field.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 55 ++++++++++++-------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 6680f7d3a469..79735a476e86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -64,28 +64,27 @@ struct ingenic_soc_info {
 	enum ingenic_mac_version version;
 	u32 mask;
 
-	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
+	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
+
+	u8 valid_phy_intf_sel;
 };
 
-static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			       u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_GMII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -93,7 +92,6 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
 		break;
 
@@ -110,7 +108,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 
@@ -129,15 +128,14 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
 }
 
-static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -153,16 +151,15 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -178,17 +175,16 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
 			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -197,8 +193,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 		val = 0;
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
-
 		if (mac->tx_delay == 0)
 			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
 		else
@@ -229,10 +223,21 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 {
 	struct ingenic_mac *mac = bsp_priv;
-	int ret;
+	phy_interface_t interface;
+	int phy_intf_sel, ret;
 
 	if (mac->soc_info->set_mode) {
-		ret = mac->soc_info->set_mode(mac->plat_dat);
+		interface = mac->plat_dat->phy_interface;
+
+		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
+		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
+			dev_err(mac->dev, "unsupported interface %s\n",
+				phy_modes(interface));
+			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+		}
+
+		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
 		if (ret)
 			return ret;
 	}
@@ -309,6 +314,9 @@ static struct ingenic_soc_info jz4775_soc_info = {
 	.mask = MACPHYC_TXCLK_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = jz4775_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_GMII_MII) |
+			      BIT(PHY_INTF_SEL_RGMII) |
+			      BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x1000_soc_info = {
@@ -316,6 +324,7 @@ static struct ingenic_soc_info x1000_soc_info = {
 	.mask = MACPHYC_SOFT_RST_MASK,
 
 	.set_mode = x1000_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x1600_soc_info = {
@@ -323,6 +332,7 @@ static struct ingenic_soc_info x1600_soc_info = {
 	.mask = MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = x1600_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x1830_soc_info = {
@@ -330,6 +340,7 @@ static struct ingenic_soc_info x1830_soc_info = {
 	.mask = MACPHYC_MODE_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = x1830_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x2000_soc_info = {
@@ -338,6 +349,8 @@ static struct ingenic_soc_info x2000_soc_info = {
 			MACPHYC_RX_DELAY_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = x2000_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RGMII) |
+			      BIT(PHY_INTF_SEL_RMII),
 };
 
 static const struct of_device_id ingenic_mac_of_matches[] = {
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
