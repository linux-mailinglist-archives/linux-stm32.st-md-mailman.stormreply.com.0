Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C25E50E4F3
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 17:59:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A71A4C60462;
	Mon, 25 Apr 2022 15:59:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 386DFC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=tRaJqis/SWifEwnFIxuNq9dKtN4ay+SViNUuz6JWxmk=; b=ThIeBmQ7cVrq3qfftbtHsbnhFH
 MiYIVhIeiwQ/zC36tF3MmFeJIOhZ44Dqen2123Qt3MHtjiUMCvgzTZMe09t+7P6rXQhYvtNg5n3CZ
 bFJfNCoHoel9E7T0uxFlETsFL7flcOd06A9jeEvnoaiSxTpfA1B9vekbC8viaq2dZQ8Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nj17m-00HQ8g-4S; Mon, 25 Apr 2022 17:59:42 +0200
Date: Mon, 25 Apr 2022 17:59:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Message-ID: <YmbFblFCrGFND+h/@lunn.ch>
References: <36ba455aad3e57c0c1f75cce4ee0f3da69e139a1.camel@toradex.com>
 <YmXIo6q8vVkL6zLp@lunn.ch>
 <5e51e11bbbf6ecd0ee23b4fd2edec98e6e7fbaa8.camel@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e51e11bbbf6ecd0ee23b4fd2edec98e6e7fbaa8.camel@toradex.com>
Cc: "festevam@gmail.com" <festevam@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] net: stmmac: dwmac-imx: half duplex crash
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

> Good point. I was blinded by NXP downstream which, while listing all incl. 10baseT/Half and 100baseT/Half as
> supported link modes, also does not work. However, upstream indeed shows only full-duplex modes as supported:
> 
> root@verdin-imx8mp-07106916:~# ethtool eth1
> Settings for eth1:
>         Supported ports: [ TP MII ]
>         Supported link modes:   10baseT/Full 
>                                 100baseT/Full 
>                                 1000baseT/Full 

So maybe we actually want ethtool to report -EINVAL when asked to do
something which is not supported! Humm:

https://elixir.bootlin.com/linux/latest/source/drivers/net/phy/phy.c#L783


	/* We make sure that we don't pass unsupported values in to the PHY */
	linkmode_and(advertising, advertising, phydev->supported);

So maybe the unsupported mode got removed, and the PHY was asked to
advertise nothing!

Anyway, this is roughly there the check should go.

> ...
> 
> Once I remove them queues being setup via device tree it shows all modes as supported again:
> 
> root@verdin-imx8mp-07106916:~# ethtool eth1
> Settings for eth1:
>         Supported ports: [ TP MII ]
>         Supported link modes:   10baseT/Half 10baseT/Full 
>                                 100baseT/Half 100baseT/Full 
>                                 1000baseT/Full 
> ...
> 
> However, 10baseT/Half, while no longer just crashing, still does not seem to work right. Looking at wireshark
> traces it does send packets but seems not to ever get neither ARP nor DHCP answers (as well as any other packet
> for that matter).

So the answers are on the wire, just not received? 

> Looks like the same actually applies to 10baseT/Full as well. While 100baseT/Half and
> 100baseT/Full work fine now.
> 
> Any idea what else could still be going wrong with them 10baseT modes?

I would use mii-tool to check the status of the PHY. Make sure it
really has negotiated 10/Half mode. After that, it is very likely to
be a MAC problem, and i don't think i can help you.

> On a side note, besides modifying the device tree for such single-queue setup being half-duplex capable, is
> there any easier way? Much nicer would, of course, be if it justworkedTM (e.g. advertise all modes but once a
> half-duplex mode is chosen revert to such single-queue operation). Then, on the other hand, who still uses
> half-duplex communication in this day and age (;-p).

You seem to need it for some reason!

Anyway, it is just code. You have all the needed information in the
adjust_link callback, so you could implement it.

	    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
