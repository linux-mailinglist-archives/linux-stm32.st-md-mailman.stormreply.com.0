Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 187FC5EE278
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 19:01:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC157C63327;
	Wed, 28 Sep 2022 17:01:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE0FEC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 17:01:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7C75D82AE2;
 Wed, 28 Sep 2022 19:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664384478;
 bh=R662rqzf5LpcAoW1egPdR05HiSRoulQxcfy+h5YeO2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qESkC8I+PANyJZsBKFTVUzkdPRkKywaRRMJGWMkiElqq8E7lLsvcACiNJ3+kQEVsv
 4DxjxDlRqdmg9FT/YV5mm/Eo9c8eXse65aw2s2GSAEirIUTcJmG3Sr+SU0BPeJLZ6/
 kOv7EAC6spKVI5J8jIFfOm1rkdp/CEi5yaImy7oNC55m4gV3hpuWSaPmMD27vz2r5P
 j4YfLsnWv+I0ux2CaK5aSIwTelxob0pyicIh/9ZOdIOIige+J8fXo+8Wd4q2PFJFt+
 l3FXvVGFBxY+uv7pMfDUIa7kRRb8ySC7wX4s46aLuVqCCv5EBQDpMvk3K/h3zdM1kL
 Zjo1ig6STKLCQ==
Message-ID: <e787f5b1-88e6-375c-b9e7-22db346c27be@denx.de>
Date: Wed, 28 Sep 2022 19:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220926225536.548139-1-marex@denx.de>
 <846bc515-bdda-6022-0611-daaa9a632e64@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <846bc515-bdda-6022-0611-daaa9a632e64@linaro.org>
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

On 9/28/22 09:10, Krzysztof Kozlowski wrote:

Hi,

[...]

>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> index a1f535cececcc..49243f447eb90 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> @@ -49,143 +49,6 @@ patternProperties:
>>     "^.*@[0-4],[a-f0-9]+$":
>>       type: object
>>   
>> -    properties:
>> -      reg:
>> -        description: Bank number, base address and size of the device.
>> -
> 
> To be equivalent (and similar to SPI peripherals and controllers) this
> should reference st,stm32-fmc2-ebi-props.yaml as well.
> 
> After such reference, you can add here unevaluatedProperties:false
> (could be same or new patch as it is not related to actual split).

I don't think I understand. I don't see any ref from the controller node 
to its props in various SPI controllers (even if that would make sense):

next$ git grep qspi-nor-peripheral-props.yaml
Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml:$id: 
http://devicetree.org/schemas/spi/cdns,qspi-nor-peripheral-props.yaml#
Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  - 
$ref: cdns,qspi-nor-peripheral-props.yaml#

No ref to cdns,qspi-nor-peripheral-props.yaml in 
Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml

next$ git grep tegra210-quad-peripheral-props
Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml:$id: 
http://devicetree.org/schemas/spi/nvidia,tegra210-quad-peripheral-props.yaml#
Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml:  - 
$ref: nvidia,tegra210-quad-peripheral-props.yaml#

No ref to nvidia,tegra210-quad-peripheral-props.yaml in 
Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml

What am I missing here ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
