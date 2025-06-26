Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC5AEAAD7
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 01:48:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BA75C36B2C;
	Thu, 26 Jun 2025 23:48:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09B86C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 23:48:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A3D85C13FA;
 Thu, 26 Jun 2025 23:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1600DC4CEEB;
 Thu, 26 Jun 2025 23:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750981697;
 bh=UtT4R14YmcZBQdtbiQF4aYA0gAR4Kg/4hgZsKCZzdjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egyGcd2Xu5wFL2I1FrhAsH0nN/UgK8xH+EBSmS7M8miRrBVxsvIukhXLc4hjfcXsX
 Ru4UQ6T5VlSdW1GhnvDIBclPtH2vniV0FISYBM3xJmFnHof6lqS6JBym6u8mVRYw5b
 caY1tvjODHzkgq6knazcBlHINp40vc3UQZvyNEQjFdy+wV+ckrfGWoyelEF8w2VPRc
 D/sLoMOkFomuh9fMYO5bwN8RlUieIA6L7YBECdwhgbul7N2O2jgzrwCQVHIBVX4puL
 0QK4kSeQV+Qzxv8D7S6F9DAbudxvslIHhaGQhukiwTVtjNnTdE0csQ6wOOl/Ee7/UN
 aVLBhF1vbR32w==
Date: Thu, 26 Jun 2025 18:48:16 -0500
From: Rob Herring <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <20250626234816.GB1398428-robh@kernel.org>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613225844.43148-1-matthew.gerlach@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Mun Yew Tham <mun.yew.tham@altera.com>, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

On Fri, Jun 13, 2025 at 03:58:44PM -0700, Matthew Gerlach wrote:
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.

Sigh I just reviewed a conversion from Dinh:

https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/

I prefer this one as it has altr,gmii-to-sgmii-2.0.yaml, but I see some 
issues compared to Dinh's.

> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v6:
>  - Fix reference to altr,gmii-to-sgmii-2.0.yaml in MAINTAINERS.
>  - Add Reviewed-by:
> 
> v5:
>  - Fix dt_binding_check error: comptabile.
>  - Rename altr,gmii-to-sgmii.yaml to altr,gmii-to-sgmii-2.0.yaml
> 
> v4:
>  - Change filename from socfpga,dwmac.yaml to altr,socfpga-stmmac.yaml.
>  - Updated compatible in select properties and main properties.
>  - Fixed clocks so stmmaceth clock is required.
>  - Added binding for altr,gmii-to-sgmii.
>  - Update MAINTAINERS.
> 
> v3:
>  - Add missing supported phy-modes.
> 
> v2:
>  - Add compatible to required.
>  - Add descriptions for clocks.
>  - Add clock-names.
>  - Clean up items: in altr,sysmgr-syscon.
>  - Change "additionalProperties: true" to "unevaluatedProperties: false".
>  - Add properties needed for "unevaluatedProperties: false".
>  - Fix indentation in examples.
>  - Drop gmac0: label in examples.
>  - Exclude support for Arria10 that is not validating.
> ---
>  .../bindings/net/altr,gmii-to-sgmii-2.0.yaml  |  49 ++++++
>  .../bindings/net/altr,socfpga-stmmac.yaml     | 162 ++++++++++++++++++
>  .../devicetree/bindings/net/socfpga-dwmac.txt |  57 ------
>  MAINTAINERS                                   |   7 +-
>  4 files changed, 217 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/altr,gmii-to-sgmii-2.0.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/socfpga-dwmac.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/altr,gmii-to-sgmii-2.0.yaml b/Documentation/devicetree/bindings/net/altr,gmii-to-sgmii-2.0.yaml
> new file mode 100644
> index 000000000000..aafb6447b6c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/altr,gmii-to-sgmii-2.0.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (C) 2025 Altera Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/altr,gmii-to-sgmii-2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera GMII to SGMII Converter
> +
> +maintainers:
> +  - Matthew Gerlach <matthew.gerlach@altera.com>
> +
> +description:
> +  This binding describes the Altera GMII to SGMII converter.
> +
> +properties:
> +  compatible:
> +    const: altr,gmii-to-sgmii-2.0
> +
> +  reg:
> +    items:
> +      - description: Registers for the emac splitter IP
> +      - description: Registers for the GMII to SGMII converter.
> +      - description: Registers for TSE control.
> +
> +  reg-names:
> +    items:
> +      - const: hps_emac_interface_splitter_avalon_slave
> +      - const: gmii_to_sgmii_adapter_avalon_slave
> +      - const: eth_tse_control_port
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    phy@ff000240 {
> +        compatible = "altr,gmii-to-sgmii-2.0";
> +        reg = <0xff000240 0x00000008>,
> +              <0xff000200 0x00000040>,
> +              <0xff000250 0x00000008>;
> +        reg-names = "hps_emac_interface_splitter_avalon_slave",
> +                    "gmii_to_sgmii_adapter_avalon_slave",
> +                    "eth_tse_control_port";
> +    };
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> new file mode 100644
> index 000000000000..ccbbdb870755
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera SOCFPGA SoC DWMAC controller
> +
> +maintainers:
> +  - Matthew Gerlach <matthew.gerlach@altera.com>
> +
> +description:
> +  This binding describes the Altera SOCFPGA SoC implementation of the
> +  Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, and Agilex7 families
> +  of chips.
> +  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
> +  # does not validate against net/snps,dwmac.yaml.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - altr,socfpga-stmmac
> +          - altr,socfpga-stmmac-a10-s10
> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: altr,socfpga-stmmac
> +          - const: snps,dwmac-3.70a
> +          - const: snps,dwmac
> +      - items:
> +          - const: altr,socfpga-stmmac-a10-s10
> +          - const: snps,dwmac-3.74a
> +          - const: snps,dwmac

You are missing the snps,dwmac-3.72a version.


> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: GMAC main clock
> +      - description:
> +          PTP reference clock. This clock is used for programming the
> +          Timestamp Addend Register. If not passed then the system
> +          clock will be used and this is fine on some platforms.
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +
> +  iommus:
> +    maxItems: 1

Dinh's says there can be 2?

> +
> +  phy-mode:
> +    enum:
> +      - gmii
> +      - mii
> +      - rgmii
> +      - rgmii-id
> +      - rgmii-rxid
> +      - rgmii-txid
> +      - sgmii
> +      - 1000base-x

Dinh's says only rgmii, gmii, and mii supported?

> +
> +  rxc-skew-ps:
> +    description: Skew control of RXC pad
> +
> +  rxd0-skew-ps:
> +    description: Skew control of RX data 0 pad
> +
> +  rxd1-skew-ps:
> +    description: Skew control of RX data 1 pad
> +
> +  rxd2-skew-ps:
> +    description: Skew control of RX data 2 pad
> +
> +  rxd3-skew-ps:
> +    description: Skew control of RX data 3 pad
> +
> +  rxdv-skew-ps:
> +    description: Skew control of RX CTL pad
> +
> +  txc-skew-ps:
> +    description: Skew control of TXC pad
> +
> +  txen-skew-ps:
> +    description: Skew control of TXC pad
> +
> +  altr,emac-splitter:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Should be the phandle to the emac splitter soft IP node if DWMAC
> +      controller is connected an emac splitter.
> +
> +  altr,f2h_ptp_ref_clk:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to Precision Time Protocol reference clock. This clock is
> +      common to gmac instances and defaults to osc1.
> +
> +  altr,gmii-to-sgmii-converter:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Should be the phandle to the gmii to sgmii converter soft IP.
> +
> +  altr,sysmgr-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Should be the phandle to the system manager node that encompass
> +      the glue register, the register offset, and the register shift.
> +      On Cyclone5/Arria5, the register shift represents the PHY mode
> +      bits, while on the Arria10/Stratix10/Agilex platforms, the
> +      register shift represents bit for each emac to enable/disable
> +      signals from the FPGA fabric to the EMAC modules.
> +    items:
> +      - items:
> +          - description: phandle to the system manager node
> +          - description: offset of the control register
> +          - description: shift within the control register
> +
> +patternProperties:
> +  "^mdio[0-9]$":
> +    type: object
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - altr,sysmgr-syscon
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ethernet@ff700000 {
> +            compatible = "altr,socfpga-stmmac", "snps,dwmac-3.70a",
> +            "snps,dwmac";
> +            altr,sysmgr-syscon = <&sysmgr 0x60 0>;
> +            reg = <0xff700000 0x2000>;
> +            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "macirq";
> +            mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
> +            clocks = <&emac_0_clk>;
> +            clock-names = "stmmaceth";
> +            phy-mode = "sgmii";
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/socfpga-dwmac.txt b/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
> deleted file mode 100644
> index 612a8e8abc88..000000000000
> --- a/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Altera SOCFPGA SoC DWMAC controller
> -
> -This is a variant of the dwmac/stmmac driver an inherits all descriptions
> -present in Documentation/devicetree/bindings/net/stmmac.txt.
> -
> -The device node has additional properties:
> -
> -Required properties:
> - - compatible	: For Cyclone5/Arria5 SoCs it should contain
> -		  "altr,socfpga-stmmac". For Arria10/Agilex/Stratix10 SoCs
> -		  "altr,socfpga-stmmac-a10-s10".
> -		  Along with "snps,dwmac" and any applicable more detailed
> -		  designware version numbers documented in stmmac.txt
> - - altr,sysmgr-syscon : Should be the phandle to the system manager node that
> -   encompasses the glue register, the register offset, and the register shift.
> -   On Cyclone5/Arria5, the register shift represents the PHY mode bits, while
> -   on the Arria10/Stratix10/Agilex platforms, the register shift represents
> -   bit for each emac to enable/disable signals from the FPGA fabric to the
> -   EMAC modules.
> - - altr,f2h_ptp_ref_clk use f2h_ptp_ref_clk instead of default eosc1 clock
> -   for ptp ref clk. This affects all emacs as the clock is common.
> -
> -Optional properties:
> -altr,emac-splitter: Should be the phandle to the emac splitter soft IP node if
> -		DWMAC controller is connected emac splitter.
> -phy-mode: The phy mode the ethernet operates in
> -altr,sgmii-to-sgmii-converter: phandle to the TSE SGMII converter
> -
> -This device node has additional phandle dependency, the sgmii converter:
> -
> -Required properties:
> - - compatible	: Should be altr,gmii-to-sgmii-2.0
> - - reg-names	: Should be "eth_tse_control_port"
> -
> -Example:
> -
> -gmii_to_sgmii_converter: phy@100000240 {
> -	compatible = "altr,gmii-to-sgmii-2.0";
> -	reg = <0x00000001 0x00000240 0x00000008>,
> -		<0x00000001 0x00000200 0x00000040>;
> -	reg-names = "eth_tse_control_port";
> -	clocks = <&sgmii_1_clk_0 &emac1 1 &sgmii_clk_125 &sgmii_clk_125>;
> -	clock-names = "tse_pcs_ref_clk_clock_connection", "tse_rx_cdr_refclk";
> -};
> -
> -gmac0: ethernet@ff700000 {
> -	compatible = "altr,socfpga-stmmac", "snps,dwmac-3.70a", "snps,dwmac";
> -	altr,sysmgr-syscon = <&sysmgr 0x60 0>;
> -	reg = <0xff700000 0x2000>;
> -	interrupts = <0 115 4>;
> -	interrupt-names = "macirq";
> -	mac-address = [00 00 00 00 00 00];/* Filled in by U-Boot */
> -	clocks = <&emac_0_clk>;
> -	clock-names = "stmmaceth";
> -	phy-mode = "sgmii";
> -	altr,gmii-to-sgmii-converter = <&gmii_to_sgmii_converter>;
> -};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2b570ed5f2f..d308789d9877 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3262,10 +3262,15 @@ M:	Dinh Nguyen <dinguyen@kernel.org>
>  S:	Maintained
>  F:	drivers/clk/socfpga/
>  
> +ARM/SOCFPGA DWMAC GLUE LAYER BINDINGS
> +M:	Matthew Gerlach <matthew.gerlach@altera.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/altr,gmii-to-sgmii-2.0.yaml
> +F:	Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +
>  ARM/SOCFPGA DWMAC GLUE LAYER
>  M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/net/socfpga-dwmac.txt
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>  
>  ARM/SOCFPGA EDAC BINDINGS
> -- 
> 2.35.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
