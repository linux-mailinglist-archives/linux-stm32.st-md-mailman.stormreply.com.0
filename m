Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 396D875EC6A
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 09:24:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0286AC6B459;
	Mon, 24 Jul 2023 07:24:04 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2632BC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 07:24:03 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-992e22c09edso590515366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690183442; x=1690788242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CBrXA3GfQqUqZF4hKq4KKQZVGsJT8J4SBU3nb0zPdIc=;
 b=vTksFXABghnZiSOnD0bW1YzvyKrWF7RWN8q75TD+vcEq1QW/hkPGoDaXm6PZ9CO9XS
 Gsk4NDvqLU/KRqKZ7AEiS2nq4k6510nvPjX09tbPSQ6yZUxdgMY456q4bXkn+tv8VcNz
 uU3iKbiIrRmJNDsL9vBHFPyfbZSCq0s6Q7kJv0XqOTa6GRsSWaI/Y0PkR5+BHtJIom8C
 ztVynBlHVoNU9hPpQm4cmB3s5xkxY1oACHXUlXcGoNX2JQRjoisleVqMm9AIolhN+2x6
 Td3k1Qs5n4oetbi7G/MAl54+qCWmoecqJGXOuocMLaLMRp48bSgLCDunV5NMzFP9CgVw
 BFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690183442; x=1690788242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CBrXA3GfQqUqZF4hKq4KKQZVGsJT8J4SBU3nb0zPdIc=;
 b=hKUJ3G6OpNLkZug+ehz9ABAr4lH7mmACLnIyLa+j/SCFfeKbw+kard1v0m5E6hOSYY
 pqiOKIWyKLyaCWyWR6PK4tGKoM89y/AduKd3FAkONAu2ofX34XQG7wpBWmBPP+5TT/lc
 /WVZCGoJplhvk0Whhl0hVy6xIO/3kMWMvX/ahiljIvIa0o4x9C5BsIhCQUR2qGwekg8d
 2O1cu3V9+fwnCV23ICepe3W2kKh2/bT0u1wOhORrqabJRLQ30dZoG9GrYYazfPt8hWse
 vY+tqTrRHyDxo6pEavpgD1Lc/2y8GgYA+KPzh+4mE5tu1mHSKh7syfrSz135WkK8nULU
 Gkqw==
X-Gm-Message-State: ABy/qLaGMDVTA4njURrRq/BrbVD3gEHNp0ZJL0IyFaALKenovY36Jrpe
 JE7qh1QlsldZCPPD0VICMTtsKQ==
X-Google-Smtp-Source: APBJJlGjYdU3iGP0Fguc6/73vVCUUIk+kJlhFXlg86MiGvd9WTlERBp8eHJaZ3yfX4z4ulPCBh/L1Q==
X-Received: by 2002:a17:906:749a:b0:99b:4e52:da47 with SMTP id
 e26-20020a170906749a00b0099b4e52da47mr7387743ejl.33.1690183442711; 
 Mon, 24 Jul 2023 00:24:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a17090606cc00b0099290e2c15esm6314315ejb.75.2023.07.24.00.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 00:24:02 -0700 (PDT)
Message-ID: <97565358-d11e-459c-8bf7-adfb3aa079ed@linaro.org>
Date: Mon, 24 Jul 2023 09:24:00 +0200
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
 <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: leds: Add
 gpio-line-names to PCA9532 GPIO
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
> pca9532 supports up to 16 GPIOs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Add min/maxItems
> 
>  Documentation/devicetree/bindings/leds/nxp,pca953x.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> index edf6f55df685..9610bca57dd5 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> @@ -29,6 +29,10 @@ properties:
>  
>    gpio-controller: true
>  
> +  gpio-line-names:
> +    minItems: 1

GPIO expander which adds only one GPIO? That would be weird. Are sure?
Which model supports 1 GPIO?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
