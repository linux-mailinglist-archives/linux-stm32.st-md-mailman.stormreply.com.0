Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E11DAAD70AC
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 14:45:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93088C32E8E;
	Thu, 12 Jun 2025 12:45:26 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5835C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=23ZG+xJSw4YpAjmPdytqobZOImtcUHEUQlR+e/rQiqI=; b=NTn8e+6gKdA3pIbp0py+2v72Mi
 jTjyRpKf6fLT7hpmfyodEh7uknxaaSBFccw61FIxbUPhz5+05UVGkAbKoa1uQSYbW6UgkBo85/L0G
 /9F7l5826yfE8XQr3N0hpst+Fk8xhcwYnifPsU5AelPsi2sImXP76Bh/wrAOgikqSthw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uPhIv-00FXUq-UD; Thu, 12 Jun 2025 14:45:13 +0200
Date: Thu, 12 Jun 2025 14:45:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <353f4fd1-5081-48f4-84fd-ff58f2ba1698@lunn.ch>
References: <20250612062032.293275-1-jonathanh@nvidia.com>
 <aEqyrWDPykceDM2x@a5393a930297>
 <85e27a26-b115-49aa-8e23-963bff11f3f6@lunn.ch>
 <e720596d-6fbb-40a4-9567-e8d05755cf6f@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e720596d-6fbb-40a4-9567-e8d05755cf6f@nvidia.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Alexis Lothorrr <alexis.lothore@bootlin.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix PTP ref clock for
	Tegra234
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

On Thu, Jun 12, 2025 at 01:26:55PM +0100, Jon Hunter wrote:
> 
> On 12/06/2025 13:10, Andrew Lunn wrote:
> > On Thu, Jun 12, 2025 at 10:57:49AM +0000, Subbaraya Sundeep wrote:
> > > Hi,
> > > 
> > > On 2025-06-12 at 06:20:32, Jon Hunter (jonathanh@nvidia.com) wrote:
> > > > Since commit 030ce919e114 ("net: stmmac: make sure that ptp_rate is not
> > > > 0 before configuring timestamping") was added the following error is
> > > > observed on Tegra234:
> > > > 
> > > >   ERR KERN tegra-mgbe 6800000.ethernet eth0: Invalid PTP clock rate
> > > >   WARNING KERN tegra-mgbe 6800000.ethernet eth0: PTP init failed
> > > > 
> > > > It turns out that the Tegra234 device-tree binding defines the PTP ref
> > > > clock name as 'ptp-ref' and not 'ptp_ref' and the above commit now
> > > > exposes this and that the PTP clock is not configured correctly.
> > > > 
> > > > Ideally, we would rename the PTP ref clock for Tegra234 to fix this but
> > > > this will break backward compatibility with existing device-tree blobs.
> > > > Therefore, fix this by using the name 'ptp-ref' for devices that are
> > > > compatible with 'nvidia,tegra234-mgbe'.
> > 
> > > AFAIU for Tegra234 device from the beginning, entry in dts is ptp-ref.
> > > Since driver is looking for ptp_ref it is getting 0 hence the crash
> > > and after the commit 030ce919e114 result is Invalid error instead of crash.
> > > For me PTP is not working for Tegra234 from day 1 so why to bother about
> > > backward compatibility and instead fix dts.
> > > Please help me understand it has been years I worked on dts.
> > 
> > Please could you expand on that, because when i look at the code....
> > 
> > 
> >    	/* Fall-back to main clock in case of no PTP ref is passed */
> >   	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> >    	if (IS_ERR(plat->clk_ptp_ref)) {
> >    		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
> >    		plat->clk_ptp_ref = NULL;
> > 
> > if the ptp_ref does not exist, it falls back to stmmac_clk. Why would
> > that cause a crash?
> >  > While i agree if this never worked, we can ignore backwards
> > compatibility and just fix the DT, but i would like a fuller
> > explanation why the fallback is not sufficient to prevent a crash.
> 
> The problem is that in the 'ptp-ref' clock name is also defined in the
> 'mgbe_clks' array in dwmac-tegra.c driver. All of these clocks are requested
> and enabled using the clk_bulk_xxx APIs and so I don't see how we can simply
> fix this now without breaking support for older device-trees.

So you can definitively say, PTP does actually work? You have ptp4l
running with older kernels and DT blob, and it has sync to a grand
master?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
