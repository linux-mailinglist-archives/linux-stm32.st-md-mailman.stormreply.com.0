Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353FA7C17E
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 18:25:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4A64C78F85;
	Fri,  4 Apr 2025 16:25:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04198C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 16:25:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4w9E024189;
 Fri, 4 Apr 2025 18:24:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 b/eiqZHdZQvwyfWZe39Nel4pZGk4oMDE2ktEcKkJ+Bg=; b=GPs1mCk6so4eBW/i
 lXR2Q8uSv9mTWSYzCTrsYIUpsGVl+b5KkwSPJUAiC+X8RPBpkWci6nFGYbKlJPU0
 MyourA9U0IenCcBTUMRgeqcVY+RR+/Wan6EWNGFmsruygSbB5xREg+n77mKuz87V
 hZAUYUfu76BpWVOB3T2Ws6OEytqZ2bQSz1NldoRVDBqIheVCCrxgb9UaFRGd3g4c
 U2TwBLVAcig1ZN+EdMCoPaMk/RipFouF0wptUuRwaY3E8UKD3fx1ReRULWyIzgOO
 TU3abhVTmwqEbP6nB2jFDuf3m4CRvQoerDEM6dppKj9+6u5Omms/F92d6PPSVwUe
 mwNPDA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2cjv2uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Apr 2025 18:24:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A85E4004B;
 Fri,  4 Apr 2025 18:23:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BD4C921962;
 Fri,  4 Apr 2025 18:19:28 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 18:19:24 +0200
Message-ID: <d2b38bb5-4551-4c8b-90bb-753f2176ff1e@foss.st.com>
Date: Fri, 4 Apr 2025 18:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Marc Zyngier <maz@kernel.org>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-3-christian.bruel@foss.st.com>
 <8734epyw17.wl-maz@kernel.org>
 <1213dbfb-821a-4534-947b-acc4eac9da81@foss.st.com>
 <87y0wgxd4j.wl-maz@kernel.org>
Content-Language: en-US
In-Reply-To: <87y0wgxd4j.wl-maz@kernel.org>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_07,2025-04-03_03,2024-11-22_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, tglx@linutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] irqchip/gic: Use 0x10000 offset to
 access GICC_DIR on STM32MP2
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



On 4/4/25 15:36, Marc Zyngier wrote:
> On Fri, 04 Apr 2025 13:15:05 +0100,
> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>
>>
>>
>> On 4/3/25 19:50, Marc Zyngier wrote:
>>> On Thu, 03 Apr 2025 13:28:04 +0100,
>>> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>>>
>>>> When GIC_4KNOT64K bit in the GIC configuration register is
>>>> 0 (64KB), address block is modified in such a way than only the
>>>> first 4KB of the GIC cpu interface are accessible with default
>>>> offsets.
>>>> With this bit mapping GICC_DIR register is accessible at
>>>> offset 0x10000 instead of 0x1000, thus remap accordingly
>>>
>>> And I'm pretty sure the whole of the GICC range is correctly
>>> accessible at offset 0xF000, giving you the full 8kB you need. That's
>>> because each page of the GIC is aliased over two 64kB blocks, as per
>>> the integration guidelines so that MMU isolation can be provided on a
>>> 64kB boundary.
>>
>> Thanks a lot for this explanation, indeed this works like a charm.
>>
>>>
>>> Funnily enough, all it takes is to adjust GICC region. You can either:
>>>
>>> - make it 128kB wide, and the driver will take care of it (details in
>>>     gic_check_eoimode()). On one of my boxes that is similarly
>>>     configured, I get:
>>>
>>>     [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>>     [    0.000000] GIC: Adjusting CPU interface base to 0x00000000780af000
>>>     [    0.000000] Root IRQ handler: gic_handle_irq
>>>     [    0.000000] GIC: Using split EOI/Deactivate mode
>>>
>>>     See below for what I expect to be the correct fix.
>>>     - make it 8kB wide from offset 0xF000.
>>
>> I checked both and they work. I will go for the former to show real
>> 8kB size to be exposed in the DT. And there are a few other
>> platforms that use this alias
> 
> I think 8kB the wrong option. The GIC *is* supposed to be integrated
> over 128kB on arm64 platforms (there was some documentation about that
> back in the days, but it has become impossible to search anything on
> ARM's stupidly broken website.  My recollection is that it was bundled
> with the GICv2m "specification" (only half a page!). >
> Furthermore, you are supposed to describe the HW. Not your
> interpretation of it. Correctly written SW targeting arm64 know about
> this anyway.

greping other platforms there are a bunch 0xf000 offset 8KB mapped:

  amd/amd-seattle-soc.dtsi
  arm/corstone1000.dtsi
  arm/foundation-v8-gicv3.dtsi
  arm/juno-base.dtsi
  mediatek/mt8516.dtsi

but, looking at the stm32mp25 memory map (1) page 239:

0x4AC22000 - 0x4AC3FFFF 120 Reserved -
0x4AC20000 - 0x4AC21FFF 8   GICC

I can know guess that the "Reserved" 120kB is for aliasing the 64kB 
blocks. Thus describing the GICC 128KB range size makes sense

similarly 4KB + 120KB Reserved for GICH and 8KB + 120KB Reserved for GICV

(1) 
https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf


> 
>>> Unless the ST HW folks have been even more creative, none of this
>>> overly complicated stuff should be necessary. Just describe the HW
>>> correctly.
>>
>> I was unable to find this information in the GIC-400 trm
>> (https://developer.arm.com/documentation/ddi0471/b/programmers-model/gic-400-register-map). Now
>> I also prefer to use GICC alias at
>> offset 0xf000 as suggested rather than the quirk solution
> 
> Again, this isn't a quirk. It's the one true way for 64bit platforms
> that can use pages bigger than 4kB. That's the purpose of the 4Kn64K
> parameter in the integration, dropping bits [15:12] from the PA
> presented to the CPU interface.

there might be a misunderstanding, I was referring to my dropped quirk 
that I now dropped, not your options

thanks

Christian
> 
> 	M.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
