Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57332B1E8EF
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Aug 2025 15:10:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31628C3F952;
	Fri,  8 Aug 2025 13:10:05 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDD95C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 13:10:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 656F5A556D0;
 Fri,  8 Aug 2025 13:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BAAC4CEED;
 Fri,  8 Aug 2025 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754658602;
 bh=Ry/5UI73pZtdPKEskqZzyPIwhQo+s64pnx0FlVxe0dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFOwBdRshhFKDGtm6ZJNi50fc33bSOPHC1hQMCtSk20p3W1WQd2f4JcdQCjINzeXX
 Dh3LLcw/aZAB8B849z6ypCLJC4025T1Ko/yKIXpt7bXG6W2MJOaHAaCF+qy7X3Gcua
 2YoqTry90teKprfUWIlirzavBwIxyfTD2LIU5sE6UP+lTuOciJzRkcrg4OKNV+YqFu
 2uMdlNe3iQ0VjaZJcTxh+vIyCFc9FtIQoJQeIPYsQ1oUpSHav9HCfMMMQBLI76a+M7
 sut8kVIa4+QLyekrP1S06cNVMJKu58YlBl8ZNSRi5s30vx9DMof01qfsaJFJPniV+U
 MFGC2fdQ/1xmw==
Date: Fri, 8 Aug 2025 14:09:57 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250808130957.GB1705@horms.kernel.org>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
 <20250807183359.GO61519@horms.kernel.org>
 <aJT7QTzT_AHmkS6H@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJT7QTzT_AHmkS6H@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: rk: put the PHY clock on
	remove
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

On Thu, Aug 07, 2025 at 08:15:13PM +0100, Russell King (Oracle) wrote:
> On Thu, Aug 07, 2025 at 07:33:59PM +0100, Simon Horman wrote:
> > On Thu, Aug 07, 2025 at 09:48:30AM +0100, Russell King (Oracle) wrote:
> > > The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> > > doesn't take part in the devm release. Therefore, when a device is
> > > unbound, this clock needs to be explicitly put. Fix this.
> > > 
> > > Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > > Spotted this resource leak while making other changes to dwmac-rk.
> > > Would be great if the dwmac-rk maintainers can test it.
> > > 
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > index 79b92130a03f..4a315c87c4d0 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > @@ -1770,6 +1770,9 @@ static void rk_gmac_remove(struct platform_device *pdev)
> > >  	stmmac_dvr_remove(&pdev->dev);
> > >  
> > >  	rk_gmac_powerdown(bsp_priv);
> > > +
> > > +	if (plat->phy_node && bsp_priv->integrated_phy)
> > > +		clk_put(bsp_priv->clk_phy);
> > 
> > Hi Russell,
> > 
> > Something seems a little off here.
> > I don't see plat in this context in net.
> 
> Already have a fix for it, thanks anyway. Today ended up going awol
> due to dentistry stuff. :(

Thanks, I see the fix now.
Hope your AFK mission went well.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
