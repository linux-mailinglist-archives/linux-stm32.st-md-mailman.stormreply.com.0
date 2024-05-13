Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C128C46B2
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 20:07:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F8CAC6A61D;
	Mon, 13 May 2024 18:07:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30EEBC5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=qv4aa2y30wKDIpbTtsqV7m9XFw7hrbmhzvePIaRnkJs=; b=UvfWN3y5pfzUTvOPr5g8P+RC7S
 9msDnr0XJmQf7mI4Ln2mXe2UWfeeFM0FZ9qnl2YU+bdIGup1THUwQ9gZeYUoJ4i1MkedVU8M8kDhM
 YUCPfJOMIuU3Nqn01Y9s8uqK2+PR4ttjSRM9YSm9h72ebhsaRPVe4yxQ1mChxBXmh5lk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s6a51-00FKNw-JD; Mon, 13 May 2024 20:07:19 +0200
Date: Mon, 13 May 2024 20:07:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <1484c1b7-90aa-4495-a417-a400add8602a@lunn.ch>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <4ede8911-827d-4fad-b327-52c9aa7ed957@lunn.ch>
 <Zj+nBpQn1cqTMJxQ@shell.armlinux.org.uk>
 <08b9be81-52c9-449d-898f-61aa24a7b276@lunn.ch>
 <CAMdnO-+V2npKBoXW5o-5avS9HP84LV+nQkvW6AxbLwFOrZuAGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-+V2npKBoXW5o-5avS9HP84LV+nQkvW6AxbLwFOrZuAGg@mail.gmail.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, edumazet@google.com,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

> Yes, the MAC directly connects to switch within the SoC with no external MII.
> The SoC is BCM89586M/BCM89587 automotive ethernet switch.
> The SOC presents PCIE interfaces on BCM89586M/BCM89587 automotive
> ethernet switch.
> The switch supports many ethernet interfaces out of which one or two
> interfaces are presented as PCIE endpoints to the host connected on
> the PCIE bus.
> The MAC connects to switch using XGMII interface internal to the SOC.
> The high level diagram is shown below:
> 
> +==================================================+
>    +--------+                     |                     BCM8958X
> switch SoC               +----------------+         |
>    | Host   |                      |  +----------------+
>     +-------+                 |                     |         | ===
> more ethernet IFs
>    | CPU   | ===PCIE===| PCIE endpoint |==DMA==| MAC |==XGMII==|
> switch fabric |         | === more ethernet IFs
>    |Linux   |                      | +----------------+
>    +-------+                 |                      |         |
>    +-------+                       |
>                                       +-----------------+        |
> 
> +==================================================+
> Since the legacy fixed link cannot support 10G, we are initializing to
> fixed speed 1G.

You ASCII art is broken, probably because you are not using a fixed
width font.

So the interface between the MAC and the switch is fixed at XGMII. Is
the MAC actually capable of anything other than XGMII? If XGMII is all
it can do, then there is no need for a fixed link. You use a
fixed-link when you have a conventional off the shelf MAC which can do
10BaseT_Half through to 10GBaseT. Normally there would be a PHY
connected to the MAC and phylib/phylink will determine the line rate
and tell the MAC what speed to operate at. However, if this device
only supports XGMII, it is impossible to connect to a PHY because
there is no external MII interface, then skip all the phylib/phylink
support and hard code it. Look at the patches on the netdev list for
the RealTek automotive driver which seems to be pretty similar.

	   Andrew

	       
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
