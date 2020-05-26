Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAED1BB8F4
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 10:40:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39DB0C36B0C;
	Tue, 28 Apr 2020 08:40:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF74EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 08:40:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03S8c60B007008; Tue, 28 Apr 2020 10:39:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=iggMpM4k3OMpDymVeQlXTpcwpY9qozcRLBTldOVkKoU=;
 b=ZgVVGayV1fkOmkGH6tVEiAnViKYagvCVvHZ4gs+njCotETu6IBPMIARbeqWtpLLDUOXu
 O0alsGmV3KCaiHtJr4585QYfVPH8EDPYrmEPGnZGV90Ra4PW+4hm3GB16AtUBK23SMZn
 +ObngClmoUn2my2/4A9Q/C151/Ike+KAR6RaPjc5iJF/HIoIXaYM6fIwIcgeXcJlYOXk
 fcf5NoL8QzbLysXor7YtesPtyPmkiyoD+9+lNu2WRTlLxC/MTtUz4z5wdDyZFQHwj9xc
 SDynpkTE8GeokJIDKRp2LCUX1HFOdpEFbFguOOE5Ys01qbmZCI2DV5B0KSuUjX8PO1LT dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j5tk7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 10:39:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12F85100034;
 Tue, 28 Apr 2020 10:39:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3E5A220F39;
 Tue, 28 Apr 2020 10:39:54 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Apr
 2020 10:39:50 +0200
To: Adrian Pop <pop.adrian61@gmail.com>, Lee Jones <lee.jones@linaro.org>
References: <20200424182139.32190-1-pop.adrian61@gmail.com>
 <3efb57a1-283b-f2f0-66a4-97e88c6c02d6@st.com>
 <CAP-HsdS0rq4iCq1oqpTU=EXF8UWbfPivCJVZG-4b7jyvdHHXUw@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <39c59632-e395-f7ec-12b9-ca1d667651a6@st.com>
Date: Tue, 28 Apr 2020 10:39:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAP-HsdS0rq4iCq1oqpTU=EXF8UWbfPivCJVZG-4b7jyvdHHXUw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_04:2020-04-27,
 2020-04-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] arm: dts: stm32f769-disco: Enable
 MIPI DSI display support
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

Hi Adrian

On 4/27/20 10:05 PM, Adrian Pop wrote:
> Added lee.jones@linaro.org.
> 
> First, thank you all for taking a look at my changes!

no pb.

> 
> Hello Alex,
> 
> On Mon, Apr 27, 2020 at 11:28 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
>>
>> Hi Adrian
>>
>> On 4/24/20 8:21 PM, Adrian Pop wrote:
>>> STM32f769-disco features a 4" MIPI DSI display: add support for it.
>>>
>>> Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
>>> ---
>>
>> Commit title should be ARM: dts: stm32: ...
> 
> Will fix in next version if that's ok.
> 
>>
>> Can you explain a bit more in your commit message why do you use a
>> reserved memory pool for DMA and where this pool is located. (I assume
>> it's linked to a story of DMA and cache memory attribute on cortexM7...)
> 
> Need to look more into this, but if I remove it, /dev/fb0 is not
> available anymore and I get a warning stating:
> ...
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] Initialized stm 1.0.0 20170330 for 40016800.display-controller on minor 0
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 13 at arch/arm/mm/dma-mapping-nommu.c:50 0xc000b8ed
> CPU: 0 PID: 13 Comm: kworker/0:1 Not tainted 5.6.0-next-20200412 #23
> Hardware name: STM32 (Device Tree Support)
> Workqueue: events 0xc014fa35
> Function entered at [<c000b325>] from [<c000a487>]
> ...
> 
> When I looked in arch/arm/mm/dma-mapping-nommu.c:50, there is a comment stating:
> 
>      /*
>       * dma_alloc_from_global_coherent() may fail because:
>       *
>       * - no consistent DMA region has been defined, so we can't
>       *   continue.
>       * - there is no space left in consistent DMA region, so we
>       *   only can fallback to generic allocator if we are
>       *   advertised that consistency is not required.
>       */
> 
> This is the reason I added the reserved-memory.

Note that on cortexM7 DMA can't use cached memory. For this reason you 
have to declare a dedicated memory area for DMA with no-cache attribute.
It is done thanks to a "linux,dma" node plus a kernel config: 
CONFIG_ARM_MPU. I planed to declare this dedicated memeory region in 
sram. Can you check if add it for the same reason I explain and check if 
it works using sram ?



> 
> About the location, does it need to be hardcoded? On my board
> (STM32F769I-Disco, tftp boot) in boot log I get:
> ...
> Reserved memory: created DMA memory pool at 0xc0ef1000, size 1 MiB
> OF: reserved mem: initialized node linux,dma, compatible id shared-dma-pool
> ...
> 
>>
>> Did you try this configuration with XIP boot ?
> 
> I did not try with XIP. Currently loading zImage from tftp to memory.
> Will try with XIP as well, and get back with feedback.

Ok thanks.

> 
>>
>> regards
>> alex
>>
>>>    arch/arm/boot/dts/stm32f746.dtsi      | 34 ++++++++++++++++++
>>>    arch/arm/boot/dts/stm32f769-disco.dts | 50 +++++++++++++++++++++++++++
>>>    2 files changed, 84 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
>>> index 93c063796780..202bb6edc9f1 100644
>>> --- a/arch/arm/boot/dts/stm32f746.dtsi
>>> +++ b/arch/arm/boot/dts/stm32f746.dtsi
>>> @@ -48,6 +48,19 @@ / {
>>>        #address-cells = <1>;
>>>        #size-cells = <1>;
>>>
>>> +     reserved-memory {
>>> +             #address-cells = <1>;
>>> +             #size-cells = <1>;
>>> +             ranges;
>>> +
>>> +             linux,dma {
>>> +                     compatible = "shared-dma-pool";
>>> +                     linux,dma-default;
>>> +                     no-map;
>>> +                     size = <0x10F000>;
>>> +             };
>>> +     };
>>> +
>>>        clocks {
>>>                clk_hse: clk-hse {
>>>                        #clock-cells = <0>;
>>> @@ -75,6 +88,27 @@ clk_i2s_ckin: clk-i2s-ckin {
>>>        };
>>>
>>>        soc {
>>> +             ltdc: display-controller@40016800 {
>>> +                     compatible = "st,stm32-ltdc";
>>> +                     reg = <0x40016800 0x200>;
>>> +                     interrupts = <88>, <89>;
>>> +                     resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
>>> +                     clocks = <&rcc 1 CLK_LCD>;
>>> +                     clock-names = "lcd";
>>> +                     status = "disabled";
>>> +             };
>>> +
>>> +             dsi: dsi@40016c00 {
>>> +                     compatible = "st,stm32-dsi";
>>> +                     reg = <0x40016c00 0x800>;
>>> +                     interrupts = <98>;
>>> +                     clocks = <&rcc 1 CLK_F769_DSI>, <&clk_hse>;
>>> +                     clock-names = "pclk", "ref";
>>> +                     resets = <&rcc STM32F7_APB2_RESET(DSI)>;
>>> +                     reset-names = "apb";
>>> +                     status = "disabled";
>>> +             };
>>> +
>>>                timer2: timer@40000000 {
>>>                        compatible = "st,stm32-timer";
>>>                        reg = <0x40000000 0x400>;
>>> diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
>>> index 1626e00bb2cb..30ebbc193e82 100644
>>> --- a/arch/arm/boot/dts/stm32f769-disco.dts
>>> +++ b/arch/arm/boot/dts/stm32f769-disco.dts
>>> @@ -153,3 +153,53 @@ &usbotg_hs {
>>>        pinctrl-names = "default";
>>>        status = "okay";
>>>    };
>>> +
>>> +&dsi {
>>> +     #address-cells = <1>;
>>> +     #size-cells = <0>;
>>> +     status = "okay";
>>> +
>>> +     ports {
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +
>>> +             port@0 {
>>> +                     reg = <0>;
>>> +                     dsi_in: endpoint {
>>> +                             remote-endpoint = <&ltdc_out_dsi>;
>>> +                     };
>>> +             };
>>> +
>>> +             port@1 {
>>> +                     reg = <1>;
>>> +                     dsi_out: endpoint {
>>> +                             remote-endpoint = <&dsi_in_panel>;
>>> +                     };
>>> +             };
>>> +
>>> +     };
>>> +
>>> +     panel: panel {
>>> +             compatible = "orisetech,otm8009a";
>>> +             reg = <0>; /* dsi virtual channel (0..3) */
>>> +             reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
>>> +             status = "okay";
>>> +
>>> +             port {
>>> +                     dsi_in_panel: endpoint {
>>> +                             remote-endpoint = <&dsi_out>;
>>> +                     };
>>> +             };
>>> +     };
>>> +};
>>> +
>>> +&ltdc {
>>> +     dma-ranges;
> 
> Need to remove this, not needed and causes a warning.
> 
>>> +     status = "okay";
>>> +
>>> +     port {
>>> +             ltdc_out_dsi: endpoint {
>>> +                     remote-endpoint = <&dsi_in>;
>>> +             };
>>> +     };
>>> +};
>>>
> 
> Regards,
> Adrian
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
