Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E781C0EE
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 23:21:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA4AAC6B477;
	Thu, 21 Dec 2023 22:21:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C65E0C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 22:21:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 887D361A3D;
 Thu, 21 Dec 2023 22:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD12C433C7;
 Thu, 21 Dec 2023 22:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703197272;
 bh=QgXF77VH1quUhBSUHnfmL14IOGo1ToPCIsuSoRp28oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CRpF4i0/6Uwc4vIfioIc95uffcYv2DC2hR8KxwZCE238XwNPgiOvE6WvGz5elA3Qi
 LDbNOISdmiVDiDK2kY/GeKgJgf/OVFmPsstYpvuoVu/syOfVvM70Il5p62loK9Hoiy
 T1ZF+MGKJt45QFgWOO3ZE5o1LJEkwQTVb6VRxxL/vACAURdpSisaqdTtcP5W7rmWga
 oCcZfsW5D09OyQjVs0Rop88P5wdvt/1NXooobClx0HbP+SSyoFeNyUomULsn61hcEU
 el8bh7xuNSr42ymb82aEKaNSKCHlzsK3su/Sb0apnXp1zH1NRm3eGXOhOml1JomaGK
 hjCH76QgIL/BQ==
Received: (nullmailer pid 194830 invoked by uid 1000);
 Thu, 21 Dec 2023 22:21:09 -0000
Date: Thu, 21 Dec 2023 16:21:09 -0600
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20231221222109.GA186673-robh@kernel.org>
References: <20231220002824.2462655-1-cristian.ciocaltea@collabora.com>
 <20231220002824.2462655-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231220002824.2462655-2-cristian.ciocaltea@collabora.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 Emil Renner Berthing <kernel@esmil.dk>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

On Wed, Dec 20, 2023 at 02:28:22AM +0200, Cristian Ciocaltea wrote:
> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is mostly
> similar to the newer JH7110, but it requires only two interrupts and a
> single reset line, which is 'ahb' instead of the commonly used
> 'stmmaceth'.
> 
> Since the common binding 'snps,dwmac' allows selecting 'ahb' only in
> conjunction with 'stmmaceth', extend the logic to also permit exclusive
> usage of the 'ahb' reset name.  This ensures the following use cases are
> supported:
> 
>   JH7110: reset-names = "stmmaceth", "ahb";
>   JH7100: reset-names = "ahb";
>   other:  reset-names = "stmmaceth";
> 
> Also note the need to use a different dwmac fallback, as v5.20 applies
> to JH7110 only, while JH7100 relies on v3.7x.
> 
> Additionally, drop the reset description items from top-level binding as
> they are already provided by the included snps,dwmac schema.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 11 ++-
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 75 +++++++++++++------
>  2 files changed, 60 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 5c2769dc689a..90c4db178c67 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -95,6 +95,7 @@ properties:
>          - snps,dwmac-5.20
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
>  
>    reg:
> @@ -144,10 +145,12 @@ properties:
>        - description: AHB reset
>  
>    reset-names:
> -    minItems: 1
> -    items:
> -      - const: stmmaceth
> -      - const: ahb
> +    oneOf:
> +      - items:
> +          - enum: [stmmaceth, ahb]
> +      - items:
> +          - const: stmmaceth
> +          - const: ahb
>  
>    power-domains:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 5e7cfbbebce6..f5f0bff5be0f 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -16,16 +16,20 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - starfive,jh7100-dwmac
>            - starfive,jh7110-dwmac
>    required:
>      - compatible
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - starfive,jh7110-dwmac
> -      - const: snps,dwmac-5.20
> +    oneOf:
> +      - items:
> +          - const: starfive,jh7100-dwmac
> +          - const: snps,dwmac
> +      - items:
> +          - const: starfive,jh7110-dwmac
> +          - const: snps,dwmac-5.20
>  
>    reg:
>      maxItems: 1
> @@ -46,24 +50,6 @@ properties:
>        - const: tx
>        - const: gtx
>  
> -  interrupts:
> -    minItems: 3
> -    maxItems: 3
> -
> -  interrupt-names:
> -    minItems: 3
> -    maxItems: 3
> -
> -  resets:
> -    items:
> -      - description: MAC Reset signal.
> -      - description: AHB Reset signal.
> -
> -  reset-names:
> -    items:
> -      - const: stmmaceth
> -      - const: ahb
> -
>    starfive,tx-use-rgmii-clk:
>      description:
>        Tx clock is provided by external rgmii clock.
> @@ -94,6 +80,51 @@ required:
>  allOf:
>    - $ref: snps,dwmac.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7100-dwmac
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +          maxItems: 2
> +
> +        interrupt-names:
> +          minItems: 2
> +          maxItems: 2
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          const: ahb

Just 'maxItems: 1'

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-dwmac
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 3
> +          maxItems: 3
> +
> +        interrupt-names:
> +          minItems: 3
> +          maxItems: 3
> +
> +        resets:
> +          minItems: 2
> +          maxItems: 2

max is already 2. Drop.

> +
> +        reset-names:
> +          items:
> +            - const: stmmaceth
> +            - const: ahb

Already defined the names. Just 'minItems: 2'.

> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
