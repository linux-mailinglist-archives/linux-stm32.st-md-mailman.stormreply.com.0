Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 008B5471F22
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 02:34:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A19C8C5AB61;
	Mon, 13 Dec 2021 01:34:24 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90EE1C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 01:34:22 +0000 (UTC)
X-UUID: c1140fd5ec734c71986effc6be0a3b99-20211213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2fYx9IHqR6kL1H1uOawtRVXyCwPDOYnfOuVZEgk7sV4=; 
 b=u/NV4Y7Cr8pZBIlnZZEYXOiYcDXmBT7cSbiIcTuf8NnZr62JQEp4L8EestwLKMklTLU0wmZ31FSgyxDuvbzORGVf5D1NbCY6hRd99Ny+3O5p+GLWWxlRUTavXvM48rKficOj2UwlNS1+orUMqlRq3cEe8AbKU9w/J3js1X1CVC0=;
X-UUID: c1140fd5ec734c71986effc6be0a3b99-20211213
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1547964492; Mon, 13 Dec 2021 09:34:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 13 Dec 2021 09:34:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 09:34:14 +0800
Message-ID: <80d5d287a6c6f84bc9898ceeec794dc05cbb44bc.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 13 Dec 2021 09:34:16 +0800
In-Reply-To: <YbOhK6ojiYdHTFFx@robh.at.kernel.org>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-5-biao.huang@mediatek.com>
 <YbOhK6ojiYdHTFFx@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
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
Subject: Re: [Linux-stm32] [PATCH net-next v8 4/6] net: dt-bindings: dwmac:
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

Dear Rob,
	Thanks for your comments~

On Fri, 2021-12-10 at 12:49 -0600, Rob Herring wrote:
> On Fri, Dec 10, 2021 at 09:31:27AM +0800, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > And there are some changes in .yaml than .txt, others almost keep
> > the same:
> >   1. compatible "const: snps,dwmac-4.20".
> >   2. delete "snps,reset-active-low;" in example, since driver
> > remove this
> >      property long ago.
> >   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
> >   4. the example is for rgmii interface, keep related properties
> > only.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
> >  .../bindings/net/mediatek-dwmac.yaml          | 156
> > ++++++++++++++++++
> >  2 files changed, 156 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > 
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
> > index 000000000000..9207266a6e69
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -0,0 +1,156 @@
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
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> 
> Don't need oneOf for 1 entry.
OK, I'll fix it in next send.
> 
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
> 
> Seems you need 'minItems: 4' or are the DT files wrong?
The current eth device node in mt2712.dtsi should be updated,
and there is a patch in this series for it:
"[PATCH net-next v8 3/6] arm64: dts: mt2712: update ethernet device
node"
> 
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
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
