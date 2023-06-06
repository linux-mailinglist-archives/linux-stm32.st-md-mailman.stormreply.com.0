Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D14F2723FA4
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 12:34:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FE78C65E70;
	Tue,  6 Jun 2023 10:34:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3BC5C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YGQ2Bv3kGFq35R0tej3M/wC9jHmJwxihT/B4NZfZ6TU=; b=v4NYY2xYaGVu/ck2Y1Dcz7cNlc
 kV6ccR1w7wZ3zHyk7wNy8kFVl5L4IIb0H4cpNfOiVIo/yU2KogUbuTzaEpN6ZEkmposQ4kTBWDq6f
 yLft8IBYY/FrKMu9YP7ZrITAmtia2J9XFMyO3bKIgbrGCc9EScU7B7ptUlBIzU76Jlc2rGulSriAU
 3HuaJAcFIfg3/rbY4094CvBiFtIbCN2lmd9gbgrnA49PlxaJU896mPtv45lWuNrw+YUI8Q7FyufUq
 Aqqn44QWzzJd3rl+StV2V9GClQwAZ2JyYJ4klpqfNN+Gz5jorCjlDTAuJ2owExjdWuwCLJzNRMySC
 gdMujS4g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54368)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q6U1X-0005U2-8c; Tue, 06 Jun 2023 11:34:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q6U1U-00073a-73; Tue, 06 Jun 2023 11:34:44 +0100
Date: Tue, 6 Jun 2023 11:34:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <ZH8LxGIvHd+B1eNm@shell.armlinux.org.uk>
References: <20230606064914.134945-1-maxime.chevallier@bootlin.com>
 <20230606064914.134945-2-maxime.chevallier@bootlin.com>
 <889297a0-88c3-90df-7752-efa00184859@linux-m68k.org>
 <ZH78uGBfeHjI4Cdn@shell.armlinux.org.uk>
 <20230606121311.3cc5aa78@pc-7.home>
 <ZH8JxF+TNuX0C1vC@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZH8JxF+TNuX0C1vC@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: Add PCS_LYNX as
 a dependency for the whole driver
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

On Tue, Jun 06, 2023 at 11:26:12AM +0100, Russell King (Oracle) wrote:
> On Tue, Jun 06, 2023 at 12:13:11PM +0200, Maxime Chevallier wrote:
> > Hello Geert, Russell,
> > 
> > On Tue, 6 Jun 2023 10:30:32 +0100
> > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > 
> > > On Tue, Jun 06, 2023 at 10:29:20AM +0200, Geert Uytterhoeven wrote:
> > > > 	Hi Maxime,
> > > > 
> > > > On Tue, 6 Jun 2023, Maxime Chevallier wrote:  
> > > > > Although pcs_lynx is only used on dwmac_socfpga for now, the cleanup
> > > > > path is in the generic driver, and triggers build issues for other
> > > > > stmmac variants. Make sure we build pcs_lynx in all cases too, as for
> > > > > XPCS.  
> > > > 
> > > > That seems suboptimal to me, as it needlesly increases kernel size for
> > > > people who do not use dwmac_socfpga.  Hence I made an alternative patch:
> > > > https://lore.kernel/org/7b36ac43778b41831debd5c30b5b37d268512195.1686039915.git.geert+renesas@glider.be  
> > > 
> > > A better solution would be to re-architect the removal code so that
> > > whatever creates the PCS is also responsible for removing it.
> > > 
> > > Also, dwmac_socfpga nees to be reorganised anyway, because it calls
> > > stmmac_dvr_probe() which then goes on to call register_netdev(),
> > > publishing the network device, and then after stmmac_dvr_probe(),
> > > further device setup is done. As the basic driver probe flow should
> > > be setup and then publish, the existing code structure violates that.
> > > 
> > 
> > I agree that this solution is definitely suboptimal, I wanted mostly to get it
> > fixed quickly as this breaks other stmmac variants.
> > 
> > Do we still go on with the current patch (as Geert's has issues) and then
> > consider reworking dwmac_socfpga ?
> 
> As Geert himself mentioned, passed on from Arnd:
>   As pointed out by Arnd, this doesn't work when PCS_LYNX is a loadable
>   module and STMMAC is built-in:
>   https://lore.kernel.org/r/11bd37e9-c62e-46ba-9456-8e3b353df28f@app.fastmail.com
> 
> So Geert's solution will just get rid of the build error, but leave the
> Lynx PCS undestroyed. I take Geert's comment as a self-nack on his
> proposed patch.
> 
> The changes are only in net-next at the moment, and we're at -rc5.
> There's probably about 2.5 weeks to get this sorted before the merge
> window opens.
> 
> So, we currently have your suggestion. Here's mine as an immediate
> fix. This doesn't address all the points I've raised, but should
> resolve the immediate issue.
> 
> Untested since I don't have the hardware... (the test build is
> running):
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index e399fccbafe5..239c7e9ed41d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -494,6 +494,17 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void socfpga_dwmac_remove(struct platform_device *pdev)
> +{
> +	struct net_device *ndev = platform_get_drvdata(pdev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	struct phylink_pcs *pcs = priv->hw->lynx_pcs;
> +
> +	stmmac_pltfr_remove(pdev);
> +
> +	lynx_pcs_destroy(pcs);
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int socfpga_dwmac_resume(struct device *dev)
>  {
> @@ -565,7 +576,7 @@ MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
>  
>  static struct platform_driver socfpga_dwmac_driver = {
>  	.probe  = socfpga_dwmac_probe,
> -	.remove_new = stmmac_pltfr_remove,
> +	.remove_new = socfpga_dwmac_remove,
>  	.driver = {
>  		.name           = "socfpga-dwmac",
>  		.pm		= &socfpga_dwmac_pm_ops,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index fa07b0d50b46..1801f8cc8413 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -940,9 +940,6 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  	if (priv->hw->xpcs)
>  		return &priv->hw->xpcs->pcs;
>  
> -	if (priv->hw->lynx_pcs)
> -		return priv->hw->lynx_pcs;
> -

This hunk is completely wrong... but I guess you spotted that anyway.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
