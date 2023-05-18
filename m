Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1BF7083E8
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 16:26:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EAB0C6B445;
	Thu, 18 May 2023 14:26:46 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A3E9C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 14:26:45 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-510e682795fso1347119a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684420004; x=1687012004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YuvcxNH7JXmFWKxshrQCssfOPyKkSR/Zuw9sucomlNs=;
 b=r7JIGfX5eToWEIiU2ViTc64+MqKj+8KA51H8LTywYlDStm5RaxAgc8QJuMPHjmf89z
 TEQLY/iZjrGsEJ37PGpj6Qfrak6Jj1CDQMt7KQme+TIytriUt3KLByplUeR1QO1/FwDX
 /x89fOXRTZ/tsu5SpFb51MjbdDsil/5PkGRvaWlmlIXnIpTMQ/s3xMY1QwdzybkXlxyV
 c4aCfsC2gJESlrUOis+1V0YMW0ieazBsAoHuKMKxPH6Rv4jNCr7EDXIIOXQKGmMML1+3
 n5CZWoC9iPkO6eMnOIsR4wD24nY8KhFJIzE9zjMOwzx56WFQeaT8xP43KMUmGN6QPFef
 Ufxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684420004; x=1687012004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YuvcxNH7JXmFWKxshrQCssfOPyKkSR/Zuw9sucomlNs=;
 b=kIjSPqnlnnkIkkdQtyMARYFgvx+7J8NUbcBAWkpURb4Tn6SmRkmpSVXTU+6yxd3zTA
 M/6rg+i/6y0IZHyA+BprtYlOEdVnlVVsHIwhtUUPsP/6yDme4yCeQoiA+zcxf8dD385L
 gZSQhpCBzwXSDsi9VofT5hhIja9NpKsmTBwc+psTm5MeUKglGAvEbzxGx/1cc+zinlf0
 4mpOwP+O8F1PCsGag8yeHzcVOVrdPJJEP9ijaYJeew2J31LGa1t6gvGAH9rNa7L+Z1gp
 qmG3ljtuG/0bPHUE6ebm9GakcxtkC2XctEfDtsDA/g6QZddsDprYQ0t1UNdlr13rOBlB
 C6Cw==
X-Gm-Message-State: AC+VfDxuWA0bOEiCUjZtCqlJgt9Pf9QWr6MsX5AHo3lo3Ngi4MPuOTzx
 9ok05uz3zo49zKEY1Fjfclpb3g==
X-Google-Smtp-Source: ACHHUZ520EF3osA7uFm0FAgBBBlw2Ae6R7OE4gQPTEbEx8PFtBsMh4TIg48XFmdqz2nOIyJaWe7SKQ==
X-Received: by 2002:aa7:d849:0:b0:504:9393:18b1 with SMTP id
 f9-20020aa7d849000000b00504939318b1mr4996447eds.9.1684420004594; 
 Thu, 18 May 2023 07:26:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e24:6d1b:6bf:4249?
 ([2a02:810d:15c0:828:7e24:6d1b:6bf:4249])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a056402181100b0050bc5acfcc0sm657310edy.24.2023.05.18.07.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 07:26:44 -0700 (PDT)
Message-ID: <3951bf42-bf77-20a5-a343-46127b875dd5@linaro.org>
Date: Thu, 18 May 2023 16:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20230517152513.27922-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517152513.27922-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: nvmem: syscon: Add
 syscon backed nvmem bindings
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

On 17/05/2023 17:25, Marek Vasut wrote:
> Add trivial bindings for driver which permits exposing syscon backed
> register to userspace. This is useful e.g. to expose U-Boot boot
> counter on various platforms where the boot counter is stored in
> random volatile register, like STM32MP15xx TAMP_BKPxR register.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: Use generic syscon supernode
> ---
>  .../bindings/nvmem/nvmem-syscon.yaml          | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
> new file mode 100644
> index 0000000000000..7c1173a1a6218
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/nvmem-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic syscon backed nvmem
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"

Usual comment: drop quotes. We removed them everywhere, so you based
your work on some old tree.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvmem-syscon
> +
> +  reg:
> +    maxItems: 1

Rob's questions are not solved. The nvmem.yaml schema expects here to
allow children. This should not be created per-register, but per entire
block of registers.

OTOH, using nvmem for syscon (which are MMIO and writeable registers
usually) seems odd.

> +

missing nvmem cells

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

unevaluatedProps: false

> +
> +examples:
> +  - |
> +    syscon {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        syscon@14c {

It's not really a syscon, but efuse, otp or nvmem.

> +            compatible = "nvmem-syscon";
> +            reg = <0x14c 0x4>;

Missing nvmem cells

> +        };
> +    };

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
