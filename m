Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0C7356B4
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 14:23:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A327AC6A60D;
	Mon, 19 Jun 2023 12:23:31 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9F76C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 12:23:29 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2b4636bb22eso30970241fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687177409; x=1689769409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TSP20PRjLfEjEczhmjfYNlia/vcSKNLRdUGUz9NHLWk=;
 b=yo+Z+f5JTD4zf+O3aNYVki4aAyWmqo9AGYDhyQXjeCuyotDVx5sjiU3lNnxu5dNF4r
 gWi9toGSJ0qggbyNgYt83JM5CmBlAoJk5Na/Rxh8xLCneHmgrQHJfo4EZMKUq4J4gT8m
 vbfLwDA9/sMvcAtiqOLpM/80FvrFBsls1lOpQ92tmXK1Q5X0Z/fsxjv7zSQ2OAoLAvNq
 1q8VrWtJYjZ/Qt4qyeuEQd6R2iNvsUpfKcPYu1ed0Yrlpxl6aP5/5XC3ABwl0vH3UMRz
 6dyS1XvJNUMU1084BqEMdAcA04kzQS4pxZc79NCW3EtIZoZ7rL1l4XfIBUMcJEUtdO5z
 R7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687177409; x=1689769409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSP20PRjLfEjEczhmjfYNlia/vcSKNLRdUGUz9NHLWk=;
 b=VJUxIY8ftMHDo4eO5C+swZhR1wReqrs6A2eYF1RlQOGFotIIm3Tc/fMOfU9iGo9bs4
 V2kR4+BoGavEdlp29DoRTWSmjR57XKSbOQ3fMYqfFgCVpD1OF7KL4UY5gb4gP8CFG9Nm
 qbBUeg83m6+vzuS2A+v6aDzp06JxlwHruEaWB1R+rEi8t85yTgI03z62r9eGtf+Jq088
 v48vHn786ZYMAGfYaFR5CNVjTiljkvwccjjBCy1Lke1p6i7YvOrws+ciHDcnTAyip5XY
 R9decq3VOSyzhRYA0UfAnSspwgG73Qhy9PJbsbgiLLZmow0JgfXNAwvUVTW83L02fDIn
 KDsA==
X-Gm-Message-State: AC+VfDyBeQAh2WeLGcEjuZGAzqSlclZNX6Dn2CjaUgbqG+LUHhkYGDSh
 PacozZuvoS/LMFaBL8brEalFpw==
X-Google-Smtp-Source: ACHHUZ55Tp1NaWXP5nJ6mewhwTdXY+WArg4PWOHSlyIXMGE3IKFjWZen5h93Q5FJPTwyw1f8IXcyAA==
X-Received: by 2002:a2e:a401:0:b0:2b4:809a:1c7c with SMTP id
 p1-20020a2ea401000000b002b4809a1c7cmr933619ljn.19.1687177408953; 
 Mon, 19 Jun 2023 05:23:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 k27-20020a17090646db00b00988be3c1d87sm1123119ejs.116.2023.06.19.05.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 05:23:28 -0700 (PDT)
Message-ID: <598c14f9-395c-d218-4af9-31bba022dcf6@linaro.org>
Date: Mon, 19 Jun 2023 14:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
References: <20230619115120.64474-1-yann.gautier@foss.st.com>
 <20230619115120.64474-2-yann.gautier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619115120.64474-2-yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Xiang wangx <wangxiang@cdjrlc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/6] dt-bindings: mmc: mmci: Add st,
 stm32mp25-sdmmc2 compatible
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

On 19/06/2023 13:51, Yann Gautier wrote:
> For STM32MP25, we'll need to distinguish how is managed the delay block.
> This is done through a new comptible dedicated for this SoC, as the
> delay block registers are located in SYSCFG peripheral.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
> Changes in v2:
> - update dt-bindings file (remove bootloader reference and use enum)
> 
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 1c96da04f0e53..2459a55ed540b 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -53,10 +53,11 @@ properties:
>          items:
>            - const: arm,pl18x
>            - const: arm,primecell
> -      - description: Entry for STMicroelectronics variant of PL18x.
> -          This dedicated compatible is used by bootloaders.
> +      - description: Entries for STMicroelectronics variant of PL18x.
>          items:
> -          - const: st,stm32-sdmmc2
> +          - enum:
> +              - st,stm32-sdmmc2
> +              - st,stm32mp25-sdmmc2

It's nicely visible that old stm32 entry was family-generic, not
device-specific, thus not really correct. :( I hope we can learn from
this for future stm submissions.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
