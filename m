Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F31B0A89ECF
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:58:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B527BC78F81;
	Tue, 15 Apr 2025 12:58:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C09C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NEfpJshR6Sfriowq4GQ0FM8g/G2gger1/qz9A6JvWeQ=; b=vMSvp3kfcZkZz1BBI1ZLsx2tfT
 7koMQYU6EWjS/2Dmh8m1EgqGu64fQqFBJcNy/6JZGVAjtx7Io4xHV51WYbtrj6JbnBYDHRzH8n7Vh
 F6jouX8VpsmmvUQiRJjwraVipM6+fkU1/UpmS6mLxee9XvGmPWcm2+47B7lpsPoYDQynkf0E81g3K
 0HDbnLm1Q4Hf4LnLygsQrUDRWGFIkqKsu9dL2yGacKvx9yI+jZbzGTGUksdnahEXkairEk3FGHtKc
 k4awzckzgPy2T75Y/B5YcGxhTHnRUEBEaCftXaarDf16IYw0uzfuSyqTQrb2Ef3qyQ7ySRJbFOIh8
 au1KZ/SQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52848 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4fs5-0008Bw-1i;
 Tue, 15 Apr 2025 13:58:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4frU-000nMf-6o; Tue, 15 Apr 2025 13:58:00 +0100
In-Reply-To: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
References: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4frU-000nMf-6o@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 13:58:00 +0100
Cc: Eric Dumazet <edumazet@google.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: sunxi: convert to
	set_clk_tx_rate()
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

Convert sunxi to use the set_clk_tx_rate() callback rather than the
fix_mac_speed() callback.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 9f098ff0ff05..a245c223a18f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -72,28 +72,28 @@ static void sun7i_gmac_exit(struct platform_device *pdev, void *priv)
 		regulator_disable(gmac->regulator);
 }
 
-static void sun7i_fix_speed(void *priv, int speed, unsigned int mode)
+static int sun7i_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				 phy_interface_t interface, int speed)
 {
-	struct sunxi_priv_data *gmac = priv;
-
-	/* only GMII mode requires us to reconfigure the clock lines */
-	if (gmac->interface != PHY_INTERFACE_MODE_GMII)
-		return;
-
-	if (gmac->clk_enabled) {
-		clk_disable(gmac->tx_clk);
-		gmac->clk_enabled = 0;
-	}
-	clk_unprepare(gmac->tx_clk);
-
-	if (speed == 1000) {
-		clk_set_rate(gmac->tx_clk, SUN7I_GMAC_GMII_RGMII_RATE);
-		clk_prepare_enable(gmac->tx_clk);
-		gmac->clk_enabled = 1;
-	} else {
-		clk_set_rate(gmac->tx_clk, SUN7I_GMAC_MII_RATE);
-		clk_prepare(gmac->tx_clk);
+	struct sunxi_priv_data *gmac = bsp_priv;
+
+	if (interface == PHY_INTERFACE_MODE_GMII) {
+		if (gmac->clk_enabled) {
+			clk_disable(gmac->tx_clk);
+			gmac->clk_enabled = 0;
+		}
+		clk_unprepare(gmac->tx_clk);
+
+		if (speed == 1000) {
+			clk_set_rate(gmac->tx_clk, SUN7I_GMAC_GMII_RGMII_RATE);
+			clk_prepare_enable(gmac->tx_clk);
+			gmac->clk_enabled = 1;
+		} else {
+			clk_set_rate(gmac->tx_clk, SUN7I_GMAC_MII_RATE);
+			clk_prepare(gmac->tx_clk);
+		}
 	}
+	return 0;
 }
 
 static int sun7i_gmac_probe(struct platform_device *pdev)
@@ -140,7 +140,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun7i_gmac_init;
 	plat_dat->exit = sun7i_gmac_exit;
-	plat_dat->fix_mac_speed = sun7i_fix_speed;
+	plat_dat->set_clk_tx_rate = sun7i_set_clk_tx_rate;
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
