Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 319491D3476
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 17:07:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5CEAC36B12;
	Thu, 14 May 2020 15:07:35 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 447B2C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 15:07:34 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id c12so23811822oic.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 08:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yg8hdfMrRRVHZiBFCuf6XG1bLnfAoqI+0t/1DFiaeXU=;
 b=ITaXa9u1Acf6IH+MmtWLzM5Brcmns+ahYU/a1u5/JKH6FMokpC9f92uvoJIEA3C5G5
 zlmOmNjUbD8Ct9yHLgAtbibljETDCBPtg4Vw052wZAFdG5yiNhUsV3bIMtoytuF0618j
 KRlHXSHyMtSLILUpF2ifTwXN4BxvaeAkzEkF08+bDEKOKsHN+KD/5QavpHW8hyU9aTNP
 Bz1H10QVm6xFdGfr6awKUcuVTUhZzPR8bOeAXX57V0Tlkay+fjGR8H0iC6q+NiBk+tpN
 6inn9SYP8F/HL2naWuoXTqOuJWx/Fpyv41iPiQxJ6FLSM5LGqupDAfmDz1aM3v6ocj6N
 6F8Q==
X-Gm-Message-State: AGi0PubC0jzU1PFirvZsvJFpux/fhxTbyMHJxlHQKNfjNDtXJArzf2yu
 WET7YgCWUAWehu4h1uj8hQ==
X-Google-Smtp-Source: APiQypIVJ01Dgb2w/v0TvErjE3wZWRbC+rSILiNQahx5qZ4nREDQUN/GtuERHv0Rf0TjDPPAV4A1nw==
X-Received: by 2002:a05:6808:207:: with SMTP id
 l7mr32435241oie.67.1589468852791; 
 Thu, 14 May 2020 08:07:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f8sm839981oto.47.2020.05.14.08.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 08:07:31 -0700 (PDT)
Received: (nullmailer pid 24699 invoked by uid 1000);
 Thu, 14 May 2020 15:07:30 -0000
Date: Thu, 14 May 2020 10:07:30 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200514150730.GA10372@bogus>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-8-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588756279-17289-8-git-send-email-christophe.kerello@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 07/10] dt-bindings: memory-controller:
 add STM32 FMC2 EBI controller documentation
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

On Wed, May 06, 2020 at 11:11:16AM +0200, Christophe Kerello wrote:
> This patch adds the documentation of the device tree bindings for the STM32
> FMC2 EBI controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
> Changes in v4:
>  - fix filename: st,stm32-fmc2-ebi.yaml
> 
> Changes in v3:
>  - pattern name has been modified
>  - vendor properties have been modified
>    - s/_/-/
>    - add unit suffix (-ns) on timing properties
> 
>  .../memory-controllers/st,stm32-fmc2-ebi.yaml      | 261 +++++++++++++++++++++
>  1 file changed, 261 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> new file mode 100644
> index 0000000..bf130c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/st,stm32-fmc2-ebi.yaml#
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
> +    const: st,stm32mp1-fmc2-ebi
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
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    description: |
> +      Reflects the memory layout with four integer values per bank. Format:
> +      <bank-number> 0 <address of the bank> <size>
> +
> +patternProperties:
> +  "^.*@[0-4],[a-f0-9]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        description: Bank number, base address and size of the device.
> +
> +      st,fmc2-ebi-cs-transaction-type:
> +        description: |
> +                     Select one of the transactions type supported

Indent should be 2 more than 'description'.

> +                       0: Asynchronous mode 1 SRAM/FRAM.
> +                       1: Asynchronous mode 1 PSRAM.
> +                       2: Asynchronous mode A SRAM/FRAM.
> +                       3: Asynchronous mode A PSRAM.
> +                       4: Asynchronous mode 2 NOR.
> +                       5: Asynchronous mode B NOR.
> +                       6: Asynchronous mode C NOR.
> +                       7: Asynchronous mode D NOR.
> +                       8: Synchronous read synchronous write PSRAM.
> +                       9: Synchronous read asynchronous write PSRAM.
> +                       10: Synchronous read synchronous write NOR.
> +                       11: Synchronous read asynchronous write NOR.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 11
> +
> +      st,fmc2-ebi-cs-cclk-enable:
> +        description: Continuous clock enable (first bank must be configured
> +                     in synchronous mode). The FMC_CLK is generated continuously
> +                     during asynchronous and synchronous access. By default, the
> +                     FMC_CLK is only generated during synchronous access.

Indent 2 more than 'description'. You can run this through yaml-format 
in dtschema repo and it will re-flow everything for you.

With these fixed,

Reviewed-by: Rob Herring <robh@kernel.org>


> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,fmc2-ebi-cs-mux-enable:
> +        description: Address/Data multiplexed on databus (valid only with
> +                     NOR and PSRAM transactions type). By default, Address/Data
> +                     are not multiplexed.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,fmc2-ebi-cs-buswidth:
> +        description: Data bus width
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 8, 16 ]
> +        default: 16
> +
> +      st,fmc2-ebi-cs-waitpol-high:
> +        description: Wait signal polarity (NWAIT signal active high).
> +                     By default, NWAIT is active low.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,fmc2-ebi-cs-waitcfg-enable:
> +        description: The NWAIT signal indicates wheither the data from the
> +                     device are valid or if a wait state must be inserted when
> +                     accessing the device in synchronous mode. By default, the
> +                     NWAIT signal is active one data cycle before wait state.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,fmc2-ebi-cs-wait-enable:
> +        description: The NWAIT signal is enabled (its level is taken into
> +                     account after the programmed latency period to insert wait
> +                     states if asserted). By default, the NWAIT signal is
> +                     disabled.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,fmc2-ebi-cs-asyncwait-enable:
> +        description: The NWAIT signal is taken into account during asynchronous
> +                     transactions. By default, the NWAIT signal is not taken
> +                     into account during asynchronous transactions.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,fmc2-ebi-cs-cpsize:
> +        description: CRAM page size. The controller splits the burst access
> +                     when the memory page is reached. By default, no burst
> +                     split when crossing page boundary.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 128, 256, 512, 1024 ]
> +        default: 0
> +
> +      st,fmc2-ebi-cs-byte-lane-setup-ns:
> +        description: This property configures the byte lane setup timing
> +                     defined in nanoseconds from NBLx low to Chip Select NEx
> +                     low.
> +
> +      st,fmc2-ebi-cs-address-setup-ns:
> +        description: This property defines the duration of the address setup
> +                     phase in nanoseconds used for asynchronous read/write
> +                     transactions.
> +
> +      st,fmc2-ebi-cs-address-hold-ns:
> +        description: This property defines the duration of the address hold
> +                     phase in nanoseconds used for asynchronous multiplexed
> +                     read/write transactions.
> +
> +      st,fmc2-ebi-cs-data-setup-ns:
> +        description: This property defines the duration of the data setup phase
> +                     in nanoseconds used for asynchronous read/write
> +                     transactions.
> +
> +      st,fmc2-ebi-cs-bus-turnaround-ns:
> +        description: This property defines the delay in nanoseconds between the
> +                     end of current read/write transaction and the next
> +                     transaction.
> +
> +      st,fmc2-ebi-cs-data-hold-ns:
> +        description: This property defines the duration of the data hold phase
> +                     in nanoseconds used for asynchronous read/write
> +                     transactions.
> +
> +      st,fmc2-ebi-cs-clk-period-ns:
> +        description: This property defines the FMC_CLK output signal period in
> +                     nanoseconds.
> +
> +      st,fmc2-ebi-cs-data-latency-ns:
> +        description: This property defines the data latency before reading or
> +                     writing the first data in nanoseconds.
> +
> +      st,fmc2_ebi-cs-write-address-setup-ns:
> +        description: This property defines the duration of the address setup
> +                     phase in nanoseconds used for asynchronous write
> +                     transactions.
> +
> +      st,fmc2-ebi-cs-write-address-hold-ns:
> +        description: This property defines the duration of the address hold
> +                     phase in nanoseconds used for asynchronous multiplexed
> +                     write transactions.
> +
> +      st,fmc2-ebi-cs-write-data-setup-ns:
> +        description: This property defines the duration of the data setup
> +                     phase in nanoseconds used for asynchronous write
> +                     transactions.
> +
> +      st,fmc2-ebi-cs-write-bus-turnaround-ns:
> +        description: This property defines the delay between the end of current
> +                     write transaction and the next transaction in nanoseconds.
> +
> +      st,fmc2-ebi-cs-write-data-hold-ns:
> +        description: This property defines the duration of the data hold phase
> +                     in nanoseconds used for asynchronous write transactions.
> +
> +      st,fmc2-ebi-cs-max-low-pulse-ns:
> +        description: This property defines the maximum chip select low pulse
> +                     duration in nanoseconds for synchronous transactions. When
> +                     this timing reaches 0, the controller splits the current
> +                     access, toggles NE to allow device refresh and restarts a
> +                     new access.
> +
> +    required:
> +      - reg
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
> +    memory-controller@58002000 {
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      compatible = "st,stm32mp1-fmc2-ebi";
> +      reg = <0x58002000 0x1000>;
> +      clocks = <&rcc FMC_K>;
> +      resets = <&rcc FMC_R>;
> +
> +      ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
> +               <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
> +               <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
> +               <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
> +               <4 0 0x80000000 0x10000000>; /* NAND */
> +
> +      psram@0,0 {
> +        compatible = "mtd-ram";
> +        reg = <0 0x00000000 0x100000>;
> +        bank-width = <2>;
> +
> +        st,fmc2-ebi-cs-transaction-type = <1>;
> +        st,fmc2-ebi-cs-address-setup-ns = <60>;
> +        st,fmc2-ebi-cs-data-setup-ns = <30>;
> +        st,fmc2-ebi-cs-bus-turnaround-ns = <5>;
> +      };
> +
> +      nand-controller@4,0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "st,stm32mp15-fmc2";
> +        reg = <4 0x00000000 0x1000>,
> +              <4 0x08010000 0x1000>,
> +              <4 0x08020000 0x1000>,
> +              <4 0x01000000 0x1000>,
> +              <4 0x09010000 0x1000>,
> +              <4 0x09020000 0x1000>;
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
