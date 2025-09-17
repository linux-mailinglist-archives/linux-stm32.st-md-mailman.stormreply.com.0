Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6AB806D6
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:12:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E982C3F954;
	Wed, 17 Sep 2025 15:12:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAAFEC3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yHSQ+RaFu0KBQqFTLVbeHlZC6n9bOFTaTq8CjHGDQOw=; b=MKAuvQDtEtgNfMzhwzjV8r8xgP
 MA40JSEfx2W+1qrr8SwP2ukornVJjksr1bNjlM2u8GrzNvFS2gnmrInqIPa3CIVQlBwasWSruJhtw
 lF4RPM2ySN1xcB7urXSizeXm73q3+OIPrPaNIqji8HTilKukU4QQGGUkJ7F/2LPK6a12KSY7okHOK
 iSwU6pzn1CjUQihhwZLDyjzHurthSlqDajFfhnzp2OGzbeKYZ0/eMOYs5xLXEXIE4TIgR6CNso4eC
 gHQGuc+bX2AyjCm3lTupCItG1qU2yIzRMSz8Ldqy8gKzsfXRcvgMwFnp+Drl+m1dn/Kh1t4O6DufU
 OpOF9rNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58692 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uytpT-000000004kx-365Q;
 Wed, 17 Sep 2025 16:12:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uytpQ-00000006H2L-2Jzb; Wed, 17 Sep 2025 16:12:16 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uytpQ-00000006H2L-2Jzb@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:16 +0100
Cc: Drew Fustini <fustini@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minda Chen <minda.chen@starfivetech.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 04/10] net: stmmac: ingenic: convert
 to use phy_interface
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

dwmac-ingenic uses only MII, RMII, GMII or RGMII interface modes, none
of which require any kind of conversion between the MAC and external
world. Thus, mac_interface and phy_interface will be the same.

Convert dwmac-ingenic to use phy_interface when determining the
interface mode that the dwmac core should be configured to at reset,
rather than mac_interface.

Also convert the error prints to use phy_modes() and terminate with a
newline so that we get a human readable string rather than a number for
the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 15abe214131f..c1670f6bae14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -90,7 +90,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
 			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_MII);
@@ -119,7 +119,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -131,13 +132,14 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -150,14 +152,15 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -170,7 +173,7 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
 			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
@@ -178,7 +181,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -191,7 +195,7 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
 			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
@@ -221,7 +225,8 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
