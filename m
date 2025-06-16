Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8B4ADB114
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 15:06:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 262D8C35E2B;
	Mon, 16 Jun 2025 13:06:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3289CC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=6EiGoP0CFRPN9DlmZM3Ult5DiFuokD7txHWgsRXBcRM=; b=Etludh7dptxTH6P3Xz+xzQmn4M
 Pk9fgXsVBhX6nlUcl/bIdl8VkxWLYWFmfr/qZ1LWpn7R4uemH0Nb7uWb7aBEdNXWihw5Tx6OK0ZAt
 RZG3PgaUf+ZuUqdsrp9D+lNIJxt3YM81WpBkrsQyhMhcZ7vWSAWI3ltxQTSETcXpE/Us=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uR9XH-00G2lm-N1; Mon, 16 Jun 2025 15:06:03 +0200
Date: Mon, 16 Jun 2025 15:06:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e87b4398-41de-4584-87fe-b9ad1df32dbe@lunn.ch>
References: <20250612062032.293275-1-jonathanh@nvidia.com>
 <aEqyrWDPykceDM2x@a5393a930297>
 <85e27a26-b115-49aa-8e23-963bff11f3f6@lunn.ch>
 <e720596d-6fbb-40a4-9567-e8d05755cf6f@nvidia.com>
 <353f4fd1-5081-48f4-84fd-ff58f2ba1698@lunn.ch>
 <9544a718-1c1a-4c6b-96ae-d777400305a7@nvidia.com>
 <5a3e1026-740a-4829-bfd2-ce4c4525d2a0@lunn.ch>
 <f769098f-2268-491e-9c94-dbecf7a280a4@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f769098f-2268-491e-9c94-dbecf7a280a4@nvidia.com>
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

On Mon, Jun 16, 2025 at 11:06:54AM +0100, Jon Hunter wrote:
> 
> On 13/06/2025 14:22, Andrew Lunn wrote:
> > > > So you can definitively say, PTP does actually work? You have ptp4l
> > > > running with older kernels and DT blob, and it has sync to a grand
> > > > master?
> > > 
> > > So no I can't say that and I have not done any testing with PTP to be clear.
> > > However, the problem I see, is that because the driver defines the name as
> > > 'ptp-ref', if we were to update both the device-tree and the driver now to
> > > use the expected name 'ptp_ref', then and older device-tree will no longer
> > > work with the new driver regardless of the PTP because the
> > > devm_clk_bulk_get() in tegra_mgbe_probe() will fail.
> > > 
> > > I guess we could check to see if 'ptp-ref' or 'ptp_ref' is present during
> > > the tegra_mgbe_probe() and then update the mgbe_clks array as necessary.
> > 
> > Lets just consider for the moment, that it never worked.
> 
> To be clear, by 'it never worked', you are referring to only PTP support?
> Then yes that is most likely.

Yes, i'm just referring to PTP. I would be very surprised if
sending/receiving Ethernet frames is broken, that gets lots of
testing.

> > If we change the device tree to the expected 'ptp_ref', some devices
> > actually start working. None regress, because none ever worked. We can
> > also get the DT change added to stable, so older devices start
> > working. We keep the code nice and clean, no special case.
> 
> Although PTP may not work, basic ethernet support does and 'correcting' the
> device-tree only, will break basic ethernet support for this device.

We clearly don't want to do that. But we should be able to come up
with a fix which does not make things worse. The obvious one is that
we have both ptp-ref and ptp_ref in tegra234.dtsi, so that both
mgbe_clks in dwmac-tegra.c and stmmac_probe_config_dt is happy.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
