Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4919B806CD
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:12:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 903D7C3F954;
	Wed, 17 Sep 2025 15:12:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3813AC3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O1d4PdhmWXab487Qmnpyv/UQOdJgyUlVnXpcfDIvvio=; b=Pqne3nUKJrbNd08WmRsH1VgjPS
 crju6qG4wPTq54tK0iiV+OTGCt95Licg+PkwaNVjUswxmPex/LBzA2dXM3JHwWF7Ko323ejBpr4j4
 ob0Tu4hRnpG3sGBgyFs8RxZJVBv0S6dkLI8437zZ9mQtKnaB44Gi4wFiUJ+QvdpUxxLlg/7OHfFWr
 vxWHEWIV252pnqBdU47JAUBjFYYm4NbgaSUaiQI0+PxOoRoALKTHNpO710c9Z1jA8ytQ5wApimbGI
 /+ipugw0VKzafNr3x0TFp7a84epvjUCqRmjbnQRzJO1t7JjiJjlwqIN5VybbnZyJtu/chRqvB1Rkj
 1zrXrAwg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58688 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uytpM-000000004kW-33fd;
 Wed, 17 Sep 2025 16:12:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uytpL-00000006H2F-1o6b; Wed, 17 Sep 2025 16:12:11 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uytpL-00000006H2F-1o6b@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:11 +0100
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
Subject: [Linux-stm32] [PATCH net-next 03/10] net: stmmac: imx: convert to
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

Checking the IMX8MP documentation, there is no requirement for a
separate mac_interface mode definition. As mac_interface and
phy_interface will be the same, use phy_interface internally rather
than mac_interface.

Also convert the error prints to use phy_modes() so that we get a
meaningful string rather than a number for the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 80200a6aa0cb..4268b9987237 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -72,7 +72,7 @@ static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
 	int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = GPR_ENET_QOS_INTF_SEL_MII;
 		break;
@@ -88,8 +88,8 @@ static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 		      GPR_ENET_QOS_RGMII_EN;
 		break;
 	default:
-		pr_debug("imx dwmac doesn't support %d interface\n",
-			 plat_dat->mac_interface);
+		pr_debug("imx dwmac doesn't support %s interface\n",
+			 phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -112,7 +112,7 @@ static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
 	int val, ret;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = MX93_GPR_ENET_QOS_INTF_SEL_MII;
 		break;
@@ -134,8 +134,8 @@ static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 		val = MX93_GPR_ENET_QOS_INTF_SEL_RGMII;
 		break;
 	default:
-		dev_dbg(dwmac->dev, "imx dwmac doesn't support %d interface\n",
-			 plat_dat->mac_interface);
+		dev_dbg(dwmac->dev, "imx dwmac doesn't support %s interface\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -197,7 +197,7 @@ static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 {
 	struct imx_priv_data *dwmac = bsp_priv;
 
-	interface = dwmac->plat_dat->mac_interface;
+	interface = dwmac->plat_dat->phy_interface;
 	if (interface == PHY_INTERFACE_MODE_RMII ||
 	    interface == PHY_INTERFACE_MODE_MII)
 		return 0;
@@ -215,8 +215,8 @@ static void imx_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	plat_dat = dwmac->plat_dat;
 
 	if (dwmac->ops->mac_rgmii_txclk_auto_adj ||
-	    (plat_dat->mac_interface == PHY_INTERFACE_MODE_RMII) ||
-	    (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII))
+	    (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) ||
+	    (plat_dat->phy_interface == PHY_INTERFACE_MODE_MII))
 		return;
 
 	rate = rgmii_clock(speed);
@@ -274,7 +274,7 @@ static int imx_dwmac_mx93_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
 	value |= DMA_BUS_MODE_SFT_RESET;
 	writel(value, ioaddr + DMA_BUS_MODE);
 
-	if (plat_dat->mac_interface == PHY_INTERFACE_MODE_RMII) {
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) {
 		usleep_range(100, 200);
 		writel(RMII_RESET_SPEED, ioaddr + MAC_CTRL_REG);
 	}
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
