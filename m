Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE079C853
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 09:39:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4AADC6B46E;
	Tue, 12 Sep 2023 07:39:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C211C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 07:39:34 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38C3N8bC006265; Tue, 12 Sep 2023 09:39:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=W6ZFSny7x5hTX7VHE3RAqqRXrh5zcFFP1oA9ZYe1TR0=; b=O6
 sEC3DWDxvkpK0fP1ZfbdNaRLyz8DljJOJRxQLP6ZnPjlk1F3sauZHJU4q5Nau8Oh
 pyPoKMerndpDvj4If+UI6pm5XzLqujorcuntOJvNCgQ7TgWxDFa4rmfDrBRNhvgY
 DHc1ad/Wgev9ePRbu/lF/7CNHM0pXZreVgsft2F8eicATDeTNEfuuu1bjWdxDvuo
 MhYyoNLjI0gDrO/5M0d0a2aKg4NPuePM0TjSKkMnUsl5AZSJF5AsOXwtYBTca5Ak
 8CcDovAp5Dok02K27+Cg3Qak3+5NlHjZ0eACKoX9h0v52B6PpIc0bcn57Cdsr7Vh
 sb637vw6RgiuHv0MT3xw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t2g1hryc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Sep 2023 09:39:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D0C0100058;
 Tue, 12 Sep 2023 09:39:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 548FF21ED3A;
 Tue, 12 Sep 2023 09:39:14 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 09:39:13 +0200
Message-ID: <3c138ce6-7766-87a7-1447-22f597863ab3@foss.st.com>
Date: Tue, 12 Sep 2023 09:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
 <20230908165120.730867-8-gatien.chevallier@foss.st.com>
 <20230911150958.GA1255978-robh@kernel.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20230911150958.GA1255978-robh@kernel.org>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_04,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/10] dt-bindings: rng: add st,
	rng-lock-conf
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

Hello Rob,

On 9/11/23 17:09, Rob Herring wrote:
> On Fri, Sep 08, 2023 at 06:51:17PM +0200, Gatien Chevallier wrote:
>> If st,rng-lock-conf is set, the RNG configuration in RNG_CR, RNG_HTCR
>> and RNG_NSCR will be locked. It is supported starting from the RNG
>> version present in the STM32MP13
> 
> This should be squashed into the prior binding patch.
> 

Ok, I will squash both for V3.

>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   .../devicetree/bindings/rng/st,stm32-rng.yaml      | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> index 59abdc85a9fb..0055f14a8e3f 100644
>> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> @@ -37,6 +37,20 @@ required:
>>     - reg
>>     - clocks
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp13-rng
>> +    then:
>> +      properties:
>> +        st,rng-lock-conf:
>> +          type: boolean
>> +          description: If set, the RNG configuration in RNG_CR, RNG_HTCR and
>> +                       RNG_NSCR will be locked.
> 
> Define the property at the top-level and then restrict its presence in
> a if/then schema.
> 

Ok, will change in V3. Thanks for your input

>> +
>>   additionalProperties: false
> 
> Did you test this property is allowed? No, because additionalProperties
> won't work with properties defined in if/then schemas.
> 
>>   
>>   examples:
>> -- 
>> 2.25.1
>>

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
