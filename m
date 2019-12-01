Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C710E389
	for <lists+linux-stm32@lfdr.de>; Sun,  1 Dec 2019 22:08:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61CF1C36B0B;
	Sun,  1 Dec 2019 21:08:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2CF7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Dec 2019 21:08:34 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE00B20865;
 Sun,  1 Dec 2019 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575234513;
 bh=xUtbib0mj42a6stnoW1G9F2urnfc6rxP/uq2AAN28Wk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UHXg0uT4VqwMSqggJJt3pmJuZnrzaA7EGyOv6K5l0HlOPHqmeIRPRVMRf94hgUnh9
 nJYqbQrIIndqa9VdPXS3pHODnowcsYcqrSMPyBlkVKaNlcldpLQomUpMI0XN86htKv
 IIWL4GSZRzRvv+/rPpen5/VQxUk0cqGMPRj564K0=
Date: Sun, 1 Dec 2019 21:08:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191201210827.41e1612c@archlinux>
In-Reply-To: <1574873325-9916-1-git-send-email-fabrice.gasnier@st.com>
References: <1574873325-9916-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: adc: stm32-adc: convert
 bindings to json-schema
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

On Wed, 27 Nov 2019 17:48:45 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Convert the STM32 ADC binding to DT schema format using json-schema
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
This one is complex enough that I'm going to leave it to the experts :)
Definitely one for the DT maintainers.

Jonathan

> ---
> Note: this applies on top of IIO tree currently (iio-for-5.5c).
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> new file mode 100644
> index 00000000..2ebc2e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -0,0 +1,448 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/bindings/iio/adc/st,stm32-adc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: STMicroelectronics STM32 ADC bindings
> +
> +description: |
> +  STM32 ADC is a successive approximation analog-to-digital converter.
> +  It has several multiplexed input channels. Conversions can be performed
> +  in single, continuous, scan or discontinuous mode. Result of the ADC is
> +  stored in a left-aligned or right-aligned 32-bit data register.
> +  Conversions can be launched in software or using hardware triggers.
> +
> +  The analog watchdog feature allows the application to detect if the input
> +  voltage goes beyond the user-defined, higher or lower thresholds.
> +
> +  Each STM32 ADC block can have up to 3 ADC instances.
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32f4-adc-core
> +      - st,stm32h7-adc-core
> +      - st,stm32mp1-adc-core
> +
> +  reg:
> +    description: Offset and length of the ADC block register set
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      One or more interrupts for ADC block, depending on part used:
> +        - stm32f4 and stm32h7 share a common ADC interrupt line.
> +        - stm32mp1 has two separate interrupt lines, one for each ADC within
> +          ADC block.
> +
> +  clocks:
> +    description: |
> +      Core can use up to two clocks, depending on part used:
> +        - "adc" clock: for the analog circuitry, common to all ADCs.
> +          It's required on stm32f4.
> +          It's optional on stm32h7 and stm32mp1.
> +        - "bus" clock: for registers access, common to all ADCs.
> +          It's not present on stm32f4.
> +          It's required on stm32h7 and stm32mp1.
> +
> +  clock-names: true
> +
> +  st,max-clk-rate-hz:
> +    description: |
> +      Allow to specify desired max clock rate used by analog circuitry.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  vdda-supply:
> +    description: Phandle to the vdda input analog voltage.
> +
> +  vref-supply:
> +    description: Phandle to the vref input analog reference voltage.
> +
> +  booster-supply:
> +    description: |
> +      Phandle to the embedded booster regulator that can be used to supply ADC
> +      analog input switches on stm32h7 and stm32mp1.
> +
> +  vdd-supply:
> +    description: |
> +      Phandle to the vdd input voltage. It can be used to supply ADC analog
> +      input switches on stm32mp1.
> +
> +  st,syscfg:
> +    description: |
> +      Phandle to system configuration controller. It can be used to control the
> +      analog circuitry on stm32mp1.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32f4-adc-core
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          items:
> +            const: adc
> +          maxItems: 1
> +
> +        interrupts:
> +          items:
> +            - description: interrupt line common for all ADCs
> +
> +        booster-supply: false
> +
> +        vdd-supply: false
> +
> +        st,syscfg: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32h7-adc-core
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: bus
> +            - const: adc
> +          minItems: 1
> +          maxItems: 2
> +
> +        interrupts:
> +          items:
> +            - description: interrupt line common for all ADCs
> +
> +        vdd-supply: false
> +
> +        st,syscfg: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-adc-core
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: bus
> +            - const: adc
> +          minItems: 1
> +          maxItems: 2
> +
> +        interrupts:
> +          items:
> +            - description: interrupt line for ADC1
> +            - description: interrupt line for ADC2
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - vdda-supply
> +  - vref-supply
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +patternProperties:
> +  "^adc@[0-9]+$":
> +    type: object
> +    description: |
> +      An ADC block node should contain at least one subnode, representing an
> +      ADC instance available on the machine.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - st,stm32f4-adc
> +          - st,stm32h7-adc
> +          - st,stm32mp1-adc
> +
> +      reg:
> +        description: |
> +          Offset of ADC instance in ADC block. Valid values are:
> +            - 0x0:   ADC1
> +            - 0x100: ADC2
> +            - 0x200: ADC3 (stm32f4 only)
> +        maxItems: 1
> +
> +      '#io-channel-cells':
> +        const: 1
> +
> +      interrupts:
> +        description: |
> +          IRQ Line for the ADC instance. Valid values are:
> +            - 0 for adc@0
> +            - 1 for adc@100
> +            - 2 for adc@200 (stm32f4 only)
> +        maxItems: 1
> +
> +      clocks:
> +        description: |
> +          Input clock private to this ADC instance. It's required only on
> +          stm32f4, that has per instance clock input for registers access.
> +        maxItems: 1
> +
> +      dmas:
> +        description: RX DMA Channel
> +        maxItems: 1
> +
> +      dma-names:
> +        const: rx
> +
> +      assigned-resolution-bits:
> +        description: |
> +          Resolution (bits) to use for conversions:
> +            - can be 6, 8, 10 or 12 on stm32f4
> +            - can be 8, 10, 12, 14 or 16 on stm32h7 and stm32mp1
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      st,adc-channels:
> +        description: |
> +          List of single-ended channels muxed for this ADC. It can have up to:
> +            - 16 channels, numbered from 0 to 15 (for in0..in15) on stm32f4
> +            - 20 channels, numbered from 0 to 19 (for in0..in19) on stm32h7 and
> +              stm32mp1.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +      st,adc-diff-channels:
> +        description: |
> +          List of differential channels muxed for this ADC. Some channels can
> +          be configured as differential instead of single-ended on stm32h7 and
> +          on stm32mp1. Positive and negative inputs pairs are listed:
> +          <vinp vinn>, <vinp vinn>,... vinp and vinn are numbered from 0 to 19.
> +
> +          Note: At least one of "st,adc-channels" or "st,adc-diff-channels" is
> +          required. Both properties can be used together. Some channels can be
> +          used as single-ended and some other ones as differential (mixed). But
> +          channels can't be configured both as single-ended and differential.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +          - items:
> +              items:
> +                - description: |
> +                    "vinp" indicates positive input number
> +                  minimum: 0
> +                  maximum: 19
> +                - description: |
> +                    "vinn" indicates negative input number
> +                  minimum: 0
> +                  maximum: 19
> +
> +      st,min-sample-time-nsecs:
> +        description: |
> +          Minimum sampling time in nanoseconds. Depending on hardware (board)
> +          e.g. high/low analog input source impedance, fine tune of ADC
> +          sampling time may be recommended. This can be either one value or an
> +          array that matches "st,adc-channels" and/or "st,adc-diff-channels"
> +          list, to set sample time resp. for all channels, or independently for
> +          each channel.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: st,stm32f4-adc
> +
> +        then:
> +          properties:
> +            reg:
> +              enum:
> +                - 0x0
> +                - 0x100
> +                - 0x200
> +
> +            interrupts:
> +              minimum: 0
> +              maximum: 2
> +
> +            assigned-resolution-bits:
> +              allOf:
> +                - enum: [6, 8, 10, 12]
> +                - default: 12
> +
> +            st,adc-channels:
> +              allOf:
> +                - maxItems: 16
> +                  items:
> +                    minimum: 0
> +                    maximum: 15
> +
> +            st,adc-diff-channels: false
> +
> +            st,min-sample-time-nsecs:
> +              allOf:
> +                - maxItems: 16
> +                  items:
> +                    minimum: 80
> +
> +          required:
> +            - clocks
> +
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  - st,stm32h7-adc
> +                  - st,stm32mp1-adc
> +
> +        then:
> +          properties:
> +            reg:
> +              enum:
> +                - 0x0
> +                - 0x100
> +
> +            interrupts:
> +              minimum: 0
> +              maximum: 1
> +
> +            assigned-resolution-bits:
> +              allOf:
> +                - enum: [8, 10, 12, 14, 16]
> +                - default: 16
> +
> +            st,adc-channels:
> +              allOf:
> +                - maxItems: 20
> +                  items:
> +                    minimum: 0
> +                    maximum: 19
> +
> +            st,min-sample-time-nsecs:
> +              allOf:
> +                - maxItems: 20
> +                  items:
> +                    minimum: 40
> +
> +    additionalProperties: false
> +
> +    anyOf:
> +      - required:
> +          - st,adc-channels
> +      - required:
> +          - st,adc-diff-channels
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - '#io-channel-cells'
> +
> +examples:
> +  - |
> +    // Example 1: with stm32f429
> +      adc123: adc@40012000 {
> +        compatible = "st,stm32f4-adc-core";
> +        reg = <0x40012000 0x400>;
> +        interrupts = <18>;
> +        clocks = <&rcc 0 168>;
> +        clock-names = "adc";
> +        st,max-clk-rate-hz = <36000000>;
> +        vdda-supply = <&vdda>;
> +        vref-supply = <&vref>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        adc@0 {
> +          compatible = "st,stm32f4-adc";
> +          #io-channel-cells = <1>;
> +          reg = <0x0>;
> +          clocks = <&rcc 0 168>;
> +          interrupt-parent = <&adc123>;
> +          interrupts = <0>;
> +          st,adc-channels = <8>;
> +          dmas = <&dma2 0 0 0x400 0x0>;
> +          dma-names = "rx";
> +          assigned-resolution-bits = <8>;
> +        };
> +        // ...
> +        // other adc child nodes follow...
> +      };
> +
> +  - |
> +    // Example 2: with stm32mp157c to setup ADC1 with:
> +    // - channel 1 as single-ended
> +    // - channels 2 & 3 as differential (with resp. 6 & 7 negative inputs)
> +      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +      #include <dt-bindings/clock/stm32mp1-clks.h>
> +      adc12: adc@48003000 {
> +        compatible = "st,stm32mp1-adc-core";
> +        reg = <0x48003000 0x400>;
> +        interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&rcc ADC12>, <&rcc ADC12_K>;
> +        clock-names = "bus", "adc";
> +        booster-supply = <&booster>;
> +        vdd-supply = <&vdd>;
> +        vdda-supply = <&vdda>;
> +        vref-supply = <&vref>;
> +        st,syscfg = <&syscfg>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        adc@0 {
> +          compatible = "st,stm32mp1-adc";
> +          #io-channel-cells = <1>;
> +          reg = <0x0>;
> +          interrupt-parent = <&adc12>;
> +          interrupts = <0>;
> +          st,adc-channels = <1>;
> +          st,adc-diff-channels = <2 6>, <3 7>;
> +          st,min-sample-time-nsecs = <5000>;
> +          dmas = <&dmamux1 9 0x400 0x05>;
> +          dma-names = "rx";
> +        };
> +        // ...
> +        // other adc child node follow...
> +      };
> +
> +...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
