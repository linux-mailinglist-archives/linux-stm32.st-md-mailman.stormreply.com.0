Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3295EE3E8
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 20:08:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A28CC63327;
	Wed, 28 Sep 2022 18:08:16 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53EC0C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 18:08:15 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q17so15195797lji.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=dz47N9d43oVIDQOrhiG/PtfjNHz7S7woh4wQVpU2xwE=;
 b=oDc3AIyuYdhxjFfYM7g87t9+40ZKmtqXS04ytcQNYm06KN0ZCEhDZtz0wu9a2iLxU0
 tTBTY5BZcZNhUVZzGGSAgUCz3EfiJA9yssljOwkL5g+pFw1eKp5CRVrY54J4ThiO+Z6N
 AD6J4qpLMh4W65tiDTSrl6hqa2fwYEd1hqmsQbJnGz/3Dl/zhpjhM0ORLochuSOBXoNO
 nM89jDy0TJPTwzygSDE9brfnSeEr2ccUnZv9LijIm+8d4AiD9VDa6lUvVxZPvlTc6Ary
 PGmwezJ7qGOZEfbGOuloU6dr/wGjfvlRB+iS9zrmRWGbB3PglD+wE6yuseYfTGba0Ow2
 DjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dz47N9d43oVIDQOrhiG/PtfjNHz7S7woh4wQVpU2xwE=;
 b=H1612nAXe+GzMHiurlDcrdu3wO/8QyE7IB9mg09b/VK3F/UtNemP5TOXwrsGhnr/ip
 ehoyxl5e+rbMrDKzgu7s7/Z2ccVgARoatDZnXtPRUBZkKji6VolUIONKak3iy86CUJOU
 mTlh9+MpFcTign/gNInJNGAcMlcPKW/5uWZT7yp29/sLUVTogHTwjJxV/6+ReZd+zT+p
 wMyhUIFS6quJj1febbB7zjeokmHzA9Igkk+OjsTr+C47Cqurw6uZG4PRtu/nfwW7Q23T
 jpv27eC6Cf3Zxnu0yI9iYr/lGbyhT+CAMBAAm3je7zo7W6T5F95HYQFaETveUc2KNUMR
 oLuQ==
X-Gm-Message-State: ACrzQf3wrtdCMjC8AXXjnWaRLrq/gcFGeE8gDTxRGw82sk97hgpNe+L2
 NKW9P2pJi44H+cYeOB3lXDdwDw==
X-Google-Smtp-Source: AMsMyM50qlpmjWeaPPeYAEU0LVKsZs3urOezw0hiFOvIYvc2SiLCI3y2ptVXbtWEbEUan4bQKmLVVg==
X-Received: by 2002:a2e:bd84:0:b0:261:e43c:bac3 with SMTP id
 o4-20020a2ebd84000000b00261e43cbac3mr12670372ljq.198.1664388494581; 
 Wed, 28 Sep 2022 11:08:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t12-20020a2e954c000000b00268335eaa8asm508314ljh.51.2022.09.28.11.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 11:08:14 -0700 (PDT)
Message-ID: <9cdb0eb8-db72-a77b-e377-1103e12c2c85@linaro.org>
Date: Wed, 28 Sep 2022 20:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20220926225536.548139-1-marex@denx.de>
 <846bc515-bdda-6022-0611-daaa9a632e64@linaro.org>
 <e787f5b1-88e6-375c-b9e7-22db346c27be@denx.de>
 <393eb833-0dcd-bf6c-49f3-ab8d60e3a8e5@linaro.org>
 <7adc3299-5dd6-fd43-fd5e-c22d150a328a@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7adc3299-5dd6-fd43-fd5e-c22d150a328a@denx.de>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: memory-controller: st,
 stm32: Split off MC properties
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

On 28/09/2022 19:44, Marek Vasut wrote:
> On 9/28/22 19:24, Krzysztof Kozlowski wrote:
>> On 28/09/2022 19:01, Marek Vasut wrote:
>>> On 9/28/22 09:10, Krzysztof Kozlowski wrote:
>>>
>>> Hi,
>>>
>>> [...]
>>>
>>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>>>> index a1f535cececcc..49243f447eb90 100644
>>>>> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>>>> @@ -49,143 +49,6 @@ patternProperties:
>>>>>      "^.*@[0-4],[a-f0-9]+$":
>>>>>        type: object
>>>>>    
>>>>> -    properties:
>>>>> -      reg:
>>>>> -        description: Bank number, base address and size of the device.
>>>>> -
>>>>
>>>> To be equivalent (and similar to SPI peripherals and controllers) this
>>>> should reference st,stm32-fmc2-ebi-props.yaml as well.
>>>>
>>>> After such reference, you can add here unevaluatedProperties:false
>>>> (could be same or new patch as it is not related to actual split).
>>>
>>> I don't think I understand. I don't see any ref from the controller node
>>> to its props in various SPI controllers (even if that would make sense):
>>
>> Because they reference spi peripheral props...
>>
>>>
>>> next$ git grep qspi-nor-peripheral-props.yaml
>>> Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml:$id:
>>> http://devicetree.org/schemas/spi/cdns,qspi-nor-peripheral-props.yaml#
>>> Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  -
>>> $ref: cdns,qspi-nor-peripheral-props.yaml#
>>>
>>> No ref to cdns,qspi-nor-peripheral-props.yaml in
>>> Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>>>
>>> next$ git grep tegra210-quad-peripheral-props
>>> Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml:$id:
>>> http://devicetree.org/schemas/spi/nvidia,tegra210-quad-peripheral-props.yaml#
>>> Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  -
>>> $ref: nvidia,tegra210-quad-peripheral-props.yaml#
>>>
>>> No ref to nvidia,tegra210-quad-peripheral-props.yaml in
>>> Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
>>
>> All your examples do it - reference spi peripheral props.
>>
>> As I said, your change is now not equivalent. If any other device
>> appears in st,stm32-fmc2-ebi, the schema won't be applied.
>>
>> Let me put it that way: you must have there additionalProperties:false
>> or unevaluatedProperties:false. Once you add it, you start seeing errors
>> leading to missing ref.
> 
> Is what you are trying to convey that 
> Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml does ref 
> spi-controller.yaml# and that one does patternProperties: ref: 
> spi-peripheral-props.yaml ?

Yes.

> 
> So the fix for V3 should be the following ?

patternProperties:
  "^.*@[0-4],[a-f0-9]+$":
    type: object
    $ref: st,stm32-fmc2-ebi-props.yaml
    unevaluatedProperties: false


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
