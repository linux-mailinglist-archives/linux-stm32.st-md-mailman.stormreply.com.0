Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB764AD7696
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 17:41:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E29C32E8E;
	Thu, 12 Jun 2025 15:41:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A76F3C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=64CpcFM6H4Vg52rc57aO+fncDZ9t6GSrZTLajMibm0A=; b=GdOcwzr1kJJxKsUOvBySQ2rKLK
 3jOiO26DYmylhL3sbABgwpnvvuxsqzd+zT/lhEr1ftyIaSx0HUA16mMV1ek2b1olV3RomKEF/6LfU
 xZv3fIAdSPLjVLJY73nnx4L+RAydUbE9X7UITyN6FCVf4OpWEsnrU1NRPaY3et3dAAQh03fmQKJHe
 wfRlt6hqi3/aGDhKXI9ThEDO6Yext49HvEJDh43CvFNO13+GlTlgbqR4qD4GemX4Y5SH933nnrDwT
 plg61K4WUgFU9rrvqxbRg2Q2jB+hpe+P6Nm6ONvBSxlKDqEhkTxfHo/zxYAD13D9xL6vikBYNbvly
 8KXBzgtw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38864 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uPk3d-000846-18;
 Thu, 12 Jun 2025 16:41:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uPk2z-004CFT-0e; Thu, 12 Jun 2025 16:40:57 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uPk2z-004CFT-0e@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:40:57 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/9] net: stmmac: rk: combine rv1126
 set_*_speed() methods
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

Just like rk3568, there is no need to have separate RGMII and RMII
methods to set clk_mac_speed() as rgmii_clock() can be used to return
the clock rate for both RGMII and RMII interface modes. Combine these
two methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 +++----------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7b5e989bb77f..c7b64f0a2931 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1496,7 +1496,7 @@ static void rv1126_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     RV1126_GMAC_PHY_INTF_SEL_RMII);
 }
 
-static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
+static void rv1126_set_clk_mac_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
@@ -1505,32 +1505,7 @@ static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate < 0) {
-		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
-		return;
-	}
-
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
-			__func__, rate, ret);
-}
-
-static void rv1126_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
-{
-	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
-	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
-	int ret;
-
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	default:
-		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
+		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
 		return;
 	}
 
@@ -1543,8 +1518,8 @@ static void rv1126_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 static const struct rk_gmac_ops rv1126_ops = {
 	.set_to_rgmii = rv1126_set_to_rgmii,
 	.set_to_rmii = rv1126_set_to_rmii,
-	.set_rgmii_speed = rv1126_set_rgmii_speed,
-	.set_rmii_speed = rv1126_set_rmii_speed,
+	.set_rgmii_speed = rv1126_set_clk_mac_speed,
+	.set_rmii_speed = rv1126_set_clk_mac_speed,
 };
 
 static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
