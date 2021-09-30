Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CADDD41DD2A
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 17:17:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8268EC5A4CD;
	Thu, 30 Sep 2021 15:17:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 056E2C597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 15:17:28 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44F1A61139;
 Thu, 30 Sep 2021 15:17:24 +0000 (UTC)
Date: Thu, 30 Sep 2021 16:21:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <20210930162119.6b8c8455@jic23-huawei>
In-Reply-To: <a7467649-e949-9d1d-eed6-93830bf83bb4@foss.st.com>
References: <20200204101008.11411-1-olivier.moysan@st.com>
 <20200204101008.11411-5-olivier.moysan@st.com>
 <20200208161847.76c7d6e8@archlinux>
 <8400827e-5f3d-ad3f-99c8-986934b1a7b8@st.com>
 <20200214131113.70aa36b8@archlinux>
 <5b2e74a0-71bd-46d0-0096-b33ff17f780b@st.com>
 <20200214151011.20111e8c@archlinux>
 <AM9PR10MB43558CEB8DAE7F373E9E7A5DF9D69@AM9PR10MB4355.EURPRD10.PROD.OUTLOOK.COM>
 <78f4e4b9-ef4c-982f-7cd3-8d3052d99150@foss.st.com>
 <20210912182617.5635fa06@jic23-huawei>
 <a38906b8-7d28-b5e0-939b-e8108bd7266c@foss.st.com>
 <20210919191414.09270f4e@jic23-huawei>
 <2ac8eafa-25fe-6640-edef-960e56733534@foss.st.com>
 <20210926155607.3a7fae81@jic23-huawei>
 <a7467649-e949-9d1d-eed6-93830bf83bb4@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] iio: adc: stm32-dfsdm: add scale and
	offset support
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

On Wed, 29 Sep 2021 18:44:30 +0200
Olivier MOYSAN <olivier.moysan@foss.st.com> wrote:

> Hi Jonathan,
> 
> >>>>
> >>>> If 'backend' option turns out to be the most appropriated to match DFSDM
> >>>> constraints, I can prepare some patches to support it.
> >>>> Would you have some guidelines or requirements for the implementation of
> >>>> such feature, in this case ?  
> >>>
> >>> Closest example is that rcar-gyroadc but in this case we'd want to define
> >>> something standard to support the modulators so that if we have other filters
> >>> in future we can reuse them.
> >>>
> >>> That means implementing them as child devices of the filter - probably put
> >>> the on the IIO bus, but as different device type.  Take a look at how
> >>> triggers are done in industrialio-trigger.c
> >>> You need struct device_type sd_modulator
> >>> and a suitable device struct (burred in an iio_sd_modulator struct probably).
> >>>
> >>> Also needed would be a bunch of standard callbacks to allow you to query things
> >>> like scaling.   Keep that interface simple. Until we have a lot of modulator
> >>> drivers it will be hard to know exactly what is needed.  Also whilst we don't
> >>> have many it is easy to modify the interface.
> >>>
> >>> Then have your filter driver walk it's own dt children and instantiate
> >>> appropriate new elements and register them on the iio_bus.  They will have
> >>> the filter as their parent.
> >>>
> >>> There are various examples of this sort of thing in tree.
> >>> If you want a good one, drivers/cxl does a lot of this sort magic to manage
> >>> a fairly complex graph of devices including some nice registration stuff to
> >>> cause the correct device drivers to load automatically.
> >>>
> >>> Hmm.  Thinking more on this, there is an ordering issue for driver load.
> >>> Instead of making the modulator nodes children of the modulator, you may need
> >>> to give them their own existence and use a phandle to reference them.
> >>> That will let you defer probe in the filter driver until those
> >>> modulator drivers are ready.
> >>>
> >>> This isn't going to be particularly simple, so you may want to have a look
> >>> at how various other subsystems do similar things and mock up the dependencies
> >>> to make sure you have something that doesn't end up with a loop of dependencies.
> >>> In some ways the modulators are on a bus below the filter, but the filter driver
> >>> needs them to be in place to do the rest.
> >>> You may end up with some sort of delayed load.
> >>> 1. Initial filter driver load + parsing of the modulator dt children (if done that way).
> >>> 2. Filter driver goes to sleep until...
> >>> 3. Modulator drivers call something on the filter driver to say they are ready.
> >>> 4. Filter driver finishes loading and create the IIO device etc.
> >>> You'll need some reference counting etc in there to make removal safe etc but it
> >>> shouldn't be 'too bad'.
> >>>
> >>> Good luck!
> >>>
> >>> Jonathan
> >>>  
> I'am on the way to prototype this proposal for DFSDM.
> Looking at your advices, I see that the current topolgy based on 
> hardware consumer, already meets most of the requirements.
> 
> - SD modulators are described in DT with their own nodes and are 
> referred in DFSDM nodes through their phandle.
> - Dependencies at probe are managed (defer probe through 
> devm_iio_hw_consumer_alloc())
> - SD modulator scaling is retrieved through iio_read_channel_scale() ABI.
> 
> So, it seems that the current implementation is not so far from this 
> solution.
> It remains the unwanted sysfs interface for SD modulator. Or more than 
> that, if I missed something ?
> Instead of introducing a new device type for SD modulator, could the 
> mode field be used to identify devices not requesting an IIO sysfs ?
> (A dedicated mode may be used to skip sysfs register in device registration)
> Otherwise let's go for a new type.

I'd rather see them as a new device type than overload the IIO device.
We want to be able to control what can 'connect' to the DFSDM afterall
and device type is a convenient route to doing this.

Obviously if there is infrastructure that can be factored out and used
for both this and a normal IIO device we can do that to save on duplication.

Thanks,

Jonathan

> 
> Regards
> Olivier

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
