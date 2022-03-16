Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4864DAEC3
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 12:17:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07660C60464;
	Wed, 16 Mar 2022 11:17:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 043EDC5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 11:17:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nUReM-0003ml-JI; Wed, 16 Mar 2022 12:17:06 +0100
Message-ID: <e888d777-71f8-8ddc-7590-53e181ae0ad4@pengutronix.de>
Date: Wed, 16 Mar 2022 12:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Etienne Carriere <etienne.carriere@linaro.org>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <CAN5uoS9F1cjN+WLks1S=GzA1SHw=o-ibFbu-VsUzJ4NydAkAdw@mail.gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAN5uoS9F1cjN+WLks1S=GzA1SHw=o-ibFbu-VsUzJ4NydAkAdw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 12/13] ARM: dts: stm32: enable optee
 firmware and SCMI support on STM32MP13
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

Hello Etienne,

On 16.03.22 12:01, Etienne Carriere wrote:
> Hi Ahmad,
> 
>> Helo Gabriel,
>>
>> On 03.03.22 14:09, Gabriel FERNANDEZ wrote:
>>>
>>> On 2/25/22 16:13, Ahmad Fatoum wrote:
>>>> Hello Gabriel,
>>>>
>>>> On 25.02.22 14:31, gabriel.fernandez@foss.st.com wrote:
>>>>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>>>> +    firmware {
>>>>> +        optee {
>>>>> +            method = "smc";
>>>>> +            compatible = "linaro,optee-tz";
>>>>> +        };
>>>>> +
>>>>> +        scmi: scmi {
>>>>> +            compatible = "linaro,scmi-optee";
>>>> This compatible doesn't seem to be documented upstream. I am looking at v5.17-rc5.
>>>> Do you have a reference detailing the difference between this conduit and
>>>> plain arm,scmi-smc (as used with TF-A on the STM32MP151).
>>>>
>>>> Cheers,
>>>> Ahmad
>>>
>>> Hi
>>>
>>> Ahmad,
>>>
>>> it's on going.
>>>
>>> https://lore.kernel.org/linux-arm-kernel/20211029102118.GG6526@e120937-lin/T/#mf46c83f0aadce3061ee93fa22159405f38d881a0
>>
>> I've found that thread in the meantime and got some clarification on why a new
>> transport for OP-TEE was added. One question I still have though is why make
>> this transport the default for STM32MP13x instead of using SCMI over SMC like
>> you do for STM32MP15x. OP-TEE could still be made to service SCMI over SMC
>> and it would allow people employing TF-A as SCMI provider an easier migration
>> to the newer SoC.
>>
> 
> Just to rephrase a bit what's being said in the referred mail thread:
> On STM32MP13x, there are SCMI messages that must be processed inside a
> thread execution context in the SCMI server. There is no standard SMC
> function ID defined that the SCMI/SMC transport could use for that
> purpose. OP-TEE provides such a threaded context. Therefore STM32MP13x
> explicitly expects SCMI services based on SCMI/OP-TEE transport, not
> SCMI/SMC transport.

I see. Users can still override it as they see fit and I understand that
ST would prefer to have the "fully-featured" boot chain be the default
for the new SoC. So no concerns from my side.

Thanks a lot for the clarification!

Cheers,
Ahmad

> 
> Best regards,
> etienne
> 
>> Cheers,
>> Ahmad
> 
>>
>>>
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +            linaro,optee-channel-id = <0>;
>>>> +            shmem = <&scmi_shm>;
>>>> +
>>>> +            scmi_clk: protocol@14 {
>>>> +                reg = <0x14>;
>>>> +                #clock-cells = <1>;
>>>> +            };
>>>> +
>>>> +            scmi_reset: protocol@16 {
>>>> +                reg = <0x16>;
>>>> +                #reset-cells = <1>;
>>>> +            };
>>>> +        };
>>>> +    };
>>>>       clocks {
>>>>           clk_axi: clk-axi {
>>>>               #clock-cells = <0>;
>>>
>>
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
