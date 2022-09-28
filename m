Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD375EE365
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 19:45:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40296C63327;
	Wed, 28 Sep 2022 17:45:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32AEDC03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 17:45:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0FFAF84B67;
 Wed, 28 Sep 2022 19:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664387099;
 bh=gaYUOXQ4C9X/kZ+ny8vPFL/2ozYC/B1B4psO3k3Bm2E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ApiLBC8Bw+Hw9Kzi9Tetq5/m5q+LcKwerinps3C7ZutrZnqqhFtEDeL9zJWaZbra0
 dTwgC4d+8bGlf8wDc7C5iZqa/+GDdFfMVNkpStogfjSEISpCn4uGQek0pN6RwqEmbr
 uD5JuqkeOkPHACQDWxq/71ygC9zWcAIGmyho4JTgQ5GLVDeVwm3zUGcisVit3Qxlsk
 FO4zBxoD67+ZLgoOg1dQmMlYmT6qVgwf+C3xxNx4gxdrMFf9p+HfkBX3+hKye0MlQ/
 LuAGGRyEi3Oe8TmbHzNyZCKYuCijSWc/QlMpwF53/UPUrrgejHAMdSSGYn5Cr5mz+s
 yLpARcy/xjfsQ==
Message-ID: <7adc3299-5dd6-fd43-fd5e-c22d150a328a@denx.de>
Date: Wed, 28 Sep 2022 19:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220926225536.548139-1-marex@denx.de>
 <846bc515-bdda-6022-0611-daaa9a632e64@linaro.org>
 <e787f5b1-88e6-375c-b9e7-22db346c27be@denx.de>
 <393eb833-0dcd-bf6c-49f3-ab8d60e3a8e5@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <393eb833-0dcd-bf6c-49f3-ab8d60e3a8e5@linaro.org>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/28/22 19:24, Krzysztof Kozlowski wrote:
> On 28/09/2022 19:01, Marek Vasut wrote:
>> On 9/28/22 09:10, Krzysztof Kozlowski wrote:
>>
>> Hi,
>>
>> [...]
>>
>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>>> index a1f535cececcc..49243f447eb90 100644
>>>> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>>>> @@ -49,143 +49,6 @@ patternProperties:
>>>>      "^.*@[0-4],[a-f0-9]+$":
>>>>        type: object
>>>>    
>>>> -    properties:
>>>> -      reg:
>>>> -        description: Bank number, base address and size of the device.
>>>> -
>>>
>>> To be equivalent (and similar to SPI peripherals and controllers) this
>>> should reference st,stm32-fmc2-ebi-props.yaml as well.
>>>
>>> After such reference, you can add here unevaluatedProperties:false
>>> (could be same or new patch as it is not related to actual split).
>>
>> I don't think I understand. I don't see any ref from the controller node
>> to its props in various SPI controllers (even if that would make sense):
> 
> Because they reference spi peripheral props...
> 
>>
>> next$ git grep qspi-nor-peripheral-props.yaml
>> Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml:$id:
>> http://devicetree.org/schemas/spi/cdns,qspi-nor-peripheral-props.yaml#
>> Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  -
>> $ref: cdns,qspi-nor-peripheral-props.yaml#
>>
>> No ref to cdns,qspi-nor-peripheral-props.yaml in
>> Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>>
>> next$ git grep tegra210-quad-peripheral-props
>> Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml:$id:
>> http://devicetree.org/schemas/spi/nvidia,tegra210-quad-peripheral-props.yaml#
>> Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  -
>> $ref: nvidia,tegra210-quad-peripheral-props.yaml#
>>
>> No ref to nvidia,tegra210-quad-peripheral-props.yaml in
>> Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> 
> All your examples do it - reference spi peripheral props.
> 
> As I said, your change is now not equivalent. If any other device
> appears in st,stm32-fmc2-ebi, the schema won't be applied.
> 
> Let me put it that way: you must have there additionalProperties:false
> or unevaluatedProperties:false. Once you add it, you start seeing errors
> leading to missing ref.

Is what you are trying to convey that 
Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml does ref 
spi-controller.yaml# and that one does patternProperties: ref: 
spi-peripheral-props.yaml ?

So the fix for V3 should be the following ?

diff --git 
a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml 
b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index 49243f447eb90..0448bd07f4310 100644
--- 
a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ 
b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -48,6 +48,7 @@ properties:
  patternProperties:
    "^.*@[0-4],[a-f0-9]+$":
      type: object
+    $ref: st,stm32-fmc2-ebi-props.yaml

  required:
    - "#address-cells"
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
