Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FAEAD6FC3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 14:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DB61C32E8E;
	Thu, 12 Jun 2025 12:10:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2758C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=cmVDxvCmu0v4WQ1j07pv65fsLSYRgUeNwxzAs1gLv18=; b=2LIglMtbmSted5mvl3BE2Ec5mp
 huXz6cKG637jVKAjFuK1/mRcmoHROfssZe+Bl4pkoySko4kJABtTL9Xhel+OiyS6fPw8HEavC3/Bs
 yjh+PoVGNeuSGWdSurM7cDRCiSHr7tUNgzLZ2Zrdsq/4/5g3EReD5SLBB5liqSo3bMog=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uPgkw-00FXGb-Sh; Thu, 12 Jun 2025 14:10:06 +0200
Date: Thu, 12 Jun 2025 14:10:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Subbaraya Sundeep <sbhatta@marvell.com>
Message-ID: <85e27a26-b115-49aa-8e23-963bff11f3f6@lunn.ch>
References: <20250612062032.293275-1-jonathanh@nvidia.com>
 <aEqyrWDPykceDM2x@a5393a930297>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEqyrWDPykceDM2x@a5393a930297>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Alexis Lothorrr <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
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

On Thu, Jun 12, 2025 at 10:57:49AM +0000, Subbaraya Sundeep wrote:
> Hi,
> 
> On 2025-06-12 at 06:20:32, Jon Hunter (jonathanh@nvidia.com) wrote:
> > Since commit 030ce919e114 ("net: stmmac: make sure that ptp_rate is not
> > 0 before configuring timestamping") was added the following error is
> > observed on Tegra234:
> > 
> >  ERR KERN tegra-mgbe 6800000.ethernet eth0: Invalid PTP clock rate
> >  WARNING KERN tegra-mgbe 6800000.ethernet eth0: PTP init failed
> > 
> > It turns out that the Tegra234 device-tree binding defines the PTP ref
> > clock name as 'ptp-ref' and not 'ptp_ref' and the above commit now
> > exposes this and that the PTP clock is not configured correctly.
> > 
> > Ideally, we would rename the PTP ref clock for Tegra234 to fix this but
> > this will break backward compatibility with existing device-tree blobs.
> > Therefore, fix this by using the name 'ptp-ref' for devices that are
> > compatible with 'nvidia,tegra234-mgbe'.

> AFAIU for Tegra234 device from the beginning, entry in dts is ptp-ref.
> Since driver is looking for ptp_ref it is getting 0 hence the crash
> and after the commit 030ce919e114 result is Invalid error instead of crash.
> For me PTP is not working for Tegra234 from day 1 so why to bother about
> backward compatibility and instead fix dts.
> Please help me understand it has been years I worked on dts.

Please could you expand on that, because when i look at the code....


  	/* Fall-back to main clock in case of no PTP ref is passed */
 	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
  	if (IS_ERR(plat->clk_ptp_ref)) {
  		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
  		plat->clk_ptp_ref = NULL;

if the ptp_ref does not exist, it falls back to stmmac_clk. Why would
that cause a crash?

While i agree if this never worked, we can ignore backwards
compatibility and just fix the DT, but i would like a fuller
explanation why the fallback is not sufficient to prevent a crash.

	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
