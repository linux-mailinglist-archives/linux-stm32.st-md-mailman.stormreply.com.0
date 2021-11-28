Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38274460B51
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 00:59:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04F64C57B6F;
	Sun, 28 Nov 2021 23:59:59 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1031C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 23:59:57 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso23070279otj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 15:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=It1lzkkJ24PwFk2cT/A6Qw7GiP3Z+ld/pMrDenOyPmI=;
 b=mmHdTagUK9RfJIIDFPHgZKNFaBK8Src6n7DqvzwW7llgXSxgd057vtcPSInutD4Htt
 JFdouYFPp0AFSXtW8k0e7pRW41HY/dnyEwmDP3yJoDOVH0zArCaZfMofDITlbTK4mm6u
 nS4+1JxOymFIwpMyR8qGPb5xrFeUVrulByGh3ZyDEqJKa/LoBCgj5xfHxx27A1p67KSb
 11kwCUlqEyIN/0j5xvZ7gALqNWhVJw3EsUwf9QQEkGiZnenedDkca4uEp3PHlQs0W57B
 6te0DlC9NoECrTgDVMPi/B62J9nUujiYtrWXJDt+/yYidPtOIeEPI/bpYIyeRkRoee9h
 jbCg==
X-Gm-Message-State: AOAM5306svo6jL1oK/vrMeK7CnR0HoBJ1LBqFlZYvaBCx5FygS6ztGfT
 CveS1o0l0o/vfGOIFPrGoQ==
X-Google-Smtp-Source: ABdhPJx0DJedEYbq8QkfDEMq6sCGyXJZjQhR0qhaN7A6+1HmwQOqy9oomiiApp8DlznyZIkXP5mDfw==
X-Received: by 2002:a05:6830:22d8:: with SMTP id
 q24mr40500288otc.170.1638143996812; 
 Sun, 28 Nov 2021 15:59:56 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fe7:4487:d1b1:985f:1f68:141e])
 by smtp.gmail.com with ESMTPSA id
 s17sm2402501otp.20.2021.11.28.15.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 15:59:56 -0800 (PST)
Received: (nullmailer pid 2845884 invoked by uid 1000);
 Sun, 28 Nov 2021 23:59:20 -0000
Date: Sun, 28 Nov 2021 17:59:20 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <YaQX2N05WsZxXOgX@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112093918.11061-5-biao.huang@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 4/7] net-next: dt-bindings: dwmac:
 Convert mediatek-dwmac to DT schema
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

On Fri, Nov 12, 2021 at 05:39:15PM +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 157 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> deleted file mode 100644
> index afbcaebf062e..000000000000
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -MediaTek DWMAC glue layer controller
> -
> -This file documents platform glue layer for stmmac.
> -Please see stmmac.txt for the other unchanged properties.
> -
> -The device node has following properties.
> -
> -Required properties:
> -- compatible:  Should be "mediatek,mt2712-gmac" for MT2712 SoC
> -- reg:  Address and length of the register set for the device
> -- interrupts:  Should contain the MAC interrupts
> -- interrupt-names: Should contain a list of interrupt names corresponding to
> -	the interrupts in the interrupts property, if available.
> -	Should be "macirq" for the main MAC IRQ
> -- clocks: Must contain a phandle for each entry in clock-names.
> -- clock-names: The name of the clock listed in the clocks property. These are
> -	"axi", "apb", "mac_main", "ptp_ref", "rmii_internal" for MT2712 SoC.
> -- mac-address: See ethernet.txt in the same directory
> -- phy-mode: See ethernet.txt in the same directory
> -- mediatek,pericfg: A phandle to the syscon node that control ethernet
> -	interface and timing delay.
> -
> -Optional properties:
> -- mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
> -	It should be defined for RGMII/MII interface.
> -	It should be defined for RMII interface when the reference clock is from MT2712 SoC.
> -- mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
> -	It should be defined for RGMII/MII interface.
> -	It should be defined for RMII interface.
> -Both delay properties need to be a multiple of 170 for RGMII interface,
> -or will round down. Range 0~31*170.
> -Both delay properties need to be a multiple of 550 for MII/RMII interface,
> -or will round down. Range 0~31*550.
> -
> -- mediatek,rmii-rxc: boolean property, if present indicates that the RMII
> -	reference clock, which is from external PHYs, is connected to RXC pin
> -	on MT2712 SoC.
> -	Otherwise, is connected to TXC pin.
> -- mediatek,rmii-clk-from-mac: boolean property, if present indicates that
> -	MT2712 SoC provides the RMII reference clock, which outputs to TXC pin only.
> -- mediatek,txc-inverse: boolean property, if present indicates that
> -	1. tx clock will be inversed in MII/RGMII case,
> -	2. tx clock inside MAC will be inversed relative to reference clock
> -	   which is from external PHYs in RMII case, and it rarely happen.
> -	3. the reference clock, which outputs to TXC pin will be inversed in RMII case
> -	   when the reference clock is from MT2712 SoC.
> -- mediatek,rxc-inverse: boolean property, if present indicates that
> -	1. rx clock will be inversed in MII/RGMII case.
> -	2. reference clock will be inversed when arrived at MAC in RMII case, when
> -	   the reference clock is from external PHYs.
> -	3. the inside clock, which be sent to MAC, will be inversed in RMII case when
> -	   the reference clock is from MT2712 SoC.
> -- assigned-clocks: mac_main and ptp_ref clocks
> -- assigned-clock-parents: parent clocks of the assigned clocks
> -
> -Example:
> -	eth: ethernet@1101c000 {
> -		compatible = "mediatek,mt2712-gmac";
> -		reg = <0 0x1101c000 0 0x1300>;
> -		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> -		interrupt-names = "macirq";
> -		phy-mode ="rgmii-rxid";
> -		mac-address = [00 55 7b b5 7d f7];
> -		clock-names = "axi",
> -			      "apb",
> -			      "mac_main",
> -			      "ptp_ref",
> -			      "rmii_internal";
> -		clocks = <&pericfg CLK_PERI_GMAC>,
> -			 <&pericfg CLK_PERI_GMAC_PCLK>,
> -			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> -			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> -		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> -				  <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> -		assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
> -					 <&topckgen CLK_TOP_APLL1_D3>,
> -					 <&topckgen CLK_TOP_ETHERPLL_50M>;
> -		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> -		mediatek,pericfg = <&pericfg>;
> -		mediatek,tx-delay-ps = <1530>;
> -		mediatek,rx-delay-ps = <1530>;
> -		mediatek,rmii-rxc;
> -		mediatek,txc-inverse;
> -		mediatek,rxc-inverse;
> -		snps,txpbl = <1>;
> -		snps,rxpbl = <1>;
> -		snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> -		snps,reset-active-low;
> -	};
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> new file mode 100644
> index 000000000000..2eb4781536f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DWMAC glue layer controller
> +
> +maintainers:
> +  - Biao Huang <biao.huang@mediatek.com>
> +
> +description:
> +  This file documents platform glue layer for stmmac.
> +
> +# We need a select here so we don't match all nodes with 'snps,dwmac'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mediatek,mt2712-gmac
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: "snps,dwmac.yaml#"
> +  - $ref: "ethernet-controller.yaml#"

Doesn't snps,dwmac.yaml already reference ethernet-controller.yaml?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-gmac
> +          - const: snps,dwmac-4.20a
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: APB clock
> +      - description: MAC Main clock
> +      - description: PTP clock
> +      - description: RMII reference clock provided by MAC
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: apb
> +      - const: mac_main
> +      - const: ptp_ref
> +      - const: rmii_internal
> +
> +  mediatek,pericfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the syscon node that control ethernet
> +      interface and timing delay.
> +
> +  mediatek,tx-delay-ps:
> +    description:
> +      The internal TX clock delay (provided by this driver) in nanoseconds.
> +      For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
> +      or will round down. Range 0~31*170.
> +      For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
> +      or will round down. Range 0~31*550.
> +
> +  mediatek,rx-delay-ps:
> +    description:
> +      The internal RX clock delay (provided by this driver) in nanoseconds.
> +      For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
> +      or will round down. Range 0~31*170.
> +      For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
> +      or will round down. Range 0~31*550.
> +
> +  mediatek,rmii-rxc:
> +    type: boolean
> +    description:
> +      If present, indicates that the RMII reference clock, which is from external
> +      PHYs, is connected to RXC pin. Otherwise, is connected to TXC pin.
> +
> +  mediatek,rmii-clk-from-mac:
> +    type: boolean
> +    description:
> +      If present, indicates that MAC provides the RMII reference clock, which
> +      outputs to TXC pin only.
> +
> +  mediatek,txc-inverse:
> +    type: boolean
> +    description:
> +      If present, indicates that
> +      1. tx clock will be inversed in MII/RGMII case,
> +      2. tx clock inside MAC will be inversed relative to reference clock
> +         which is from external PHYs in RMII case, and it rarely happen.
> +      3. the reference clock, which outputs to TXC pin will be inversed in RMII case
> +         when the reference clock is from MAC.
> +
> +  mediatek,rxc-inverse:
> +    type: boolean
> +    description:
> +      If present, indicates that
> +      1. rx clock will be inversed in MII/RGMII case.
> +      2. reference clock will be inversed when arrived at MAC in RMII case, when
> +         the reference clock is from external PHYs.
> +      3. the inside clock, which be sent to MAC, will be inversed in RMII case when
> +         the reference clock is from MAC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - phy-mode
> +  - mediatek,pericfg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2712-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt2712-power.h>
> +
> +    eth: ethernet@1101c000 {
> +        compatible = "mediatek,mt2712-gmac", "snps,dwmac-4.20a";
> +        reg = <0x1101c000 0x1300>;
> +        interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-names = "macirq";
> +        phy-mode ="rgmii-rxid";
> +        mac-address = [00 55 7b b5 7d f7];
> +        clock-names = "axi",
> +                      "apb",
> +                      "mac_main",
> +                      "ptp_ref",
> +                      "rmii_internal";
> +        clocks = <&pericfg CLK_PERI_GMAC>,
> +                 <&pericfg CLK_PERI_GMAC_PCLK>,
> +                 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> +                 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +                 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> +        assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> +                          <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +                          <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
> +                                 <&topckgen CLK_TOP_APLL1_D3>,
> +                                 <&topckgen CLK_TOP_ETHERPLL_50M>;
> +        power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> +        mediatek,pericfg = <&pericfg>;
> +        mediatek,tx-delay-ps = <1530>;
> +        snps,txpbl = <1>;
> +        snps,rxpbl = <1>;
> +        snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> +        snps,reset-delays-us = <0 10000 10000>;
> +    };
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
