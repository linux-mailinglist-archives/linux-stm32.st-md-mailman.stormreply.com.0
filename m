Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08704A478DF
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 10:17:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2B99C7A83E;
	Thu, 27 Feb 2025 09:17:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C25EEC7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ufZqnl34vm+Pc3lq/GZFpFx8vvNtFX+vITx7KqbOkWc=; b=Cu0S5ynVTtTZxDgbsXX8fgD9Pf
 iCbv2qYrqpBlzm2jdjz8Lf2cwvZOvlriYf2nXoV65RT4m2GcPFqwxrBWj9tPGMnYLzRb40RTAErcv
 yrDjd51be6Xot7fWRCTUjhrFULrwoWHYpdCPihoOPmkZDuMyxl3QP7OGELscLIFPPl5fvaTRdSc5B
 uCZ8H83Kb8xkDCZmPiCJhg0FUQ3SHbVCNj4bqN/cp9iZ2TbUtBl6Xu0NL2OHRiwKMo4mZr6YTpyrU
 kkVtFRioqKVS55ri5MiPhJmvjEJCtQZJmoHpEPj6OsEjrCpwUpktLQOwOji8mtu52ojl6GcBoLRcD
 4vFlmDYg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37578 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tna1O-0006eI-36;
 Thu, 27 Feb 2025 09:17:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tna14-0052tT-S4; Thu, 27 Feb 2025 09:17:14 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tna14-0052tT-S4@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:17:14 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 11/11] net: stmmac: thead: switch to
 use set_clk_tx_rate() hook
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

Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
manage the transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c  | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index f9f2bd65959f..c72ee759aae5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -101,10 +101,11 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 	return 0;
 }
 
-static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
+static int thead_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				 phy_interface_t interface, int speed)
 {
+	struct thead_dwmac *dwmac = bsp_priv;
 	struct plat_stmmacenet_data *plat;
-	struct thead_dwmac *dwmac = priv;
 	unsigned long rate;
 	long tx_rate;
 	u32 div, reg;
@@ -114,7 +115,7 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	switch (plat->mac_interface) {
 	/* For MII, rxc/txc is provided by phy */
 	case PHY_INTERFACE_MODE_MII:
-		return;
+		return 0;
 
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -127,23 +128,24 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 		tx_rate = rgmii_clock(speed);
 		if (tx_rate < 0) {
 			dev_err(dwmac->dev, "invalid speed %d\n", speed);
-			return;
+			return tx_rate;
 		}
 
 		div = rate / tx_rate;
 		if (rate != tx_rate * div) {
 			dev_err(dwmac->dev, "invalid gmac rate %lu\n", rate);
-			return;
+			return -EINVAL;
 		}
 
 		reg = FIELD_PREP(GMAC_PLLCLK_DIV_EN, 1) |
 		      FIELD_PREP(GMAC_PLLCLK_DIV_NUM, div);
 		writel(reg, dwmac->apb_base + GMAC_PLLCLK_DIV);
-		break;
+		return 0;
+
 	default:
 		dev_err(dwmac->dev, "unsupported phy interface %d\n",
 			plat->mac_interface);
-		return;
+		return -EINVAL;
 	}
 }
 
@@ -235,7 +237,7 @@ static int thead_dwmac_probe(struct platform_device *pdev)
 	dwmac->plat = plat;
 	dwmac->apb_base = apb;
 	plat->bsp_priv = dwmac;
-	plat->fix_mac_speed = thead_dwmac_fix_speed;
+	plat->set_clk_tx_rate = thead_set_clk_tx_rate;
 	plat->init = thead_dwmac_init;
 
 	return devm_stmmac_pltfr_probe(pdev, plat, &stmmac_res);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
