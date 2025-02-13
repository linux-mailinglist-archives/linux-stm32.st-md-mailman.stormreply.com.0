Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD5CA33A8B
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 10:02:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D027C78F6D;
	Thu, 13 Feb 2025 09:02:44 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98A4CC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 09:02:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C96AA41F42;
 Thu, 13 Feb 2025 09:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C5CC4CED1;
 Thu, 13 Feb 2025 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739437355;
 bh=ua5WVx0I54fdUo13pJ7VbTe7xfRZawQhzWzOpvpRg1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovk7ETsketUvOyZ4x0M+tYWtrM8P3TrEw/+n7GF9T7YrLRxw4AU7ZYRDEoljujezS
 AKAc9XP9P+4gbCsas1wjAxVjcDzy1n9OxHHIYQYAth2nefLNJ80T9nIW5uXdpF3wG1
 k+3IVIBYeMLwk9p5EPtOFaGJMp8zZ8mHFmu6M+XfuNXOWQ4Wg7AIhNyEHk6rKwfO8k
 pyZTIOox8EtBXITKJ/+Xmd38PoDvVB+fo+c01WaH9XzzEphXk6c/Nbe6K9ZtvuQl0r
 9E7+muEApvu00wTzkXK1KkMAMOv2PE9BdEneOA87POE8P1eJwnZjCBKal4Ga2PEtEG
 iqnncWVcn/HKQ==
Date: Thu, 13 Feb 2025 10:02:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20250213-accurate-acoustic-mushroom-a0dfbd@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-8-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-8-e8ef1e666c5e@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/10] arm64: dts: st: introduce stm32mp21
	SoCs family
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

On Mon, Feb 10, 2025 at 04:21:02PM +0100, Amelie Delaunay wrote:
> From: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> STM32MP21 family is composed of 3 SoCs defined as following:
> 
> -STM32MP211: common part composed of 1*Cortex-A35, common peripherals
> like SDMMC, UART, SPI, I2C, parallel display, 1*ETH ...
> 
> -STM32MP213: STM32MP211 + a second ETH, CAN-FD.
> 
> -STM32MP215: STM32MP213 + Display and CSI2.
> 
> A second diversity layer exists for security features/ A35 frequency:
> -STM32MP21xY, "Y" gives information:
>  -Y = A means A35@1.2GHz + no cryp IP and no secure boot.
>  -Y = C means A35@1.2GHz + cryp IP and secure boot.
>  -Y = D means A35@1.5GHz + no cryp IP and no secure boot.
>  -Y = F means A35@1.5GHz + cryp IP and secure boot.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp211.dtsi  | 130 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp213.dtsi  |   9 +++
>  arch/arm64/boot/dts/st/stm32mp215.dtsi  |   9 +++
>  arch/arm64/boot/dts/st/stm32mp21xc.dtsi |   8 ++
>  arch/arm64/boot/dts/st/stm32mp21xf.dtsi |   8 ++
>  5 files changed, 164 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..d384359e0ea16e2593795ff48d4a699324c8ca75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a35";
> +			device_type = "cpu";
> +			reg = <0>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,cortex-a35-pmu";
> +		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>;
> +		interrupt-parent = <&intc>;
> +	};
> +
> +	arm_wdt: watchdog {
> +		compatible = "arm,smc-wdt";
> +		arm,smc-id = <0xbc000000>;
> +		status = "disabled";
> +	};
> +
> +	clocks {
> +		ck_flexgen_08: ck-flexgen-08 {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <64000000>;
> +		};
> +
> +		ck_flexgen_51: ck-flexgen-51 {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <200000000>;
> +		};
> +	};
> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +
> +		scmi: scmi {
> +			compatible = "linaro,scmi-optee";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			linaro,optee-channel-id = <0>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +
> +			scmi_reset: protocol@16 {
> +				reg = <0x16>;
> +				#reset-cells = <1>;
> +			};
> +		};
> +	};
> +
> +	intc: interrupt-controller@4ac00000 {

MMIO nodes belong to the soc.

> +		compatible = "arm,cortex-a7-gic";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x0 0x4ac10000 0x0 0x1000>,
> +		      <0x0 0x4ac20000 0x0 0x2000>,
> +		      <0x0 0x4ac40000 0x0 0x2000>,
> +		      <0x0 0x4ac60000 0x0 0x2000>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&intc>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <2>;
> +		interrupt-parent = <&intc>;
> +		ranges = <0x0 0x0 0x0 0x0 0x80000000>;

ranges is the second property. See DTS coding style.

> +		dma-ranges = <0x0 0x0 0x80000000 0x1 0x0>;
> +
> +		rifsc: bus@42080000 {
> +			compatible = "simple-bus";
> +			reg = <0x42080000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <2>;
> +			ranges;

and here is third.

> +			dma-ranges;
> +
> +			usart2: serial@400e0000 {

Although addresses seem wrong. How bus could start at 0x4208 but device
at 0x400e?

> +				compatible = "st,stm32h7-uart";
> +				reg = <0x400e0000 0x0 0x400>;
> +				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&ck_flexgen_08>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		syscfg: syscon@44230000 {
> +			compatible = "st,stm32mp25-syscfg", "syscon";

Which soc is this? DTSI says stm32mp211, commit STM32MP21, but
compatible xxx25?

> +			reg = <0x44230000 0x0 0x10000>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/st/stm32mp213.dtsi b/arch/arm64/boot/dts/st/stm32mp213.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..22cdedd9abbf4efac2334d497618daa6cc76727b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp213.dtsi
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +#include "stm32mp211.dtsi"
> +
> +/ {
> +};
> diff --git a/arch/arm64/boot/dts/st/stm32mp215.dtsi b/arch/arm64/boot/dts/st/stm32mp215.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..d2c63e92b3cc15ec64898374fd2e745a9c71eb6d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp215.dtsi
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +#include "stm32mp213.dtsi"
> +
> +/ {
> +};

What is the point of this file exactly?

> diff --git a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi b/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..39507a7564c8488647a3276eb227eb5f446359e6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/ {
> +};

And this and others.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
