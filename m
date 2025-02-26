Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14503A45F7E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 13:40:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9689C7A831;
	Wed, 26 Feb 2025 12:40:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3729C7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 12:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jY/bwN9A5xa9iSopLwyTQOxIV4QgdsLsdC4BTyAYt0s=; b=qeMkGQ3y0EikusQ5iHd4bfTahQ
 VIXzKqFJ8IuD3zi7Bds5zQxg6xqFWF1UTAxmGM5ZFoaZpFhfGgwlOywV9EthV0Aw1BXHUkvLrNKAV
 rmcVXqxqtO4SQUrZ2YNITE4q9QJqb2A+zRm77pMqU3169CUNZCcoFYmCGRod2yFDfu8ydaJ+NHk6a
 jQVGp+KrPPtvH8pDfAlr5i1MHou26K+PWMKnf+fbN40ZHh1D6KN9GJhwEUQ0jmwijbhhKS9UAj/h4
 +kZw30OqsrDFWVsqH1MK6fFHR/ZAS5ERJK8l/v+NOP86YirCEDQ51wEXwnGxoIjp/dfaT3PbslIWO
 IdQ4fMHQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32848)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnGi8-0004Ez-2J;
 Wed, 26 Feb 2025 12:40:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnGi5-000766-0H;
 Wed, 26 Feb 2025 12:40:21 +0000
Date: Wed, 26 Feb 2025 12:40:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <Z78LtBo2lfTGG-9o@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
 <n67c4bq7n7ejakmqmglve3os6vqvm57umysjjzexxkygvusnoo@ndee4gfnmsst>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <n67c4bq7n7ejakmqmglve3os6vqvm57umysjjzexxkygvusnoo@ndee4gfnmsst>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: intel: use
 generic stmmac_set_clk_tx_rate()
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

On Tue, Feb 25, 2025 at 09:46:56PM +0100, Thierry Reding wrote:
> On Tue, Feb 18, 2025 at 11:15:05AM +0000, Russell King (Oracle) wrote:
> > Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> > clock.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
> >  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> This isn't quite the same code, but the result should be the same since
> clk_set_rate() will be ignored if the clock is NULL, which would be the
> case for !dwmac->data->tx_clk_en.

You're right, thanks for spotting! I'll move it out of the if()
statement so the code has the exact same behaviour. Replacement patch
below.

> Reviewed-by: Thierry Reding <treding@nvidia.com>

Thanks for the review.

8<====
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()

Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
clock.

Note that given the current unpatched driver structure,
plat_dat->fix_mac_speed will always be populated with
kmb_eth_fix_mac_speed(), even when no clock is present. We preserve
this behaviour in this patch by always initialising plat_dat->clk_tx_i
and plat_dat->set_clk_tx_rate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 0591756a2100..599def7b3a64 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -22,31 +22,12 @@ struct intel_dwmac {
 };
 
 struct intel_dwmac_data {
-	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 	unsigned long ptp_ref_clk_rate;
 	unsigned long tx_clk_rate;
 	bool tx_clk_en;
 };
 
-static void kmb_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
-{
-	struct intel_dwmac *dwmac = priv;
-	long rate;
-	int ret;
-
-	rate = rgmii_clock(speed);
-	if (rate < 0) {
-		dev_err(dwmac->dev, "Invalid speed\n");
-		return;
-	}
-
-	ret = clk_set_rate(dwmac->tx_clk, rate);
-	if (ret)
-		dev_err(dwmac->dev, "Failed to configure tx clock rate\n");
-}
-
 static const struct intel_dwmac_data kmb_data = {
-	.fix_mac_speed = kmb_eth_fix_mac_speed,
 	.ptp_ref_clk_rate = 200000000,
 	.tx_clk_rate = 125000000,
 	.tx_clk_en = true,
@@ -89,8 +70,6 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	 * platform_match().
 	 */
 	dwmac->data = device_get_match_data(&pdev->dev);
-	if (dwmac->data->fix_mac_speed)
-		plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
 
 	/* Enable TX clock */
 	if (dwmac->data->tx_clk_en) {
@@ -132,6 +111,9 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 		}
 	}
 
+	plat_dat->clk_tx_i = dwmac->tx_clk;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
 
-- 
2.30.2


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
