Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A258B04B0D
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 00:51:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A251C3F92F;
	Mon, 14 Jul 2025 22:51:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D98CCC36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=HjeoFMni5D8FZbA2QblKQtsOtTKxXPyVOVcubTEine8=; b=d+KJ0A4ZqqvLbmCeMtCn7KZIqK
 lMWirgyILo1QyUWza5WwPn33MyeWPFv3s1FQdB3piR3nRaZ5SNFXhdi7FKCr1kejaPfbSydDLvo6A
 zycMeoYscPdyeyluXwfoIUwCYQaLn4M08MJ8Hpi8s3K1U+jPqmwT6FGM/uk02qrlKPi8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ubS0W-001W0H-OT; Tue, 15 Jul 2025 00:50:48 +0200
Date: Tue, 15 Jul 2025 00:50:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Message-ID: <434a235b-7e33-499f-a9ab-99166297012c@lunn.ch>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-4-matthew.gerlach@altera.com>
 <de1e4302-0262-4bcc-b324-49bfc2f5fd11@lunn.ch>
 <256054d7-351a-4b1c-8e1a-48628ace091d@altera.com>
 <86e1e04a-3242-482c-adb0-dde7375561c1@lunn.ch>
 <baed95d4-c220-4d3b-8173-fc673660432d@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <baed95d4-c220-4d3b-8173-fc673660432d@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/4] arm64: dts: socfpga: agilex5: enable
 gmac2 on the Agilex5 dev kit
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

On Mon, Jul 14, 2025 at 03:29:21PM -0700, Matthew Gerlach wrote:
> 
> 
> On 7/14/25 11:52 AM, Andrew Lunn wrote:
> > On Mon, Jul 14, 2025 at 11:09:33AM -0700, Matthew Gerlach wrote:
> > > > > On 7/14/25 10:25 AM, Andrew Lunn wrote:
> > > > > +&gmac2 {
> > > > > +	status = "okay";
> > > > > +	phy-mode = "rgmii";	/* Delays implemented by the IO ring of the Agilex5 SOCFPGA. */
> > > > > > Please could you explain in more details what this means.
> > > > > > The normal meaning for 'rgmii' is that the PCB implements the
> > delay. I
> > > > just want to fully understand what this IO ring is, and if it is part
> > > > of the PCB.
> > > > The IO ring is the logic in the Agilex5 that controls the pins on
> > the chip.
> > > It is this logic that sits between the MAC IP in the Agilex5 and the pins
> > > connected to the PCB that is inserting the necessary delays. Technically the
> > > PCB is not implementing the delays, but the "wires" between the MAC and the
> > > external pins of the Agilex5 are implementing the delay. It seems to me that
> > > "rgmii" is a more accurate description of the hardware than "rgmii-id" in
> > > this case.
> > 
> > Is this delay hard coded, physically impossible to be disabled? A
> > syntheses option? Can it be changed at run time? Is the IO ring under
> > the control of a pinctrl driver? Can i use the standard 'skew-delay'
> > DT property to control this delay?

> The delay is not hard coded. It is a synthesis option that can be disabled.

Is there a register you can read which tells you if it is
enabled/disabled?

> The delay in the IO ring can be disabled, but implementing the delay in the
> IO ring allows for RGMII phys that don't implement the delay.

All RGMII PHYs which Linux support have the ability to do delays. And
we recommend the PHY does the delay, just to keep all systems the
same. There are a few exceptions, mostly because the MAC has hard
coded delays which cannot be disabled, but i guess 90% of systems have
the PHY doing the 2ns delays.

So, phy-mode should be set to 'rgmii-id', since the PCB does not add
the delays.

Ideally, you want to read from the IO ring if it is synthesised to do
the 2ns delays. Assuming it is enabled, you then mask the phy-mode
before connecting to the PHY, so avoiding double delays.

	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
