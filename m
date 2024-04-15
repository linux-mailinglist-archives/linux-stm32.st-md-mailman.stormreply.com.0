Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF20D8A5DB3
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 00:27:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8912BC6B444;
	Mon, 15 Apr 2024 22:27:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 442EEC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 22:27:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E322760BC3;
 Mon, 15 Apr 2024 22:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5171CC113CC;
 Mon, 15 Apr 2024 22:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713220026;
 bh=HEf/tRcjyvnch8G1vURup/zbc73d2ZJkc5OYcs0NKco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6ic+DeJpJjMdu+ZMBmBoT1mHXbZwxdPlCBsMhKa3rEEQur6u5Togj2/sh4qQlIQG
 q56pEWUGzu3goJ0NNv8vDm/8M7pOhoVMrDxSsC+xEECSfaF09lO2uQ8Fkx5LOmOesX
 k5mQ3pxDOBgbWzRh0xoKRQlP+RDTbcAeS+43UEsuwL3n91R0UyWzq0VMY6GALF0Bwd
 +fljv149smnODNlWw2PMYlgrKHxoJxOOJOVZPz7ZJWXabT0AXSj63AikAnlbYaIXcU
 K4YfYeOd7Vz9quMI5fyUJJNMm6kZ2KR1fkWzPDbWpJdmwYNaOxfWC5ldodwIvp3jci
 HsTy1DHc1tCpQ==
Date: Mon, 15 Apr 2024 17:27:04 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240415222704.GA191094-robh@kernel.org>
References: <20240411143658.1049706-1-christophe.roullier@foss.st.com>
 <20240411143658.1049706-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411143658.1049706-2-christophe.roullier@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/11] dt-bindings: net: add STM32MP13
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

On Thu, Apr 11, 2024 at 04:36:48PM +0200, Christophe Roullier wrote:
> New STM32 SOC have 2 GMACs instances.
> GMAC IP version is SNPS 4.20.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  .../devicetree/bindings/net/stm32-dwmac.yaml  | 80 +++++++++++++++++--
>  1 file changed, 72 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index 857d58949b029..20f58eff6e6f9 100644
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
> -    items:
> -      - items:

It is subtle, but the '-' there was significant...

> -          - description: phandle to the syscon node which encompases the glue register
> -          - description: offset of the control register
>      description:
>        Should be phandle/offset pair. The phandle to the syscon node which
> -      encompases the glue register, and the offset of the control register
> +      encompases the glue register, the offset of the control register and
> +      the mask to set bitfield in control register
> +    items:
> +      minItems: 2
> +      items:

Now you removed it, so any number of <phandle offset mask> are allowed. 
You need:

items:
  - minItems: 2
    items:
      - ...


> +        - description: phandle to the syscon node which encompases the glue register
> +        - description: offset of the control register
> +        - description: field to set mask in register
>  
>    st,ext-phyclk:
>      description:
> @@ -108,6 +110,34 @@ required:
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
> +            minItems: 2

You mean 'maxItems: 2' as 2 is already the min.

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
> +
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -168,3 +198,37 @@ examples:
>             snps,pbl = <8>;
>             phy-mode = "mii";
>         };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    #include <dt-bindings/mfd/stm32h7-rcc.h>
> +    //Example 4

Not a useful comment.

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
