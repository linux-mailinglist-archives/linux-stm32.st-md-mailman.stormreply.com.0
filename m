Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E27E9A478D8
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 10:17:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2D44C7A83E;
	Thu, 27 Feb 2025 09:17:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CCA1C7A843
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ar9U8vywYkCzFOSigD5N+dM7En/CQg4G4NArSWcUyqA=; b=Fswkmnpdej517Pxe4qm3+867fC
 YjMWTko7DumqM0dYbTHSfmWUvEsMMwez+VmXNT0H724SaEjJ0i5QF0Z+Wk534JzumAZrFDAFJ+n4p
 7ndEDI1ssF+PcDmbutDyLrenDuiDRU17oyV10mibL6i8amtVllQ2e5odagkGof/eqzAfUkmHdZ+7J
 WwwBUoL6/+JPphc8TC5kV4D7pDGPS8IqVwjlL92vT6ethTUizdoH3JV9WGZqb6c48ClSDKcwHMbFh
 fnFa3/21IFQnpP1b1LtsPiETuPucc1ULQKZ/HYyb4ja2jFP6G7pNm+CKDOsrAdqMCRCyQX5HylAsQ
 WljGscJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38772 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tna19-0006dT-1c;
 Thu, 27 Feb 2025 09:17:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tna0p-0052t8-Gn; Thu, 27 Feb 2025 09:16:59 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tna0p-0052t8-Gn@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:16:59 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: rk: switch to use
 set_clk_tx_rate() hook
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 83d104a274c5..003fa5cf42c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1920,9 +1920,10 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	gmac_clk_enable(gmac, false);
 }
 
-static void rk_fix_speed(void *priv, int speed, unsigned int mode)
+static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
+			      phy_interface_t interface, int speed)
 {
-	struct rk_priv_data *bsp_priv = priv;
+	struct rk_priv_data *bsp_priv = bsp_priv_;
 	struct device *dev = &bsp_priv->pdev->dev;
 
 	switch (bsp_priv->phy_iface) {
@@ -1940,6 +1941,8 @@ static void rk_fix_speed(void *priv, int speed, unsigned int mode)
 	default:
 		dev_err(dev, "unsupported interface %d", bsp_priv->phy_iface);
 	}
+
+	return 0;
 }
 
 static int rk_gmac_probe(struct platform_device *pdev)
@@ -1968,7 +1971,8 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	 */
 	if (!plat_dat->has_gmac4)
 		plat_dat->has_gmac = true;
-	plat_dat->fix_mac_speed = rk_fix_speed;
+
+	plat_dat->set_clk_tx_rate = rk_set_clk_tx_rate;
 
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
 	if (IS_ERR(plat_dat->bsp_priv))
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
