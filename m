Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8F5EE2FD
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 19:24:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21796C63327;
	Wed, 28 Sep 2022 17:24:32 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52A99C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 17:24:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id g1so3784515lfu.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=8Z5zh1T5tY7YbcNGtu85v/lt9i1GBE15ciJzbg3QGl8=;
 b=v4f2dXn3NwjLAimGU1+YuNgGvvrQ5uC+PnjyYA9ihA1GIL0J5DzhFxZmRqDO786mfy
 +M1HCSHhZOCQoCvAtg45+boFV0XyHXwjFukqZmdwUV8cVDicfR+9ei3MKE6dmWNzJ065
 56EoD/IfyGopGKY630Dwe1LbRgf4Kqea0aWaAkoSoFXciait6ScPI+MtTeV6ekrbTuSp
 NPHNEnrYfSJckeuMF7juN6dek2f6MCfw/x1LBff9HVHQFKir541zeLRPcZPMfy+TX97V
 f2r9z2rYwFqIdAHWGou7gK4Dohno3jFXjWrOpVXUKkX2wboYhB3P6MwFypUUmrCGP+tz
 jHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8Z5zh1T5tY7YbcNGtu85v/lt9i1GBE15ciJzbg3QGl8=;
 b=72LkYOXvsgQ7/AS57hoCSYeHleGmC7nIjzccUKSv8ujy7aXrcaxywRgUK9lrh9v5mw
 YdkL31VImDG5VnN+KpHhOTLi6pzd8Be+C80vyXzjmRg8+WFcB3jJ5SBBBKUKWTA3mloS
 TFsH2Qiu/NXfDcSQ4n65zxTmRoZb2BUDbeDIlQJT7/cppYW910sf2v+u14gInfApdMnl
 U5llqqLrwZlX0pkPh3IfqcXh1gMU0++HtA3XtHrOo9pzgsDYmPX0Idt0JGnw8xLbzqOo
 4Bg6Pvg2YYIw+j/eUT73uY8A4wZB6o75wRH6WbiXihh0d2vt2G/6v61qdooJzHL30N71
 9IuQ==
X-Gm-Message-State: ACrzQf0sr0SeK0oYSerXf8OPj/oojH9iXiPGy2wy5NGkzz5TPWblpWC5
 lM9ruy4Uk3/FrLKPUjQ9P6sZ9w==
X-Google-Smtp-Source: AMsMyM6NmGP9e9VnZSGpZi7HlyxRbi+yzCkLknJ93JX2bggmMDRITamIb4AEiUZimqPT/oDpm02zkQ==
X-Received: by 2002:a19:6555:0:b0:49e:7d52:a4ca with SMTP id
 c21-20020a196555000000b0049e7d52a4camr14799398lfj.198.1664385869565; 
 Wed, 28 Sep 2022 10:24:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o1-20020ac24e81000000b0049478cc4eb9sm526728lfr.230.2022.09.28.10.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 10:24:28 -0700 (PDT)
Message-ID: <393eb833-0dcd-bf6c-49f3-ab8d60e3a8e5@linaro.org>
Date: Wed, 28 Sep 2022 19:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20220926225536.548139-1-marex@denx.de>
 <846bc515-bdda-6022-0611-daaa9a632e64@linaro.org>
 <e787f5b1-88e6-375c-b9e7-22db346c27be@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e787f5b1-88e6-375c-b9e7-22db346c27be@denx.de>
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

On 28/09/2022 19:01, Marek Vasut wrote:
> On 9/28/22 09:10, Krzysztof Kozlowski wrote:
> 
> Hi,
> 
> [...]
> 
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>> index a1f535cececcc..49243f447eb90 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>> @@ -49,143 +49,6 @@ patternProperties:
>>>     "^.*@[0-4],[a-f0-9]+$":
>>>       type: object
>>>   
>>> -    properties:
>>> -      reg:
>>> -        description: Bank number, base address and size of the device.
>>> -
>>
>> To be equivalent (and similar to SPI peripherals and controllers) this
>> should reference st,stm32-fmc2-ebi-props.yaml as well.
>>
>> After such reference, you can add here unevaluatedProperties:false
>> (could be same or new patch as it is not related to actual split).
> 
> I don't think I understand. I don't see any ref from the controller node 
> to its props in various SPI controllers (even if that would make sense):

Because they reference spi peripheral props...

> 
> next$ git grep qspi-nor-peripheral-props.yaml
> Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml:$id: 
> http://devicetree.org/schemas/spi/cdns,qspi-nor-peripheral-props.yaml#
> Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  - 
> $ref: cdns,qspi-nor-peripheral-props.yaml#
> 
> No ref to cdns,qspi-nor-peripheral-props.yaml in 
> Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> 
> next$ git grep tegra210-quad-peripheral-props
> Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml:$id: 
> http://devicetree.org/schemas/spi/nvidia,tegra210-quad-peripheral-props.yaml#
> Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  - 
> $ref: nvidia,tegra210-quad-peripheral-props.yaml#
> 
> No ref to nvidia,tegra210-quad-peripheral-props.yaml in 
> Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml

All your examples do it - reference spi peripheral props.

As I said, your change is now not equivalent. If any other device
appears in st,stm32-fmc2-ebi, the schema won't be applied.

Let me put it that way: you must have there additionalProperties:false
or unevaluatedProperties:false. Once you add it, you start seeing errors
leading to missing ref.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
