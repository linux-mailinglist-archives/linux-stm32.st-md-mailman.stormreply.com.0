Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4E1AD769A
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 17:41:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA673C32E8E;
	Thu, 12 Jun 2025 15:41:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDD4BC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U8OnpIVRMDsCvWvEU627B7xFOFqUm/Prfg2szCnr5fc=; b=GrvY1SOCPxPv97W26JYreUrBFT
 GnkuxBm7nYyHeUfamWkF81FFBqf6p2jGGsjkbk7zbJgaFcplaCsNn7z9Z8IdCG9gQ6AUABI65UUER
 oMCowzW5X0+H4rcfduxN+0ijLU+8bkB9AY0KdRNWowMsOeAbV97zhHBQeGN5PM5lUlMZIqYdOhhwE
 YnUQz48g2qTMgeX6V5hRFIM+WpXMPFWVYpTJmxSKDWqt0cPbb2I7wOyKgn52wolYjbXwYJJgFQRbC
 hDq9M9wOm6Ke9xtrmDNafvMwQ2SJZ5MjK4UZHLNnowMEEIzRAZ8GWM3HsxYSo1Ga5sjMwSek9h54E
 CzC5CaVA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42644 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uPk3s-00084s-1R;
 Thu, 12 Jun 2025 16:41:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uPk3E-004CFl-BZ; Thu, 12 Jun 2025 16:41:12 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uPk3E-004CFl-BZ@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:41:12 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 7/9] net: stmmac: rk: simplify
	px30_set_rmii_speed()
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

px30_set_rmii_speed() doesn't need to be as verbose as it is - it
merely needs the values for the register and clock rate which depend
on the speed, and then call the appropriate functions. Rewrite the
function to make it so.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8ad6b3b0e282..72f2b80bf3bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -250,6 +250,8 @@ static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
+	unsigned int con1;
+	long rate;
 	int ret;
 
 	if (!clk_mac_speed) {
@@ -258,25 +260,22 @@ static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 	}
 
 	if (speed == 10) {
-		regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1,
-			     PX30_GMAC_SPEED_10M);
-
-		ret = clk_set_rate(clk_mac_speed, 2500000);
-		if (ret)
-			dev_err(dev, "%s: set clk_mac_speed rate 2500000 failed: %d\n",
-				__func__, ret);
+		con1 = PX30_GMAC_SPEED_10M;
+		rate = 2500000;
 	} else if (speed == 100) {
-		regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1,
-			     PX30_GMAC_SPEED_100M);
-
-		ret = clk_set_rate(clk_mac_speed, 25000000);
-		if (ret)
-			dev_err(dev, "%s: set clk_mac_speed rate 25000000 failed: %d\n",
-				__func__, ret);
-
+		con1 = PX30_GMAC_SPEED_100M;
+		rate = 25000000;
 	} else {
 		dev_err(dev, "unknown speed value for RMII! speed=%d", speed);
+		return;
 	}
+
+	regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1, con1);
+
+	ret = clk_set_rate(clk_mac_speed, rate);
+	if (ret)
+		dev_err(dev, "%s: set clk_mac_speed rate %ld failed: %d\n",
+			__func__, rate, ret);
 }
 
 static const struct rk_gmac_ops px30_ops = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
