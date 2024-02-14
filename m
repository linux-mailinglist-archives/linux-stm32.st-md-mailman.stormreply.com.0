Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 694388546D4
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 11:07:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A01CC03FC3;
	Wed, 14 Feb 2024 10:07:48 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62A86C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 10:07:46 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a3cf64f33b3so206947566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 02:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707905266; x=1708510066;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4S+dmutnJlsc7Y02Zch4RpMAq9Ld2olVAZFnN/YBZNw=;
 b=K1lmUsdKBiX0XATe/lOA89pk+U0ItnoV148w6boXh3GWg+e32SPs+swOduomEDJ4tU
 3aqnmmdwSccQRuMxWkXdbtLuRnyfreA7V0do1CqeNdileQDjPWTMCngIpzsVxDmz3X45
 l+1/af8jWLvwxnP8++jjn2Goz0GwFxjhFT6MXgOJynHljeCk8y/SkQzNPd+bjoMA5r9A
 tj7YCuLHXDU59IucZYy13ROxrHyhbueoy+7ps9aix9FudGWafwlNJypvh6MKVk9pdqqf
 X+jnWIMcn8X0b7D7iWT1Eil8kxd724UN/HsD5FYStQLKzAieGVne6cIOO+LcNdTVoeEt
 ZuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707905266; x=1708510066;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4S+dmutnJlsc7Y02Zch4RpMAq9Ld2olVAZFnN/YBZNw=;
 b=UVOeivj7gJvQqBE8TVFC1jbbk/cKy4plSYff+x8PKyxTeYiPh7hIcY6BLiU/Nnkbjp
 Vf+/8FbJzEV3NrtWmEv7unXvPsHvdqLjH8DhJFgZdPb7cSeys2RiiDxvCL/KrEbid48z
 CNK3ePaud//Jg53M0bU3zJ9N8OUCDamjKO7YtEfSy6OmWAYBaenjKkDL3/rlrgDky84F
 gPTbwkNWh1LLzsXAjZdQfmvWjN53T4FhGRWoLb7M8q0biVc+v/mO12qxx7kRl7tiNHrr
 QE7uDTKr3peRZ1fB6q5R4Z/kXoCe/aXgqJYtZ35k/XFidS83WWARFBR0ajXmU4sq5es8
 gCWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsmu8/+wWTJ5Fi+10BwKFOLBhtjauhdz/X6uA2Xl7ppF+qVyccYQ/UzLc7yDg9I6NWnSsCdph/bthWgoNK3fH+vovEPys7+Y3Wm57nit7zlwXsiZeLigfo
X-Gm-Message-State: AOJu0Yxhfr98APl7eEtTZHxSMMrYgI7r6hF/Lp8DGsXPx53kfkEWWifw
 QjeWhCAnuuSAyedsHfBhF2XgWJ01ZiomtZWgVcsleOULdMeOIVTgzNlbUtpLZck=
X-Google-Smtp-Source: AGHT+IG16aCKvGqfGMvVqfd7HunSzBT1WwMQM6uxLmD7hXEU5em2A7Pi2aDEbxoiWobhCdQETRUgvg==
X-Received: by 2002:a17:906:e248:b0:a3c:63ee:ad82 with SMTP id
 gq8-20020a170906e24800b00a3c63eead82mr1319676ejb.19.1707905263735; 
 Wed, 14 Feb 2024 02:07:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUv+vnzooSrKna4gOeIJgsQfvJUwjMcVVAIqhSfSiiv3nAleghG7SZi8yO/1pLRC5J2hnsueIPpuwSvyTvWWk2YdN07Zr2OoZpZNGqPggnfA8/BsVJCLGfyWDN7NQKCdIt6+hRe1PfOCEFjOfuwHv64iOLfWQApyPK5ldW09bVSzSTdl9BYM8Fc1rW9EPqS/pdpjBdWt3NxnS24RtYTIw8Y3vB22LAKmYCrOdWh0lbfi3TfYxWsSzLZGZ6Qwz3gbaeznv4mqRKFliKbOrtKVtzJD7AxKj5XioKUk2EuREOiUJ01Nyhwz/kZ/mZf/nyS13ixJ44Skondp7nMgCgoQZfOhKAks7GOejSyqbEQH6tOv/qVbNWXDQ4HFJz0gFfPdlprChw/Q6ZF5F+Fwsu59xHPeISYaEUO58hp7KRyW0mJ0iRpoNboGn37yHjnL6n+
Received: from [192.168.0.22] ([78.10.207.130])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a1709061d4700b00a3d6395156esm53769ejh.168.2024.02.14.02.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 02:07:43 -0800 (PST)
Message-ID: <e2bcc8e4-e73f-4e31-b725-aecc51145cef@linaro.org>
Date: Wed, 14 Feb 2024 11:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 Conor Dooley <conor@kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-3-christophe.kerello@foss.st.com>
 <20240212-chemicals-skinny-18eda1cfe781@spud>
 <c57b8094-be08-4ae4-ba85-f48522e5d2a8@foss.st.com>
 <52be1d88-51a1-4ec7-8aaf-6046f5a469f4@linaro.org>
 <44f24885-eb62-4730-86fd-f42b3a3cca34@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <44f24885-eb62-4730-86fd-f42b3a3cca34@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 miquel.raynal@bootlin.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: memory-controller: st,
 stm32: add 'power-domains' property
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

On 13/02/2024 16:57, Christophe Kerello wrote:
> 
> 
> On 2/13/24 12:57, Krzysztof Kozlowski wrote:
>> On 13/02/2024 11:57, Christophe Kerello wrote:
>>>
>>>
>>> On 2/12/24 19:33, Conor Dooley wrote:
>>>> On Mon, Feb 12, 2024 at 06:48:12PM +0100, Christophe Kerello wrote:
>>>>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>>>>
>>>>> On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
>>>>> Allow a single 'power-domains' entry for STM32 FMC2.
>>>>
>>>> This should be squashed with patch 1, since they both modify the same
>>>> file and this power-domain is part of the addition of mp25 support.
>>>
>>> Hi Conor,
>>>
>>> Ok, I will squash this patch with patch 1.
>>>
>>>>
>>>> If the mp1 doesn't have power domains, shouldn't you constrain the
>>>> property to mp25 only?
>>>>
>>>
>>> As this property is optional, I do not see the need to constrain the
>>> property to MP25 only, but if you think that it should be the case, I
>>> will do it.
>>
>> The question is: is this property valid for the old/existing variant?
>>
> 
> Hi Krzysztof,
> 
> It is not currently valid but there is a plan to move MP1 on PSCI 
> OS-initiated.

OK

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
