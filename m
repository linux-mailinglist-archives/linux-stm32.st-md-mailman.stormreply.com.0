Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57A55F5D7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 07:54:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3682FC5F1EF;
	Wed, 29 Jun 2022 05:54:36 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 829ADC5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 05:54:34 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id pk21so30385095ejb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oHw/+xoj6M1ZZO8v925Uv2hnFfP6UJZ/2begt2QtJMw=;
 b=JNAnBoXi2m7HwUMHD+Kl0YKox5Ft9n7pvymCrPBxw9eL5lkcJH6Fo17IHjKPjUMEXX
 e8PPfNme88MfJGJ5onIB2O1yOMlxzax8j9bmCPcP66mytFV0BrbeTol1VDZH8hHLb1pS
 GrzLj4CX+QmzX8kwo3H26ZsEzdJJa5bmiepmRAI1q0xovkyeLj87wpazuljXzN7cAPvb
 avmdbMpTks9P4Lb8U3Y1NFK9gT135/URjogUg7q1fRX26NsfKt6YL9YipdorHHNR3JYR
 2GYX0CWYIZedB1ze4iPiw9DPBD2Oy9gHza1W1cTylAGiOVbSvOFuCf77MY4FqTUneD8P
 WSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHw/+xoj6M1ZZO8v925Uv2hnFfP6UJZ/2begt2QtJMw=;
 b=0Was3nXbqeYltGYqO5svnXmDDNMIwBv2kF96w81kzcujP85EDlHjBJyFmKRpc5oGKt
 F0iLVvkGV1gRnu2qz0kZzlGokUJ8u9Qv3lTp68l3Z1nauhLY2VN9xK/in2qOZ6WXgaKe
 fui/XBXlViVOxb2SYPn7+U08CGL3dC9Tirm0bWTTk/LhZybLuA9Hh5zGsMmenr/R5VR0
 ImmnH9mCFh2dqtgZBnEV3wRxQroX+OgoEDisWWSX0uHnh1q+j2N848Ej+QZabgmMFrQm
 C/R7C11qfat6ebchgVJB1/E9FXjMOJnn693JfDOoaoU1RathoeUAK0RvvTr5sEAI1S7R
 Wuhw==
X-Gm-Message-State: AJIora8wMvAUlds7SaF5E+1+5VNkrcYvNQXS7ctAVJjK2fm8eqPofZsA
 zw/LX1OTDqzDxSFWdhbfBRCKRg==
X-Google-Smtp-Source: AGRyM1uVMnNRwFRWLEyAWsZnCgUwfDa5H0WPXvalL8dPym5vOfaRVZAaEOX474g1jOofoa+0SDxCTQ==
X-Received: by 2002:a17:907:1612:b0:722:e1b9:45d0 with SMTP id
 hb18-20020a170907161200b00722e1b945d0mr1601638ejc.439.1656482074020; 
 Tue, 28 Jun 2022 22:54:34 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 t23-20020a170906609700b006fed062c68esm7394505ejj.182.2022.06.28.22.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 22:54:33 -0700 (PDT)
Message-ID: <f86dd47c-0fc5-6c93-a49e-534610d10c49@linaro.org>
Date: Wed, 29 Jun 2022 07:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, robh+dt@kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
 <20220624155413.399190-2-fabrice.gasnier@foss.st.com>
 <ddb0e946-c955-1404-c1cd-c2548f34ec35@linaro.org>
 <845d6817-d2e4-7925-f7f5-da1102514636@foss.st.com>
 <286633b2-43d2-655e-b3f1-54bf5c7a4a21@linaro.org>
 <6ef58f1f-ee8a-b060-6fda-d1388b3ede6d@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6ef58f1f-ee8a-b060-6fda-d1388b3ede6d@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: usb: typec: add bindings
 for stm32g0 controller
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

On 28/06/2022 19:01, Fabrice Gasnier wrote:

>>>>> +  connector:
>>>>> +    type: object> +    allOf:
>>>>> +      - $ref: ../connector/usb-connector.yaml#
>>>>
>>>> Full path, so /schemas/connector/...
>>>>
>>>> unevaluatedProperties: false
> 
> Hi Krzysztof,
> 
> I Just figured out usb-connector schema has "additionalProperties:
> true". Adding "unevaluatedProperties: false" here seem to be useless.
> At least at my end, this make any dummy property added in the example
> below to be validated without error by the schema.

No, it's expected. The common schema allows additional properties. You
specific device schema (including common) should not allow anything more
and this is expressed like you mentioned.

However depending on the version of dtschema, the
unevaluatedProperties:false might still be not implemented. AFAIK, Rob
added it quite recently.

> 
> Should this be updated in usb-connector.yaml instead ?

No

> 
> Shall I omit it here in the end ?

You need to add here unevaluatedProperties: false (on the level of this
$ref)

> 
>>>
>>> ack,
>>>
>>>>
>>>>> +
>>>>> +  firmware-name:
>>>>> +    description: |
>>>>> +      Should contain the name of the default firmware image
>>>>> +      file located on the firmware search path
>>>>> +
>>>>> +  wakeup-source: true
>>>>> +  power-domains: true
>>>>
>>>> maxItems
>>>
>>> Do you mean maxItems regarding the "power-domains" property ?
>>
>> Yes.
>>
>>> This will depend on the user platform, where it's used as an I2C device.
>>> So I'm not sure this can / should be specified here.
>>> Could please you clarify ?
>>
>> Then maybe this property is not valid here. Power domains usually are
>> used for blocks of a SoC, having common power source and power gating.
>> In your case it looks much more like a regulator supply.
> 
> This property is used in our implementation to refer to SOC PM domain
> for GPIO that is used to wakeup the system. This isn't only a regulator,
> this PM domain serves various IPs such as I2C, GPIO, UART... (it manages
> regulator and clocks used in low power).
> 
> I can limit to 1 item if this is fine for you ?
> 
> e.g. maxItems: 1

Yes, it's good (assuming it is true :) ).

> 
>>
>>>
>>>>
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - interrupts
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +    i2c5 {
>>>>
>>>> Just "i2c"
>>>
>>> ack,
>>>
>>>>
>>>>> +      #address-cells = <1>;
>>>>> +      #size-cells = <0>;
>>>>> +
>>>>> +      stm32g0@53 {
>>>>
>>>> Generic node name describing class of the device.
>>>
>>>
>>> I wasn't aware of generic node name for an I2C device (not talking of
>>> the controller). I may have missed it.
>>>
>>> Could you please clarify ?
>>
>> The class of a device is not a I2C device. I2C is just a bus. For
>> example the generic name for Power Management IC connected over I2C
>> (quite common case) is "pmic".
>>
>> For USB HCD controllers the generic name is "usb". For USB
>> ports/connectors this is "connector". So what is your hardware?
>> "interface" is a bit too unspecific to figure it out.
> 
> Thanks, I better understand your point now.
> 
> A common definition for the hardware here could be "USB Type-C PD
> controller". I'll improve this schema title by the way.
> 
> I had a quick look in various .dts files. I could find mainly:
> - typec-portc@hh
> - usb-typec@hh
> - typec@hh
> 
> Not sure if this has already been discussed in other reviews, it lacks
> the "controller" idea in the naming IMHO.
> Perhaps something like "typec-pd-controller" or
> "usb-typec-pd-controller" could be used here ?
> 
> Otherwise, I could adopt the shortest "typec" name if it's fine for you ?

typec sounds good.

> 
>>
>>>
>>>>
>>>>> +        compatible = "st,stm32g0-typec";
>>>>> +        reg = <0x53>;
>>>>> +        /* Alert pin on GPIO PE12 */
>>>>> +        interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
>>>>> +        interrupt-parent = <&gpioe>;
>>>>> +
>>>>> +        /* Example with one type-C connector */
>>>>> +        connector {
>>>>> +          compatible = "usb-c-connector";
>>>>> +          label = "USB-C";
>>>>> +
>>>>> +          port {
>>>>
>>>> This does not look like proper schema of connector.yaml.
>>>
>>> This refers to graph.yaml [1], where similar example is seen [2].
>>>
>>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml#L79
>>>
>>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml#L207
>>
>> Just look at the usb-conector schema. It's different. You miss ports.
>> Maybe other properties as well.
> 
> 
> (I may miss something, and got confused around port/ports earlier)
> The graph properties seems to allow both the 'port' and 'ports' syntax
> thanks to the graph definition.
> The "port" syntax is also used in other typec controller schemas.
> 
> There's only one port in this example. Of course other example could use
> two or more ports (like for USB HS / SS / aux) which would require using
> the "ports" node (with port@0/1/2 childs).
> 
> I can adopt the "ports" node if you prefer. As I see it just doesn't
> bring much in the current example (The only drawback is this adds one
> indentation/node level w.r.t. the bellow example, so not a big deal).

The graph schema allows, but you include here usb-connector schema which
requires to put it under "ports". You should not use it differently, so
I expect here "ports" property, even with one port.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
