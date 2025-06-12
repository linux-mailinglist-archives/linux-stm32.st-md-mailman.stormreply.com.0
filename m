Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D460AD769B
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 17:42:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5FCEC32E8E;
	Thu, 12 Jun 2025 15:42:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43FF4C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wY+eCXCVGTGusBEHAW8kNT7MMSIsV/Ri13PvFprdNrs=; b=OV8rgJAQ3GWl2LTl5+MvARs5fR
 BOahYIV+iOvroz3UMVYgttPq3H7tRCaejfazD/tLSZ3LHh8cLDX3G7BZUwYe9lYtpYz0eJj6qc2Qs
 kZpMs3SmnIhAVSvSlhglCmpvZpKnI2nz12fuQjC4JA5npMds7lnQHavJ40t9oGfJXMd6Wayrj2F0J
 DV48SGaSrVeQMxNisJoocWj8csYtvKjWDOj8drh7ogoizfgB7DTVeURL/pFRtDT3kFkm33rQVoDJx
 s/yQoZWExy8KKMkzXCx4aZXIGLlNG2q6xvCxji7vz7GStAS9axu1iuyvsp+IOLPGIJlp42b0iMmhy
 YlSxP0zA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42652 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uPk3x-000858-1w;
 Thu, 12 Jun 2025 16:41:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uPk3J-004CFr-FE; Thu, 12 Jun 2025 16:41:17 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uPk3J-004CFr-FE@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:41:17 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 8/9] net: stmmac: rk: convert
 px30_set_rmii_speed() to .set_speed()
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

Convert px30_set_rmii_speed() to use the common .set_speed() method,
which eliminates another user of the older .set_*_speed() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 72f2b80bf3bb..7cdb09037da0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -246,17 +246,17 @@ static void px30_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     PX30_GMAC_PHY_INTF_SEL_RMII);
 }
 
-static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
+static int px30_set_speed(struct rk_priv_data *bsp_priv,
+			  phy_interface_t interface, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
 	unsigned int con1;
 	long rate;
-	int ret;
 
 	if (!clk_mac_speed) {
 		dev_err(dev, "%s: Missing clk_mac_speed clock\n", __func__);
-		return;
+		return -EINVAL;
 	}
 
 	if (speed == 10) {
@@ -267,20 +267,17 @@ static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 		rate = 25000000;
 	} else {
 		dev_err(dev, "unknown speed value for RMII! speed=%d", speed);
-		return;
+		return -EINVAL;
 	}
 
 	regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1, con1);
 
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed: %d\n",
-			__func__, rate, ret);
+	return clk_set_rate(clk_mac_speed, rate);
 }
 
 static const struct rk_gmac_ops px30_ops = {
 	.set_to_rmii = px30_set_to_rmii,
-	.set_rmii_speed = px30_set_rmii_speed,
+	.set_speed = px30_set_speed,
 };
 
 #define RK3128_GRF_MAC_CON0	0x0168
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
