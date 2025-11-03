Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B09C2B827
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:50:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57FECC62D32;
	Mon,  3 Nov 2025 11:50:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47321C62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7xL9GiU2IaWHrasIEnSZbT6M9oFMnSwoQNmb4+tGE3o=; b=snBIplvIVkUf0YsCAdoyLlUA1B
 yStvnWgOqPNvyDMqHuZSX+/yBhxmjEcdRsu1HmY9y4uuAhYQFIA177MBLRKW4tYCifHBuysqtbPml
 wTyP7lojvuRjnAEgiqjI+gevOsqOYVIR5L0/gSeQlwHbpGiPtSEC+ZLmWMz4GtwG/okWmuCbDfqm+
 ShPnM6OjvMHTDXBfD6w/PqdanezCQtbCTas2DtL6GUrHeOKvHQuJyg12+WU41+f/DsA519xjtFiZ6
 AW281jpFmqZH7YQu7VDq4qxniPl22GcTmQibymg127KQUVtJM3n47vw47ot7oC7B5ox5tO2I1XhKg
 ZnlEI/rQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41448 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt4u-000000000hA-2yld;
 Mon, 03 Nov 2025 11:50:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt4s-0000000Chp4-0kwf; Mon, 03 Nov 2025 11:50:26 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt4s-0000000Chp4-0kwf@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:26 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/11] net: stmmac: imx: use
 FIELD_PREP()/FIELD_GET() for PHY_INTF_SEL_x
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

Use FIELD_PREP()/FIELD_GET() in the functions to construct the PHY
interface selection bitfield or to extract its value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 44 +++++++++----------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 4fbee59e7337..f1cfccd4269c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -24,24 +24,12 @@
 
 #define GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(21, 16)
 #define GPR_ENET_QOS_INTF_SEL_MASK	GENMASK(20, 16)
-#define GPR_ENET_QOS_INTF_SEL_MII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
-						   PHY_INTF_SEL_GMII_MII)
-#define GPR_ENET_QOS_INTF_SEL_RMII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
-						   PHY_INTF_SEL_RMII)
-#define GPR_ENET_QOS_INTF_SEL_RGMII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
-						   PHY_INTF_SEL_RGMII)
 #define GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 19)
 #define GPR_ENET_QOS_CLK_TX_CLK_SEL	(0x1 << 20)
 #define GPR_ENET_QOS_RGMII_EN		(0x1 << 21)
 
 #define MX93_GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(3, 0)
 #define MX93_GPR_ENET_QOS_INTF_SEL_MASK		GENMASK(3, 1)
-#define MX93_GPR_ENET_QOS_INTF_SEL_MII		FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
-							   PHY_INTF_SEL_GMII_MII)
-#define MX93_GPR_ENET_QOS_INTF_SEL_RMII		FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
-							   PHY_INTF_SEL_RMII)
-#define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
-							   PHY_INTF_SEL_RGMII)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
 #define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
 #define MX93_GPR_CLK_SEL_OFFSET			(4)
@@ -77,22 +65,24 @@ struct imx_priv_data {
 static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
+	u8 phy_intf_sel;
 	int val;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		val = GPR_ENET_QOS_INTF_SEL_MII;
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
+		val = 0;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		val = GPR_ENET_QOS_INTF_SEL_RMII;
-		val |= (dwmac->rmii_refclk_ext ? 0 : GPR_ENET_QOS_CLK_TX_CLK_SEL);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
+		val = dwmac->rmii_refclk_ext ? 0 : GPR_ENET_QOS_CLK_TX_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = GPR_ENET_QOS_INTF_SEL_RGMII |
-		      GPR_ENET_QOS_RGMII_EN;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
+		val = GPR_ENET_QOS_RGMII_EN;
 		break;
 	default:
 		pr_debug("imx dwmac doesn't support %s interface\n",
@@ -100,7 +90,9 @@ static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 		return -EINVAL;
 	}
 
-	val |= GPR_ENET_QOS_CLK_GEN_EN;
+	val |= FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
+	       GPR_ENET_QOS_CLK_GEN_EN;
+
 	return regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
 				  GPR_ENET_QOS_INTF_MODE_MASK, val);
 };
@@ -117,11 +109,12 @@ imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
+	u8 phy_intf_sel;
 	int val, ret;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		val = MX93_GPR_ENET_QOS_INTF_SEL_MII;
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		if (dwmac->rmii_refclk_ext) {
@@ -132,13 +125,13 @@ static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 			if (ret)
 				return ret;
 		}
-		val = MX93_GPR_ENET_QOS_INTF_SEL_RMII;
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = MX93_GPR_ENET_QOS_INTF_SEL_RGMII;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		break;
 	default:
 		dev_dbg(dwmac->dev, "imx dwmac doesn't support %s interface\n",
@@ -146,7 +139,9 @@ static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 		return -EINVAL;
 	}
 
-	val |= MX93_GPR_ENET_QOS_CLK_GEN_EN;
+	val = FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
+	      MX93_GPR_ENET_QOS_CLK_GEN_EN;
+
 	return regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
 				  MX93_GPR_ENET_QOS_INTF_MODE_MASK, val);
 };
@@ -248,8 +243,8 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	if (regmap_read(dwmac->intf_regmap, dwmac->intf_reg_off, &iface))
 		return;
 
-	iface &= MX93_GPR_ENET_QOS_INTF_SEL_MASK;
-	if (iface != MX93_GPR_ENET_QOS_INTF_SEL_RGMII)
+	if (FIELD_GET(MX93_GPR_ENET_QOS_INTF_SEL_MASK, iface) !=
+	    PHY_INTF_SEL_RGMII)
 		return;
 
 	old_ctrl = readl(dwmac->base_addr + MAC_CTRL_REG);
@@ -262,6 +257,7 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	readl(dwmac->base_addr + MAC_CTRL_REG);
 
 	usleep_range(10, 20);
+	iface &= MX93_GPR_ENET_QOS_INTF_SEL_MASK;
 	iface |= MX93_GPR_ENET_QOS_CLK_GEN_EN;
 	regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
 			   MX93_GPR_ENET_QOS_INTF_MODE_MASK, iface);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
