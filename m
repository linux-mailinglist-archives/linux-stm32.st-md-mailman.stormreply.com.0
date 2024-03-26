Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B038888D021
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 22:34:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 543AFC6B46B;
	Tue, 26 Mar 2024 21:34:34 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C78BC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 21:34:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BF7B7CE244D;
 Tue, 26 Mar 2024 21:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA317C433F1;
 Tue, 26 Mar 2024 21:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711488869;
 bh=Vp6QKMZSyuFN03oJX7Gy9S9p6P3Gg6AmCMANf0QxqRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVWgwjD4ab3E4sy34QBQEECtoSaxU0lDFKM+AuYxrGjQDLJ7ob7m8hnlZuZNzlOol
 IifXx+FbxLTbKOe7YjxDiXCmf9ZBJxPrQGdDoCeLjNclIMptnMvss13kozTFYBq9Pg
 UDm9WJ/YA0Gr3J/h/+iLa2KcEJyTlyDn2hzrmXJM9wwXpi71SdFpP65ol8fLwYVQKU
 FCWo5bRsnhzupCoRb3IaRJtY0rSxTqwnlU90H3lcdjgEAbTIc9Ml4q9L2wO4ku9Phq
 xnGJB++507iw0UbYvg01+73b5wfIGwtjGGp28UwCJLYmrtwNIqqVmYYovJncsPRZ0p
 n2L9EFIFukgKQ==
Date: Tue, 26 Mar 2024 16:34:26 -0500
From: Rob Herring <robh@kernel.org>
To: Tan Chun Hau <chunhau.tan@starfivetech.com>
Message-ID: <20240326213426.GA3667606-robh@kernel.org>
References: <20240326052505.197408-1-chunhau.tan@starfivetech.com>
 <20240326052505.197408-2-chunhau.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326052505.197408-2-chunhau.tan@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jee Heng Sia <jeeheng.sia@starfivetech.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v4 1/1] dt-bindings: net: starfive,
 jh7110-dwmac: Add StarFive JH8100 support
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

On Mon, Mar 25, 2024 at 10:25:05PM -0700, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
> 
> Please refer to below:
> 
>   JH8100: reset-names = "stmmaceth";
>   JH7110: reset-names = "stmmaceth", "ahb";
>   JH7100: reset-names = "ahb";
> 
> Example usage of JH8100 in the device tree:
> 
> gmac0: ethernet@16030000 {
>         compatible = "starfive,jh8100-dwmac",
>                      "starfive,jh7110-dwmac",
>                      "snps,dwmac-5.20";
>         ...
> };
> 
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 54 ++++++++++++++-----
>  2 files changed, 41 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 6b0341a8e0ea..a6d596b7dcf4 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -97,6 +97,7 @@ properties:
>          - snps,dwxgmac-2.10
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
> +        - starfive,jh8100-dwmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 0d1962980f57..ce018e9768d2 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -18,6 +18,7 @@ select:
>          enum:
>            - starfive,jh7100-dwmac
>            - starfive,jh7110-dwmac
> +          - starfive,jh8100-dwmac
>    required:
>      - compatible
>  
> @@ -30,6 +31,10 @@ properties:
>        - items:
>            - const: starfive,jh7110-dwmac
>            - const: snps,dwmac-5.20
> +      - items:
> +          - const: starfive,jh8100-dwmac
> +          - const: starfive,jh7110-dwmac
> +          - const: snps,dwmac-5.20
>  
>    reg:
>      maxItems: 1
> @@ -107,20 +112,41 @@ allOf:
>            contains:
>              const: starfive,jh7110-dwmac
>      then:
> -      properties:
> -        interrupts:
> -          minItems: 3
> -          maxItems: 3
> -
> -        interrupt-names:
> -          minItems: 3
> -          maxItems: 3

interrupts and interrupt-names are the same, so you can leave them here 
instead of duplicating them as you have.

> -
> -        resets:
> -          minItems: 2
> -
> -        reset-names:
> -          minItems: 2
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: starfive,jh8100-dwmac
> +      then:
> +        properties:
> +          interrupts:
> +            minItems: 3
> +            maxItems: 3
> +
> +          interrupt-names:
> +            minItems: 3
> +            maxItems: 3
> +
> +          resets:
> +            maxItems: 1
> +
> +          reset-names:
> +            const: stmmaceth
> +      else:
> +        properties:
> +          interrupts:
> +            minItems: 3
> +            maxItems: 3
> +
> +          interrupt-names:
> +            minItems: 3
> +            maxItems: 3
> +
> +          resets:
> +            minItems: 2
> +
> +          reset-names:
> +            minItems: 2
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
