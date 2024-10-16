Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D239A031A
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 09:52:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E3A2C78031;
	Wed, 16 Oct 2024 07:52:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D142CC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 07:52:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G6srm9018560;
 Wed, 16 Oct 2024 09:51:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 y0SO0f4uMsrT8LrR3lXqkljdwmWntT/Iph4CINxfy5A=; b=YHMaPFgoiGLu1edY
 q237gUsdGzhhRSChb0JYmCmc63uxeAdpVnJ1Xpqn4YVVeWGVEz0588ktYgSw4Az/
 ldXpceI4mSXTBNBPgwm9L+/2iN1rpNmKZjDcGKM8ejs/sGhQF5ARpW7vONRnLeEu
 t8ZlhLEGCv+38G9udDGRlEAU7YmZJXhxu35/kKKO6Fw9gXNb/o2N0CRC0yeI/Nbe
 GTNiU7iax3VpwVM061EyIvLNSq4frrokorTbina9ETewnng70MMTvtrxPAUuofao
 w5qacnB/hMzHDQ4dRYC27tlytMrHH4TmQSTi08jJQQ+TicPg6lNKTOFaPKDMuckI
 NyM9cQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42a8mv89ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 09:51:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A7A5A40048;
 Wed, 16 Oct 2024 09:50:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76010231A9D;
 Wed, 16 Oct 2024 09:49:35 +0200 (CEST)
Received: from [10.48.86.225] (10.48.86.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 09:49:34 +0200
Message-ID: <6948f590-50ba-47d8-91b9-ee6f9d1ee31a@foss.st.com>
Date: Wed, 16 Oct 2024 09:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20241015-rng-mp25-v2-v3-0-87630d73e5eb@foss.st.com>
 <20241015-rng-mp25-v2-v3-1-87630d73e5eb@foss.st.com>
 <20241015221740.GA2100600-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20241015221740.GA2100600-robh@kernel.org>
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: rng: add st,
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



On 10/16/24 00:17, Rob Herring wrote:
> On Tue, Oct 15, 2024 at 06:48:54PM +0200, Gatien Chevallier wrote:
>> Add RNG STM32MP25x platforms compatible. Update the clock
>> properties management to support all versions.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>> Changes in V3:
>> 	- Add constraint on clock-names for st,stm32mp25-rng compatible
>>
>> Changes in V2
>> 	-Fix missing min/maxItems
>> 	-Removed MP25 RNG example
>> 	-Renamed RNG clocks for mp25 to "core" and "bus"
>> ---
>>   .../devicetree/bindings/rng/st,stm32-rng.yaml      | 34 +++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> index 340d01d481d12ce8664a60db42182ddaf0d1385b..c276723d566ce4a0d6deca10c491510644d842f8 100644
>> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> @@ -18,12 +18,20 @@ properties:
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
>> +    minItems: 1
>> +    items:
>> +      - const: core
>> +      - const: bus
>>   
>>     resets:
>>       maxItems: 1
>> @@ -57,6 +65,30 @@ allOf:
>>         properties:
>>           st,rng-lock-conf: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32-rng
>> +              - st,stm32mp13-rng
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +        clock-names: false
> 
> It makes no sense that you allowed 1 entry, but then disallow the
> property. Either drop the 'minItems: 1' at the top level (keeping this)
> or put 'maxItems: 1' here,
> 

Hi Rob,

Will put maxItems: 1 here then.

>> +    else:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
> 
> maxItems is already 2. Only need minItems.
> 

Yes, will update for V4

>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: bus
> 
> You already defined the names, don't do it again. You need either
> nothing or 'minItems: 2' depending on the above.
> 

I will add minItems: 2 then, thanks!

>> +      required:
>> +        - clock-names
>> +
>>   additionalProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
