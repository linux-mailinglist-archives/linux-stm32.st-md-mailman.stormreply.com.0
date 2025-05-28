Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02BAC72C0
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 23:29:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7DC7C36B3E;
	Wed, 28 May 2025 21:29:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99297C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=smRHoEj0Twx20AA+nj0Da054TRsu20UDIY5yl86Aq4A=; b=vhDUvgUGKpHJX8MckMn6K1pZFi
 0eYhyiinOgak6BcAx1TuEKdJQwOLiPTnCiQ4g4tOS+ZFMlJUSlnTNG2yFMIWzcr6mYVE+gVUKqf7w
 cJgzrSGB8ykanu5921ZUAnmygqK2uZwN8GdwhGo3gq0nH1nP8NGuKD2upm36Hwyw17+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uKOKx-00ED7B-69; Wed, 28 May 2025 23:29:23 +0200
Date: Wed, 28 May 2025 23:29:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
References: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
 <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
 <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, wens@csie.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

> > Describe the one PHY which actually exists in device tree for the
> > board, and point to it using phy-handle. No runtime detection, just
> > correctly describe the hardware.
> 
> But the boards randomly contain SoC's with different PHY's so we
> have to support both variants.

You have two .dts files, resulting in two .dtb files, which are 95%
identical, but import a different .dtsi file for the PHY.

You can test if the correct .dtb blob is used by checking the fuse. If
it is wrong, you can give a hint what .dtb should be used.

Or, as Russell suggested, you give the bootloader both .dtb blobs, and
it can pick the correct one to pass to the kernel. Or the bootloader
can patch the .dtb blob to make it fit the hardware.

> > Do you have examples of boards where the SoC variant changed during
> > the boards production life?
> 
> Yes, the boards I'm working for example, but this is likely an issue for
> other boards as well(vendor BSP auto detects PHY variants):
> https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?ID=1139

Mainline generally does not care what vendors do, because they often
do horrible things. Which is O.K, it is open source, they can do what
they want in their fork of the kernel.

But for Mainline, we expect a high level of quality, and a uniform way
of doing things.

This can also act as push back on SoC vendors, for doing silly things
like changing the PHY within a SoC without changing its name/number.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
