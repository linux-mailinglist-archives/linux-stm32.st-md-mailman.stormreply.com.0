Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0B7E35E0
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Nov 2023 08:27:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76F05C6B463;
	Tue,  7 Nov 2023 07:27:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9D8EC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Nov 2023 07:27:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE47F6119C;
 Tue,  7 Nov 2023 07:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269A9C433C7;
 Tue,  7 Nov 2023 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699342031;
 bh=vGMmP2SbG8QW0rKepADVb1kvIx/cDL07UnzdkoIwYDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mB1qp55vx4ch817u9eU2Y8VdhBifuruRrfu5WkD8+NRovOdls7bGMQEpO13p9l7Bk
 zCiBrotlSSJuHptBzxTf6YjBAtzxcRxpH1/mdh39yCF8FR6hTPh1h8PcsPeV8A3nT6
 EkKeiod5X+JWehHc5dLVyVBgmOI3Y5Kxx4AbIWHzuQo9rYV0vAZulDuNRoGYXD30Sn
 ne77tS9BxdYAntsPEW/7FSYiY4/9p3GiCyDS4nsbrk7Qfmo8TddB2J6jhYT6oQEJ/S
 hS6JgO1BKXyQKb/5mDvlLZCIEoIDVyjM8c73fGi15TgPFGzjPzzH54Q1DbWGKz8ybx
 OjDACSCen+6zg==
Message-ID: <a0231a23-89be-4b44-aae0-ee0bb332f2ae@kernel.org>
Date: Tue, 7 Nov 2023 08:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20231106141845.102648-1-gabriel.fernandez@foss.st.com>
 <20231106141845.102648-2-gabriel.fernandez@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20231106141845.102648-2-gabriel.fernandez@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: stm32: add clocks and
 reset binding for stm32mp25 platform
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

On 06/11/2023 15:18, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Adds clock and reset binding entries for STM32MP25 SoC family
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

This was based on some very old tree. Please work on latest release,
maintainer's tree or linux-next. Otherwise we need to point the same
issues we already fixed. This would be quite a waste of time, don't you
think?


> ---
>  .../bindings/clock/st,stm32mp25-rcc.yaml      | 116 +++++
>  include/dt-bindings/clock/stm32mp25-clks.h    | 492 ++++++++++++++++++
>  include/dt-bindings/reset/stm32mp25-resets.h  | 167 ++++++
>  3 files changed, 775 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>  create mode 100644 include/dt-bindings/clock/stm32mp25-clks.h
>  create mode 100644 include/dt-bindings/reset/stm32mp25-resets.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> new file mode 100644
> index 000000000000..27c60f3231ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp25-rcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 Reset Clock Controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The RCC IP is both a reset and a clock controller.
> +  RCC makes also power management (resume/supend and wakeup interrupt).
> +  Please also refer to reset.txt for common reset controller binding usage.

Sorry, what TXT?

> +
> +  This binding uses common clock bindings
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt

Please drop all unrelevant, 5 year old links.

> +
> +  Specifying clocks
> +  =================
> +
> +  All available clocks are defined as preprocessor macros in
> +  dt-bindings/clock/stm32mp25-clks.h header and can be used in device

Not even proper path :/

> +  tree sources.
> +  This file implements defines like:
> +      #define CK_BUS_SDMMC1 245
> +      #define CK_KER_SDMMC1 313

Open other bindings to see how it is done. We expect full path only.
Drop all this irrelevant parts.

> +
> +  Specifying softreset control of devices
> +  =======================================
> +
> +  Device nodes should specify the reset channel required in their "resets"
> +  property, containing a phandle to the reset device node and an index
> +  specifying which channel to use.

Are you now describing how DT and Linux work? Drop.

> +  The index is the bit number within the RCC registers bank, starting from RCC
> +  base address.

No, it should not be. Use IDs. You will get NAK below anyway.

> +  It is calculated as: index = register_offset / 4 * 32 + bit_offset.
> +  Where bit_offset is the bit offset within the register.
> +
> +  For example on STM32MP25, for LTDC reset:
> +     ltdc = RCC_LTDCCFGR offset / 4 * 32 + LTDC_bit_offset
> +          = 0x840 / 4 * 32 + 0 = 16896
> +
> +  The list of valid indices for STM32MP25 is available in:
> +  include/dt-bindings/reset-controller/stm32mp25-resets.h
> +
> +  This file implements defines like:
> +  #define LTDC_R	16896

? I have no clue what you are saying here.

> +
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - st,stm32mp25-rcc

Compatible is always first.

> +  clocks: true
> +  clock-names: true

NAK, missing constraints.

This does not look at all like any decent bindings. Start from scratch
from recently reviewed bindings.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - "#clock-cells"
> +  - "#reset-cells"
> +  - compatible
> +  - reg
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - st,stm32mp25-rcc
> +then:
> +  properties:
> +    clocks:
> +      description: Specifies oscillators.
> +      maxItems: 5
> +
> +    clock-names:
> +      items:
> +        - const: hse
> +        - const: hsi
> +        - const: msi
> +        - const: lse
> +        - const: lsi
> +  required:
> +    - clocks
> +    - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp25-clks.h>
> +    #include <dt-bindings/reset/stm32mp25-resets.h>
> +
> +    rcc: rcc@44200000 {
> +        compatible = "st,stm32mp25-rcc";
> +        reg = <0x44200000 0x10000>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        clock-names = "hse", "hsi", "msi", "lse", "lsi";
> +        clocks = <&scmi_clk CK_SCMI_HSE>,
> +                 <&scmi_clk CK_SCMI_HSI>,
> +                 <&scmi_clk CK_SCMI_MSI>,
> +                 <&scmi_clk CK_SCMI_LSE>,
> +                 <&scmi_clk CK_SCMI_LSI>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/stm32mp25-clks.h b/include/dt-bindings/clock/stm32mp25-clks.h
> new file mode 100644
> index 000000000000..9876ee0dd1e4
> --- /dev/null
> +++ b/include/dt-bindings/clock/stm32mp25-clks.h

Same filename as bindings.

> @@ -0,0 +1,492 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
> +/*
> + * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> + */
> +
> +#ifndef _DT_BINDINGS_STM32MP25_CLKS_H_
> +#define _DT_BINDINGS_STM32MP25_CLKS_H_
> +


...

> +#endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */
> diff --git a/include/dt-bindings/reset/stm32mp25-resets.h b/include/dt-bindings/reset/stm32mp25-resets.h
> new file mode 100644
> index 000000000000..3a4a9eef6a95
> --- /dev/null
> +++ b/include/dt-bindings/reset/stm32mp25-resets.h

Filename matching compatible format.

> @@ -0,0 +1,167 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
> +/*
> + * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
> + * Author(s): Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> + */
> +
> +#ifndef _DT_BINDINGS_STM32MP25_RESET_H_
> +#define _DT_BINDINGS_STM32MP25_RESET_H_
> +
> +#define SYS_R		8192

NAK, don't put register values into the bindings. There is no single
need of it. Use IDs (which start from 0 and are incremented by 1) or
drop it.



Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
