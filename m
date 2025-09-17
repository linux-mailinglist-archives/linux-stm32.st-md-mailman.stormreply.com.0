Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29CB808ED
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:29:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4207CC3F954;
	Wed, 17 Sep 2025 15:29:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E693C3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRAJRW4WfloKke+sA3cXYCgUSWJDPjglxO5sAwdnW9Y=; b=0YjQF4VTUahjY2yLEZTHLsirA9
 PmtQnLqyIa+N9Biz3pWT4UPa3AVij5qesBfp0YDnwdGc7Wq/WQ1+HwQdPkENVqDIksW9znV3+9a1f
 ISQo4WIImUOMmHsM8Emuf9P0MCwoxa9RL6W22jfMyjn+1s9PO1SsErOlhang4vSFhpbtPRs8dVGQp
 0wJvgqB+ECAtCKkcn3K0P85Yls1KJnJij/sQSIbuA/LTdqLRxtrAnUeEZ3MPg26dAqFC1MPz3/QRg
 3j1ZDLRaIkCR2+CcgGv6s86gtpKnLs63wPqVlWK29iTQXbWglpSXwCtqk/uszytdKzEvu+lrUirz3
 9KJyp2Nw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42810 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uytpu-000000004mr-1r1L;
 Wed, 17 Sep 2025 16:12:46 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uytpq-00000006H2q-0ajY; Wed, 17 Sep 2025 16:12:42 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uytpq-00000006H2q-0ajY@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:42 +0100
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
Subject: [Linux-stm32] [PATCH net-next 09/10] net: stmmac: thead: convert to
 use phy_interface
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

dwmac-thead supports either MII or RGMII interface modes only.

None of the DTS files set "mac-mode", so mac_interface will be
identical to phy_interface.

Convert dwmac-thead to use phy_interface when determining the
interface mode rather than mac_interface.

Also convert the error prints to use phy_modes() so that we get a
meaningful string rather than a number for the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index 6c6c49e4b66f..a3378046b061 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -56,7 +56,7 @@ static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
 	struct thead_dwmac *dwmac = plat->bsp_priv;
 	u32 phyif;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		phyif = PHY_INTF_MII_GMII;
 		break;
@@ -67,8 +67,8 @@ static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
 		phyif = PHY_INTF_RGMII;
 		break;
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -81,7 +81,7 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 	struct thead_dwmac *dwmac = plat->bsp_priv;
 	u32 txclk_dir;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		txclk_dir = TXCLK_DIR_INPUT;
 		break;
@@ -92,8 +92,8 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 		txclk_dir = TXCLK_DIR_OUTPUT;
 		break;
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -112,7 +112,7 @@ static int thead_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 	plat = dwmac->plat;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	/* For MII, rxc/txc is provided by phy */
 	case PHY_INTERFACE_MODE_MII:
 		return 0;
@@ -143,8 +143,8 @@ static int thead_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 		return 0;
 
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 }
@@ -154,7 +154,7 @@ static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
 	struct thead_dwmac *dwmac = plat->bsp_priv;
 	u32 reg, div;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
 		break;
@@ -177,8 +177,8 @@ static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
 		break;
 
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
