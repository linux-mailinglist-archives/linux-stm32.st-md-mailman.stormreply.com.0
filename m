Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE2773AB7
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 16:25:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B53FC6B469;
	Tue,  8 Aug 2023 14:25:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1641AC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=1eMz8Kx1EHbpbcwhOQKyLVqRjaGKTaNj4sW/uynWnl8=; b=nejMPi3VM7ofMENIN8bhAEJL07
 R1JLkq+Z0e+Vvd3amNjdds5KLa/IkvIBpX/KZhrsGzbSHj/Jpm8DHhBojZxbdLdU2XbGa8Ca9S0Cs
 WFv1W+lkAfog6/kxtpgQlcebGAxCSMz4Gni1CCitszWFXF4f8IxW2G0nJ4D4I9d5w4tw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qTNeM-003TSm-VY; Tue, 08 Aug 2023 16:25:30 +0200
Date: Tue, 8 Aug 2023 16:25:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <65b53003-23cf-40fa-b9d7-f0dbb45a4cb2@lunn.ch>
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
 <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
 <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH 0/2] net: stmmac: allow sharing MDIO lines
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

> > On Tue, Aug 08, 2023 at 10:13:09AM +0200, Bartosz Golaszewski wrote:
> > > Ok so upon some further investigation, the actual culprit is in stmmac
> > > platform code - it always tries to register an MDIO bus - independent
> > > of whether there is an actual mdio child node - unless the MAC is
> > > marked explicitly as having a fixed-link.
> > >
> > > When I fixed that, MAC1's probe is correctly deferred until MAC0 has
> > > created the MDIO bus.
> > >
> > > Even so, isn't it useful to actually reference the shared MDIO bus in some way?
> > >
> > > If the schematics look something like this:
> > >
> > > --------           -------
> > > | MAC0 |--MDIO-----| PHY |
> > > -------- |     |   -------
> > >          |     |
> > > -------- |     |   -------
> > > | MAC1 |--     ----| PHY |
> > > --------           -------
> > >
> > > Then it would make sense to model it on the device tree?
> >
> > So I think what you're saying is that MAC0 and MAC1's have MDIO bus
> > masters, and the hardware designer decided to tie both together to
> > a single set of clock and data lines, which then go to two PHYs.
> 
> The schematics I have are not very clear on that, but now that you
> mention this, it's most likely the case.

I hope not. That would be very broken. As Russell pointed out, MDIO is
not multi-master. You need to check with the hardware designer if the
schematics are not clear.

> Good point, but it's worse than that: when MAC0 is unbound, it will
> unregister the MDIO bus and destroy all PHY devices. These are not
> refcounted so they will literally go from under MAC1. Not sure how
> this can be dealt with?

unbinding is not a normal operation. So i would just live with it, and
if root decides to shoot herself in the foot, that is her choice.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
