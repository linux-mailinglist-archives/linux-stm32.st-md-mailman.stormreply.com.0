Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAEFADBBAE
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 23:07:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15953C349C6;
	Mon, 16 Jun 2025 21:07:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4C9CC349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5HK7OaVp0TjYPgWKg6AXOdVH8aRtHfxReV5dlUnGC6E=; b=Tk68rq9H+KaChngKJ0QD67osy4
 w9KFNxZ0Feeh9u2QD7iIna981ocDOaw9iFpFjEdWP4V4k4r7ip4RvL/yZVyQ2PjhHyQQDBsxCrGB/
 LQt+zg0qC3skTIdkitvQ+GMhU8kY0C3Zhp+walESCi5gdGLOkX5oZcdS/rZZUnqBnn4Dl1ksHPsBS
 54QxSg/yxnECwJBfUa7ddFYA9SXyKgCZOe4FcoTKcEzHDyN30HAF86FP0RI/CNZJ8vH5GEPwpcZZp
 sXOGkbEH3nhSlzPdtL5Zf9E/2q82tJvc7DnteekFeE/f+0ALDMUfqPHmBuuo1J5h54tOAua+F5jCF
 TU4TM/XA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43774 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uRH2f-0004Ge-1b;
 Mon, 16 Jun 2025 22:06:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uRH21-004UyG-50; Mon, 16 Jun 2025 22:06:17 +0100
In-Reply-To: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uRH21-004UyG-50@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 22:06:17 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/4] net: stmmac: visconti:
	re-arrange speed decode
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

Re-arrange the speed decode in visconti_eth_set_clk_tx_rate() to be
more readable by first checking to see if we're using RGMII or RMII
and then decoding the speed, rather than decoding the speed and then
testing the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 44 +++++++++++--------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index 5e6ac82a89b9..ef86f9dce791 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -57,30 +57,38 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 					phy_interface_t interface, int speed)
 {
 	struct visconti_eth *dwmac = bsp_priv;
-	struct net_device *netdev = dev_get_drvdata(dwmac->dev);
 	unsigned int val, clk_sel_val = 0;
 
-	switch (speed) {
-	case SPEED_1000:
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII)
+	if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII) {
+		switch (speed) {
+		case SPEED_1000:
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_125M;
-		break;
-	case SPEED_100:
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII)
+			break;
+
+		case SPEED_100:
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_25M;
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII)
-			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_2;
-		break;
-	case SPEED_10:
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII)
+			break;
+
+		case SPEED_10:
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_2P5M;
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII)
+			break;
+
+		default:
+			return -EINVAL;
+		}
+	} else if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII) {
+		switch (speed) {
+		case SPEED_100:
+			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_2;
+			break;
+
+		case SPEED_10:
 			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_20;
-		break;
-	default:
-		/* No bit control */
-		netdev_err(netdev, "Unsupported speed request (%d)", speed);
-		return -EINVAL;
+			break;
+
+		default:
+			return -EINVAL;
+		}
 	}
 
 	/* Stop internal clock */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
