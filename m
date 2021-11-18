Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43883455317
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 04:10:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0DDAC5E2CC;
	Thu, 18 Nov 2021 03:10:04 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA28EC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 03:10:02 +0000 (UTC)
X-UUID: d4d3ce8644f64b179953ae5fb827ebd0-20211118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eiZG4F1mIiW90Szr5u/pQmwRwrGim6XkRI3sYIZIuno=; 
 b=lthtNhD1mFIvd20wvbTy3MB2VDdLU+X+Ul+BN+wDMFSMUcMr/Fp/hdQSK4ms0AzH4tLCq3RglSrA4Ub0e/xtP9jbt9zOk1vfJ2xAVkJPAYkBRa/RE3v2K4Ej82IO8Rl0KJxGNCD2n0htzWOOohAtnORlpVIvHSKQ0oKRT/TJb/0=;
X-UUID: d4d3ce8644f64b179953ae5fb827ebd0-20211118
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1345420090; Thu, 18 Nov 2021 11:09:57 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 18 Nov 2021 11:09:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Nov 2021 11:09:55 +0800
Message-ID: <5f6fec21ef9f2bca6007283b37e35301cfe745ed.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 18 Nov 2021 11:09:55 +0800
In-Reply-To: <04051f18-a955-9397-d94e-0c61fc8f595b@gmail.com>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
 <04051f18-a955-9397-d94e-0c61fc8f595b@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

Dear Matthias,
	Agree, converting and changes should be seperated.

	There are some changes in the driver, but mediatek-dwmac.txt
	
is not updated for a long time, and is not accurate enough.

	So this patch is more like a new yaml replace the old txt,
	than a word-to-word converting.

	
Anyway, only 3 little changes compare to old mediate-dwmac.txt, 	others
almost keep the same:
	1. compatible " const: snps,dwmac-4.20"
	2. delete "snps,reset-active-low;" in example, since driver
remove this property long ago.
	3. add "snps,reset-delays-us = <0 10000 10000>;" in example, 

	Should I split this patch? 
	If yes, I'll split in next send.
	Thanks.

Regards!

On Wed, 2021-11-17 at 16:11 +0100, Matthias Brugger wrote:
> 
> On 12/11/2021 10:39, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   .../bindings/net/mediatek-dwmac.txt           |  91 ----------
> >   .../bindings/net/mediatek-dwmac.yaml          | 157
> > ++++++++++++++++++
> >   2 files changed, 157 insertions(+), 91 deletions(-)
> >   delete mode 100644
> > Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> >   create mode 100644
> > Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > 
> 
>  From a quick look you are converting the binding to yaml and in the
> same patch 
> change the binding. Please do that in two different patches as
> otherwise it's 
> dificult to review.
> 
> Regards,
> Matthias
> 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> > deleted file mode 100644
> > index afbcaebf062e..000000000000
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> > +++ /dev/null
> > @@ -1,91 +0,0 @@
> > -MediaTek DWMAC glue layer controller
> > -
> > -This file documents platform glue layer for stmmac.
> > -Please see stmmac.txt for the other unchanged properties.
> > -
> > -The device node has following properties.
> > -
> > -Required properties:
> > -- compatible:  Should be "mediatek,mt2712-gmac" for MT2712 SoC
> > -- reg:  Address and length of the register set for the device
> > -- interrupts:  Should contain the MAC interrupts
> > -- interrupt-names: Should contain a list of interrupt names
> > corresponding to
> > -	the interrupts in the interrupts property, if available.
> > -	Should be "macirq" for the main MAC IRQ
> > -- clocks: Must contain a phandle for each entry in clock-names.
> > -- clock-names: The name of the clock listed in the clocks
> > property. These are
> > -	"axi", "apb", "mac_main", "ptp_ref", "rmii_internal" for MT2712
> > SoC.
> > -- mac-address: See ethernet.txt in the same directory
> > -- phy-mode: See ethernet.txt in the same directory
> > -- mediatek,pericfg: A phandle to the syscon node that control
> > ethernet
> > -	interface and timing delay.
> > -
> > -Optional properties:
> > -- mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
> > -	It should be defined for RGMII/MII interface.
> > -	It should be defined for RMII interface when the reference
> > clock is from MT2712 SoC.
> > -- mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
> > -	It should be defined for RGMII/MII interface.
> > -	It should be defined for RMII interface.
> > -Both delay properties need to be a multiple of 170 for RGMII
> > interface,
> > -or will round down. Range 0~31*170.
> > -Both delay properties need to be a multiple of 550 for MII/RMII
> > interface,
> > -or will round down. Range 0~31*550.
> > -
> > -- mediatek,rmii-rxc: boolean property, if present indicates that
> > the RMII
> > -	reference clock, which is from external PHYs, is connected to
> > RXC pin
> > -	on MT2712 SoC.
> > -	Otherwise, is connected to TXC pin.
> > -- mediatek,rmii-clk-from-mac: boolean property, if present
> > indicates that
> > -	MT2712 SoC provides the RMII reference clock, which outputs to
> > TXC pin only.
> > -- mediatek,txc-inverse: boolean property, if present indicates
> > that
> > -	1. tx clock will be inversed in MII/RGMII case,
> > -	2. tx clock inside MAC will be inversed relative to reference
> > clock
> > -	   which is from external PHYs in RMII case, and it rarely
> > happen.
> > -	3. the reference clock, which outputs to TXC pin will be
> > inversed in RMII case
> > -	   when the reference clock is from MT2712 SoC.
> > -- mediatek,rxc-inverse: boolean property, if present indicates
> > that
> > -	1. rx clock will be inversed in MII/RGMII case.
> > -	2. reference clock will be inversed when arrived at MAC in RMII
> > case, when
> > -	   the reference clock is from external PHYs.
> > -	3. the inside clock, which be sent to MAC, will be inversed in
> > RMII case when
> > -	   the reference clock is from MT2712 SoC.
> > -- assigned-clocks: mac_main and ptp_ref clocks
> > -- assigned-clock-parents: parent clocks of the assigned clocks
> > -
> > -Example:
> > -	eth: ethernet@1101c000 {
> > -		compatible = "mediatek,mt2712-gmac";
> > -		reg = <0 0x1101c000 0 0x1300>;
> > -		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> > -		interrupt-names = "macirq";
> > -		phy-mode ="rgmii-rxid";
> > -		mac-address = [00 55 7b b5 7d f7];
> > -		clock-names = "axi",
> > -			      "apb",
> > -			      "mac_main",
> > -			      "ptp_ref",
> > -			      "rmii_internal";
> > -		clocks = <&pericfg CLK_PERI_GMAC>,
> > -			 <&pericfg CLK_PERI_GMAC_PCLK>,
> > -			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > -			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> > -		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > -				  <&topckgen
> > CLK_TOP_ETHER_50M_RMII_SEL>;
> > -		assigned-clock-parents = <&topckgen
> > CLK_TOP_ETHERPLL_125M>,
> > -					 <&topckgen CLK_TOP_APLL1_D3>,
> > -					 <&topckgen
> > CLK_TOP_ETHERPLL_50M>;
> > -		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> > -		mediatek,pericfg = <&pericfg>;
> > -		mediatek,tx-delay-ps = <1530>;
> > -		mediatek,rx-delay-ps = <1530>;
> > -		mediatek,rmii-rxc;
> > -		mediatek,txc-inverse;
> > -		mediatek,rxc-inverse;
> > -		snps,txpbl = <1>;
> > -		snps,rxpbl = <1>;
> > -		snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> > -		snps,reset-active-low;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > new file mode 100644
> > index 000000000000..2eb4781536f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -0,0 +1,157 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek DWMAC glue layer controller
> > +
> > +maintainers:
> > +  - Biao Huang <biao.huang@mediatek.com>
> > +
> > +description:
> > +  This file documents platform glue layer for stmmac.
> > +
> > +# We need a select here so we don't match all nodes with
> > 'snps,dwmac'
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - mediatek,mt2712-gmac
> > +  required:
> > +    - compatible
> > +
> > +allOf:
> > +  - $ref: "snps,dwmac.yaml#"
> > +  - $ref: "ethernet-controller.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2712-gmac
> > +          - const: snps,dwmac-4.20a
> > +
> > +  clocks:
> > +    items:
> > +      - description: AXI clock
> > +      - description: APB clock
> > +      - description: MAC Main clock
> > +      - description: PTP clock
> > +      - description: RMII reference clock provided by MAC
> > +
> > +  clock-names:
> > +    items:
> > +      - const: axi
> > +      - const: apb
> > +      - const: mac_main
> > +      - const: ptp_ref
> > +      - const: rmii_internal
> > +
> > +  mediatek,pericfg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle to the syscon node that control ethernet
> > +      interface and timing delay.
> > +
> > +  mediatek,tx-delay-ps:
> > +    description:
> > +      The internal TX clock delay (provided by this driver) in
> > nanoseconds.
> > +      For MT2712 RGMII interface, Allowed value need to be a
> > multiple of 170,
> > +      or will round down. Range 0~31*170.
> > +      For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> > +      or will round down. Range 0~31*550.
> > +
> > +  mediatek,rx-delay-ps:
> > +    description:
> > +      The internal RX clock delay (provided by this driver) in
> > nanoseconds.
> > +      For MT2712 RGMII interface, Allowed value need to be a
> > multiple of 170,
> > +      or will round down. Range 0~31*170.
> > +      For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> > +      or will round down. Range 0~31*550.
> > +
> > +  mediatek,rmii-rxc:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that the RMII reference clock, which
> > is from external
> > +      PHYs, is connected to RXC pin. Otherwise, is connected to
> > TXC pin.
> > +
> > +  mediatek,rmii-clk-from-mac:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that MAC provides the RMII reference
> > clock, which
> > +      outputs to TXC pin only.
> > +
> > +  mediatek,txc-inverse:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that
> > +      1. tx clock will be inversed in MII/RGMII case,
> > +      2. tx clock inside MAC will be inversed relative to
> > reference clock
> > +         which is from external PHYs in RMII case, and it rarely
> > happen.
> > +      3. the reference clock, which outputs to TXC pin will be
> > inversed in RMII case
> > +         when the reference clock is from MAC.
> > +
> > +  mediatek,rxc-inverse:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that
> > +      1. rx clock will be inversed in MII/RGMII case.
> > +      2. reference clock will be inversed when arrived at MAC in
> > RMII case, when
> > +         the reference clock is from external PHYs.
> > +      3. the inside clock, which be sent to MAC, will be inversed
> > in RMII case when
> > +         the reference clock is from MAC.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - phy-mode
> > +  - mediatek,pericfg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt2712-clk.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt2712-power.h>
> > +
> > +    eth: ethernet@1101c000 {
> > +        compatible = "mediatek,mt2712-gmac", "snps,dwmac-4.20a";
> > +        reg = <0x1101c000 0x1300>;
> > +        interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> > +        interrupt-names = "macirq";
> > +        phy-mode ="rgmii-rxid";
> > +        mac-address = [00 55 7b b5 7d f7];
> > +        clock-names = "axi",
> > +                      "apb",
> > +                      "mac_main",
> > +                      "ptp_ref",
> > +                      "rmii_internal";
> > +        clocks = <&pericfg CLK_PERI_GMAC>,
> > +                 <&pericfg CLK_PERI_GMAC_PCLK>,
> > +                 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > +                 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +                 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> > +        assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > +                          <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +                          <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> > +        assigned-clock-parents = <&topckgen
> > CLK_TOP_ETHERPLL_125M>,
> > +                                 <&topckgen CLK_TOP_APLL1_D3>,
> > +                                 <&topckgen CLK_TOP_ETHERPLL_50M>;
> > +        power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> > +        mediatek,pericfg = <&pericfg>;
> > +        mediatek,tx-delay-ps = <1530>;
> > +        snps,txpbl = <1>;
> > +        snps,rxpbl = <1>;
> > +        snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> > +        snps,reset-delays-us = <0 10000 10000>;
> > +    };
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
