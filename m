Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D78B3FF8
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 21:17:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9DD9C7128C;
	Fri, 26 Apr 2024 19:17:04 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76AA8C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 19:17:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1FE67CE1B30;
 Fri, 26 Apr 2024 19:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4885C113CD;
 Fri, 26 Apr 2024 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714159019;
 bh=Bj2AZaQTqYSdg6fkn6Il92fkgt/C3Q4S+clYDV4u+Ww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WV2aOfp6+5cu/MfFdETRZeOz0ESfZvdTNKnPbuq2lPH+VKfUpsEWIvLAO8tE7HSaq
 uS8OG4qXZt++P681yhw1OiTP8C7MVrNYmpN2fmckWGKNEdb5xBlB2pO/r0Px+TznNt
 ZicF4qYOMR0xWBctHvVMfxyxIUnNJ45rknVIvoT0NNkn0nk7sx9vjpOlKHTU6GAzBb
 ctpAqq+zRqq7Vpo+1jQlnKbqSaOVU7ia4l1zjcHnnsdc5n9F6uvlgUY7tybTI5A38Y
 8nFS/5ubW7H2NbBlLBeQNSenpEKkwZpRgNxKRNnCFJdrKr+N4Z5mjNs67c5Xc1uwCb
 +Ke7p3B9mVgVw==
Date: Fri, 26 Apr 2024 14:16:55 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240426191655.GA2675331-robh@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426125707.585269-2-christophe.roullier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/11] dt-bindings: net: add STM32MP13
 compatible in documentation for stm32
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

On Fri, Apr 26, 2024 at 02:56:57PM +0200, Christophe Roullier wrote:
> New STM32 SOC have 2 GMACs instances.
> GMAC IP version is SNPS 4.20.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  .../devicetree/bindings/net/stm32-dwmac.yaml  | 76 ++++++++++++++++---
>  1 file changed, 67 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index f2714b5b6cf4..b901a432dfa9 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -22,18 +22,17 @@ select:
>          enum:
>            - st,stm32-dwmac
>            - st,stm32mp1-dwmac
> +          - st,stm32mp13-dwmac
>    required:
>      - compatible
>  
> -allOf:
> -  - $ref: snps,dwmac.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
>                - st,stm32mp1-dwmac
> +              - st,stm32mp13-dwmac
>            - const: snps,dwmac-4.20a
>        - items:
>            - enum:
> @@ -74,13 +73,16 @@ properties:
>  
>    st,syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:

Why do you move the location of 'description'? It just increases the 
diff. My preference is description is either 1st or last and not in the 
middle.

> +      Should be phandle/offset pair. The phandle to the syscon node which
> +      encompases the glue register, the offset of the control register and
> +      the mask to set bitfield in control register
>      items:
> -      - items:
> +      - minItems: 2
> +        items:
>            - description: phandle to the syscon node which encompases the glue register
>            - description: offset of the control register
> -    description:
> -      Should be phandle/offset pair. The phandle to the syscon node which
> -      encompases the glue register, and the offset of the control register
> +          - description: field to set mask in register
>  
>    st,eth-clk-sel:
>      description:
> @@ -105,12 +107,38 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp1-dwmac
> +              - st,stm32-dwmac
> +    then:
> +      properties:
> +        st,syscon:
> +          items:
> +            maxItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp13-dwmac
> +    then:
> +      properties:
> +        st,syscon:
> +          items:
> +            minItems: 3
> +            maxItems: 3

Just minItems is needed.

> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/stm32mp1-clks.h>
> -    #include <dt-bindings/reset/stm32mp1-resets.h>
> -    #include <dt-bindings/mfd/stm32h7-rcc.h>
>      //Example 1
>       ethernet0: ethernet@5800a000 {
>             compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
> @@ -165,3 +193,33 @@ examples:
>             snps,pbl = <8>;
>             phy-mode = "mii";
>         };
> +
> +  - |
> +     //Example 4

I don't think it is worth a whole new example just for 1 property 
difference.

> +     ethernet3: ethernet@5800a000 {
> +           compatible = "st,stm32mp13-dwmac", "snps,dwmac-4.20a";
> +           reg = <0x5800a000 0x2000>;
> +           reg-names = "stmmaceth";
> +           interrupts-extended = <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +                                 <&exti 68 IRQ_TYPE_LEVEL_HIGH>;
> +           interrupt-names = "macirq",
> +                             "eth_wake_irq";
> +           clock-names = "stmmaceth",
> +                         "mac-clk-tx",
> +                         "mac-clk-rx",
> +                         "eth-ck",
> +                         "ptp_ref",
> +                         "ethstp";
> +           clocks = <&rcc ETHMAC>,
> +                    <&rcc ETHTX>,
> +                    <&rcc ETHRX>,
> +                    <&rcc ETHCK_K>,
> +                    <&rcc ETHPTP_K>,
> +                    <&rcc ETHSTP>;
> +           st,syscon = <&syscfg 0x4 0xff0000>;
> +           snps,mixed-burst;
> +           snps,pbl = <2>;
> +           snps,axi-config = <&stmmac_axi_config_1>;
> +           snps,tso;
> +           phy-mode = "rmii";
> +     };
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
