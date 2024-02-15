Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68534856D2B
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 19:56:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D414C65E42;
	Thu, 15 Feb 2024 18:56:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 994BDC6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 18:56:06 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a3db14a0a31so77399766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 10:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708023366; x=1708628166;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4cAJLHNF/JRrCEO49lp/BKyIGOuJcZVH2wEu3LRWvvE=;
 b=eqk/2Fw8TEou+HzbLQVd5NPOGEwu/FMorfGNqw4cdQCFT5V6BvAgC5IHqhLbAaqkd8
 yyFK6UeGZPO9iRbWXxOZuGuCW2Qgv1ACJpfY+3GE0g6WApJaxFF27HY+no4vf6l9JMxs
 oXAUBiGX6Vmrv8mCnu3aAj66x08kVzCJ/7nFKrkIrXq4EgS95nl395zVkfZkf1U4/ND5
 4cVzI3BI9XoXEs/pW6GtTnb2gsT32JsDVyXpJzhsw0h0bAugCR2PpElYdhyiaNQej8W2
 SxHZemR87o0gUDXf3aTeqOSsymDnIHMttzTBZPyprrfiF3h7a6jMUgRnGFBh0nFNHsjL
 6Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708023366; x=1708628166;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4cAJLHNF/JRrCEO49lp/BKyIGOuJcZVH2wEu3LRWvvE=;
 b=R+Ra8GUdEgWAmU5t4/XZzt4Ne0rNXsfOXPGgWLkHjymrAXgyU9/16z8UB5WWyT/rjU
 W2qQ27fP0x7Ejh74nbAOVGeqo4Q1c9jj4/jG58uIZm4+KSYuLSJ24Zny7FVMrPCmqHXn
 hKH2cN62MDyPhpvCSt3A38bw7IUUPi/1NLERm0RonjBBcbeOxHl0yQc8qQAvUMAey2m1
 URQOLaDkx3ujIINEJM+z1PM8eYLy1ge5vdEFndFeULsTq7NbOqzBYoRztUCJw4ymORyO
 jAcUECt+uFt9ezolrUtSGP6f3RKEQIXW0jPpYzgH4c+fXIGOGEJ/XKgshXuSlHvtfyN6
 migg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMeqzQcfJM7uVrHkCoZWvO7+yHYqdshWtemO4i5wXoh1q17f8XCaRrJuxStylfBUIpHQbZmkwGjDNLDSDjF7SG8inqdFBXbAML8LeufzDzUP0darP243WY
X-Gm-Message-State: AOJu0Yyn6pjsa85TA9jKvChvf0gjJusDVNsM8+6Mxfht3q7lntREVNPn
 hZ+MIsP24faHx8KEejnA3bZMjOF9pyG9pzjRfOTuQummY3K0/Ur/x6jWpzlfYOM=
X-Google-Smtp-Source: AGHT+IEP+URuxt3T56XaW6PGp8rRSuDf5PyL8goXj3rHrMJxTftAeuUO0uUbbfH7vkxrWaqXZt2u9A==
X-Received: by 2002:a17:906:1186:b0:a39:6c07:d31c with SMTP id
 n6-20020a170906118600b00a396c07d31cmr1969344eja.25.1708023366046; 
 Thu, 15 Feb 2024 10:56:06 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
 by smtp.gmail.com with ESMTPSA id
 tj6-20020a170907c24600b00a3dba44a709sm261960ejc.50.2024.02.15.10.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 10:56:05 -0800 (PST)
Message-ID: <9c36b6e5-262d-48b1-971c-b03d9edf7789@linaro.org>
Date: Thu, 15 Feb 2024 19:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-7-christophe.kerello@foss.st.com>
 <989661f0-f539-43c3-a332-13c0e99ed7b9@linaro.org>
 <edbb5e6e-44c0-426b-9c97-87ea1eee1b4c@foss.st.com>
 <1e1ae38b-7f8c-44ba-9970-0929aaaa28a8@linaro.org>
 <a1badd8b-041b-495d-81cb-b264c687de80@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a1badd8b-041b-495d-81cb-b264c687de80@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 06/12] memory: stm32-fmc2-ebi: add RIF
	support
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

On 15/02/2024 10:00, Christophe Kerello wrote:
> 
> 
> On 2/14/24 11:07, Krzysztof Kozlowski wrote:
>> On 13/02/2024 14:15, Christophe Kerello wrote:
>>>>> +
>>>>> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (resource >= FMC2_MAX_RESOURCES)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	regmap_read(ebi->regmap, FMC2_SECCFGR, &seccfgr);
>>>
>>> Hi Krzysztof,
>>>
>>>>
>>>> No checking of read value?
>>>>
>>>
>>> No, it should never failed.
>>
>> And you tested that neither smatch, sparse nor Coverity report here
>> warnings?
>>
> 
> Hi Krzysztof,
> 
> There is a lot of driver in the Kernel that are using same 
> implementation, and I am surprised to not have had this comment 4 years 
> ago when the driver was introduced.

Really? Care to give some pointers? Heh, I don't know what to respond to
it. Either you say that my comment is incorrect or you say that it's
okay to sneak poor code if no one notices? We can argue on the first,
whether my comment is reasonable or not. But if you claim that previous
poor choice of code is argument of bringing more of such poor choices,
then we are done here. It's the oldest argument: someone did it that
way, so I can do the same. Nope.

> 
> So, how should I proceed? Shall I initialize all local variables used by 
> regmap_read? Or shall I check the return value of regmap_read?
> And, as there is a lot of regmap_read call in this driver, shall I fix 
> them in a separate patch?

regmap operations, depending on the regmap used, can fail. Most of the
errors are result of static configuration, e.g. alignment, regmap in
cache mode etc. Then certain regmap implementations can produce errors,
which is not a static condition but dynamic.

You have neither error checking nor value initialization. You risk here
to have quite tricky to find, unnoticeable bugs, if there any mistake
leading to regmap errors.

Indeed neither smatch nor sparse report this as error currently, but
maybe that's their limitation?


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
