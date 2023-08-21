Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A621D7823B4
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 08:29:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AA79C6B44E;
	Mon, 21 Aug 2023 06:29:14 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F24ECC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:29:12 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-99c93638322so612193666b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692599352; x=1693204152;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+jqHn5WqQaJCtg0AUJN1FB+zw67/mJle7arazhBOmko=;
 b=uBhtrmUWcQZYqn4uY2bSvQU2eud7UeI4VaPCawfTs8lFgDgS4S6oPVwHPGi/J9JSi9
 Cg8t2/x3c9XBn7O2ZyzPmAa24lRvVSS56PbNRD8WZZy6uXNC7vSRqI/mEFUQYiFtw82n
 QaAe6CwzMeadrUWLErPi90FmPSizT7npPdN807HHxfQ0ETTTy/8g2I0+rE9upci26NjO
 4q9QkuIwRxz6Wf4VpZ+NqpPEaIE/xpwICIzuQ+c7zIu8BvbwwJUpJzvP2hsEvDYbkObr
 Vqnwj0FO0s8LL4qTBPyGsn0llyb/7JC1OBKfQGzlOZVvhLQ41PJlUlyAHlhXi5L8SuyF
 ExTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692599352; x=1693204152;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jqHn5WqQaJCtg0AUJN1FB+zw67/mJle7arazhBOmko=;
 b=kdhyBp7T4QCI24++nhMsu1wOUPDcZggOcD8yL1ukyWiN+FCFMzjgne8OiPwkwXne3S
 6qs14KAbxjeXXxwT6O5UHuLIP0R99+oBowW8J6rfDnixe+XchdheZUBwyQQGUkCvkBGO
 W0znqWogXYy+04EkZYAikpCMnlxtbwGNc28Fzw0R/7scne7Tmbrg6Uv2IZrUe+bWxe+D
 spc5AjHYoKbjciiDYMwWF3+v2r9THAI2Ey3MZquXBzUb8tA3zB/Yes/KCmBhTuOFi3V3
 Z5W4gCjwQqsxBU0mT0+gy1tcCZ1aoG8w70EhneMiOw279oOzga9CfJ8wK2ioZMsy+dJS
 MeDg==
X-Gm-Message-State: AOJu0Yy9R3TxxQf+Rhk6cjCo4ueBQoQ7b2ezEvlVxnEhx0Fy0Kp36siz
 /c87Qy0iozEhgE5xeXicC5l3/w==
X-Google-Smtp-Source: AGHT+IHd6+ypVwsYhxnMdbL1UGq6ySkQpWZQ9iHuM8cgfdj0lw84KWdQOHSNV2yTMAzl8mMt2IyJ8A==
X-Received: by 2002:a17:907:9483:b0:99d:f274:316e with SMTP id
 dm3-20020a170907948300b0099df274316emr5384047ejc.2.1692599352343; 
 Sun, 20 Aug 2023 23:29:12 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 kj20-20020a170907765400b0099cc402d3ddsm5836644ejc.202.2023.08.20.23.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Aug 2023 23:29:11 -0700 (PDT)
Message-ID: <946ef7a0-a60b-b6ab-69f8-b169343f36f9@linaro.org>
Date: Mon, 21 Aug 2023 08:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230820120213.2054-1-jszhang@kernel.org>
 <20230820120213.2054-3-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230820120213.2054-3-jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] dt-bindings: net: add T-HEAD
	dwmac support
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

On 20/08/2023 14:02, Jisheng Zhang wrote:
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

Thank you for your patch. There is something to discuss/improve.

> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD DWMAC glue layer

Describe/name rather the actual device, not some layer.

> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - thead,th1520-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - thead,th1520-dwmac
> +      - const: snps,dwmac-3.70a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: AXI clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: axi

Isn't basically axi clock a pclk? You should rather use the names from
snps,dwmac

> +
> +  thead,gmacapb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the syscon node that control ethernet
> +      interface and timing delay.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-mode
> +  - thead,gmacapb

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
