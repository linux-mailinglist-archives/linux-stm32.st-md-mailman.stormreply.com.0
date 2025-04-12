Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F0A86BC9
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 10:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FBD2C78F77;
	Sat, 12 Apr 2025 08:09:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41888C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 08:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQd32sdl+fRSmh8Brlhe3sM7lTnHOxR88TKi6LoNcBY=; b=XBA4nphcVi0vDEM8VQlVZsSdNy
 qeU9eE/20ys3vrLwYFoPkTFzAneVQLJKkNj8ihpugQ3fMRNWvCfhCXyOO6lgJN71jujHKHkcC8evB
 pME2Jb14yY66oryPThM4GBYbF6fUhmgYLLpQLvCCol16gtvBmxg5YVbbiY+OvfdJ+MVdVPlGgzv8D
 oWOCq8mjoZaPmdPRZ7b+fYeuc59YZi2F7NLhAUCo8uHtUCAlXOtBBunKQaVBybfw6aTE3wdw2f+Tj
 CS7U77c7TjC/pHl0T6TpFLy1tLJTT+MYSTtxqR+OmR+G+/FnvBAdkZM9UzBZI4rFqmyJrbaxiL78d
 YctzxBdw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42092 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u3VvR-0004MK-1A;
 Sat, 12 Apr 2025 09:09:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u3Vuq-000E7s-5Y; Sat, 12 Apr 2025 09:08:40 +0100
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u3Vuq-000E7s-5Y@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 09:08:40 +0100
Cc: Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/5] net: stmmac: intel-plat:
 remove eee_usecs_rate and hardware write
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

Remove the write to GMAC_1US_TIC_COUNTER for two reasons:

1. during initialisation or reinitialisation of the DWMAC core, the
   core is reset, which sets this register back to its default value.
   Writing it prior to stmmac_dvr_probe() has no effect.

2. Since commit 8efbdbfa9938 ("net: stmmac: Initialize
   MAC_ONEUS_TIC_COUNTER register"), GMAC4/5 core code will set
   this register based on the rate of plat->stmmac_clk. This clock
   is fetched by devm_stmmac_probe_config_dt(), and plat->clk_ptp_rate
   will be set to its rate profided a "ptp_ref" clock is not provided.
   In any case, Marek's commit will set the effectual value of this
   register.

Therefore, dwmac-intel-plat.c writing GMAC_1US_TIC_COUNTER serves no
useful purpose and can be removed.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 599def7b3a64..4ea7b0a803d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -113,16 +113,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 
 	plat_dat->clk_tx_i = dwmac->tx_clk;
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
-
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
-
-	if (plat_dat->eee_usecs_rate > 0) {
-		u32 tx_lpi_usec;
-
-		tx_lpi_usec = (plat_dat->eee_usecs_rate / 1000000) - 1;
-		writel(tx_lpi_usec, stmmac_res.addr + GMAC_1US_TIC_COUNTER);
-	}
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
