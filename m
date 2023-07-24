Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87975F85A
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 15:35:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E35CC6B442;
	Mon, 24 Jul 2023 13:35:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76DD1C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 13:35:50 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-992ace062f3so772273766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690205750; x=1690810550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pyk4fD3in9SCwQr3Wn/ALPJfSHMbY/PKpFnttAdK8bU=;
 b=n3qNJ0MQSJmvtZbNgB9/GWd502foogaALkyarW0REA2eP6zmn/6rHdFrRRwvC2b/w6
 fjAuamGQ44MsKic3xauwZaovL5vc4P57/GX2M9lLuu2+N18CvuObku2xYaG6QYbqNvdh
 9p3HpgWGkgGvqnz3omM2dF07B3X720H9sLYj0VDcwqKdf8fbfISNHa1/z0NcASYCETfl
 RccxOvCeQUSNuJtMX9Qc9Ri6UxPwQt5xi+2OQJ8OR4Ivs4R+UH5FYu6I2oNw+rnnmQVp
 t72XpNW+Fk22HFi5bzWQ8hPTrIpScGNRbIaT1B/LFhXoEqXs23EyeL21qsHYmBx6QvuW
 nrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690205750; x=1690810550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pyk4fD3in9SCwQr3Wn/ALPJfSHMbY/PKpFnttAdK8bU=;
 b=batGIodbp1iCVnuOvZHiRRUSprWyTycCM3AS1Lpv/1WrUHYz+4e8aPv3qE/pBkkWnh
 qEiyk1xwsKYCB18pRE7VrUVkwogf7zsd0+Bq+3aZUnN9UAjP7HeLBlP96hCJzeKkMHbE
 W07UhbM3Sh1dMqPoolI1igrJLX/EaGrYEKDRxVAW2uPvodcXXXmYTUjFVPxr1PTj4VCJ
 TE7h8uByGMWF+RRih+Ruo+H9oru0CyukthAbO4X4DzzaBlv/PQAcHvALey1kp+AEnFiz
 gLInLNqRuSVRwCPGv2wOQxfQYNZlwoEjT9VQZM/mddGLOEHcLi4v6FfKmCjw2ns1nNSs
 GnGA==
X-Gm-Message-State: ABy/qLZgYisQcWje8czgjCs1hCZ85zNJL75yLSBm9YJhpO5uwcSJfjgn
 VkSWtl5VuuHjTXtaK2RwIY1ebA==
X-Google-Smtp-Source: APBJJlE2EuOvOzG5yoUMAQGXRsVo1OcR6VQ/NNvDt80p2QTN5TsNr21XD+vvL3eUuvYO9hJa0aUFJA==
X-Received: by 2002:a17:906:9b:b0:98d:fc51:b3dd with SMTP id
 27-20020a170906009b00b0098dfc51b3ddmr10293060ejc.41.1690205749881; 
 Mon, 24 Jul 2023 06:35:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 dt15-20020a170906b78f00b00991bba473e1sm6774025ejb.3.2023.07.24.06.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 06:35:49 -0700 (PDT)
Message-ID: <a19aa54a-9bbd-c67c-5ca3-cae82a4e85de@linaro.org>
Date: Mon, 24 Jul 2023 15:35:47 +0200
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
 <21957396.EfDdHjke4D@steina-w>
 <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
 <4285919.ejJDZkT8p0@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4285919.ejJDZkT8p0@steina-w>
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

On 24/07/2023 13:44, Alexander Stein wrote:

>>>>>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>>> b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
>>>>> 22c0cae73425..4555f1644a4d 100644
>>>>> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>>> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
>>>>>
>>>>> @@ -28,6 +28,10 @@ properties:
>>>>>    gpio-controller: true
>>>>>
>>>>> +  gpio-line-names:
>>>>> +    minItems: 1
>>>>> +    maxItems: 24
>>>>> +
>>>>
>>>> I am sure there is no variant with one GPIO.
>>>
>>> That's true. But if only one GPIO is actually connected there is no use
>>> enforcing to add empty entries.
>>> AFAIK it is also allowed to provide an incomplete array.
>>
>> Did you test it? Linux prints warning. Warning means "not allowed".
> 
> I did and I don't see any warnings.
> I using the following (modified) GPIO subnode on an stmpe811 chip:
> gpio {
> 	compatible = "st,stmpe-gpio";
> 	gpio-controller;
> 	#gpio-cells = <2>;
> 	interrupt-controller;
> 	#interrupt-cells = <2>;
> 	/* GPIO 5-7 used for touch */
> 	st,norequest-mask = <0xf0>;
> 	gpio-line-names = "GPIO_ADC_I2C1_1";
> };
> 
> I only see the warning "stmpe-gpio stmpe-gpio: DMA mask not set", but that's a 
> different matter.
> Only GPIO 0-3 are connected. Original property is
> gpio-line-names = "GPIO_ADC_I2C1_1",
> 	        "GPIO_ADC_I2C1_2",
> 	        "GPIO_ADC_I2C1_3",
> 	        "GPIO_ADC_I2C1_4";
> 
> Also gpioinfo shows that the gpiochip has 8 pins while only the first one is 
> named.
> 
> gpiochip7 - 8 lines:
>         line   0: "GPIO_ADC_I2C1_1" unused input active-high 
>         line   1:      unnamed       unused   input  active-high 
>         line   2:      unnamed       unused   input  active-high 
>         line   3:      unnamed       unused   input  active-high 
>         line   4:      unnamed       unused   input  active-high 
>         line   5:      unnamed       unused   input  active-high 
>         line   6:      unnamed       unused   input  active-high 
>         line   7:      unnamed       unused   input  active-high
> 
> 
> If 4 GPIOs are named the output shows names for lines 1-3 accordingly, but no 
> errors/warnings as well.
> 
>> The expectation is that the rest are named "NC".
> 
> Where does this expectation come from? Is there any pending change I am not 
> aware of?
> 

Hm, indeed, I mistaken the case for multiple gpio chips in one device
(so having an offset). Bindings are actually explicitly allowing array
for only some GPIOs.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
