Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B4654230
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 14:55:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33057C6904D;
	Thu, 22 Dec 2022 13:55:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FF8DC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 13:55:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 948CFB81D61;
 Thu, 22 Dec 2022 13:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1619C433D2;
 Thu, 22 Dec 2022 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671717355;
 bh=tc1btOSbBaMZEMUX8Y0A0tpBlXbf7iZKeoWMZ5GMRBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h/xcKtKwDWcBW1YfeRk2m2xy8oi1Ssc4a9WJ+kG01SsNnJZwCP6fAHEX6VoKdvaCg
 /y3sfpROcHfrC4Z38FRHBCkKkTxUOfOGOPb03bfR/oQQu/f5kztn6ZZDnGenib5vc7
 rU9IzQTAC+Em18Dx7RK429CbmeE+SbyRnkeAvPnZNvmJzY8fGsN/KHl09vh4X3EdhD
 90vv/XEO1v/G4S8GIepOW/fteqE8ksRDDaIosyrEDbFtCd5MZjTj/8uHwHaowSV5Qw
 PkgCQyfF2BptVktsHGQRlinrz54K/SIrQx+JT1F43sZ9tJJD1m8D2tFBv8sY0QZjhs
 Mq4g+Whd2wQRA==
Message-ID: <e2974f65-fe56-2ac2-5b03-bc8ffe14b554@kernel.org>
Date: Thu, 22 Dec 2022 14:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-3-gatien.chevallier@foss.st.com>
 <d55cae92-0c4f-f957-4c7b-bdf7b9b6006a@kernel.org>
 <f785a9f9-a931-a4b0-5d97-d9e8ce24065a@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <f785a9f9-a931-a4b0-5d97-d9e8ce24065a@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 2/7] dt-bindings: bus: add STM32
	System Bus
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

On 22/12/2022 14:39, Gatien CHEVALLIER wrote:
> Hello,
> 
> On 12/22/22 11:24, Krzysztof Kozlowski wrote:
>> On 21/12/2022 18:30, Gatien Chevallier wrote:
>>> Document STM32 System Bus. This bus is intended to control firewall
>>> access for the peripherals connected to it.
>>>
>>> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel
> As it is based on Oleksii's patchset and older threads:
> [1]: 
> https://lore.kernel.org/all/20190318100605.29120-1-benjamin.gaignard@st.com/
> [2]: 
> https://lore.kernel.org/all/20200701132523.32533-1-benjamin.gaignard@st.com/
> 
> I wanted to include people that have already been included or 
> participated in these.
> 
> I'm sorry I did miss/added some (extra) people. I will double-check for 
> next patchset version.

Include people pointed by maintainers, they are not "extra". They are
basic/required. It's worth to include additionally people from original
feature-domain work, but as extra, not replacing get_maintainers!

> 
>>
>>> ---
>>>   .../devicetree/bindings/bus/st,sys-bus.yaml   | 88 +++++++++++++++++++
>>>   1 file changed, 88 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/bus/st,sys-bus.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/bus/st,sys-bus.yaml b/Documentation/devicetree/bindings/bus/st,sys-bus.yaml
>>> new file mode 100644
>>> index 000000000000..9c0e86612695
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/bus/st,sys-bus.yaml
>>> @@ -0,0 +1,88 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/bus/stm32,sys-bus.yaml
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title:  STM32 System Bus
>>
>> Only one space.
>>
> 
> Ack. I already pushed a V2, that is now outdated with your review, where 
> this error is fixed.
> 
>>> +
>>> +description: |
>>> +  The STM32 System Bus is an internal bus to which some internal peripherals
>>> +  are connected. STM32 System Bus integrates a firewall controlling access to each
>>> +  device. This bus prevents non-accessible devices to be probed.
>>> +
>>> +  To see which peripherals are securable, please check the SoC reference manual.
>>> +
>>> +maintainers:
>>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/feature-controllers/feature-domain-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - st,stm32mp13-sys-bus
>>> +      - st,stm32mp15-sys-bus
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  '#feature-domain-cells':
>>
>> Use consistent quotes, either ' or "
> 
> Ack, will change in V3.
> 
>>
>>> +    minItems: 1
>>
>> No. Cells must be const. This does not match cells at all...
>>
> 
> Ack, will change to const in V3. What do imply by saying it does not 
> match? 

cells do not have items, it's not an array but a number.

> Note that I've changed it to "minimum" in V2.

No, it must be const.



> 
>>> +
>>> +  ranges: true
>>> +
>>> +  feature-domain-controller: true
>>> +
>>> +patternProperties:
>>> +  "^.*@[0-9a-f]+$":
>>> +    description: Devices attached to system bus
>>> +    type: object
>>> +    properties:
>>> +      feature-domains:
>>> +        $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains
>>
>> maxItems
> 
> I don't think setting a max here is relevant as there can be numerous 
> feature-domains referenced.

Then pick some high, reasonable number with minItems: 1.

> 
> Maybe a min?
> 
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - feature-domain-controller
>>> +  - '#feature-domain-cells'
>>> +  - ranges
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    // In this example,
>>> +    // - the foo1 device refers to etzpc as his domain controller.
>>> +    // - same goes for foo2.
>>> +    // Access rights are verified before creating devices.
>>> +
>>> +    etzpc: etzpc@5c007000 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>
> 
> Ack, will change to "etzpc: bus@5c007000" in V3
> 
>>> +        compatible = "st,stm32mp15-sys-bus";
>>> +        reg = <0x5c007000 0x400>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +        feature-domain-controller;
>>> +        #feature-domain-cells = <1>;
>>> +
>>> +        foo1: foo@1000000 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> Here, if I use real peripherals, I have an issue with the dependency to 
> YAML files. The feature-domains property is not defined in their 
> bindings. Therefore, the dt_binding_check fails on peripherals whose 
> YAML declare "additionalProperties: false" because the link to the 
> feature domain controller bindings does not exist.

Then your patchset is not complete and not correct, right? The binding
for the real example which you have in real world, should also allow it
in such
Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
