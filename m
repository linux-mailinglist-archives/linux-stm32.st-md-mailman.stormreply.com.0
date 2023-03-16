Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 662076BC830
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:06:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FA72C6904F;
	Thu, 16 Mar 2023 08:06:08 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D46C8C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:06:06 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cy23so4057629edb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678953966;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6OsjiDE3NuSgDjET5WMD6UNfNrRCIGptQw+4KyflP4M=;
 b=CwY1cgzXszkGS4WESkxCLBSPnvMH/NZrsLWq2/QLedh/OR5tbm1AMfxmZ6E8ESvi3B
 UW7DKuDh7v7p0idaBeWAoIK4SYgA3wOjjfrMuGEDO7A+fWPHbgbfxW6q/X8JIqCYACGL
 AJAS5SoMevqLaqMZJYrDU6j56SRYBawRkl1YZtIyZPtRenxzp/1VL0x4tU6dJwd8x7W8
 4H1gfbz+pvV4V2dBpwgpkzBOfkHToXFHMaN5l8iWjdci5hNWUirygOsfEh/DjJBbY2UE
 25Rb7LrLzci7lkUI8AR8Yp5p58FzgtFT3tc6L8nIYgvac+Va9/4CKFC1V8ShGjvfFhBK
 drNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678953966;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6OsjiDE3NuSgDjET5WMD6UNfNrRCIGptQw+4KyflP4M=;
 b=NDH/D0dnIGa+wa+HRxSnEjYn2pw6L4Gi1KkJlC0QKHjI8+ULHCUmuDfLy8ef12ooex
 F6lt07UZ4yVhklJhmtmPxvcfcFTH7CrZvB5RMRsdbWn0eIX+AW5g+YIrDPJjXVI0SK6+
 eyEts588eLyyZ2Ypv0SKQ93MySBxG5rbpHN7ivrEzVL1vFiTrCCeFKSk5xa9smg2oFlQ
 KBQF71tnUpSUcyVTADvvTyWp3QkZ8GUjtWqKUw+pQTXVcJ6LXQ2lgRhslXSaffJciFSR
 PPBqgUYD+dJ3oio2IKeZCQq4g4RpnsrF9rxDgmuoOOO4ceslruX8cF6Yt+xBE7qmmXtx
 Ee1g==
X-Gm-Message-State: AO0yUKV8B1kGZg155cIGPQYhJyJAKHWcD4dJYIqh1uLd6aOLjMMFRAQd
 rzSOvLuLHwqIkTlTpUntXS3EEA==
X-Google-Smtp-Source: AK7set+0+bYA3DjoEwcKwtIg4+mtWmSsVYB0+wwlaUkKsDgFBzV1Gz6/yFNUpM4ZJuB480jjnWZYuw==
X-Received: by 2002:aa7:c40b:0:b0:4fe:96a9:ab0a with SMTP id
 j11-20020aa7c40b000000b004fe96a9ab0amr5517331edq.1.1678953966456; 
 Thu, 16 Mar 2023 01:06:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 r24-20020a50d698000000b004af71e8cc3dsm3436547edi.60.2023.03.16.01.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:06:06 -0700 (PDT)
Message-ID: <78224241-00a3-2e8e-4763-603b27ac3b83@linaro.org>
Date: Thu, 16 Mar 2023 09:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-10-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313225103.30512-10-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 09/16] dt-bindings: net: dwmac:
 Prohibit additional props in AXI-config
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

On 13/03/2023 23:50, Serge Semin wrote:
> Currently DT-schema of the AXI-bus config sub-node prohibits to have
> unknown properties by using the unevaluatedProperties property. It's
> overkill for the sub-node which doesn't use any combining schemas
> keywords (allOf, anyOf, etc). Instead more natural is to use
> additionalProperties to prohibit for that.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 89be67e55c3e..d1b2910b799b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -466,7 +466,6 @@ properties:
>  
>    stmmac-axi-config:
>      type: object
> -    unevaluatedProperties: false
>      description:
>        AXI BUS Mode parameters.
>  
> @@ -518,6 +517,8 @@ properties:
>          description:
>            rebuild INCRx Burst
>  
> +    additionalProperties: false

But why moving it? Keep the same placement.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
