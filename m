Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 859059D00A1
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Nov 2024 20:23:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34344C78036;
	Sat, 16 Nov 2024 19:23:17 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E472AC7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Nov 2024 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=dn+2cDfRC1yH4NOcw8ysKYN7T3VzTAsD6jJX6tRQuE0=; b=gdRfOcvTKwxKkLKP+bQtMsvxeP
 Zcxq1PDSbPRXkd6PvRH478+Xa11lrRN3cdrqac8/EN9m0pGru+9CaGqImJwB9y2vem4kTJ9INuRjQ
 3BNTlCTAlH6WrvWOK3XO5BHaKsjGnmQlg/tFjALWn9OFuc6IOvE4cK8R+h+z/XuTo7NM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tCONh-00DXYh-Cb; Sat, 16 Nov 2024 20:22:53 +0100
Date: Sat, 16 Nov 2024 20:22:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Parker Newman <parker@finest.io>
Message-ID: <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241115135940.5f898781.parker@finest.io>
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

On Fri, Nov 15, 2024 at 01:59:40PM -0500, Parker Newman wrote:
> On Fri, 15 Nov 2024 18:17:07 +0100
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
> > On 11/15/24 17:31, Parker Newman wrote:
> > > From: Parker Newman <pnewman@connecttech.com>
> > >
> > > Read the iommu stream id from device tree rather than hard coding to mgbe0.
> > > Fixes kernel panics when using mgbe controllers other than mgbe0.
> >
> > It's better to include the full Oops backtrace, possibly decoded.
> >
> 
> Will do, there are many different ones but I can add the most common.
> 
> > > Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.
> >
> > Since this looks like a fix, you should include a suitable 'Fixes' tag
> > here, and specify the 'net' target tree in the subj prefix.
> >
> 
> Sorry I missed the "net" tag.
> 
> The bug has existed since dwmac-tegra.c was added. I can add a Fixes tag but
> in the past I was told they aren't needed in that situation?
> 
> > > @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(mgbe->xpcs))
> > >  		return PTR_ERR(mgbe->xpcs);
> > >
> > > +	/* get controller's stream id from iommu property in device tree */
> > > +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> > > +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> > > +		return -EINVAL;
> > > +	}
> >
> > I *think* it would be better to fallback (possibly with a warning or
> > notice) to the previous default value when the device tree property is
> > not available, to avoid regressions.
> >
> 
> I debated this as well... In theory the iommu must be setup for the
> mgbe controller to work anyways. Doing it this way means the worst case is
> probe() fails and you lose an ethernet port.

New DT properties are always optional. Take the example of a board
only using a single controller. It should happily work. It probably
does not have this property because it is not needed. Your change is
likely to cause a regression on such a board.

Also, is a binding patch needed?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
