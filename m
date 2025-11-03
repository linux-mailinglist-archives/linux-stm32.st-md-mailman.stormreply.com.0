Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C109FC2B82D
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:51:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87733C62D32;
	Mon,  3 Nov 2025 11:51:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E8DCC62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kly4N6abxp7aiePb6wwRYSJBZH1/+QjzYw61vq0g2YY=; b=VLRDRUvcQXaTw2J9kkhL41exjg
 l03aK4H5uo2r3lFc7UW+qkMbskoYLmUNx1vTeQXFsWaGs/dVVrYQMk6ahorUvjrArrwmmMrW259rT
 d3gYqe06cb7qItzqXKILT6Mt5XgrHxlNNDsoghKsHOBnQRZsL6WTkefxMg6+rwYqZUKRz7iMHwEua
 FrXmdJ1esBBO2TXfhbNL31mcEW2ySLoGgSM3cn6UgIz8E31IZbecuu7xWNkYUdtqoNrTsmbHoi3Hd
 PIVdJnkHQ9YKxgv78dtENXBUJYvGAHwn/M9EaCCt1LFsMRmGOUQp6ye+LHFVBOPu3mwoHX3gSD3A8
 0yD2ZqVQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50026 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt56-000000000ho-2CKc;
 Mon, 03 Nov 2025 11:50:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt52-0000000ChpG-1bsd; Mon, 03 Nov 2025 11:50:36 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt52-0000000ChpG-1bsd@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:36 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: imx: simplify
 set_intf_mode() implementations
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

Simplify the set_intf_mode() implementations, testing the phy_intf_sel
value rather than the PHY interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 67 ++++++-------------
 1 file changed, 19 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index dc28486a7af0..d69be9de4468 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -67,29 +67,15 @@ static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
 				u8 phy_intf_sel)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	int val;
-
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_MII:
-		val = 0;
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		val = dwmac->rmii_refclk_ext ? 0 : GPR_ENET_QOS_CLK_TX_CLK_SEL;
-		break;
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = GPR_ENET_QOS_RGMII_EN;
-		break;
-	default:
-		pr_debug("imx dwmac doesn't support %s interface\n",
-			 phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
-	}
+	unsigned int val;
 
-	val |= FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
-	       GPR_ENET_QOS_CLK_GEN_EN;
+	val = FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
+	      GPR_ENET_QOS_CLK_GEN_EN;
+
+	if (phy_intf_sel == PHY_INTF_SEL_RMII && !dwmac->rmii_refclk_ext)
+		val |= GPR_ENET_QOS_CLK_TX_CLK_SEL;
+	else if (phy_intf_sel == PHY_INTF_SEL_RGMII)
+		val |= GPR_ENET_QOS_RGMII_EN;
 
 	return regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
 				  GPR_ENET_QOS_INTF_MODE_MASK, val);
@@ -99,39 +85,24 @@ static int
 imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
 		      u8 phy_intf_sel)
 {
-	int ret = 0;
-
 	/* TBD: depends on imx8dxl scu interfaces to be upstreamed */
-	return ret;
+	return 0;
 }
 
 static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
 			       u8 phy_intf_sel)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	int val, ret;
-
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		if (dwmac->rmii_refclk_ext) {
-			ret = regmap_clear_bits(dwmac->intf_regmap,
-						dwmac->intf_reg_off +
-						MX93_GPR_CLK_SEL_OFFSET,
-						MX93_GPR_ENET_QOS_CLK_SEL_MASK);
-			if (ret)
-				return ret;
-		}
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		break;
-	default:
-		dev_dbg(dwmac->dev, "imx dwmac doesn't support %s interface\n",
-			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
+	unsigned int val;
+	int ret;
+
+	if (phy_intf_sel == PHY_INTF_SEL_RMII && dwmac->rmii_refclk_ext) {
+		ret = regmap_clear_bits(dwmac->intf_regmap,
+					dwmac->intf_reg_off +
+					MX93_GPR_CLK_SEL_OFFSET,
+					MX93_GPR_ENET_QOS_CLK_SEL_MASK);
+		if (ret)
+			return ret;
 	}
 
 	val = FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
