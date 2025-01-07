Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BCFA03869
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 08:08:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EE64C78018;
	Tue,  7 Jan 2025 07:08:28 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0534C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 07:08:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F0B81A40277;
 Tue,  7 Jan 2025 07:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC357C4CED6;
 Tue,  7 Jan 2025 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736233699;
 bh=R8h9eLfpu3xvbqL1BO+eFKtQtfe7sm2Zwb1q9DoGnrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5OVSucKvFdrOhO+k/lAkfQjEvBEBrt/yTbAsyIHLY8P9NzbulizOX2EbuDdm2XbB
 w8X00HgngAr3UEqsK404FmI4/JpdStdRUVQe2H5HUKuRn0x1ojRR9nB3quLpMVkbqE
 rXDW+Hl0Ip52LjfbqqHT2VvajsaaLDmViY7KQUiXTYUa+3gPZRJ0VLGetZ+7kf2t1a
 GChhTxJOZ/+FyE+TMNTaabUJ21a0ZsDSkqxEvE1YGLZ9TbFg7gJfRgFvpQY9xi/3jQ
 fRzAlLJJf7wuMQR/XysRaeOd4FneWv3hwm7US1lub/XOUXtJIrtlxynrF4P81wnn6+
 nS2a3/U/HsJ5A==
Date: Tue, 7 Jan 2025 08:08:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <tedqfrtcnx66j5tlkgmiv4wr6towpwwso4pjzraxm76cjejory@3cktakntjbab>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-2-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: clock: convert stm32 rcc
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

On Sun, Jan 05, 2025 at 07:14:13PM +0100, Dario Binacchi wrote:
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> new file mode 100644
> index 000000000000..ae9e5b26d876
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32-rcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Reset Clock Controller
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description: |
> +  The RCC IP is both a reset and a clock controller.
> +
> +  This binding uses common clock and reset bindings
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt
> +  Documentation/devicetree/bindings/reset/reset.txt

Drop paragraph.

> +
> +  Specifying softreset control of devices
> +  =======================================
> +
> +  Device nodes should specify the reset channel required in their "resets"
> +  property, containing a phandle to the reset device node and an index specifying
> +  which channel to use.

Drop paragraph and rephrase it that reset phandle argument is "... the bit
number within the RCC...."

> +  The index is the bit number within the RCC registers bank, starting from RCC
> +  base address.
> +  It is calculated as: index = register_offset / 4 * 32 + bit_offset.
> +  Where bit_offset is the bit offset within the register.
> +
> +  For example, for CRC reset:
> +  crc = AHB1RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x10 / 4 * 32 + 12 = 140
> +
> +  The list of valid indices is available in:
> +  - include/dt-bindings/mfd/stm32f4-rcc.h for STM32F4 series
> +  - include/dt-bindings/mfd/stm32f7-rcc.h for STM32F7 series
> +  - include/dt-bindings/mfd/stm32h7-rcc.h for STM32H7 series
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f469-rcc
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32f746-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f769-rcc
> +          - const: st,stm32f746-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32h743-rcc
> +          - const: st,stm32-rcc

Old binding did not mention any fallbacks, so you need to explain this
in commit msg. You only said "st,stm32h743-rcc"

> + 
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#clock-cells':
> +    enum: [1, 2]
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3

You need to list the items with description. Narrow the clock numbers
per varian in allOf:if:then and explain this in commit msg (old binding
did not say three clocks, so that's another change).

> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to system configuration controller. It can be used to control the
> +      power domain circuitry.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +  - '#clock-cells'
> +  - clocks
> +  - st,syscfg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32h743-rcc
> +    then:
> +      properties:
> +        '#clock-cells':
> +          const: 1
> +          description: |
> +            The clock index for the specified type.
> +    else:
> +      properties:
> +        '#clock-cells':
> +          const: 2
> +          description: |
> +            - The first cell is the clock type, possible values are 0 for
> +              gated clocks and 1 otherwise.
> +            - The second cell is the clock index for the specified type.
> +
> +additionalProperties: false
> +
> +examples:
> +  # Reset and Clock Control Module node:
> +  - |
> +    rcc@40023800 {
> +        #reset-cells = <1>;
> +        #clock-cells = <2>;
> +        compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
> +        reg = <0x40023800 0x400>;

compatible and reg are alwys the first.

> +        clocks = <&clk_hse>, <&clk_i2s_ckin>;
> +        st,syscfg = <&pwrcfg>;

Only one example.

> +    };
> +
> +  - |
> +    rcc@40023800 {
> +        #reset-cells = <1>;
> +        #clock-cells = <2>;
> +        compatible = "st,stm32f746-rcc", "st,stm32-rcc";
> +        reg = <0x40023800 0x400>;
> +        clocks = <&clk_hse>, <&clk_i2s_ckin>;
> +        st,syscfg = <&pwrcfg>;
> +    };
> +
> +  - |
> +    rcc@58024400 {

clock-controller@58024400

> +        compatible = "st,stm32h743-rcc", "st,stm32-rcc";
> +        reg = <0x58024400 0x400>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
> +        st,syscfg = <&pwrcfg>;

So maybe just keep this example only.

> +    };
> +
> +...
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
