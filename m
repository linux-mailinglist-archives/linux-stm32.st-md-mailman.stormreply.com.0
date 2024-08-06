Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C679493FB
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 16:58:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75F80C71290;
	Tue,  6 Aug 2024 14:58:00 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F2BFC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 14:57:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CF270CE0E9F;
 Tue,  6 Aug 2024 14:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AADC4AF12;
 Tue,  6 Aug 2024 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722956270;
 bh=WvUKeYGEnDCMv+ueazaSl3PBo1+JLiRTjhrQ6VKYw0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rV4GqNrJfetI/fwIhKY+0Wo5JSVDXU4OgOt9bnDmMHKmri6JYdaWmUF5bZxtGCEQB
 e4yzlsC5qpzB6Xn6lDkrKsrqxpHikymw0WYNJUcspOQNFGWJ0FRtP02OM9AMAZQrl0
 L7rop4/B1k0t6PoOat3/X9rRz4Q0UK7KQkMnxP4KAIIlTUXRyKKS+FhWqKt90Na8OW
 qOzEnC6xD8dmQGece5TAEWe6zkiIGooO62y0PCNkQRI3Dvx7aLQbylH67f5LYO1r5R
 Ab6Z/OcZTY5VHXQOCEggiW+zfKaHT4NIfsQmMZm9XWmuZvfFoJ9j+yQ3J0r0yUWn5G
 QzinxQ5lWN3BA==
Date: Tue, 6 Aug 2024 08:57:48 -0600
From: Rob Herring <robh@kernel.org>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <20240806145748.GA1502402-robh@kernel.org>
References: <20240730091648.72322-1-swathi.ks@samsung.com>
 <CGME20240730092855epcas5p49902519f31bddcfe7da8f4b96a7d0527@epcas5p4.samsung.com>
 <20240730091648.72322-2-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240730091648.72322-2-swathi.ks@samsung.com>
Cc: andrew@lunn.ch, jayati.sahu@samsung.com, edumazet@google.com,
 linux-fsd@tesla.com, alim.akhtar@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 ssiddha@tesla.com, pankaj.dubey@samsung.com, krzk@kernel.org,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ravi.patel@samsung.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 1/4] dt-bindings: net: Add FSD EQoS
 device tree bindings
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

On Tue, Jul 30, 2024 at 02:46:45PM +0530, Swathi K S wrote:
> Add FSD Ethernet compatible in Synopsys dt-bindings document. Add FSD
> Ethernet YAML schema to enable the DT validation.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  5 +-
>  .../devicetree/bindings/net/tesla,ethqos.yaml | 91 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/tesla,ethqos.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3eb65e63fdae..0da11fe98cec 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -98,6 +98,7 @@ properties:
>          - snps,dwxgmac-2.10
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
> +        - tesla,fsd-ethqos
>  
>    reg:
>      minItems: 1
> @@ -121,7 +122,7 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      additionalItems: true
>      items:
>        - description: GMAC main clock
> @@ -133,7 +134,7 @@ properties:
>  
>    clock-names:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      additionalItems: true
>      contains:
>        enum:
> diff --git a/Documentation/devicetree/bindings/net/tesla,ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,ethqos.yaml
> new file mode 100644
> index 000000000000..9246b0395126
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/tesla,ethqos.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/tesla,ethqos.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: FSD Ethernet Quality of Service
> +
> +maintainers:
> +  - Swathi K S <swathi.ks@samsung.com>
> +
> +description:
> +  dwmmac based tesla ethernet devices which support Gigabit
> +  ethernet.

Please write complete sentences.

> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: tesla,fsd-ethqos.yaml

???

Filename matching compatible means for compatible string 
"tesla,fsd-ethqos" the filename should be tesla,fsd-ethqos.yaml.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    maxItems: 10
> +
> +  clock-names:
> +    minItems: 5
> +    maxItems: 10
> +
> +  iommus:
> +    maxItems: 1
> +
> +  phy-mode:
> +    $ref: ethernet-controller.yaml#/properties/phy-connection-type

No need for this. phy-mode should already be included by snps,dwmac.yaml 
including ethernet-controller.yaml.

Though you may want to define what subset of modes are valid.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - phy-mode
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/fsd-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ethernet_1: ethernet@14300000 {

Drop unused label.

> +              compatible = "tesla,fsd-ethqos";
> +              reg = <0x0 0x14300000 0x0 0x10000>;
> +              interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +              clocks = <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I>,
> +                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_ACLK_I>,
> +                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_HCLK_I>,
> +                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I>,
> +                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I>,
> +                       <&clock_peric PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK>,
> +                       <&clock_peric PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK>,
> +                       <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
> +                       <&clock_peric PERIC_EQOS_PHYRXCLK>,
> +                       <&clock_peric PERIC_DOUT_RGMII_CLK>;
> +              clock-names = "ptp_ref",
> +                            "master_bus",
> +                            "slave_bus",
> +                            "tx",
> +                            "rx",
> +                            "master2_bus",
> +                            "slave2_bus",
> +                            "eqos_rxclk_mux",
> +                            "eqos_phyrxclk",
> +                            "dout_peric_rgmii_clk";
> +              pinctrl-names = "default";
> +              pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
> +                          <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
> +                          <&eth1_rx_ctrl>, <&eth1_mdio>;
> +              iommus = <&smmu_peric 0x0 0x1>;
> +              phy-mode = "rgmii-id";
> +    };
> +
> +...
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
