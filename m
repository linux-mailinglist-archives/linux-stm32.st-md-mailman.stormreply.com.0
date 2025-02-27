Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA1A478DD
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 10:17:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7505C7A83E;
	Thu, 27 Feb 2025 09:17:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25102C7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iWnPECP85hSj80bfwjHgzvvanWg0iFIEd3mo6R2Ssbs=; b=xikXrqHkwfP9GNCfi+BVPe4Nwb
 et0s7E0VCYJN5fG5eKUAMEBzd8HRWpsJWXrejf7FZcFOlaKtEZLJyOZS+U2/bgVFWk3NAQjm8/MSW
 54rMdQbA2MxWIyuyFfMHqwWwXeUI+l3WblBMxYoSqhkWdQ0DUQIoTzZEX+kxOyGOWVojGo+5cqrrl
 6JixAOyo2xnOSx0GGBCY85hdzpsxDGGXHnjczs5SIbxTLziNXdhmC0smmLucsyqu7dYigWX7FmX/n
 41lEkpEbCTnga4KiuigfVyZ3zs7oH6nX25Dhmvnqhppy/NOZKaKUN16AitEd5o9OmvOYkBts1/cRP
 xSsOsYLQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38326 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tna1J-0006e3-2Q;
 Thu, 27 Feb 2025 09:17:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tna0z-0052tN-O1; Thu, 27 Feb 2025 09:17:09 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:17:09 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: meson: switch to
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
index b115b7873cef..07c504d07604 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
@@ -22,9 +22,10 @@ struct meson_dwmac {
 	void __iomem	*reg;
 };
 
-static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+					phy_interface_t interface, int speed)
 {
-	struct meson_dwmac *dwmac = priv;
+	struct meson_dwmac *dwmac = bsp_priv;
 	unsigned int val;
 
 	val = readl(dwmac->reg);
@@ -39,6 +40,8 @@ static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	}
 
 	writel(val, dwmac->reg);
+
+	return 0;
 }
 
 static int meson6_dwmac_probe(struct platform_device *pdev)
@@ -65,7 +68,7 @@ static int meson6_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(dwmac->reg);
 
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->fix_mac_speed = meson6_dwmac_fix_mac_speed;
+	plat_dat->set_clk_tx_rate = meson6_dwmac_set_clk_tx_rate;
 
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
