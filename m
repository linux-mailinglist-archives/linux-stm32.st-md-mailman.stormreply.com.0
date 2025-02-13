Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A72EBA33A95
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 10:03:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C7D5C78F6D;
	Thu, 13 Feb 2025 09:03:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E106C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 09:03:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F6885C0F75;
 Thu, 13 Feb 2025 09:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B1FC4CED1;
 Thu, 13 Feb 2025 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739437428;
 bh=IEPqyHTmr/nEf5lzsdVqV6RZ6BK9t/GQNcR6dYu4yrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ByHxqda+ehRnaFPRonkLDaCEP+8wA8PDPmvtoI2kdc+H7EAdvKyssJPdy+PmxOtos
 xMsV+8ETqyHhHrYjpmNITbkVUfC6AwL0KbP2G9cw5GWfdSdHi1FbFRaLo5N+g3x2ar
 WdsnpPfFtOl0q39m8O7+n56EpxRkckOhoKdBmbejCXUXDdaXkqPOhARMok7i5NZofa
 kGheN/6yX7f4NqMYQUVPf3MYCjl9wJAgIV1+KP8cvvM3ug96f3M4UXsxL6ddGJvZy7
 X2vqqOP/9tD69TKAIGsXR9DNCjUC2t5KpbyTNlE2289kmf2j5V9l4L0FAZ61tYVYHA
 Ri9dCCdVanrPA==
Date: Thu, 13 Feb 2025 10:03:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20250213-truthful-accurate-gaur-bd118f@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-6-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-6-e8ef1e666c5e@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/10] arm64: dts: st: add stm32mp235f-dk
	board support
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

On Mon, Feb 10, 2025 at 04:21:00PM +0100, Amelie Delaunay wrote:
> Add STM32MP235F Discovery Kit board support. It embeds a STM32MP235FAK
> SoC, with 4GB of LPDDR4, 2*USB typeA, 1*USB3 typeC, 1*ETH, wifi/BT
> combo, DSI HDMI, LVDS connector ...
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/Makefile           |   1 +
>  arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 115 ++++++++++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
> index 0cc12f2b1dfeea6510793ea26f599f767df77749..06364152206997863d0991c25589de73c63494fb 100644
> --- a/arch/arm64/boot/dts/st/Makefile
> +++ b/arch/arm64/boot/dts/st/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  dtb-$(CONFIG_ARCH_STM32) += \
> +	stm32mp235f-dk.dtb \
>  	stm32mp257f-dk.dtb \
>  	stm32mp257f-ev1.dtb
> diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..08e330d310749506c5b0e7a1fb2f80dfa134400a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "stm32mp235.dtsi"
> +#include "stm32mp23xf.dtsi"
> +#include "stm32mp25-pinctrl.dtsi"
> +#include "stm32mp25xxak-pinctrl.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP235F-DK Discovery Board";
> +	compatible = "st,stm32mp235f-dk", "st,stm32mp235";
> +
> +	aliases {
> +		serial0 = &usart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-user-1 {
> +			label = "User-1";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpioc 5 GPIO_ACTIVE_HIGH>;
> +			status = "okay";

Where is it disabled?

> +		};
> +
> +		button-user-2 {
> +			label = "User-2";
> +			linux,code = <BTN_2>;
> +			gpios = <&gpioc 11 GPIO_ACTIVE_HIGH>;
> +			status = "okay";

Same question

> +		};
> +	};

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
