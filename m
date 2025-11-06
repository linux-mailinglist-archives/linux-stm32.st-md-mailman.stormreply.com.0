Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D29C3A8A7
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 12:24:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22FE8C36B3C;
	Thu,  6 Nov 2025 11:24:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01E6FC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UzBB2UijmCHVcRf7zDJoQKSDLaPP35srt0SKwOk7mnI=; b=1gKYzpftgWqRE5TRemFZNjchAw
 kUej7N0A1oleBKN8fdgR3jJemeX3S85a2ohNJGFOc1EeYIp0urBE8xR0gm9VNR8znWWOCBKHYHlZ6
 0FVu1ocR+LwdGxurJVqe/gGgl0H1kiOH4c/9Ux6Y/fTeacQndeQGGwcGmtswBGzZXnRIP65xhOQkc
 09GA+qeZvQdGLOcLqDRx2J8weQZtmg5QhOaVtp/ZZ9sFWxASNRa/lra0X72vp3IMBxAlsCPc3Ldqc
 uJtUVDpLJPgQBRXEmgvGNIpqlrfUDS8o18MnM0THVA1UD8QSut22pswYRuSoXjdoTfeFTfhoDhUoq
 4D1tQaAA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60354 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGy5q-000000004wp-0M57;
 Thu, 06 Nov 2025 11:23:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGy5o-0000000DhQn-34JE; Thu, 06 Nov 2025 11:23:52 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGy5o-0000000DhQn-34JE@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:52 +0000
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 9/9] net: stmmac: sti: use
	->set_phy_intf_sel()
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

Rather than placing the phy_intf_sel() setup in the ->init() method,
move it to the new ->set_phy_intf_sel() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 25 +++++++------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 593e154b5957..b0509ab6b31c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -146,17 +146,18 @@ static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
 			   stih4xx_tx_retime_val[src]);
 }
 
-static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
+static int sti_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	struct regmap *regmap = dwmac->regmap;
-	u32 reg = dwmac->ctrl_reg;
-	int phy_intf_sel;
-	u32 val;
+	struct sti_dwmac *dwmac = bsp_priv;
+	struct regmap *regmap;
+	u32 reg, val;
+
+	regmap = dwmac->regmap;
+	reg = dwmac->ctrl_reg;
 
 	if (dwmac->gmac_en)
 		regmap_update_bits(regmap, reg, EN_MASK, EN);
 
-	phy_intf_sel = stmmac_get_phy_intf_sel(dwmac->interface);
 	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
 	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
 	    phy_intf_sel != PHY_INTF_SEL_SGMII &&
@@ -231,17 +232,8 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 static int sti_dwmac_init(struct platform_device *pdev, void *bsp_priv)
 {
 	struct sti_dwmac *dwmac = bsp_priv;
-	int ret;
-
-	ret = clk_prepare_enable(dwmac->clk);
-	if (ret)
-		return ret;
-
-	ret = sti_dwmac_set_mode(dwmac);
-	if (ret)
-		clk_disable_unprepare(dwmac->clk);
 
-	return ret;
+	return clk_prepare_enable(dwmac->clk);
 }
 
 static void sti_dwmac_exit(struct platform_device *pdev, void *bsp_priv)
@@ -286,6 +278,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	dwmac->fix_retime_src = data->fix_retime_src;
 
 	plat_dat->bsp_priv = dwmac;
+	plat_dat->set_phy_intf_sel = sti_set_phy_intf_sel;
 	plat_dat->fix_mac_speed = data->fix_retime_src;
 	plat_dat->init = sti_dwmac_init;
 	plat_dat->exit = sti_dwmac_exit;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
