Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF1879D3E3
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 16:39:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3E65C6B46F;
	Tue, 12 Sep 2023 14:39:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F5DAC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 14:39:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-501bd164fbfso9323509e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694529540; x=1695134340;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90jC6lxpRCDPUe28BcYQwA0xCL7xf56sZ85Q5b+uKGA=;
 b=ZGDj7wiRibsIyx0cnHLsLAHeL6Zwln2fwS4Z+hiiSZaVO+mCktIa9NgJxEfBHpqqwr
 rbE2/mLO45x2DaJ3C3z2zIOY6c3AhJJe4IPv7D+l9XlWuxDMe75Is4ricW1yVnyVwfqG
 M5+BLQItibI4MGzgLKxSG2fzzszIYI0CE6szkUlKCEFkqTS+Y66/cI+XCVau0k21uJIZ
 rAqS+LRcAJaP6gtRG8EjHUNPk5zIxUnyevN5a90vWDEXqPZ+6pubHMwg4ScP8IB42nNg
 Cb6TdtsYuzCLZvJKO08Ptyu0yIV1c4hKr0x4Ks/Ei/Qjzv9rsJq6eyKJ/eFx17WvqEL5
 lfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694529540; x=1695134340;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90jC6lxpRCDPUe28BcYQwA0xCL7xf56sZ85Q5b+uKGA=;
 b=byJwlU/oqDT5Vs283JYvsA6efJpsbNgHb2Nb21xfyEEKu+MytRPyxJbafdCJL7nylO
 NmbyF5xrEbqS5kCBQGfn5RnOgf6es1ZPpHAJ7vQnwf5MLu79JYyeDoNkKIQtpS/LBWyG
 6loFX9I/lCdBVJEJmBcFSfIbFgMtg4kL5XwDI5jiceGEywD8mjb2kmkAnk+vbTKish1R
 ltjn28e43bV+qk9LBpw+j2XHkY6K4u7JDVEPe7tBRgZ2b9ZKnlSfzaY6EgIdPhMiFIQG
 tMOX8ruSyLpvftPlIQWQhmp0sxR9ZuKUK2tefvN3PapigwOJXFqGos70QWigQfoDwIPL
 3NGA==
X-Gm-Message-State: AOJu0YxNeJc7PrXSGv7Y8uX6QDH88xx1X+pWkCSP1Q3f33yDfBjRXFQ+
 e2BDBRHtBtxBsjcWK/V1ruod3g==
X-Google-Smtp-Source: AGHT+IGTLkWR/G9NZRRA7prqCKEl3s/MsYlgvEESmIxQqGWWdnJSzY4il2hoUqsAEx+R0TwNJNs6YQ==
X-Received: by 2002:a05:6512:b95:b0:500:a6c1:36f7 with SMTP id
 b21-20020a0565120b9500b00500a6c136f7mr12163748lfv.3.1694529540570; 
 Tue, 12 Sep 2023 07:39:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 d32-20020a056402402000b00521d2f7459fsm4484835eda.49.2023.09.12.07.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 07:39:00 -0700 (PDT)
Message-ID: <327ff0b3-21c9-1452-af1b-e9b6ece52924@linaro.org>
Date: Tue, 12 Sep 2023 16:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
 <20230911120203.774632-11-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911120203.774632-11-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 10/10] ARM: dts: stm32: add RNG node
 for STM32MP13x platforms
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

On 11/09/2023 14:02, Gatien Chevallier wrote:
> The RNG on STM32MP13 offers upgrades like customization of its
> configuration and the conditional reset.
> 
> The hardware RNG should be managed in the secure world for but it
> is supported on Linux. Therefore, is it not default enabled.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  arch/arm/boot/dts/st/stm32mp131.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
> index ac90fcbf0c09..39db82b782eb 100644
> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
> @@ -1220,6 +1220,14 @@ mdma: dma-controller@58000000 {
>  			dma-requests = <48>;
>  		};
>  
> +		rng: rng@54004000 {
> +			compatible = "st,stm32mp13-rng";
> +			reg = <0x54004000 0x400>;
> +			clocks = <&rcc RNG1_K>;
> +			resets = <&rcc RNG1_R>;
> +			status = "disabled";

Why? What other resources are missing?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
