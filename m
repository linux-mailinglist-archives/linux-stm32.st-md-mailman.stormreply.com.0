Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A715E1BC3A4
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 17:28:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B99EC36B0C;
	Tue, 28 Apr 2020 15:28:48 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87EB7C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 15:28:46 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id m18so33231719otq.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PDx5jSzTsCF689zZbvPvqEwU7yEVo/oW97Fw3UfxxAY=;
 b=e8T/BwJtrTHcwwhFKuSI2pOOnD9M4HgBvGzWkBuYDV10Qt9Qv5LmZpgP486f3wikjP
 srzL8z2SCviHXWi9lQHhSdJithktwMXsOIm/Nc1DAxMQHNNCS5n40TtgDVpa5qGexdjb
 KHBAjD+Gl/mfpPx8XgaoPwCr9pPR7QAQ0/vFafI2KqpqlgR8buoxBOp+FweXbFJxXBjJ
 kNy39prlLGRKgRFyhHPErp6YVyTa8aefH4tFGhiBI9wjRvnw5w0hVCaLyMZ3f75mF+ke
 GHEZTt0ViVrxwn+i0ipaL7suuVkSnby1nImz4odn0HgL9snPYdrGNch0vHYaXubSqbdo
 zgJQ==
X-Gm-Message-State: AGi0PubZU8cXzof6OAK/lcom1LFpQYE157bhU+vCuPjcRu+rQKJs0YOT
 yINJuxcN7NikKYdYxrLrWQ==
X-Google-Smtp-Source: APiQypI1+V6ijrabaoJRFCeP9BSkzW0+lnNg3NiBmQRtiFLKcMQ63saeVwoR/e6u9BLbebXsQEUExA==
X-Received: by 2002:a9d:2dc1:: with SMTP id g59mr4199552otb.288.1588087724813; 
 Tue, 28 Apr 2020 08:28:44 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n184sm4890728oih.58.2020.04.28.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:28:44 -0700 (PDT)
Received: (nullmailer pid 25689 invoked by uid 1000);
 Tue, 28 Apr 2020 15:28:43 -0000
Date: Tue, 28 Apr 2020 10:28:43 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200428152843.GA8088@bogus>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-2-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586966256-29548-2-git-send-email-christophe.kerello@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 01/12] dt-bindings: mfd: stm32-fmc2:
 add STM32 FMC2 controller documentation
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

On Wed, Apr 15, 2020 at 05:57:25PM +0200, Christophe Kerello wrote:
> This patch adds the documentation of the device tree bindings for the STM32
> FMC2 controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stm32-fmc2.yaml     | 370 +++++++++++++++++++++
>  1 file changed, 370 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
> new file mode 100644
> index 0000000..0ce1340
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
> @@ -0,0 +1,370 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/st,stm32-fmc2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
> +
> +description: |
> +  The FMC2 functional block makes the interface with: synchronous and
> +  asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
> +  peripherals) and NAND flash memories.
> +  Its main purposes are:
> +    - to translate AXI transactions into the appropriate external device
> +      protocol
> +    - to meet the access time requirements of the external devices
> +  All external devices share the addresses, data and control signals with the
> +  controller. Each external device is accessed by means of a unique Chip
> +  Select. The FMC2 performs only one access at a time to an external device.
> +
> +maintainers:
> +  - Christophe Kerello <christophe.kerello@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1-fmc2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^ebi(@.*)?":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: st,stm32mp1-fmc2-ebi
> +
> +      "#address-cells":
> +        const: 2
> +
> +      "#size-cells":
> +        const: 1
> +
> +      ranges: true
> +
> +    patternProperties:
> +      "^[a-zA-Z]*-ebi@[a-f0-9,]*$":

These nodes should be named based on the device connected and we can be 
a bit more precise on the unit-address:

"@[0-9a-f],[0-9a-f]+$"

Adjust for how many chip selects there are. 15 seems unlikely.

> +        type: object
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +          st,fmc2_ebi_cs_transaction_type:

s/_/-/

And for the rest of the vendor properties...

> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0
> +                maximum: 11
> +            description: |
> +                         Select one of the transactions type supported
> +                           0: Asynchronous mode 1 SRAM/FRAM
> +                           1: Asynchronous mode 1 PSRAM.
> +                           2: Asynchronous mode A SRAM/FRAM.
> +                           3: Asynchronous mode A PSRAM.
> +                           4: Asynchronous mode 2 NOR.
> +                           5: Asynchronous mode B NOR.
> +                           6: Asynchronous mode C NOR.
> +                           7: Asynchronous mode D NOR.
> +                           8: Synchronous read synchronous write PSRAM.
> +                           9: Synchronous read asynchronous write PSRAM.
> +                           10: Synchronous read synchronous write NOR.
> +                           11: Synchronous read asynchronous write NOR.
> +
> +          st,fmc2_ebi_cs_cclk_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Continuous clock enable (first bank must be configured
> +                         in synchronous mode). The FMC_CLK is generated continuously
> +                         during asynchronous and synchronous access. By default, the
> +                         FMC_CLK is only generated during synchronous access.
> +
> +          st,fmc2_ebi_cs_mux_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Address/Data multiplexed on databus (valid only with
> +                         NOR and PSRAM transactions type). By default, Address/Data are
> +                         not multiplexed.
> +
> +          st,fmc2_ebi_cs_buswidth:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [ 8, 16 ]
> +              - default: 16
> +            description: Data bus width
> +
> +          st,fmc2_ebi_cs_waitpol_high:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Wait signal polarity (NWAIT signal active high).
> +                         By default, NWAIT is active low.
> +
> +          st,fmc2_ebi_cs_waitcfg_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: The NWAIT signal indicates wheither the data from the
> +                         device are valid or if a wait state must be inserted when
> +                         accessing the device in synchronous mode. By default, the NWAIT
> +                         signal is active one data cycle before wait state.
> +
> +          st,fmc2_ebi_cs_wait_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: The NWAIT signal is enabled (its level is taken into
> +                         account after the programmed latency period to insert wait states
> +                         if asserted). By default, the NWAIT signal is disabled.
> +
> +          st,fmc2_ebi_cs_asyncwait_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: The NWAIT signal is taken into account during
> +                         asynchronous transactions. By default, the NWAIT signal is not
> +                         taken into account during asynchronous transactions.
> +
> +          st,fmc2_ebi_cs_cpsize:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [ 0, 128, 256, 512, 1024 ]
> +              - default: 0
> +            description: CRAM page size. The controller splits the burst access
> +                         when the memory page is reached. By default, no burst split when
> +                         crossing page boundary.
> +
> +          st,fmc2_ebi_cs_byte_lane_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property configures the byte lane setup timing
> +                         defined in ns from NBLx low to Chip Select NEx low.

If units are nsec, then use the standard unit suffixes. Then you don't 
need to define the type either.

> +
> +          st,fmc2_ebi_cs_address_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address
> +                         setup phase in ns used for asynchronous read/write transactions.
> +
> +          st,fmc2_ebi_cs_address_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address
> +                         hold phase in ns used for asynchronous multiplexed
> +                         read/write transactions.
> +
> +          st,fmc2_ebi_cs_data_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data
> +                         setup phase in ns used for asynchronous read/write transactions.
> +
> +          st,fmc2_ebi_cs_bus_turnaround:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the delay between the end of
> +                         current read/write transaction and the next transaction.
> +
> +          st,fmc2_ebi_cs_data_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data
> +                         hold phase in ns used for asynchronous read/write transactions.
> +
> +          st,fmc2_ebi_cs_clk_period:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the FMC_CLK output signal period in ns.
> +
> +          st,fmc2_ebi_cs_data_latency:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the data latency before reading or writing
> +                         the first data. This timing is expressed in FMC_CLK periods.
> +
> +          st,fmc2_ebi_cs_write_address_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address
> +                         setup phase in ns used for asynchronous write transactions.
> +
> +          st,fmc2_ebi_cs_write_address_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address hold phase in
> +                         ns used for asynchronous multiplexed write transactions.
> +
> +          st,fmc2_ebi_cs_write_data_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data setup phase in
> +                         ns used for asynchronous write transactions.
> +
> +          st,fmc2_ebi_cs_write_bus_turnaround:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the delay between the end of current
> +                         write transaction and the next transaction.
> +
> +          st,fmc2_ebi_cs_write_data_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data hold phase
> +                         in ns used for asynchronous write transactions.
> +
> +          st,fmc2_ebi_cs_max_low_pulse:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the maximum chip select low pulse duration
> +                         in ns for synchronous transactions. When this timing reaches 0,
> +                         the controller splits the current access, toggles NE to allow
> +                         device refresh and restarts a new access.
> +
> +        required:
> +          - reg
> +          - st,fmc2_ebi_cs_transaction_type
> +
> +    additionalProperties: false
> +
> +    required:
> +      - compatible
> +      - "#address-cells"
> +      - "#size-cells"
> +      - ranges
> +
> +  nand-controller:
> +    allOf:
> +      - $ref: "../mtd/nand-controller.yaml#"
> +
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: st,stm32mp1-fmc2-nand
> +
> +      reg:
> +        items:
> +          - description: Chip select 0 data
> +          - description: Chip select 0 command
> +          - description: Chip select 0 address space
> +          - description: Chip select 1 data
> +          - description: Chip select 1 command
> +          - description: Chip select 1 address space
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      dmas:
> +        items:
> +          - description: tx DMA channel
> +          - description: rx DMA channel
> +          - description: ecc DMA channel
> +
> +      dma-names:
> +        items:
> +          - const: tx
> +          - const: rx
> +          - const: ecc
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^nand@[a-f0-9]$":
> +        type: object
> +
> +        properties:
> +          nand-ecc-step-size:
> +            const: 512
> +
> +          nand-ecc-strength:
> +            enum: [1, 4 ,8 ]
> +
> +    additionalProperties: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - compatible
> +      - reg
> +      - interrupts
> +
> +  additionalProperties: false

Wrong indentation. You are defining a DT property called 
'additionalProperties'. You need 2 of these at 0 and 4 spaces 
indentation. I have a check for this error in dt-schema pending.

> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - ranges
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    fmc@58002000 {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      compatible = "st,stm32mp1-fmc2";
> +      reg = <0x58002000 0x1000>;
> +      clocks = <&rcc FMC_K>;
> +      resets = <&rcc FMC_R>;
> +      ranges;
> +
> +      ebi@0 {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +        compatible = "st,stm32mp1-fmc2-ebi";
> +        ranges = <0 0 0x60000000 0x4000000>,
> +                 <1 0 0x64000000 0x4000000>,
> +                 <2 0 0x68000000 0x4000000>,
> +                 <3 0 0x6c000000 0x4000000>;
> +
> +        psram-ebi@0,0 {
> +          compatible = "mtd-ram";
> +          reg = <0 0x00000000 0x100000>;
> +          bank-width = <2>;
> +
> +          st,fmc2_ebi_cs_transaction_type = <1>;
> +          st,fmc2_ebi_cs_address_setup = <60>;
> +          st,fmc2_ebi_cs_data_setup = <30>;
> +          st,fmc2_ebi_cs_bus_turnaround = <5>;
> +        };
> +      };
> +
> +      nand-controller@1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "st,stm32mp1-fmc2-nand";
> +        reg = <0x80000000 0x1000>,
> +              <0x88010000 0x1000>,
> +              <0x88020000 0x1000>,
> +              <0x81000000 0x1000>,
> +              <0x89010000 0x1000>,
> +              <0x89020000 0x1000>;
> +        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
> +               <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
> +               <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
> +        dma-names = "tx", "rx", "ecc";
> +
> +        nand@0 {
> +          reg = <0>;
> +          nand-on-flash-bbt;
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 1.9.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
