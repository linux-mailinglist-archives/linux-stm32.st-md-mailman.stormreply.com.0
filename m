Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62450A40C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Apr 2022 17:26:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A336C60496;
	Thu, 21 Apr 2022 15:26:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85EFFC5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Apr 2022 15:26:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23LDvd08019975;
 Thu, 21 Apr 2022 17:26:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bnf5gVjGaaUSSavfXeijykz7SrAnxDKyVAT7Cz7u7sw=;
 b=7/MWr2I6tQ4W5fApMYlAhsleylVxrIeY2fwLEn1AxJhbRVZP6arCNDuYpKeJqj0kCzyl
 6gGS1b5G3yf9/rgKQ10fEny82gZSByubeVQ+nGKQ+Q/mdgt63zrKDaFtP3aPiJPzJg6Q
 pTdG9Fcc1d/v8uYiHOz0ABM7roxz8tIibWZL+MA8sSVrGUjYMOXSvVoVFJQIbAI6Hiwl
 r4YuRYTyf7tKpcJ9QVNnysK7w9Npxz0ltJccC6wgyX15IQam52+pzEir2Lt+80tM4knX
 zMeqN9CJy517IIU8p6SX6aIQVoQafU9E1/t/5k/k8HoLLaTYWah2vkGSkaxUeUpkQnP1 EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09m5m8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 17:26:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C18710002A;
 Thu, 21 Apr 2022 17:26:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9403B22ECEC;
 Thu, 21 Apr 2022 17:26:33 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 21 Apr
 2022 17:26:32 +0200
Message-ID: <d4ec8c8b-9c2a-3556-9c33-2a1769a4ad80@foss.st.com>
Date: Thu, 21 Apr 2022 17:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: <gabriel.fernandez@foss.st.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220316131000.9874-1-gabriel.fernandez@foss.st.com>
 <20220316131000.9874-14-gabriel.fernandez@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220316131000.9874-14-gabriel.fernandez@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-21_02,2022-04-21_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RESEND v3 13/13] ARM: dts: stm32: add RCC
 on STM32MP13x SoC family
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 3/16/22 14:10, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Enables Reset and Clocks Controller on STM32MP13
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp131.dtsi  | 107 +++++++++++------------------
>   arch/arm/boot/dts/stm32mp133.dtsi  |   4 +-
>   arch/arm/boot/dts/stm32mp13xf.dtsi |   3 +-
>   3 files changed, 46 insertions(+), 68 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index 78eac53224d4..d7300b00ec19 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -4,6 +4,8 @@
>    * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>    */
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/stm32mp13-clks.h>
> +#include <dt-bindings/reset/stm32mp13-resets.h>
>   
>   / {
>   	#address-cells = <1>;
> @@ -64,54 +66,8 @@ scmi_reset: protocol@16 {
>   			};
>   		};
>   	};
> -	clocks {
> -		clk_axi: clk-axi {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <266500000>;
> -		};
> -
> -		clk_hse: clk-hse {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <24000000>;
> -		};
> -
> -		clk_hsi: clk-hsi {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <64000000>;
> -		};
> -
> -		clk_lsi: clk-lsi {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <32000>;
> -		};
> -
> -		clk_pclk3: clk-pclk3 {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <104438965>;
> -		};
>   
> -		clk_pclk4: clk-pclk4 {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <133250000>;
> -		};
> -
> -		clk_pll4_p: clk-pll4_p {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <50000000>;
> -		};
> -
> -		clk_pll4_r: clk-pll4_r {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <99000000>;
> -		};
> +	clocks {
>   	};
>   
>   	intc: interrupt-controller@a0021000 {
> @@ -148,7 +104,8 @@ uart4: serial@40010000 {
>   			compatible = "st,stm32h7-uart";
>   			reg = <0x40010000 0x400>;
>   			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk_hsi>;
> +			clocks = <&rcc UART4_K>;
> +			resets = <&rcc UART4_R>;
>   			status = "disabled";
>   		};
>   
> @@ -163,7 +120,8 @@ dma1: dma-controller@48000000 {
>   				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk_pclk4>;
> +			clocks = <&rcc DMA1>;
> +			resets = <&rcc DMA1_R>;
>   			#dma-cells = <4>;
>   			st,mem2mem;
>   			dma-requests = <8>;
> @@ -180,7 +138,8 @@ dma2: dma-controller@48001000 {
>   				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk_pclk4>;
> +			clocks = <&rcc DMA2>;
> +			resets = <&rcc DMA2_R>;
>   			#dma-cells = <4>;
>   			st,mem2mem;
>   			dma-requests = <8>;
> @@ -189,13 +148,29 @@ dma2: dma-controller@48001000 {
>   		dmamux1: dma-router@48002000 {
>   			compatible = "st,stm32h7-dmamux";
>   			reg = <0x48002000 0x40>;
> -			clocks = <&clk_pclk4>;
> +			clocks = <&rcc DMAMUX1>;
> +			resets = <&rcc DMAMUX1_R>;
>   			#dma-cells = <3>;
>   			dma-masters = <&dma1 &dma2>;
>   			dma-requests = <128>;
>   			dma-channels = <16>;
>   		};
>   
> +		rcc: rcc@50000000 {
> +			compatible = "st,stm32mp13-rcc", "syscon";
> +			reg = <0x50000000 0x1000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +
> +			clock-names = "hse", "hsi", "csi", "lse", "lsi";
> +

It doesn't match with current yaml description. I'm preparing a patch to 
update rcc yaml file. You will have to check that it matches with this node.

> +			clocks = <&scmi_clk CK_SCMI_HSE>,
> +				 <&scmi_clk CK_SCMI_HSI>,
> +				 <&scmi_clk CK_SCMI_CSI>,
> +				 <&scmi_clk CK_SCMI_LSE>,
> +				 <&scmi_clk CK_SCMI_LSI>;
> +		};
> +
>   		exti: interrupt-controller@5000d000 {
>   			compatible = "st,stm32mp13-exti", "syscon";
>   			interrupt-controller;
> @@ -206,14 +181,14 @@ exti: interrupt-controller@5000d000 {
>   		syscfg: syscon@50020000 {
>   			compatible = "st,stm32mp157-syscfg", "syscon";
>   			reg = <0x50020000 0x400>;
> -			clocks = <&clk_pclk3>;
> +			clocks = <&rcc SYSCFG>;
>   		};
>   
>   		mdma: dma-controller@58000000 {
>   			compatible = "st,stm32h7-mdma";
>   			reg = <0x58000000 0x1000>;
>   			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk_pclk4>;
> +			clocks = <&rcc MDMA>;
>   			#dma-cells = <5>;
>   			dma-channels = <32>;
>   			dma-requests = <48>;
> @@ -225,8 +200,9 @@ sdmmc1: mmc@58005000 {
>   			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
>   			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "cmd_irq";
> -			clocks = <&clk_pll4_p>;
> +			clocks = <&rcc SDMMC1_K>;
>   			clock-names = "apb_pclk";
> +			resets = <&rcc SDMMC1_R>;
>   			cap-sd-highspeed;
>   			cap-mmc-highspeed;
>   			max-frequency = <130000000>;
> @@ -239,8 +215,9 @@ sdmmc2: mmc@58007000 {
>   			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
>   			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "cmd_irq";
> -			clocks = <&clk_pll4_p>;
> +			clocks = <&rcc SDMMC2_K>;
>   			clock-names = "apb_pclk";
> +			resets = <&rcc SDMMC2_R>;
>   			cap-sd-highspeed;
>   			cap-mmc-highspeed;
>   			max-frequency = <130000000>;
> @@ -250,7 +227,7 @@ sdmmc2: mmc@58007000 {
>   		iwdg2: watchdog@5a002000 {
>   			compatible = "st,stm32mp1-iwdg";
>   			reg = <0x5a002000 0x400>;
> -			clocks = <&clk_pclk4>, <&clk_lsi>;
> +			clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
>   			clock-names = "pclk", "lsi";
>   			status = "disabled";
>   		};
> @@ -289,7 +266,7 @@ gpioa: gpio@50002000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x0 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOA>;
>   				st,bank-name = "GPIOA";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 0 16>;
> @@ -301,7 +278,7 @@ gpiob: gpio@50003000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x1000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOB>;
>   				st,bank-name = "GPIOB";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 16 16>;
> @@ -313,7 +290,7 @@ gpioc: gpio@50004000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x2000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOC>;
>   				st,bank-name = "GPIOC";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 32 16>;
> @@ -325,7 +302,7 @@ gpiod: gpio@50005000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x3000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOD>;
>   				st,bank-name = "GPIOD";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 48 16>;
> @@ -337,7 +314,7 @@ gpioe: gpio@50006000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x4000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOE>;
>   				st,bank-name = "GPIOE";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 64 16>;
> @@ -349,7 +326,7 @@ gpiof: gpio@50007000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x5000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOF>;
>   				st,bank-name = "GPIOF";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 80 16>;
> @@ -361,7 +338,7 @@ gpiog: gpio@50008000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x6000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOG>;
>   				st,bank-name = "GPIOG";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 96 16>;
> @@ -373,7 +350,7 @@ gpioh: gpio@50009000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x7000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOH>;
>   				st,bank-name = "GPIOH";
>   				ngpios = <15>;
>   				gpio-ranges = <&pinctrl 0 112 15>;
> @@ -385,7 +362,7 @@ gpioi: gpio@5000a000 {
>   				interrupt-controller;
>   				#interrupt-cells = <2>;
>   				reg = <0x8000 0x400>;
> -				clocks = <&clk_pclk4>;
> +				clocks = <&rcc GPIOI>;
>   				st,bank-name = "GPIOI";
>   				ngpios = <8>;
>   				gpio-ranges = <&pinctrl 0 128 8>;
> diff --git a/arch/arm/boot/dts/stm32mp133.dtsi b/arch/arm/boot/dts/stm32mp133.dtsi
> index 0fb1386257cf..531c263c9f46 100644
> --- a/arch/arm/boot/dts/stm32mp133.dtsi
> +++ b/arch/arm/boot/dts/stm32mp133.dtsi
> @@ -15,7 +15,7 @@ m_can1: can@4400e000 {
>   			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "int0", "int1";
> -			clocks = <&clk_hse>, <&clk_pll4_r>;
> +			clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
>   			clock-names = "hclk", "cclk";
>   			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
>   			status = "disabled";
> @@ -28,7 +28,7 @@ m_can2: can@4400f000 {
>   			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "int0", "int1";
> -			clocks = <&clk_hse>, <&clk_pll4_r>;
> +			clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
>   			clock-names = "hclk", "cclk";
>   			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
>   			status = "disabled";
> diff --git a/arch/arm/boot/dts/stm32mp13xf.dtsi b/arch/arm/boot/dts/stm32mp13xf.dtsi
> index fa6889e30591..4d00e7592882 100644
> --- a/arch/arm/boot/dts/stm32mp13xf.dtsi
> +++ b/arch/arm/boot/dts/stm32mp13xf.dtsi
> @@ -10,7 +10,8 @@ cryp: crypto@54002000 {
>   			compatible = "st,stm32mp1-cryp";
>   			reg = <0x54002000 0x400>;
>   			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk_axi>;
> +			clocks = <&rcc CRYP1>;
> +			resets = <&rcc CRYP1_R>;
>   			status = "disabled";
>   		};
>   	};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
