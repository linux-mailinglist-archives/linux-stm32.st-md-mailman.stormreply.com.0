Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541741CA88
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Sep 2021 18:45:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6624C5A4F8;
	Wed, 29 Sep 2021 16:45:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A2D9C597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Sep 2021 16:44:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TGXpbh028065; 
 Wed, 29 Sep 2021 18:44:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=++4ateDKXxW3JCyD3y4snRaohlrpaVUIJhNfEhDJ9aQ=;
 b=UZ9k8yIYNXFpWrlxmOSsJGeCM8KwcSA0zHjY1aP0XFddjYkSNsKgdaxFyg3SFSxcPZ5W
 lTc4uTU6mkMRNQbnWFYEfhNQrTw8lDS4UzlHqMfCTeQaUAbWEfQPFLwLKMxENN+1S3sE
 2fn9MGSreWdKxk4td3ua7wLkcyRZ5IgFhVOH66cXlpgtUoNX9ZeJJyHTt4HcfqBrtlpF
 VwxM19bCiO07URDRIevJFKXwSZ7DHBXMmo9EgbsounNmHg/thqERLMDiV+x5c6zDlmFw
 yyNOuyztr2g2bmEmbSQCEPR+jhNKee3SAgVwg39SSBBelN3MyQmx6YsXPrN3TsHtCc7d fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bcjc1kvh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 18:44:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96C6810002A;
 Wed, 29 Sep 2021 18:44:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66F9B24D194;
 Wed, 29 Sep 2021 18:44:32 +0200 (CEST)
Received: from lmecxl0577.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 29 Sep
 2021 18:44:31 +0200
To: Jonathan Cameron <jic23@kernel.org>
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
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <a7467649-e949-9d1d-eed6-93830bf83bb4@foss.st.com>
Date: Wed, 29 Sep 2021 18:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926155607.3a7fae81@jic23-huawei>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_06,2021-09-29_01,2020-04-07_01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Jonathan,

>>>>
>>>> If 'backend' option turns out to be the most appropriated to match DFSDM
>>>> constraints, I can prepare some patches to support it.
>>>> Would you have some guidelines or requirements for the implementation of
>>>> such feature, in this case ?
>>>
>>> Closest example is that rcar-gyroadc but in this case we'd want to define
>>> something standard to support the modulators so that if we have other filters
>>> in future we can reuse them.
>>>
>>> That means implementing them as child devices of the filter - probably put
>>> the on the IIO bus, but as different device type.  Take a look at how
>>> triggers are done in industrialio-trigger.c
>>> You need struct device_type sd_modulator
>>> and a suitable device struct (burred in an iio_sd_modulator struct probably).
>>>
>>> Also needed would be a bunch of standard callbacks to allow you to query things
>>> like scaling.   Keep that interface simple. Until we have a lot of modulator
>>> drivers it will be hard to know exactly what is needed.  Also whilst we don't
>>> have many it is easy to modify the interface.
>>>
>>> Then have your filter driver walk it's own dt children and instantiate
>>> appropriate new elements and register them on the iio_bus.  They will have
>>> the filter as their parent.
>>>
>>> There are various examples of this sort of thing in tree.
>>> If you want a good one, drivers/cxl does a lot of this sort magic to manage
>>> a fairly complex graph of devices including some nice registration stuff to
>>> cause the correct device drivers to load automatically.
>>>
>>> Hmm.  Thinking more on this, there is an ordering issue for driver load.
>>> Instead of making the modulator nodes children of the modulator, you may need
>>> to give them their own existence and use a phandle to reference them.
>>> That will let you defer probe in the filter driver until those
>>> modulator drivers are ready.
>>>
>>> This isn't going to be particularly simple, so you may want to have a look
>>> at how various other subsystems do similar things and mock up the dependencies
>>> to make sure you have something that doesn't end up with a loop of dependencies.
>>> In some ways the modulators are on a bus below the filter, but the filter driver
>>> needs them to be in place to do the rest.
>>> You may end up with some sort of delayed load.
>>> 1. Initial filter driver load + parsing of the modulator dt children (if done that way).
>>> 2. Filter driver goes to sleep until...
>>> 3. Modulator drivers call something on the filter driver to say they are ready.
>>> 4. Filter driver finishes loading and create the IIO device etc.
>>> You'll need some reference counting etc in there to make removal safe etc but it
>>> shouldn't be 'too bad'.
>>>
>>> Good luck!
>>>
>>> Jonathan
>>>
I'am on the way to prototype this proposal for DFSDM.
Looking at your advices, I see that the current topolgy based on 
hardware consumer, already meets most of the requirements.

- SD modulators are described in DT with their own nodes and are 
referred in DFSDM nodes through their phandle.
- Dependencies at probe are managed (defer probe through 
devm_iio_hw_consumer_alloc())
- SD modulator scaling is retrieved through iio_read_channel_scale() ABI.

So, it seems that the current implementation is not so far from this 
solution.
It remains the unwanted sysfs interface for SD modulator. Or more than 
that, if I missed something ?
Instead of introducing a new device type for SD modulator, could the 
mode field be used to identify devices not requesting an IIO sysfs ?
(A dedicated mode may be used to skip sysfs register in device registration)
Otherwise let's go for a new type.

Regards
Olivier
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
