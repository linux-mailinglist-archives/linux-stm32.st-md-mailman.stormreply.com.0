Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE79E3CAC
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 15:27:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7DD8C71292;
	Wed,  4 Dec 2024 14:27:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0492C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 14:27:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96E21A41719;
 Wed,  4 Dec 2024 14:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5A6C4CECD;
 Wed,  4 Dec 2024 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733322444;
 bh=8kSlC422IeYzzzg01gqSDhhGR5XtczDm7IOevfiFGpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BdFpiD9Ehf6NJ3eXKMvlAfMjtslR49WOP1XgUzl8Ck2/Y6xhUo9QDz+XhMIbVjE45
 eFZCibANpmxxsm8ynWVu518p2aaxX5pvpUjiWwJ3rL50jEhG4+crmF4GqsX+cGlAaF
 u3q4BVYokvbhtYT0F2HAj2uqIWUtSa/NzF9/pe/iHr7eXhLjT4RL8/r2z3XDX4OJpQ
 K7iLFPQx5+KMMN2w5WvvSClaxGbQsO9IHAAEIF+2l8VL3TB61Y7/VCkJFWkSfUuFqG
 JWEd0DwOXxYGfhjwMSg9DBQAKawNzvv6CLepS2tQA0KymkZBGUiOdZlz2DgRb4ULEe
 JWqZQZUMt6mXg==
Date: Wed, 4 Dec 2024 08:27:22 -0600
From: Rob Herring <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <20241204142722.GA177756-robh@kernel.org>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241202023643.75010-2-a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org,
 netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, schung@nuvoton.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: net: nuvoton: Add
 schema for Nuvoton MA35 family GMAC
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

On Mon, Dec 02, 2024 at 10:36:41AM +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> new file mode 100644
> index 000000000000..e44abaf4da3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton DWMAC glue layer controller
> +
> +maintainers:
> +  - Joey Lu <yclu4@nuvoton.com>
> +
> +description:
> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
> +  Synopsys DesignWare MAC (version 3.73a).
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,ma35d1-dwmac
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Register range should be one of the GMAC interface.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MAC clock
> +      - description: PTP clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +
> +  nuvoton,sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to access syscon registers.
> +          - description: GMAC interface ID.
> +            enum:
> +              - 0
> +              - 1
> +    description:
> +      A phandle to the syscon with one argument that configures system registers
> +      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +
> +  phy-mode:
> +    enum:
> +      - rmii
> +      - rgmii
> +      - rgmii-id
> +      - rgmii-txid
> +      - rgmii-rxid
> +
> +  tx-internal-delay-ps:
> +    default: 0
> +    minimum: 0
> +    maximum: 2000
> +    description:
> +      RGMII TX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
> +      Allowed values are from 0 to 2000.
> +
> +  rx-internal-delay-ps:
> +    default: 0
> +    minimum: 0
> +    maximum: 2000
> +    description:
> +      RGMII RX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
> +      Allowed values are from 0 to 2000.
> +
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#

Drop. snps,dwmac.yaml already has this.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names

Drop all 4. Already required by snps,dwmac.yaml.

> +  - clocks
> +  - clock-names
> +  - nuvoton,sys
> +  - resets
> +  - reset-names
> +  - phy-mode

Drop this one too.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
> +    ethernet@40120000 {
> +        compatible = "nuvoton,ma35d1-dwmac";
> +        reg = <0x40120000 0x10000>;
> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
> +        clock-names = "stmmaceth", "ptp_ref";
> +
> +        nuvoton,sys = <&sys 0>;
> +        resets = <&sys MA35D1_RESET_GMAC0>;
> +        reset-names = "stmmaceth";
> +
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&eth_phy0>;
> +        mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index eb1f3ae41ab9..4bf59ab910cc 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -67,6 +67,7 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - nuvoton,ma35d1-dwmac
>          - qcom,qcs404-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
