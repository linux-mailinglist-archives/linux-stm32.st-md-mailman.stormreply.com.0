Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B23975F0DE
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 11:54:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B692C6B459;
	Mon, 24 Jul 2023 09:54:17 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2294DC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 09:54:16 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-993a37b79e2so670355566b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690192455; x=1690797255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=94dQO8LxQMdHUG+2c49m7yEu0QyNmeaEeNnaDcdEi50=;
 b=C6upeyf13JVH1fJWFmxl5BfIVVJfySCtaefw1vI3x426/paosiVxJES5cj2CGWW2KS
 Cr/m8HDwA0yaKDzQUno8Nq8tigb2vq0EXkwst84ddXYuKmFLmzEaRwboQ6TczmL3wAVv
 UZ2GE+0c4ocQG69t1izN3t24OytyRFu5kErU9QUsF8Tdc94ZLAwmly6y6rFwbSczEVMy
 AP4yR1Xe+rvzdZ91EjcwvRQFccLWdWPr2BBk6KNL0+cl4RY1xAUR1S9oB18B8ibq4vKy
 wZgiFS7XsagNbsm/SvbcS9oHEySLYJJJXxjVOP9bxf4y5oWwItOWI2wLPuYFtIPtowp+
 MxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192455; x=1690797255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94dQO8LxQMdHUG+2c49m7yEu0QyNmeaEeNnaDcdEi50=;
 b=fe3xFe0fqFIXubTxPBtUe+H7dG4Uou9tiw+2EtpbTr5171jnKgztv51ndui+mLUckN
 +KE5Yh2/Dk3dMlk2b0ZTQ1zLYRtsdw13ogb21svYXi1H+ZY0xyG3xJwGgDgTahwRorZI
 duG4MKKURY9GhuHKpojurMm30O70NhO0Bv9Xqf0TzRGj8jMYQl4PNOJo0O2AQbgP/Anc
 MjEDM3MojUtzpakVGkQAOrv2Iz7ktJykbBtVQicpk3Sr4b+ica0sJPNesLWulFjj3w5Y
 7xFSmMH3KQYtmgGCsIGNJ5zDW+An2fzteLbCAaJGVFf5QnCKlbDBxpb08BdeEd4MZOGq
 +QoA==
X-Gm-Message-State: ABy/qLbHcDVjpGA+yqQfoHSKzXOhu8B/EOCXOrJs+MOXLNdoqInEepVb
 IhCEn27cRUjmjeQLlgokeP75wQ==
X-Google-Smtp-Source: APBJJlFaYyJc7x+0ExqkM6W4yVmevNoyHsVyru+pCZlw6jseQKGHeO49Y942+w5FqL1ss44s207a2g==
X-Received: by 2002:a17:906:778f:b0:982:45ca:ac06 with SMTP id
 s15-20020a170906778f00b0098245caac06mr8953749ejm.60.1690192455496; 
 Mon, 24 Jul 2023 02:54:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a170906248d00b0099307a5c564sm6473655ejb.55.2023.07.24.02.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 02:54:15 -0700 (PDT)
Message-ID: <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
Date: Mon, 24 Jul 2023 11:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
 <21957396.EfDdHjke4D@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <21957396.EfDdHjke4D@steina-w>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: gpio: Add
 gpio-line-names to STMPE GPIO
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

On 24/07/2023 09:58, Alexander Stein wrote:
> Hi,
> 
> Am Montag, 24. Juli 2023, 09:23:09 CEST schrieb Krzysztof Kozlowski:
>> On 24/07/2023 08:35, Alexander Stein wrote:
>>> This is a gpio-controller, so gpio-line-names should be allowed as well.
>>> stmpe2403 supports up to 24 GPIOs.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>> Changes in v2:
>>> * Add min/maxItems
>>>
>>>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>> b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
>>> 22c0cae73425..4555f1644a4d 100644
>>> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>
>>> @@ -28,6 +28,10 @@ properties:
>>>    gpio-controller: true
>>>
>>> +  gpio-line-names:
>>> +    minItems: 1
>>> +    maxItems: 24
>>> +
>>
>> I am sure there is no variant with one GPIO.
> 
> That's true. But if only one GPIO is actually connected there is no use 
> enforcing to add empty entries.
> AFAIK it is also allowed to provide an incomplete array.

Did you test it? Linux prints warning. Warning means "not allowed".

The expectation is that the rest are named "NC".

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
