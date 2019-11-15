Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A566FE49C
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 19:12:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1513C36B0B;
	Fri, 15 Nov 2019 18:12:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDC89C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 18:12:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFI7qf0005169; Fri, 15 Nov 2019 19:12:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=OyaPEfrTH529l/ASlfKrbaJ4eycdKiFeNGebqnuC/6k=;
 b=Zqt5YNelE3NG9zhmyagZpXnnHLCInTVSJ49lmj9cRFrU2oLHnlAvhNpdS5iS83EozMb+
 5WAyPQqLef1LXpz+sllxTwFPdLOgRiEK6gB7N3aZLvD714pxqVbmnl92SJ75PalRG7Tf
 cgujyqBXVbTBZGBRuaahXwWdzVk9mf0peSpPRrwrnZ5yHp9V+tkWOd6gfo5focmARn1w
 vqOq5TXZ2hGUALOMkBtGHx+mcoFapXkBc2Y5rBqzlO0N5KDByUSX5f7ccPKOr0JKXjJQ
 6VfFDI2CzcLI7R0L9L9+PwfbPuVUO7KOXKsv82bZijGADVkPwkU27apjyzClgZIVu6yO Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psfnt48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 19:12:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63D3010002A;
 Fri, 15 Nov 2019 19:11:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 341E920FF9E;
 Fri, 15 Nov 2019 19:11:59 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 15 Nov
 2019 19:11:58 +0100
To: Rob Herring <robh+dt@kernel.org>
References: <20191114164104.22782-1-alexandre.torgue@st.com>
 <CAL_JsqKJZwJ0MyRp37Y-F0ujPdVEKARd8qcUCN1xmawpkiffLg@mail.gmail.com>
 <7415fff5-030c-a65b-a405-a1197e166432@st.com>
 <CAL_JsqKkbrF935JoVELqVpqj3fEwzpTn_xNuOS74uUragJZpHA@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e651ca95-f4ed-8247-0ca8-5b3ae3633cfe@st.com>
Date: Fri, 15 Nov 2019 19:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKkbrF935JoVELqVpqj3fEwzpTn_xNuOS74uUragJZpHA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_05:2019-11-15,2019-11-15 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: interrupt-controller:
 Convert stm32-exti to json-schema
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



On 11/15/19 6:41 PM, Rob Herring wrote:
> On Fri, Nov 15, 2019 at 11:28 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
>>
>>
>>
>> On 11/14/19 6:18 PM, Rob Herring wrote:
>>> On Thu, Nov 14, 2019 at 10:41 AM Alexandre Torgue
>>> <alexandre.torgue@st.com> wrote:
>>>>
>>>> Convert the STM32 external interrupt controller (EXTI) binding to DT
>>>> schema format using json-schema.
>>>>
>>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>>> ---
>>>>
>>>> Hi Rob,
>>>>
>>>> I planned to use "additionalProperties: false" for this schema but as I add a
>>>> property under condition, I got an error (property added under contion seems
>>>> to be detected as an "additional" property and then error is raised).
>>>>
>>>> Is there a way to fix that ?
>>>
>>> See below.
>>>
>>>>
>>>> regards
>>>> Alex
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
>>>> deleted file mode 100644
>>>> index cd01b2292ec6..000000000000
>>>> --- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
>>>> +++ /dev/null
>>>> @@ -1,29 +0,0 @@
>>>> -STM32 External Interrupt Controller
>>>> -
>>>> -Required properties:
>>>> -
>>>> -- compatible: Should be:
>>>> -    "st,stm32-exti"
>>>> -    "st,stm32h7-exti"
>>>> -    "st,stm32mp1-exti"
>>>> -- reg: Specifies base physical address and size of the registers
>>>> -- interrupt-controller: Indentifies the node as an interrupt controller
>>>> -- #interrupt-cells: Specifies the number of cells to encode an interrupt
>>>> -  specifier, shall be 2
>>>> -- interrupts: interrupts references to primary interrupt controller
>>>> -  (only needed for exti controller with multiple exti under
>>>> -  same parent interrupt: st,stm32-exti and st,stm32h7-exti)
>>>> -
>>>> -Optional properties:
>>>> -
>>>> -- hwlocks: reference to a phandle of a hardware spinlock provider node.
>>>> -
>>>> -Example:
>>>> -
>>>> -exti: interrupt-controller@40013c00 {
>>>> -       compatible = "st,stm32-exti";
>>>> -       interrupt-controller;
>>>> -       #interrupt-cells = <2>;
>>>> -       reg = <0x40013C00 0x400>;
>>>> -       interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
>>>> -};
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
>>>> new file mode 100644
>>>> index 000000000000..39be37e1e532
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
>>>> @@ -0,0 +1,82 @@
>>>> +# SPDX-License-Identifier: GPL-2.0
>>>
>>> If ST has copyright on the old binding, can you add BSD here.
>>>
>>
>> I will.
>>
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/interrupt-controller/st,stm32-exti.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: STM32 External Interrupt Controller Device Tree Bindings
>>>> +
>>>> +maintainers:
>>>> +  - Alexandre Torgue <alexandre.torgue@st.com>
>>>> +  - Ludovic Barre <ludovic.barre@st.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - items:
>>>> +        - enum:
>>>> +          - st,stm32-exti
>>>> +          - st,stm32h7-exti
>>>> +      - items:
>>>> +        - enum:
>>>> +          - st,stm32mp1-exti
>>>> +        - const: syscon
>>>> +
>>>> +  "#interrupt-cells":
>>>> +    const: 2
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupt-controller: true
>>>> +
>>>> +  hwlocks:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Reference to a phandle of a hardware spinlock provider node.
>>>> +
>>>> +required:
>>>> +  - "#interrupt-cells"
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupt-controller
>>>> +
>>>> +allOf:
>>>> +  - $ref: /schemas/interrupt-controller.yaml#
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - st,stm32-exti
>>>> +              - st,stm32h7-exti
>>>> +    then:
>>>> +      properties:
>>>> +        interrupts:
>>>> +          allOf:
>>>> +            - $ref: /schemas/types.yaml#/definitions/uint32-array
>>>
>>> Standard property, doesn't need a type. You just need 'maxItems' or an
>>> 'items' list if the index is not meaningful. This appears to be the
>>> former case.
>>
>> ok
>>
>>>
>>>> +          description:
>>>> +            Interrupts references to primary interrupt controller
>>>> +      required:
>>>> +        - interrupts
>>>
>>> You can move the definition to the main section as you only need
>>> 'required' here. That should fix your additionalProperties issue.
>>>
>> Doing that it fails as I don't have interrupts define for mp1
>> compatible. Maybe I missed something ?
> 
> Like this:
> 
> properties:
>    ...
>    interrupts:
>      maxItems: ??
>      minItems: ??
> 
> allOf:
>    - $ref: /schemas/interrupt-controller.yaml#
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - st,stm32-exti
>                - st,stm32h7-exti
>      then:
>        required:
>          - interrupts
> 

Yes it is better :). Let me send the V2

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
