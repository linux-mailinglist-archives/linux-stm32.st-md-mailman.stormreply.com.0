Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 098FC75C37C
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 11:48:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C54F3C6B442;
	Fri, 21 Jul 2023 09:48:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A115C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 09:48:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so14099055e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689932914; x=1690537714;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2aY4Xg/9Uh173A94JU4dqfm2DBiw/beAAiUkYe934cQ=;
 b=kRxBi4nr899aGHDrPjiiZi9U1nuP9VX0l5v19OWwKVoakv56kXBve/kDBWOyQyiCnG
 yhcLWDiLImh2lx1iX02pn0IDG7z3ca1enOv/JYPIMV33u3aLKweGB9R4CfwqAMCMO/wF
 jzUHsyskF93/PTee9U94sbYqk/2yokfhz7fzSM/7hQnta/+XUz2/tW8lCkFduW/qbXLN
 MvKSIJd/ZJBwaEcJxcLdZk0CYjncqNyqYFuGxWPRihDBavgaUg2rAdaaAVkpcW5wP3Hh
 3jiw+2NngjtjNEiTXLMOGnNxwe5M+Znz7v9lQqkw/pe61x4Gr8S3J9o8yzpMjLhEcO2+
 aO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689932914; x=1690537714;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2aY4Xg/9Uh173A94JU4dqfm2DBiw/beAAiUkYe934cQ=;
 b=K3KOqDwflALtmBtNhtVmV3zCfB5C4HhIg/uhv+AhwspAff0bcYpKzFoGPwfOdG8DMC
 pnRqOSXmHIgp1SWSOEgK4PcWYR9UhjdLPsonAxSAQDiTQlPHoshtwOBFTYNqakb7+bO4
 A2b87HqN8i9xJLAMbL+uQI/1cQe6qy0yGiTONaajjfRXf6GrJE1uHJtDH3UnnzQX4NdK
 PYbHIx+t2aViIGk876sdz9cR0s9ZfeRCtDFlXHac/E4UHB4bhSooVAdfMXA/W0Ets4/l
 lIOy6VfKs2o+JRpaSqr5MH2/aYfgJH6dAJKdwPLbYO7h1yQ+RNrLWhAwFrWVi32uG3xV
 JY2A==
X-Gm-Message-State: ABy/qLb09u8y5PRy9gGxqgTlbXVIrGZ4HQlVDYvqRNS0KbibiBSzjML9
 yJ/epp16M8/GNeCcu9ey8cjhWA==
X-Google-Smtp-Source: APBJJlGtcO9n/J6kiaUVyGrHaarvzjPAzYeLnvmIRvKMEN/+BYIh02pDh7a2rCHgc+kFXm3C17vADQ==
X-Received: by 2002:a7b:c856:0:b0:3fb:dd5d:76b with SMTP id
 c22-20020a7bc856000000b003fbdd5d076bmr960439wml.7.1689932914641; 
 Fri, 21 Jul 2023 02:48:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a7bc8c2000000b003fb225d414fsm5736048wml.21.2023.07.21.02.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 02:48:34 -0700 (PDT)
Message-ID: <a90e2f38-1308-cfa2-740c-02869f923171@linaro.org>
Date: Fri, 21 Jul 2023 11:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
References: <20230721090618.1211081-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721090618.1211081-1-alexander.stein@ew.tq-group.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: gpio: Add
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

On 21/07/2023 11:06, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> index 22c0cae73425..b226a8892f8a 100644
> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> @@ -27,6 +27,7 @@ properties:
>      const: 2
>  
>    gpio-controller: true
> +  gpio-line-names: true

min/maxItems

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
