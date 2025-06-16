Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027DADAD29
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 12:16:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA84EC36B17;
	Mon, 16 Jun 2025 10:16:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2E96C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i+lsTaU7RwEBcehbNbGo3qJpxDvpz1hEP91DuwXf27E=; b=Sb8NJi1j1wgs7rxo26V4o5kf62
 XTTZPvRGMz8tmy+BNl0LNU+jR41N5229OcAza2loD1++lP9ssFHKFKoPo9cDBCiODeDUmT6v5TXD7
 RC1cClZmi45lb0pQQ85lQCmL/i72Lr91HkhgbwPwuh877xuPG9+bLXjk3DWadQJ+MeIivlXl74mO+
 4SQH2H/FxhwF+SY0++A9sHDFgaOdaLCzRiDGSnNWszpUByb9OLJqurxK0f4Ci76vWyo3jAaVwZiFy
 zWs9xxah18W+hXTLSPeCrKVJ+U0Qh7yttPkRDFPP3WOTujyjTlC9uroa2TjWwXzgRFfHCKt/VGEQF
 NxtcwG0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50820 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uR6tO-0003aw-14;
 Mon, 16 Jun 2025 11:16:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uR6sj-004Ku5-HR; Mon, 16 Jun 2025 11:16:01 +0100
In-Reply-To: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uR6sj-004Ku5-HR@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 11:16:01 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: rk: remove
	unnecessary clk_mac
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

The stmmac platform code already gets the "stmmaceth" clock, so there
is no need for drivers to get it. Use the stored pointer in struct
plat_stmmacenet_data instead of getting and storing our own pointer.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7ee101a6cfcf..79b92130a03f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -80,7 +80,6 @@ struct rk_priv_data {
 
 	struct clk_bulk_data *clks;
 	int num_clks;
-	struct clk *clk_mac;
 	struct clk *clk_phy;
 
 	struct reset_control *phy_reset;
@@ -1408,16 +1407,10 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
-	/* "stmmaceth" will be enabled by the core */
-	bsp_priv->clk_mac = devm_clk_get(dev, "stmmaceth");
-	ret = PTR_ERR_OR_ZERO(bsp_priv->clk_mac);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot get stmmaceth clock\n");
-
 	if (bsp_priv->clock_input) {
 		dev_info(dev, "clock input from PHY\n");
 	} else if (phy_iface == PHY_INTERFACE_MODE_RMII) {
-		clk_set_rate(bsp_priv->clk_mac, 50000000);
+		clk_set_rate(plat->stmmac_clk, 50000000);
 	}
 
 	if (plat->phy_node && bsp_priv->integrated_phy) {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
