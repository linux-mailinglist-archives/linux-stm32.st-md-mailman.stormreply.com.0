Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A67B41CE
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Sep 2023 17:46:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7531FC6B47A;
	Sat, 30 Sep 2023 15:46:15 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC47CC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 15:46:13 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso2148757166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696088773; x=1696693573;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ujdxOyRm+3K6e9nLkeJUMVVREpdNXy+Z3KatQc5Dzc=;
 b=Ly+NhC4bwus4rprd9gxvs4rXRhyvSA4kzQT/NUA0SBvpLGeqEs/UT6c4oATaK7G22h
 /eT6uGKtNswEAHbC0CHb/OdfkPTDaZru+d3PH5g9ba/mdyFM5DOJwxvmuBVvrhKZb7qM
 +DBpHmd4tvoQm4X9+s4FNsFK4DecuVHi24m7XV5ejS6zpL2Ib79rM9pfdNLI0apeN9Qt
 NsNrjvMTpQ2VYEOtaQDKYsP2gzHJIZiI1Z9KVFkgt7syJ8N/Sd+1uQTRPOk3FJ2fSYbg
 CVwkD76c0upJmU2yyTXCUFzQo+tVA0+eSE9+huaYfzeYCUk3NLxNB2+8Kh1qu44vwGTe
 rrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696088773; x=1696693573;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ujdxOyRm+3K6e9nLkeJUMVVREpdNXy+Z3KatQc5Dzc=;
 b=qgEBXGlVgFikUf0cjEnAKxM3YQ8mLjlqa40VR93myz1lZWAO+0BDC5x+roXD8X+cn9
 w1kSjAnU7hf2d1r1jh9P0SB5DNeMU04oaDZhGI22KfxNM+UoUq1mqivR8k2ibXj91U1j
 sJvbwE8BLD+wn1c1Fxhcv+EDGugO7Bdy08jBoAzoT3JUWF0C6ZNI1pQRqLfJWHJfDHF+
 9aNc+OeFJGtqCG8+cRXHnDE2vdwnYtdDvC6YPoAbuoiTANunNiip/EWwuXct6itN6k/S
 2jN4lf4Su35rAOGhYBoigqMB02O53jpjajtlsZt10xdje+tOiGhmoANsKWk8nGEMpiM1
 bRsg==
X-Gm-Message-State: AOJu0Yzezn0Pz7ZNw8qZOv3E8mPOfqVv2ZIdnyfCI6BPp9cgWWyhECbK
 9tcZ/b5ckTSAHbOXupz93VKaOw==
X-Google-Smtp-Source: AGHT+IEIN3wdGQcE8k9/BpQuuwTdvqrpeAd3381PFLxNMRZawSPe538s4aHO6XJHBqOO9ma0aqy0rA==
X-Received: by 2002:a17:906:292a:b0:9a1:d29c:6a9d with SMTP id
 v10-20020a170906292a00b009a1d29c6a9dmr6636278ejd.46.1696088773121; 
 Sat, 30 Sep 2023 08:46:13 -0700 (PDT)
Received: from [192.168.8.76] ([88.154.66.190])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090694c200b00977cad140a8sm14034618ejy.218.2023.09.30.08.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 08:46:12 -0700 (PDT)
Message-ID: <46cf84f1-060b-4f9f-9c9c-edf504bf03ca@linaro.org>
Date: Sat, 30 Sep 2023 17:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>
References: <20230928151512.322016-1-christophe.roullier@foss.st.com>
 <20230928151512.322016-2-christophe.roullier@foss.st.com>
 <20230928-footwork-padlock-524173c3e205@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20230928-footwork-padlock-524173c3e205@spud>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 01/12] dt-bindings: net: add STM32MP13
 compatible in documentation for stm32
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

On 28/09/2023 22:39, Conor Dooley wrote:
> Hey,
> 
> On Thu, Sep 28, 2023 at 05:15:01PM +0200, Christophe Roullier wrote:
>> New STM32 SOC have 2 GMACs instances.
>> GMAC IP version is SNPS 4.20.
>>
>> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
>> ---
>>  .../devicetree/bindings/net/stm32-dwmac.yaml  | 78 +++++++++++++++++--
>>  1 file changed, 70 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> index fc8c96b08d7dc..ca976281bfc22 100644
>> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> @@ -22,18 +22,17 @@ select:
>>          enum:
>>            - st,stm32-dwmac
>>            - st,stm32mp1-dwmac
>> +          - st,stm32mp13-dwmac
>>    required:
>>      - compatible
>>  
>> -allOf:
>> -  - $ref: snps,dwmac.yaml#
>> -
>>  properties:
>>    compatible:
>>      oneOf:
>>        - items:
>>            - enum:
>>                - st,stm32mp1-dwmac
>> +              - st,stm32mp13-dwmac
>>            - const: snps,dwmac-4.20a
>>        - items:
>>            - enum:
>> @@ -74,13 +73,10 @@ properties:
>>  
>>    st,syscon:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>> -    items:
>> -      - items:
>> -          - description: phandle to the syscon node which encompases the glue register
>> -          - description: offset of the control register
>>      description:
>>        Should be phandle/offset pair. The phandle to the syscon node which
>> -      encompases the glue register, and the offset of the control register
>> +      encompases the glue register, the offset of the control register and
>> +      the mask to set bitfield in control register
>>  
>>    st,eth-clk-sel:
>>      description:
>> @@ -101,6 +97,38 @@ required:
>>  
>>  unevaluatedProperties: false
>>  
>> +allOf:
>> +  - $ref: snps,dwmac.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp1-dwmac
>> +              - st,stm32-dwmac
>> +    then:
>> +      properties:
>> +        st,syscon:
>> +          items:
>> +            items:
>> +              - description: phandle to the syscon node which encompases the glue register
>> +              - description: offset of the control register
> 
> These descriptions should, IMO, be moved back out to the st,syscon
> definition. If you put the 3 descriptions there, with "minItems: 2" &
> put "maxItems: 2" and "minItems: 3" in each of the if/then clauses.
> Also, it should be sufficient to simplify to if/then/else.

What's more, same property should not have different types. This syscon
property was way too generic, thus now you have trouble of conflicting
types.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
