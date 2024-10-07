Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA909993320
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 18:26:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 641E9C6DD94;
	Mon,  7 Oct 2024 16:26:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 713E7C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 16:26:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497D1ZBM032450;
 Mon, 7 Oct 2024 18:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LRtzkv5xMyDZ1ZZLcrbVYBvEEe9KziXBz/FhHNmAcJM=; b=ygzSG/wY3z2iznBM
 /mexUEQ3YUW+I4IlY2806Bbs4giEc1T9HOLXuY3Ww96cTzKinNfKcXo1uql0OkkR
 a1jtGmhUyQ7vzH1kUb+7n89CnnhlZEDppookgTtf2M9l6+FXgJt+KqpphRDZxHiq
 lcHTzxiwDySPTEozz3SmP+i2bzgU7YEDzpodtTvgYMGc0Y52EKhxLpLdqTLmjftS
 CvQgJ3FXIFEP1535dnZYIE/KzXDhh3+bdwXCcsux+bdyU4MS+iv2ErvYMMuBg7qL
 y1mXfM0pNa+DsexGxChb9boSvflwE5y0VxF7bBqLWKD5UiV5WhURxYfwyqNwqBoe
 nwapog==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xtq1k7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 18:25:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1066040048;
 Mon,  7 Oct 2024 18:23:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 010AE238C4F;
 Mon,  7 Oct 2024 18:22:58 +0200 (CEST)
Received: from [10.48.86.225] (10.48.86.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 18:22:56 +0200
Message-ID: <c425507f-5e78-408e-8a8d-fe02412a76e7@foss.st.com>
Date: Mon, 7 Oct 2024 18:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Olivia Mackall
 <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Marek Vasut <marex@denx.de>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-2-gatien.chevallier@foss.st.com>
 <ec3cda71-57d0-4ec1-b9d8-62381667f7d6@linaro.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ec3cda71-57d0-4ec1-b9d8-62381667f7d6@linaro.org>
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: rng: add st,
	stm32mp25-rng support
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



On 10/7/24 17:00, Krzysztof Kozlowski wrote:
> On 07/10/2024 15:27, Gatien Chevallier wrote:
>> Add RNG STM32MP25x platforms compatible. Update the clock
>> properties management to support all versions.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> You CC-ed an address, which suggests you do not work on mainline kernel
> or you do not use get_maintainers.pl/b4/patman. Regardless of the
> reason, process needs improvement: please CC correct address.
> 

Hi,

I'm using get_maintainers.pl so I'll check why I have an issue.

>> ---
>>   .../devicetree/bindings/rng/st,stm32-rng.yaml | 41 +++++++++++++++++--
>>   1 file changed, 38 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> index 340d01d481d1..c92ce92b6ac9 100644
>> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> @@ -18,12 +18,19 @@ properties:
>>       enum:
>>         - st,stm32-rng
>>         - st,stm32mp13-rng
>> +      - st,stm32mp25-rng
>>   
>>     reg:
>>       maxItems: 1
>>   
>>     clocks:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
> 
> Missing minItems
> 

Ok, will add in V2

>> +    items:
>> +      - const: rng_clk
>> +      - const: rng_hclk
> 
> Drop _clk and come with some reasonable names, e.g. "core" and "bus"?
> 

Sure, makes sense. Will change in V2.

>>   
>>     resets:
>>       maxItems: 1
>> @@ -57,15 +64,43 @@ allOf:
>>         properties:
>>           st,rng-lock-conf: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp25-rng
>> +    then:
>> +      properties:
>> +        clocks:
>> +          description: >
>> +            RNG bus clock must be named "rng_hclk". The RNG kernel clock
>> +            must be named "rng_clk".
> 
> Drop description, useless.
> 
> Missing minItems
> 

Ok, will update in V2

>> +          maxItems: 2
>> +      required:
>> +        - clock-names
>> +    else:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
> 
> Missing constrain for clock-names.
> 
>> +
>>   additionalProperties: false
>>   
>>   examples:
>>     - |
>> -    #include <dt-bindings/clock/stm32mp1-clks.h>
> 
> Why?
> 
>>       rng@54003000 {
>>         compatible = "st,stm32-rng";
>>         reg = <0x54003000 0x400>;
>> -      clocks = <&rcc RNG1_K>;
>> +      clocks = <&rcc 124>;
> 
> Why?
> 
> 

I have an issue with the generated st,stm32-rng.example.dts example.
Because there are 2 binding files included, I have a collision with
clock bindings names between the "dt-bindings/clock/stm32mp1-clks.h"
and the "dt-bindings/clock/st,stm32mp25-rcc.h" files. For example:
CK_MCO1 or CK_SCMI_HSE. I replaced the bindings with numbers
to avoid this conflict.

If you think this binding update does not need the addition of an
example, I'll completely drop it and we won't have the issue.

Best regards,
Gatien

>>       };
>>   
>> +  - |
>> +    rng: rng@42020000 {
>> +      compatible = "st,stm32mp25-rng";
>> +      reg = <0x42020000 0x400>;
>> +      clocks = <&clk_rcbsec>, <&rcc 110>;
>> +      clock-names = "rng_clk", "rng_hclk";
>> +      resets = <&rcc 97>;
>> +      access-controllers = <&rifsc 92>;
> 
> 
> Difference in one property should not need new example, usually.
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
