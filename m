Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E47ADBBB3
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 23:07:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46782C32E8E;
	Mon, 16 Jun 2025 21:07:19 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48C08C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 21:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wIfUnzGMGVGq2OxybQ2u1EyFAhDicZ6TudUKzWins8I=; b=hGhzisxYWTAl91Jqr9NH5Ll0e9
 rEdqL5qB40/F91i37xa6mnpYxu+yHvAg6mdvYIX+VJ7GrH26A878/GNhRAbDCZubx/K2P/7L3l5sT
 mc2s6QxT0TjgM4kkXx2L1urXBWQOICtMgMFicDYqDCT/N37uX7AJ1MnwmlRGYaH2MlxULZ+kbMb8T
 6a1DMrntDv8oat6aBNS4ESZC2gBmCcvaD1mvNbUS09qsV5veAV2xV9MpedvOqc0THbXZApVmnTnWu
 9BgdU/3b8Q5wOqiKDJoPsM0bIOp55yAXNPySP92D9DbD6qTkCckqSD5RShpOuaKsj10pGdEb09Lej
 SMF1V24A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36656 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uRH2u-0004HM-3B;
 Mon, 16 Jun 2025 22:07:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uRH2G-004UyY-GD; Mon, 16 Jun 2025 22:06:32 +0100
In-Reply-To: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uRH2G-004UyY-GD@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 22:06:32 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: visconti: make
	phy_intf_sel local
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

There is little need to have phy_intf_sel as a member of struct
visconti_eth when we have the PHY interface mode available from
phylink in visconti_eth_set_clk_tx_rate(). Without multiple
interface support, phylink is fixed to supporting only
plat->phy_interface, so we can be sure that "interface" passed
into this function is the same as plat->phy_interface.

Make phy_intf_sel local to visconti_eth_init_hw() and clean up.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index db82b522c248..bd65d4239054 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -48,7 +48,6 @@
 
 struct visconti_eth {
 	void __iomem *reg;
-	u32 phy_intf_sel;
 	struct clk *phy_ref_clk;
 	struct device *dev;
 };
@@ -57,9 +56,9 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 					phy_interface_t interface, int speed)
 {
 	struct visconti_eth *dwmac = bsp_priv;
-	unsigned int val, clk_sel = 0;
+	unsigned long clk_sel, val;
 
-	if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII) {
+	if (phy_interface_mode_is_rgmii(interface)) {
 		switch (speed) {
 		case SPEED_1000:
 			clk_sel = ETHER_CLK_SEL_FREQ_SEL_125M;
@@ -93,7 +92,7 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 		val &= ~ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
-	} else if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII) {
+	} else if (interface == PHY_INTERFACE_MODE_RMII) {
 		switch (speed) {
 		case SPEED_100:
 			clk_sel = ETHER_CLK_SEL_DIV_SEL_2;
@@ -150,28 +149,28 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmacenet_data *plat_dat)
 {
 	struct visconti_eth *dwmac = plat_dat->bsp_priv;
-	unsigned int reg_val, clk_sel_val;
+	unsigned int clk_sel_val;
+	u32 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		dwmac->phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
+		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
 		break;
 	case PHY_INTERFACE_MODE_MII:
-		dwmac->phy_intf_sel = ETHER_CONFIG_INTF_MII;
+		phy_intf_sel = ETHER_CONFIG_INTF_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		dwmac->phy_intf_sel = ETHER_CONFIG_INTF_RMII;
+		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
 		return -EOPNOTSUPP;
 	}
 
-	reg_val = dwmac->phy_intf_sel;
-	writel(reg_val, dwmac->reg + REG_ETHER_CONTROL);
+	writel(phy_intf_sel, dwmac->reg + REG_ETHER_CONTROL);
 
 	/* Enable TX/RX clock */
 	clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_125M;
@@ -181,8 +180,8 @@ static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmac
 	       dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 	/* release internal-reset */
-	reg_val |= ETHER_ETH_CONTROL_RESET;
-	writel(reg_val, dwmac->reg + REG_ETHER_CONTROL);
+	phy_intf_sel |= ETHER_ETH_CONTROL_RESET;
+	writel(phy_intf_sel, dwmac->reg + REG_ETHER_CONTROL);
 
 	return 0;
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
