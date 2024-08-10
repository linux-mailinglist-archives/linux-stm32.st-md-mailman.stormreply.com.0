Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8A94D996
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Aug 2024 02:53:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32890C78021;
	Sat, 10 Aug 2024 00:53:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A31CBC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2024 00:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=DkpWdwfdYShH0tYvWIL8CwsOc/KFH8bow/K6S4AK+54=; b=W5wEvW2BrijqSSaMjcQLuegg4k
 c1B94zGifDd3mz5I3i6omnBzkzRBW5jDL230SWQcib9Ds4g3gqT+WlVYCk8U//FWdCjKMWzfJn6cP
 1XrolqjD/Ch8Dy9xh1qPVge1BuzG+5C21CvSP52lCEPfpYnJwkYK8ldPGC/3AZmTSmFo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1scaM5-004QHZ-JU; Sat, 10 Aug 2024 02:53:13 +0200
Date: Sat, 10 Aug 2024 02:53:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <fab4b842-4881-4fa4-aaf6-2deee50a0a39@lunn.ch>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
 <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
 <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
 <de5b4d42-c81d-4687-b244-073142e2967b@lunn.ch>
 <CAMdnO-+_2Fy=uNgGevtnL8PGPvKyWXPvYaxOJwKcUZj+nnfqYg@mail.gmail.com>
 <5ff4a297-bafd-4b33-aae1-5a983f49119a@lunn.ch>
 <2c4a42ee-164b-447f-b51d-07b2585345b3@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c4a42ee-164b-447f-b51d-07b2585345b3@broadcom.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 kuba@kernel.org, bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI
 driver support for BCM8958x
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

> > > Hi Andrew,
> > 
> > So the switch will be left in dumb switch everything to every port
> > mode? Or it will be totally autonomous using the in build firmware?
> > 
> > What you cannot expect is we allow you to manage the switch from Linux
> > using something other than an in kernel driver, probably DSA or pure
> > switchdev.
> 
> This looks reasonable as an advice about to ideally fit within the existing
> Linux subsystems, however that is purely informational and it should not
> impair the review and acceptance of the stmmac drivers.
> 
> Doing otherwise, and rejecting the stmmac changes because now you and other
> reviewers/maintainers know how it gets used in the bigger picture means this
> is starting to be overreaching. Yes silicon vendor companies like to do all
> sorts of proprietary things for random reasons, I think we have worked
> together long enough on DSA that you know my beliefs on that aspect.
> 
> I think the stmmac changes along have their own merit, and I would seriously
> like to see a proper DSA or switchdev driver for the switching silicon that
> is being used, but I don't think we need to treat the latter as a
> prerequisite for merging the former.

I fully agree this patchset should be merged without needing a DSA
driver. We have seen a number of automotive systems recently doing
very similar things, Linux is just a host connected to a switch. Linux
is too unreliable to manage the switch, or Linux takes too long to
boot and configure the switch etc. So something else is in control of
the switch. Linux only view onto the switch is as a typical external
device, it can walk the SNMP MIBs etc.

If you decided Linux can manage this switch, then great, please
sometime in the future submit a DSA or switchdev driver. Otherwise
Linux is just a host with no real knowledge of the switch, and the SPI
interface is not used.

	  Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
