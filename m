Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9F988A8F7
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 17:22:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D854DC6B444;
	Mon, 25 Mar 2024 16:22:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4577EC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 16:22:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C889A61172;
 Mon, 25 Mar 2024 16:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0D8C433C7;
 Mon, 25 Mar 2024 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711383767;
 bh=xE6KNpCOn2OEaSo250Fbx8HQD0Ki6bF5GBxHx8kHNfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M64/jWNfngnT3K2O0pepQWlnUxOW6YNPcpROJY1+gM/c8i3VywFpfoLk0JTo00PKW
 iXf9f7G6lCML6+X9GtBSPg18JyUpmFZB/PMdRYUq1+iS4ioyDjuBjjSI4Mir22hRpF
 1XPxZQjSvs0lak8qEx48f2iE8MCI35aAn3A3zr9SwvtBOEsbWUqJFSUneSB+yWu4hx
 fS4pjsv6BfTmJPYkUo9LeFkuFdLoq42jOWyHOO3oU3J8O3BLHOKL3YintLT7xUkhxk
 VyaH2lzmc8VzwK61/yHWMmumaF3jOWkFlb9vO9atzVOh8RPRImz5vS1PFa6i/ybMYl
 AX0z34uS1hFuA==
Date: Mon, 25 Mar 2024 11:22:45 -0500
From: Rob Herring <robh@kernel.org>
To: Tan Chun Hau <chunhau.tan@starfivetech.com>
Message-ID: <20240325162245.GA4167001-robh@kernel.org>
References: <20240325085131.182657-1-chunhau.tan@starfivetech.com>
 <20240325085131.182657-2-chunhau.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325085131.182657-2-chunhau.tan@starfivetech.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 1/1] dt-bindings: net: starfive,
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

On Mon, Mar 25, 2024 at 01:51:31AM -0700, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
> 
> Please refer to below:
> 
>   JH8100: reset-names = "stmmaceth";
>   JH7110: reset-names = "stmmaceth", "ahb";

It's debatable whether JH8100 is compatible with JH7110 if the 2nd reset 
was not optional. I guess if the Linux driver treated it that way, we 
can get away with it. It would simplify the conditionals in the schema 
if the schema also treated the 2nd entry as optional on JH7110 as well.


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
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 82 +++++++++++++------
>  2 files changed, 58 insertions(+), 25 deletions(-)
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
> index 0d1962980f57..da3cc984fec9 100644
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
> @@ -83,29 +88,13 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            const: starfive,jh7100-dwmac
> -    then:
> -      properties:
> -        interrupts:
> -          minItems: 2
> -          maxItems: 2
> -
> -        interrupt-names:
> -          minItems: 2
> -          maxItems: 2
> -
> -        resets:
> -          maxItems: 1
> -
> -        reset-names:
> -          const: ahb
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: starfive,jh7110-dwmac
> +          allOf:
> +            - contains:
> +                enum:
> +                  - starfive,jh8100-dwmac
> +            - contains:
> +                enum:
> +                  - starfive,jh7110-dwmac

There's no need for the 2nd entry. You just need to check

I would something like this structure:

  - if:
      properties:
        compatible:
          contains:
            const: starfive,jh7100-dwmac

    then:

      if:
        properties:
          compatible:
            contains:
              const: starfive,jh8100-dwmac
      then:
        ...
      else:
        ...


>      then:
>        properties:
>          interrupts:
> @@ -117,10 +106,53 @@ allOf:
>            maxItems: 3
>  
>          resets:
> -          minItems: 2
> +          maxItems: 1
>  
>          reset-names:
> -          minItems: 2
> +          const: stmmaceth
> +
> +    else:

I don't think you need the else. Just do another 'if' entry.

> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: starfive,jh7100-dwmac
> +      then:
> +        properties:
> +          interrupts:
> +            minItems: 2
> +            maxItems: 2
> +
> +          interrupt-names:
> +            minItems: 2
> +            maxItems: 2
> +
> +          resets:
> +            maxItems: 1
> +
> +          reset-names:
> +            const: ahb
> +
> +        if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: starfive,jh7110-dwmac
> +        then:
> +          properties:
> +            interrupts:
> +              minItems: 3
> +              maxItems: 3
> +
> +            interrupt-names:
> +              minItems: 3
> +              maxItems: 3
> +
> +            resets:
> +              minItems: 2
> +
> +            reset-names:
> +              minItems: 2
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
