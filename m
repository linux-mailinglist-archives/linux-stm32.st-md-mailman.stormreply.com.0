Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51328A21850
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 08:52:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C202BC78026;
	Wed, 29 Jan 2025 07:52:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 304CCC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 07:52:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1EFD5C585F;
 Wed, 29 Jan 2025 07:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5407C4CED3;
 Wed, 29 Jan 2025 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738137152;
 bh=AoeffIw3Nz9eylEG8U+KY4L6HWrpPGbI3A9MidQQ4KA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RXKEsbR/CmnIwiJ0DmeDT92ebn1xGGok6hL2scYegnn9ypeujve8yDw/GsvI1lZhC
 ypE8AB0sc+pBfGGcMxnpompoAbsV6DAsF4VTanKZZ6w8cExHr3Gf8NOAbXY7MnR35I
 8FdEmV2sg5dxRiYlTopsxdingXqzhYVvlaoMLkboy8UY8jYEH5GkvXbRfdjuMbuMSi
 HCDbRzVjDxCf3lERmp05J+r8T19ydqvwVE0r1FZNgLC4/+nSjbTQ1cJw8qMNUYkaes
 d8YPVB+VYm9j0zj0XeIopsYB88zvUldsuqiEIUuKawM7pfl+vu1+PDjhjvJaCgRjkq
 1pOeJfNYpnScQ==
Date: Wed, 29 Jan 2025 08:52:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <20250129-hilarious-glittering-mustang-fb5471@krzk-bin>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-4-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128081731.2284457-4-patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/9] dt-bindings: memory-controllers:
 Add STM32 Octo Memory Manager controller
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

On Tue, Jan 28, 2025 at 09:17:25AM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Add bindings for STM32 Octo Memory Manager (OMM) controller.
> 
> OMM manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../memory-controllers/st,stm32-omm.yaml      | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml
> new file mode 100644
> index 000000000000..7e0b150e0005
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml


Filename as compatible, so st,stm32mp25-omm.yaml

You already received this comment.

> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/st,stm32-omm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Octo Memory Manager (OMM)
> +
> +maintainers:
> +  - Patrice Chotard <patrice.chotard@foss.st.com>
> +
> +description: |
> +  The STM32 Octo Memory Manager is a low-level interface that enables an
> +  efficient OCTOSPI pin assignment with a full I/O matrix (before alternate
> +  function map) and multiplex of single/dual/quad/octal SPI interfaces over
> +  the same bus. It Supports up to:
> +    - Two single/dual/quad/octal SPI interfaces
> +    - Two ports for pin assignment
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-omm
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    description: |
> +      Reflects the memory layout with four integer values per OSPI instance.
> +      Format:
> +      <chip-select> 0 <registers base address> <size>

Do you always have two children? If so, this should have maxItems.

> +
> +  reg:
> +    items:
> +      - description: OMM registers
> +      - description: OMM memory map area
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: memory_map
> +
> +  memory-region:
> +    description: Phandle to node describing memory-map region to used.
> +    minItems: 1
> +    maxItems: 2

List the items with description instead with optional minItems. Why is
this flexible in number of items?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  st,syscfg-amcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
> +      memory map area shared between the 2 OSPI instance. The Octo Memory
> +      Manager sets the AMCR depending of the memory-region configuration.
> +      Format is phandle to syscfg / register offset within syscfg / memory split
> +      bitmask.

Don't repeat constraints in free form text.

> +      The memory split bitmask description is:
> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
> +    items:
> +      minItems: 3
> +      maxItems: 3

You do not have there three phandles, but one. Look how other bindings
encode this.

> +
> +  st,omm-req2ack-ns:
> +    description: |
> +      In multiplexed mode (MUXEN = 1), this field defines the time in
> +      nanoseconds between two transactions.
> +
> +  st,omm-cssel-ovr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Configure the chip select selector override for the 2 OCTOSPIs.
> +      The 2 bits mask muxing description is:

bit mask of size? 1? Then just enum string, no?

> +        -bit 0: Chip select selector override setting for OCTOSPI1
> +          0x0: the chip select signal from OCTOSPI1 is sent to NCS1
> +          0x1: the chip select signal from OCTOSPI1 is sent to NCS2
> +        -bit 1: Chip select selector override setting for OCTOSPI2
> +          0x0: the chip select signal from OCTOSPI2 is sent to NCS1
> +          0x1: the chip select signal from OCTOSPI2 is sent to NCS2

I don't understand why this is so complicated. First, can you even send
chip select OCTOSPI1 to NCS2 and use 0x1 as mux? or 0x3 as mux?

Second, your bitmask value of "0x0" means OCTOSPI1 and OCTOSPI2 are sent
to NCS1 (whateveer NCS is). This sounds wrong, but your binding says is
perfectly correct. Is that true? Is that correct binding?


> +
> +  st,omm-mux:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Configure the muxing between the 2 OCTOSPIs busses and the 2 output ports.
> +      The muxing 2 bits mask description is:
> +        - 0x0: direct mode, default
> +        - 0x1: mux OCTOSPI1 and OCTOSPI2 to port 1
> +        - 0x2: swapped mode
> +        - 0x3: mux OCTOSPI1 and OCTOSPI2 to port 2

So these are just 1-3, not hex, not bitmasks. Missing constraints or
enum.




> +
> +  power-domains:
> +    maxItems: 1
> +
> +patternProperties:
> +  ^spi@[a-f0-9]+$:
> +    type: object
> +    $ref: "/schemas/spi/st,stm32mp25-ospi.yaml#"

Not much improved. I think you got here comment to drop quotes. That's
the second comment you ignored.

> +    description: Required spi child node
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - st,syscfg-amcr
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +    ommanager@40500000 {
> +      compatible = "st,stm32mp25-omm";
> +      reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
> +      reg-names = "regs", "memory_map";
> +      memory-region = <&mm_ospi1>, <&mm_ospi2>;
> +      pinctrl-names = "default", "sleep";

pinctrl-names after pinctrl-1

> +      pinctrl-0 = <&ospi_port1_clk_pins_a
> +                   &ospi_port1_io03_pins_a
> +                   &ospi_port1_cs0_pins_a>;
> +      pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
> +                   &ospi_port1_io03_sleep_pins_a
> +                   &ospi_port1_cs0_sleep_pins_a>;
> +      clocks = <&rcc CK_BUS_OSPIIOM>;
> +      resets = <&rcc OSPIIOM_R>;
> +      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
> +      st,omm-req2ack-ns = <0x0>;

Time is never expressed in hex, we do not follow 0x18h clock in
continental Europe.

> +      st,omm-mux = <0x0>;
> +      st,omm-cssel-ovr = <0x0>;
> +      access-controllers = <&rifsc 111>;
> +      power-domains = <&CLUSTER_PD>;
> +
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +
> +      ranges = <0 0 0x40430000 0x400>,
> +               <1 0 0x40440000 0x400>;

ranges always go after reg/reg-names.

> +
> +      spi@40430000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "st,stm32mp25-ospi";

Please follow DTS coding style in ordering your properties.



Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
