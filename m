Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7345B8AEAE9
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 17:22:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28BC8C6DD6D;
	Tue, 23 Apr 2024 15:22:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 925F1C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 15:22:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 553AD6125C;
 Tue, 23 Apr 2024 15:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6652C116B1;
 Tue, 23 Apr 2024 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713885732;
 bh=ckdRXGNIvwKMnyRaf5FG0K/hkMCAzdQEnbjUWTuh2Sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SrUlTSEmO7wAG1Vx7ILRzfbopP2BCS5ofCH7r/97jibToM3DYik0p4RbpC+YTeiP2
 yShsobB/4JGfSEeMXW44RxaMz8tOiwiIkeawcScoAt+Lodw8AeLpxeiLDvopx7EnNA
 TVy6q7D4MVmbs3QwbEovo285A6w0nYYUhO3cr5betQa92hWZtH68L43IzkgO39F6d7
 XMrDAArdQL6zRp/F4vDFPJcv9wedtrjhGU4Lt81bZbQ+ABjbjKr4Yr5EQxtVFy1/f6
 w5oX720ri04WNyNvEEbfQa1c4SB6+vX6C+YnteZVfHhSzNlsewAbyWIXHkUTdzqX21
 VQHaXTzy2VHHQ==
Date: Tue, 23 Apr 2024 10:22:09 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20240423152209.GA318680-robh@kernel.org>
References: <20240423123302.1550592-1-amelie.delaunay@foss.st.com>
 <20240423123302.1550592-5-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423123302.1550592-5-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/12] dt-bindings: dma: Document STM32
 DMA3 controller bindings
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

On Tue, Apr 23, 2024 at 02:32:54PM +0200, Amelie Delaunay wrote:
> The STM32 DMA3 is a Direct Memory Access controller with different features
> depending on its hardware configuration.
> The channels have not the same capabilities, some have a larger FIFO, so
> their performance is higher.
> This patch describes STM32 DMA3 bindings, used to select a channel that
> fits client requirements, and to pre-configure the channel depending on
> the client needs.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  .../bindings/dma/stm32/st,stm32-dma3.yaml     | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> new file mode 100644
> index 000000000000..ea4f8f6add3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/stm32/st,stm32-dma3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 DMA3 Controller
> +
> +description: |
> +  The STM32 DMA3 is a direct memory access controller with different features
> +  depending on its hardware configuration.
> +  It is either called LPDMA (Low Power), GPDMA (General Purpose) or
> +  HPDMA (High Performance).
> +  Its hardware configuration registers allow to dynamically expose its features.
> +
> +  GPDMA and HPDMA support 16 independent DMA channels, while only 4 for LPDMA.
> +  GPDMA and HPDMA support 256 DMA requests from peripherals, 8 for LPDMA.
> +
> +  Bindings are generic for these 3 STM32 DMA3 configurations.
> +
> +  DMA clients connected to the STM32 DMA3 controller must use the format described
> +  in the ../dma.txt file, using a four-cell specifier for each channel.
> +  A phandle to the DMA controller plus the following three integer cells:

This description should be part of #dma-cells.

> +    1. The request line number
> +    2. A 32-bit mask specifying the DMA channel requirements
> +      -bit 0-1: The priority level
> +        0x0: low priority, low weight
> +        0x1: low priority, mid weight
> +        0x2: low priority, high weight
> +        0x3: high priority
> +      -bit 4-7: The FIFO requirement for queuing source and destination transfers
> +        0x0: no FIFO requirement/any channel can fit
> +        0x2: FIFO of 8 bytes (2^2+1)
> +        0x4: FIFO of 32 bytes (2^4+1)
> +        0x6: FIFO of 128 bytes (2^6+1)
> +        0x7: FIFO of 256 bytes (2^7+1)
> +    3. A 32-bit mask specifying the DMA transfer requirements
> +      -bit 0: The source incrementing burst
> +        0x0: fixed burst
> +        0x1: contiguously incremented burst
> +      -bit 1: The source allocated port
> +        0x0: port 0 is allocated to the source transfer
> +        0x1: port 1 is allocated to the source transfer
> +      -bit 4: The destination incrementing burst
> +        0x0: fixed burst
> +        0x1: contiguously incremented burst
> +      -bit 5: The destination allocated port
> +        0x0: port 0 is allocated to the destination transfer
> +        0x1: port 1 is allocated to the destination transfer
> +      -bit 8: The type of hardware request
> +        0x0: burst
> +        0x1: block
> +      -bit 9: The control mode
> +        0x0: DMA controller control mode
> +        0x1: peripheral control mode
> +      -bit 12-13: The transfer complete event mode
> +        0x0: at block level, transfer complete event is generated at the end of a block
> +        0x2: at LLI level, the transfer complete event is generated at the end of the LLI transfer,
> +             including the update of the LLI if any
> +        0x3: at channel level, the transfer complete event is generated at the end of the last LLI
> +
> +maintainers:
> +  - Amelie Delaunay <amelie.delaunay@foss.st.com>
> +
> +allOf:
> +  - $ref: /schemas/dma/dma-controller.yaml#
> +
> +properties:
> +  "#dma-cells":
> +    const: 3
> +
> +  compatible:
> +    const: st,stm32-dma3

SoC specific compatible needed.

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
> +  interrupts:
> +    minItems: 4
> +    maxItems: 16

I assume this is 1 interrupt per channel? But I shouldn't have to 
assume. Either you need to list every interrupt out or you can keep this 
adding some description if they are all the type of interrupt (e.g. per 
channel).

> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    dma-controller@40400000 {
> +      compatible = "st,stm32-dma3";
> +      reg = <0x40400000 0x1000>;
> +      interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&rcc CK_BUS_HPDMA1>;
> +      #dma-cells = <3>;
> +    };
> +...
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
