Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215C75EC66
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 09:23:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA049C6B459;
	Mon, 24 Jul 2023 07:23:13 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4288BC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 07:23:13 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4fbf1f6c771so5933023e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690183392; x=1690788192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iy/GT69EmEf7HLTcBeb61pi/V8qLsmpFTLyrEgxiJLA=;
 b=NzUzdVsimqx7g51FcscwcKiCc3Mz5Y2gk16jCf1ilaOHCz+ZM7PL4iotsQfc+w6QcY
 kvMdPpDkeQPwjUw3dwzOumEY+LV7ftLHHasWdIAMDToD4J8WgqVNcK5620ZHjWOmRpcx
 UnBvKNhYHYk/DDyzTVHwntXkG61b1vTwl5+ZVB6Se2jIFLt+MfP4cnnm2fktXFIxuvnY
 azW0kCusM4leYHv9L4XmopYDqpanvdLcS8xXolOyQAz2kd2KibeY1JxiajW9h3617xA1
 DiiaffjTvt2gjFXAOBZIrE0u2alH6a3mQAsYwHs+JGtkI+ALw8KgnCQ0fu5fyf1mJzzw
 k5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690183392; x=1690788192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iy/GT69EmEf7HLTcBeb61pi/V8qLsmpFTLyrEgxiJLA=;
 b=QVqMUY1W54/WV1OzLV3zNvwBkUON57mBLBtkqXcrLqf31XDmw82Q6mfvhu4prEcBHs
 prrbqtWDyw1k2lEv8QE7W7M35+mdYnFHnnc6Cc1GBRMIizDLeTYDlAqvT7yABYTWMY5e
 ZxzAMgnMvZLZl/fXpkaCFe03/U6oR3S/4uk+TSlgs4tby3vdW4Hmv+9+g31KjGmSBe4W
 o39etna+PTaYpg59lBw41li/I4roIn4PrTAqmtp3gEHd4uA+n49ZwrwJfT9dEu9eSi8b
 vRigmou9+B3/2zEzZHEpQE9rEqL9LwZzLR+xRavbTO9liXVep06PCSqvuszp1feaY3Wx
 Rlqg==
X-Gm-Message-State: ABy/qLaI6n4+iZifnGHUu7FK2KDKeupBmf+6iKE3FyulCc9JU50lL/EO
 lUPHLeUPwbAuYM0rNcSPQZW7+A==
X-Google-Smtp-Source: APBJJlGQLyiSoIC6lNFV7XBZ9Ao16PbIMbE2mihWrJXae2AzcR2E348sVKUhIKcvWsU+F7j8eKRZvw==
X-Received: by 2002:a05:6512:3987:b0:4f8:56cd:da8c with SMTP id
 j7-20020a056512398700b004f856cdda8cmr5455515lfu.34.1690183392278; 
 Mon, 24 Jul 2023 00:23:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a170906951000b0099b4d86fbccsm6399525ejx.141.2023.07.24.00.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 00:23:11 -0700 (PDT)
Message-ID: <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
Date: Mon, 24 Jul 2023 09:23:09 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
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

On 24/07/2023 08:35, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> stmpe2403 supports up to 24 GPIOs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Add min/maxItems
> 
>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> index 22c0cae73425..4555f1644a4d 100644
> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> @@ -28,6 +28,10 @@ properties:
>  
>    gpio-controller: true
>  
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 24
> +

I am sure there is no variant with one GPIO.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
