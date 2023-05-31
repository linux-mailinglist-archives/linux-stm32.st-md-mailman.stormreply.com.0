Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B08B71898D
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 20:48:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2321C6A614;
	Wed, 31 May 2023 18:48:32 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A14AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 18:48:31 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-973bf581759so1065942566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685558911; x=1688150911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L7yEMD4GtmJf8xmNQ6AyKy2NUsZaRYPN954fFPpAVdQ=;
 b=uLO5bJfHtCz18Y+0BzM7MuqN7+sdRnrBH42OfGzDWPgEKIEYSX3aOdpnUB1dzc9dgv
 Sz6IRmTamCz+INjMaEJ/mc3on3GZwZx/awulr9uirMBHkDUutugWPnxfVXRUTidI5sQo
 ilaDuMIMEvlQVc22Rza4j3+gT3m8tHm0dwVXFKRXHm4lUQuzGS1lvUq9FKJNYgfZ6qdl
 MwI3uWaLSTCUkXxdlSex+hFWg/7xfLBuIzK60kAUvVMLyAHA9/2VAsBw3MIM0qAzymtZ
 z0x+LYAZVa/n/JhliUGItmigSZFYJVFD0+ZvZFWfPEbHCxYaEFi8c2L52T+SNz45WX9w
 mDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685558911; x=1688150911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L7yEMD4GtmJf8xmNQ6AyKy2NUsZaRYPN954fFPpAVdQ=;
 b=MO4s80M/nhe5fop6h5VX1bx/too+wqfME5RuTL/yLgc4r1Cn44+8wrq9vIqGxBTaff
 sG6k11kKabnJ8YpjsPsixkdlo3aISMRS0sCCnGw7JaeYQVcyxzgQ+CJanKf8wZg8+0BF
 B4xNEEmaYW4yvFuurIGpNpd5grsXMz7N9aAK2THvIR7IcrvFoGP+HpPbHEJerOyHPJXI
 DjHGlqevd9oYXzpBrxjRvkplPS73bbNIxLFgERxXgbSlu4qLUAI4rnwzUBLo2Ol42WMS
 eKFbztlemyQzXqUiUMVke0IkpUei8qx9pHaqELIxsP+GE1DLXcUDCeKl5HI4CoxfEzll
 2s8w==
X-Gm-Message-State: AC+VfDzE1s+clQvSdi0FYHT4TROJsDmWQOSLFtBfv+KFaBz02o45EM9g
 Swb0Tg/lk6MTQcW/6jAVRBbmXg==
X-Google-Smtp-Source: ACHHUZ7kXXRkM9Lide71GGUhJF0GEqPo8MixcjJda7Fkd7PvNdc6tC0I7G7bOSvefWO6B0AWdxnRXA==
X-Received: by 2002:a17:907:724d:b0:953:517a:8f1a with SMTP id
 ds13-20020a170907724d00b00953517a8f1amr7218867ejc.58.1685558910653; 
 Wed, 31 May 2023 11:48:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a1709063b5a00b00968242f8c37sm9252653ejf.50.2023.05.31.11.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 11:48:30 -0700 (PDT)
Message-ID: <d35fdc37-a793-3109-1474-065dffb03069@linaro.org>
Date: Wed, 31 May 2023 20:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-4-alexandre.torgue@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230529162034.20481-4-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 03/11] dt-bindings: stm32: add st,
 stm32mp25-syscfg compatible for syscon
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

On 29/05/2023 18:20, Alexandre Torgue wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Add the new syscon compatible for STM32MP25 syscfg = "st,stm32mp25-syscfg".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index ad8e51aa01b0..9ed5b121cea9 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -16,6 +16,7 @@ properties:
>        - items:
>            - enum:
>                - st,stm32mp157-syscfg
> +              - st,stm32mp25-syscfg

You should rather keep some (alphabetical?) order.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
