Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 803ECADBBB1
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 23:07:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B811C32E8E;
	Mon, 16 Jun 2025 21:07:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75383C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 21:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=usS8eSGq09XLP07GR4QpRxtU219wXTyDk0hJf9XtFIU=; b=o3vcwMCFnedGLDnmq/PMDZqR4t
 wT43Kc8QNUlkXwWVzuDyEujY3e801pdzB1IMFEdRKEfuDSaMd6WU1MzOs3Dj/+LkduSCMoJhvJdJS
 xNExyNFtuQYG07YC5LZp88lMCHvM63/cg5d2+iop4uvNpZUS8/p27Ym/LPqcY2H33fXg0fGQgMYlc
 yRaZnRaIPmg9kLWVoW9qpOaWeT8Lcm7NX8/LgRQQdlVLWtmQWN79TCOa5KuWv6oWk4FiAIKBRUeUh
 rusmTPONu9x+a2p1hAbZPB/629eJmdsTcC9qQGncItb9dYEt+FNRqHDmKW/WBobypQbMjsEONaIRd
 yBOYttFg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41072 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uRH2q-0004H6-0U;
 Mon, 16 Jun 2025 22:07:08 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uRH2B-004UyS-Ch; Mon, 16 Jun 2025 22:06:27 +0100
In-Reply-To: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uRH2B-004UyS-Ch@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 22:06:27 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/4] net: stmmac: visconti: clean up
	code formatting
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

Ensure that code is wrapped prior to column 80, and shorten the
needlessly long "clk_sel_val" to just "clk_sel".

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 35 +++++++++++--------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index c2aaac4a5ac1..db82b522c248 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -57,20 +57,20 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 					phy_interface_t interface, int speed)
 {
 	struct visconti_eth *dwmac = bsp_priv;
-	unsigned int val, clk_sel_val = 0;
+	unsigned int val, clk_sel = 0;
 
 	if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII) {
 		switch (speed) {
 		case SPEED_1000:
-			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_125M;
+			clk_sel = ETHER_CLK_SEL_FREQ_SEL_125M;
 			break;
 
 		case SPEED_100:
-			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_25M;
+			clk_sel = ETHER_CLK_SEL_FREQ_SEL_25M;
 			break;
 
 		case SPEED_10:
-			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_2P5M;
+			clk_sel = ETHER_CLK_SEL_FREQ_SEL_2P5M;
 			break;
 
 		default:
@@ -79,12 +79,13 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 		/* Stop internal clock */
 		val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
-		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
+		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN |
+			 ETHER_CLK_SEL_RX_TX_CLK_EN);
 		val |= ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 		/* Set Clock-Mux, Start clock, Set TX_O direction */
-		val = clk_sel_val | ETHER_CLK_SEL_RX_CLK_EXT_SEL_RXC;
+		val = clk_sel | ETHER_CLK_SEL_RX_CLK_EXT_SEL_RXC;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 		val |= ETHER_CLK_SEL_RX_TX_CLK_EN;
@@ -95,11 +96,11 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	} else if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII) {
 		switch (speed) {
 		case SPEED_100:
-			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_2;
+			clk_sel = ETHER_CLK_SEL_DIV_SEL_2;
 			break;
 
 		case SPEED_10:
-			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_20;
+			clk_sel = ETHER_CLK_SEL_DIV_SEL_20;
 			break;
 
 		default:
@@ -108,14 +109,16 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 		/* Stop internal clock */
 		val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
-		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
+		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN |
+			 ETHER_CLK_SEL_RX_TX_CLK_EN);
 		val |= ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 		/* Set Clock-Mux, Start clock, Set TX_O direction */
-		val = clk_sel_val | ETHER_CLK_SEL_RX_CLK_EXT_SEL_DIV |
-			ETHER_CLK_SEL_TX_CLK_EXT_SEL_DIV | ETHER_CLK_SEL_TX_O_E_N_IN |
-			ETHER_CLK_SEL_RMII_CLK_SEL_RX_C;
+		val = clk_sel | ETHER_CLK_SEL_RX_CLK_EXT_SEL_DIV |
+		      ETHER_CLK_SEL_TX_CLK_EXT_SEL_DIV |
+		      ETHER_CLK_SEL_TX_O_E_N_IN |
+		      ETHER_CLK_SEL_RMII_CLK_SEL_RX_C;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 		val |= ETHER_CLK_SEL_RMII_CLK_RST;
@@ -126,13 +129,15 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	} else {
 		/* Stop internal clock */
 		val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
-		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
+		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN |
+			 ETHER_CLK_SEL_RX_TX_CLK_EN);
 		val |= ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 		/* Set Clock-Mux, Start clock, Set TX_O direction */
-		val = clk_sel_val | ETHER_CLK_SEL_RX_CLK_EXT_SEL_RXC |
-			ETHER_CLK_SEL_TX_CLK_EXT_SEL_TXC | ETHER_CLK_SEL_TX_O_E_N_IN;
+		val = ETHER_CLK_SEL_RX_CLK_EXT_SEL_RXC |
+		      ETHER_CLK_SEL_TX_CLK_EXT_SEL_TXC |
+		      ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 		val |= ETHER_CLK_SEL_RX_TX_CLK_EN;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
