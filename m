Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D27A1C4D
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 12:33:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6BC9C6B462;
	Fri, 15 Sep 2023 10:33:27 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB494C6B45F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 10:33:26 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-99357737980so259092166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694774006; x=1695378806;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AHNXmBxDw1apCLxAkHOvDRkSwOFlN5lNz8sn0ic2gIM=;
 b=gj1HT6iSQmiW9XZ8WD76NwrFq55bXErnCvWrb/ImX0SwPQyfLNknmLhkHxLNeP7Q4B
 HlmdFz7xq21SUmmxB524l2yfcVMK41nRi9nqmWLKrOBwUMNGff4pxA06kIk9dh33b2tk
 cbq1sCAPJEzUJyX1IFgqT4tN9Bz1V0KEL1B4ek8cjaGzlenViRkwIb04Uxo3hWUO0+jo
 wFWOGjqWCIz/oBiyaLxArcP3MGdJ9um3ql7b4SVLt3ayvxkEe9q7ntO1trYVuAOSH2kk
 sPF3tuePnpvHpQec3HhDH8FZhviM0tMPeu/BUkRCC43vocCC+dupe8zPb8zTC2LLxRVN
 MAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694774006; x=1695378806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AHNXmBxDw1apCLxAkHOvDRkSwOFlN5lNz8sn0ic2gIM=;
 b=Sr4C6UM4cgbX5AQwv7XcGUOckGFlDNny1S7VDWlkBOrq2v/ivBhXWdaT5hB1SfxEIK
 hPZ8Yhg83rh7p+CQycupyvVJVa/m8Br2vH12zBoUayzoUDO/8w9cGOHRlfxw7ljh63sq
 oGNPsmA+wnCfEMMXrgEb7SzEGCQstvVmOvBA6OA/Yd7OoWZ6deaa8al6IgQMFwwwpaRT
 HwkgjJWfr0tGs7WXoHNtsl9cxG2Ycb813Ua0+r6lEegarlT40/vCyAjS6/T2ePNW7UHA
 np2Gm4KrFoKHsGdLO5n4/FFAYqYl8Co7qm9D5eCLcVwGE6mNMHWtKQKs32vxEXawAzFS
 1Wdg==
X-Gm-Message-State: AOJu0YwUOioe92txY55xcdrYcbFTwdOWdHj533KIjMfPWrlLZSFZ7kgn
 sQUs5DC8PXTu9NONC8m07SsLug==
X-Google-Smtp-Source: AGHT+IHJvOEsaBTHM8g8l1b4WaIw/WLvZKGU9znyrRyylohvQ/GtYWnnh3DUhsMGba8RbxKv1HP+iw==
X-Received: by 2002:a17:906:18aa:b0:9a5:d657:47e1 with SMTP id
 c10-20020a17090618aa00b009a5d65747e1mr1032731ejf.43.1694774006100; 
 Fri, 15 Sep 2023 03:33:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170906088400b009928b4e3b9fsm2232224eje.114.2023.09.15.03.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 03:33:25 -0700 (PDT)
Message-ID: <726e7f51-ce2c-5ac1-5347-21d6cf40c8c8@linaro.org>
Date: Fri, 15 Sep 2023 12:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Rob Herring <robh@kernel.org>
References: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
 <20230908165120.730867-8-gatien.chevallier@foss.st.com>
 <20230911150958.GA1255978-robh@kernel.org>
 <4819d89b-c2a4-0c75-27e1-d8122827ceca@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4819d89b-c2a4-0c75-27e1-d8122827ceca@foss.st.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 15/09/2023 11:28, Gatien CHEVALLIER wrote:
> Hello Rob,
> 
> On 9/11/23 17:09, Rob Herring wrote:
>> On Fri, Sep 08, 2023 at 06:51:17PM +0200, Gatien Chevallier wrote:
>>> If st,rng-lock-conf is set, the RNG configuration in RNG_CR, RNG_HTCR
>>> and RNG_NSCR will be locked. It is supported starting from the RNG
>>> version present in the STM32MP13
>>
>> This should be squashed into the prior binding patch.
>>
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>   .../devicetree/bindings/rng/st,stm32-rng.yaml      | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>>> index 59abdc85a9fb..0055f14a8e3f 100644
>>> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>>> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>>> @@ -37,6 +37,20 @@ required:
>>>     - reg
>>>     - clocks
>>>   
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - st,stm32mp13-rng
>>> +    then:
>>> +      properties:
>>> +        st,rng-lock-conf:
>>> +          type: boolean
>>> +          description: If set, the RNG configuration in RNG_CR, RNG_HTCR and
>>> +                       RNG_NSCR will be locked.
>>
>> Define the property at the top-level and then restrict its presence in
>> a if/then schema.
>>
> 
> Can you please point me to an example of such case. I can't find a way
> to define at the top-level the property then restrict it to specific
> compatibles.

You can check my slides from the talks about not reaching 10 iterations
of bindings patches.

Or open example-schema (this should be your starting point):
https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L212


Also:
https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L174
> 
> Else I'd change
> additionalProperties :false to
> unevaluatedProperties: false
> 
> so the definition of the property is seen.

No, why? Definition is there when you move it to the top as asked.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
