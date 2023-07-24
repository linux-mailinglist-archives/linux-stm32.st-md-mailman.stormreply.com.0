Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7175F85B
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 15:36:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DDCEC6B442;
	Mon, 24 Jul 2023 13:36:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 067C4C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 13:36:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so11243609a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690205763; x=1690810563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mpGN1sK2QXh4+Jmk/N0VrGqJC404Ue1gP6VHyXAM7A=;
 b=DVhka/Gg1EmteFojO2ma3hxVj1EKeRHyp9OBxNLwzuwV15YgFDr0n24IbZks9+ZH8u
 VyKFSc3zi4L5fXwmsZBdGUJQVEmog6uTeyaCrBRscZ0hQaYy+yYKgRS5+xgbJadgf6IX
 otp68DRMZVSkacT0iL4TGUuQerw7DymYXtK9Sqc2+gt167TsaLMaTvabOh5q+D0U2YmY
 OpH/2dAiMVFQFRItIf87kTlEj3XCdizHHj0D6qQ+AL2nQ6v8zkTwZZdCtVaPyf/q3oSS
 QDKwGPreKGV9RHV1ZMYmRxi16BJERztLKZE/pglD2xIQAIYBsVug2unUNFkDeNVmsrf4
 VPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690205763; x=1690810563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mpGN1sK2QXh4+Jmk/N0VrGqJC404Ue1gP6VHyXAM7A=;
 b=KWOx/QbGIhCKPpHgbiN1AWBZoab8TA25AVNKjyHY9xF4cVbs/Ah2wH/gcZV4Q1uHue
 lb6h7XiRfO7QK3XtWfh1UkpCbaqdRjivA4oLFofe4sHn8V38ApTzclnz+cR539Y9iox0
 e8KNEOvj1Txe4antvHtChoferZ9ABvPmMv8g+zJkxvUrgLJrpF9AlHufh14kx6tG8jjV
 1+c6jSyKcZxV7m1wIPwwJB0WvizKrmQCJe60+z9u7YBEVCmojdeNkEGCcaLNtci9W84M
 4bJIwRlpztIamBrjMrZRtQUz57LQ9Iyg+13+MXVwwdlIbm96ftmORNe007DyB3koKsJa
 a4XQ==
X-Gm-Message-State: ABy/qLZqqJ+whJ/jEOxw3zR4zdCWZEvX7hbkYU84cKIBhZBosalJzJoe
 Nb/sIOxmTfyE3TDDOprr5Ka5ww==
X-Google-Smtp-Source: APBJJlHVB9K6K5BSR/6zupLkVOZYeSc3WOUwXfUTugUj5DabDaCWuWD4Of1GvZR38Zwo3cUrNvJjpg==
X-Received: by 2002:a17:907:7ba6:b0:99b:4867:5e1c with SMTP id
 ne38-20020a1709077ba600b0099b48675e1cmr14638324ejc.28.1690205763548; 
 Mon, 24 Jul 2023 06:36:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170906041300b009883a3edcfcsm6861549eja.171.2023.07.24.06.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 06:36:01 -0700 (PDT)
Message-ID: <7a5b978b-1846-874b-042b-cc5704963366@linaro.org>
Date: Mon, 24 Jul 2023 15:35:59 +0200
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
