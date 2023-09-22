Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDD77AADD3
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 11:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2127EC6A5EF;
	Fri, 22 Sep 2023 09:27:08 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02AFDC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 09:27:06 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38M3Pv2t012149; Fri, 22 Sep 2023 11:26:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=PPcLxRZi1za9Uq8J/6pD8u1gwmaEw0aQixP5JYwJ+i0=; b=ps
 E0txQsm41TYXZ2PVYDGmMqiiFBtIAJe0lFTpGKv5P61sQBv0rhsUsO3sZkDoSVdM
 8LFwGcW60qRtNAaA35iqfkhg+sEBvVp3UmgmgkmtOZsQ4Y06TmzPD63TdNy9VuUg
 jphBB9XM66zJ7D9/LbJb89+ynZTp3kcS+5O3Yf4f08ZPEwAkCl/EoPi6LWRryYWb
 rRJAlpAj9fi9NcvvuanDJ6mKphypqX3sHOPiKQzQuHh5NzS+ngQQ5/pxhSBJvqeo
 EhIbB7mmMZpS3Tv7I7Z5bOjFOuTG3H58COJsnCC7Sbb4p3/oZz5BTBBFwa1Px4ic
 0Ec/1gElkh98+i8GrTtg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t8tt42pja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 11:26:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5660D100051;
 Fri, 22 Sep 2023 11:26:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C499216842;
 Fri, 22 Sep 2023 11:26:55 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 11:26:54 +0200
Message-ID: <c998cbdd-0dfb-b6db-6eea-1325cf40d5bc@foss.st.com>
Date: Fri, 22 Sep 2023 11:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20230919083553.35981-1-eagle.alexander923@gmail.com>
 <20230919083553.35981-2-eagle.alexander923@gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230919083553.35981-2-eagle.alexander923@gmail.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ARM: dts: stm32: Add MyirTech
 MYD-YA151C-T development board support
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

Hi

On 9/19/23 10:35, Alexander Shiyan wrote:
> Add support for the MyirTech SoM-based MYD-YA151C-T development board.
> 
> General features:
>   - STM32MP151C
>   - 256MB RAM
>   - 2xUSB HOST
>   - USB-C OTG
>   - Gigabit ethernet
>   - UART
>   - Boot from NAND, eMMC, SD
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---

Running  make W=1 st/stm32mp151c-myir-myd-ya151c-t.dtb

I got the following issue:

   DTC     arch/arm/boot/dts/st/stm32mp151c-myir-myd-ya151c-t.dtb
arch/arm/boot/dts/st/stm32mp15xc-myir-myc-ya15xc-t.dtsi:107.10-165.5: 
Warning (avoid_unnecessary_addr_size): 
/soc/memory-controller@58002000/nand-controller@4,0/nand@0: unnecessary 
#address-cells/#size-cells without "ranges" or child "reg" property



>   arch/arm/boot/dts/st/Makefile                 |   1 +
>   .../dts/st/stm32mp151c-myir-myd-ya151c-t.dts  | 460 ++++++++++++++++++
>   .../dts/st/stm32mp15xc-myir-myc-ya15xc-t.dtsi | 346 +++++++++++++
>   3 files changed, 807 insertions(+)
>   create mode 100644 arch/arm/boot/dts/st/stm32mp151c-myir-myd-ya151c-t.dts
>   create mode 100644 arch/arm/boot/dts/st/stm32mp15xc-myir-myc-ya15xc-t.dtsi
> 
> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
> index 44b264c399ec..9a507f87f562 100644
> --- a/arch/arm/boot/dts/st/Makefile
> +++ b/arch/arm/boot/dts/st/Makefile
> @@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp151a-prtt1c.dtb \
>   	stm32mp151a-prtt1s.dtb \
>   	stm32mp151a-dhcor-testbench.dtb \
> +	stm32mp151c-myir-myd-ya151c-t.dtb \
>   	stm32mp153c-dhcom-drc02.dtb \
>   	stm32mp153c-dhcor-drc-compact.dtb \
>   	stm32mp157a-avenger96.dtb \
> diff --git a/arch/arm/boot/dts/st/stm32mp151c-myir-myd-ya151c-t.dts b/arch/arm/boot/dts/st/stm32mp151c-myir-myd-ya151c-t.dts
> new file mode 100644
> index 000000000000..811ce394b8c6
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp151c-myir-myd-ya151c-t.dts
> @@ -0,0 +1,460 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/net/qca-ar803x.h>
> +
> +#include "stm32mp151.dtsi"
> +#include "stm32mp15xc-myir-myc-ya15xc-t.dtsi"
> +
> +/ {
> +	model = "MYIR MYD-YA151C-T";
> +	compatible = "myir,myd-ya151c-t", "st,stm32mp151";
> +
> +	aliases {
> +		ethernet0 = &ethernet0;
> +		i2c1 = &i2c2;
> +		serial0 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm2 0 100000 0>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <256>;
> +		default-brightness-level = <255>;
> +	};
> +
> +	panel: panel {
> +		compatible = "innolux,at070tn92";
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpioi 3 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> +		power-supply = <&vdd_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&ltdc_out>;
> +			};
> +		};
> +	};
> +
> +	vin: regulator-vin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vin";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	vdd_3v3: regulator-vdd-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&v3v3>;
> +	};
> +};
> +
> +&leds {
> +	led_live: led-live {
> +		label = "board:live";
> +		color = <LED_COLOR_ID_BLUE>;
> +		default-state = "off";
> +		function = LED_FUNCTION_HEARTBEAT;
> +		gpios = <&extgpio 4 GPIO_ACTIVE_LOW>;
> +		linux,default-trigger = LED_FUNCTION_HEARTBEAT;
> +		panic-indicator;
> +	};
> +};
> +
> +&vin_som {
> +	vin-supply = <&vin>;
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c2_pins &i2c2_pins_z>;
> +	pinctrl-1 = <&i2c2_sleep_pins &i2c2_sleep_pins_z>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	extgpio: gpio@20 {
> +		compatible = "nxp,pcf8575";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	typec: usb@28 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&stusb1600_pins>;
> +		compatible = "st,stusb1600";
> +		reg = <0x28>;
> +		interrupt-parent = <&gpioa>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&vin>;
> +		vsys-supply = <&vdd_3v3>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +			typec-power-opmode = "default";
> +
> +			port {
> +				typec_ep: endpoint {
> +					remote-endpoint = <&usbotg_hs_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +	rx8025: rtc@32 {
> +		compatible = "epson,rx8025";
> +		reg = <0x32>;
> +	};
> +};
> +
> +&ethernet0 {
> +	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
> +	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;
> +	nvmem-cells = <&macaddr0>;
> +	nvmem-cell-names = "mac-address";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		reset-gpios = <&gpiog 3 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <2000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy0: phy@6 {
> +			reg = <6>;
> +			qca,clk-out-frequency = <125000000>;
> +			qca,clk-out-strength = <AR803X_STRENGTH_FULL>;
> +		};
> +	};
> +};
> +
> +&ltdc {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&ltdc_pins>;
> +	pinctrl-1 = <&ltdc_sleep_pins>;
> +	status = "okay";
> +
> +	port {
> +		ltdc_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> +
> +&sai1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai1_pins>;
> +	pinctrl-1 = <&sai1_sleep_pins>;
> +	clocks = <&rcc SAI1>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "x8k", "x11k";
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	cd-gpios = <&gpioa 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	disable-wp;
> +	st,neg-edge;
> +	vmmc-supply = <&vdd>;
> +	status = "okay";
> +};
> +
> +&spi5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi5_pins>;
> +	cs-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>,
> +		   <&gpiof 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	status = "okay";
> +};
> +
> +&timers2 {
> +	status = "okay";
> +
> +	pwm2: pwm {
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&tim2_pwm_pins>;
> +		pinctrl-1 = <&tim2_pwm_sleep_pins>;
> +		status = "okay";
> +	};
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins>;
> +	pinctrl-1 = <&uart4_sleep_pins>;
> +	pinctrl-2 = <&uart4_idle_pins>;
> +	status = "okay";
> +};
> +
> +&usbh_ehci {
> +	phys = <&usbphyc_port0>;
> +	phy-names = "usb";
> +	status = "okay";
> +};
> +
> +&usbotg_hs {
> +	phys = <&usbphyc_port1 0>;
> +	phy-names = "usb2-phy";
> +	usb-role-switch;
> +	vbus-supply = <&vbus_otg>;
> +	status = "okay";
> +
> +	port {
> +		usbotg_hs_ep: endpoint {
> +			remote-endpoint = <&typec_ep>;
> +		};
> +	};
> +};
> +
> +&usbphyc {
> +	status = "okay";
> +};
> +
> +&usbphyc_port0 {
> +	phy-supply = <&vdd_usb>;
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-fs-rftime-tuning;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <15>;
> +	st,trim-hs-impedance = <1>;
> +	st,tune-squelch-level = <3>;
> +	st,tune-hs-rx-offset = <2>;
> +	st,no-lsfs-sc;
> +
> +	connector {
> +		compatible = "usb-a-connector";
> +		vbus-supply = <&vin>;
> +	};
> +};
> +
> +&usbphyc_port1 {
> +	phy-supply = <&vdd_usb>;
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-fs-rftime-tuning;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <15>;
> +	st,trim-hs-impedance = <1>;
> +	st,tune-squelch-level = <3>;
> +	st,tune-hs-rx-offset = <2>;
> +	st,no-lsfs-sc;
> +};
> +
> +&pinctrl {
> +	i2c2_pins: i2c2-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 4, AF4)>;		/* I2C2_SCL */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c2_sleep_pins: i2c2-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 4, ANALOG)>;	/* I2C2_SCL */
> +		};
> +	};
> +
> +	ltdc_pins: ltdc-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G',  7, AF14)>,		/* LCD_CLK */
> +				 <STM32_PINMUX('I', 10, AF14)>,		/* LCD_HSYNC */
> +				 <STM32_PINMUX('I',  9, AF14)>,		/* LCD_VSYNC */
> +				 <STM32_PINMUX('E', 13, AF14)>,		/* LCD_DE */
> +				 <STM32_PINMUX('H',  2, AF14)>,		/* LCD_R0 */
> +				 <STM32_PINMUX('H',  3, AF14)>,		/* LCD_R1 */
> +				 <STM32_PINMUX('H',  8, AF14)>,		/* LCD_R2 */
> +				 <STM32_PINMUX('H',  9, AF14)>,		/* LCD_R3 */
> +				 <STM32_PINMUX('H', 10, AF14)>,		/* LCD_R4 */
> +				 <STM32_PINMUX('H', 11, AF14)>,		/* LCD_R5 */
> +				 <STM32_PINMUX('H', 12, AF14)>,		/* LCD_R6 */
> +				 <STM32_PINMUX('E', 15, AF14)>,		/* LCD_R7 */
> +				 <STM32_PINMUX('E', 14, AF14)>,		/* LCD_G0 */
> +				 <STM32_PINMUX('E',  6, AF14)>,		/* LCD_G1 */
> +				 <STM32_PINMUX('H', 13, AF14)>,		/* LCD_G2 */
> +				 <STM32_PINMUX('H', 14, AF14)>,		/* LCD_G3 */
> +				 <STM32_PINMUX('H', 15, AF14)>,		/* LCD_G4 */
> +				 <STM32_PINMUX('I',  0, AF14)>,		/* LCD_G5 */
> +				 <STM32_PINMUX('I',  1, AF14)>,		/* LCD_G6 */
> +				 <STM32_PINMUX('I',  2, AF14)>,		/* LCD_G7 */
> +				 <STM32_PINMUX('D',  9, AF14)>,		/* LCD_B0 */
> +				 <STM32_PINMUX('G', 12, AF14)>,		/* LCD_B1 */
> +				 <STM32_PINMUX('G', 10, AF14)>,		/* LCD_B2 */
> +				 <STM32_PINMUX('D', 10, AF14)>,		/* LCD_B3 */
> +				 <STM32_PINMUX('I',  4, AF14)>,		/* LCD_B4 */
> +				 <STM32_PINMUX('I',  5, AF14)>,		/* LCD_B5 */
> +				 <STM32_PINMUX('I',  6, AF14)>,		/* LCD_B6 */
> +				 <STM32_PINMUX('I',  7, AF14)>;		/* LCD_B7 */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +	};
> +
> +	ltdc_sleep_pins: ltdc-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G',  7, ANALOG)>,	/* LCD_CLK */
> +				 <STM32_PINMUX('I', 10, ANALOG)>,	/* LCD_HSYNC */
> +				 <STM32_PINMUX('I',  9, ANALOG)>,	/* LCD_VSYNC */
> +				 <STM32_PINMUX('E', 13, ANALOG)>,	/* LCD_DE */
> +				 <STM32_PINMUX('H',  2, ANALOG)>,	/* LCD_R0 */
> +				 <STM32_PINMUX('H',  3, ANALOG)>,	/* LCD_R1 */
> +				 <STM32_PINMUX('H',  8, ANALOG)>,	/* LCD_R2 */
> +				 <STM32_PINMUX('H',  9, ANALOG)>,	/* LCD_R3 */
> +				 <STM32_PINMUX('H', 10, ANALOG)>,	/* LCD_R4 */
> +				 <STM32_PINMUX('H', 11, ANALOG)>,	/* LCD_R5 */
> +				 <STM32_PINMUX('H', 12, ANALOG)>,	/* LCD_R6 */
> +				 <STM32_PINMUX('E', 15, ANALOG)>,	/* LCD_R7 */
> +				 <STM32_PINMUX('E', 14, ANALOG)>,	/* LCD_G0 */
> +				 <STM32_PINMUX('E',  6, ANALOG)>,	/* LCD_G1 */
> +				 <STM32_PINMUX('H', 13, ANALOG)>,	/* LCD_G2 */
> +				 <STM32_PINMUX('H', 14, ANALOG)>,	/* LCD_G3 */
> +				 <STM32_PINMUX('H', 15, ANALOG)>,	/* LCD_G4 */
> +				 <STM32_PINMUX('I',  0, ANALOG)>,	/* LCD_G5 */
> +				 <STM32_PINMUX('I',  1, ANALOG)>,	/* LCD_G6 */
> +				 <STM32_PINMUX('I',  2, ANALOG)>,	/* LCD_G7 */
> +				 <STM32_PINMUX('D',  9, ANALOG)>,	/* LCD_B0 */
> +				 <STM32_PINMUX('G', 12, ANALOG)>,	/* LCD_B1 */
> +				 <STM32_PINMUX('G', 10, ANALOG)>,	/* LCD_B2 */
> +				 <STM32_PINMUX('D', 10, ANALOG)>,	/* LCD_B3 */
> +				 <STM32_PINMUX('I',  4, ANALOG)>,	/* LCD_B4 */
> +				 <STM32_PINMUX('I',  5, ANALOG)>,	/* LCD_B5 */
> +				 <STM32_PINMUX('I',  6, ANALOG)>,	/* LCD_B6 */
> +				 <STM32_PINMUX('I',  7, ANALOG)>;	/* LCD_B7 */
> +		};
> +	};
> +
> +	sai1_pins: sai1-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 2, AF6)>,		/* SAI1_SD_A */
> +				 <STM32_PINMUX('F', 8, AF6)>,		/* SAI1_SCK_B */
> +				 <STM32_PINMUX('F', 9, AF6)>,		/* SAI1_FS_B */
> +				 <STM32_PINMUX('F', 7, AF6)>;		/* SAI1_MCLK_B */
> +			slew-rate = <0>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 6, AF6)>;		/* SAI1_SD_B */
> +			bias-disable;
> +		};
> +	};
> +
> +	sai1_sleep_pins: sai1-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 2, ANALOG)>,	/* SAI1_SD_A */
> +				 <STM32_PINMUX('F', 8, ANALOG)>,	/* SAI1_SCK_B */
> +				 <STM32_PINMUX('F', 9, ANALOG)>,	/* SAI1_FS_B */
> +				 <STM32_PINMUX('F', 7, ANALOG)>,	/* SAI1_MCLK_B */
> +				 <STM32_PINMUX('F', 6, ANALOG)>;	/* SAI1_SD_B */
> +		};
> +	};
> +
> +	spi5_pins: spi5-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 6, AF5)>,		/* SPI5_SCK */
> +				 <STM32_PINMUX('F', 11, AF5)>;		/* SPI5_MOSI */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('H', 7, AF5)>;		/* SPI5_MISO */
> +			bias-disable;
> +		};
> +	};
> +
> +	stusb1600_pins: stusb1600-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 10, ANALOG)>;	/* STUSB1600 IRQ */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	tim2_pwm_pins: tim2-pwm-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G', 8, AF1)>;		/* TIM2_CH1 */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	tim2_pwm_sleep_pins: tim2-pwm-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G', 8, ANALOG)>;	/* TIM2_CH1 */
> +		};
> +	};
> +
> +	uart4_pins: uart4-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 11, AF6)>;		/* UART4_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 11, AF6)>;		/* UART4_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	uart4_idle_pins: uart4-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 11, ANALOG)>;	/* UART4_TX */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 11, AF6)>;		/* UART4_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	uart4_sleep_pins: uart4-sleep-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 11, ANALOG)>,	/* UART4_TX */
> +				 <STM32_PINMUX('A', 11, ANALOG)>;	/* UART4_RX */
> +		};
> +	};
> +};
> +
> +&pinctrl_z {
> +	i2c2_pins_z: i2c2-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 7, AF3)>;		/* I2C2_SDA */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c2_sleep_pins_z: i2c2-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 7, ANALOG)>;	/* I2C2_SDA */
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/st/stm32mp15xc-myir-myc-ya15xc-t.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-myir-myc-ya15xc-t.dtsi
> new file mode 100644
> index 000000000000..ec200ea394f7
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp15xc-myir-myc-ya15xc-t.dtsi
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
> +
> +#include "stm32mp15-pinctrl.dtsi"
> +#include "stm32mp15xxac-pinctrl.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/mfd/st,stpmic1.h>
> +
> +/ {
> +	aliases {
> +		i2c3 = &i2c4;
> +	};
> +
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x10000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		mcuram2: mcuram2@10000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10000000 0x40000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@10040000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10040000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@10041000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10041000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@10042000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10042000 0x4000>;
> +			no-map;
> +		};
> +
> +		mcuram: mcuram@30000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x30000000 0x40000>;
> +			no-map;
> +		};
> +
> +		retram: retram@38000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x38000000 0x10000>;
> +			no-map;
> +		};
> +
> +		optee: optee@de000000 {
> +			reg = <0xde000000 0x02000000>;
> +			no-map;
> +		};
> +	};
> +
> +	vin_som: regulator-vin-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vin_som";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	leds: leds {
> +		compatible = "gpio-leds";
> +
> +		led_cpu: led-cpu {
> +			label = "som:cpu";
> +			color = <LED_COLOR_ID_BLUE>;
> +			default-state = "off";
> +			function = LED_FUNCTION_CPU;
> +			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
> +			linux,default-trigger = LED_FUNCTION_CPU;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vddcore>;
> +};
> +
> +&dts {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&fmc_pins_a>;
> +	pinctrl-1 = <&fmc_sleep_pins_a>;
> +	status = "okay";
> +
> +	nand-controller@4,0 {
> +		status = "okay";
> +
> +		nand@0 {
> +			reg = <0>;
> +			nand-on-flash-bbt;
> +			nand-ecc-strength = <4>;
> +			nand-ecc-step-size = <512>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			nand_parts: partitions {
> +				compatible = "fixed-partitions";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				partition@0 {
> +					label = "fsbl1";
> +					reg = <0x0 0x80000>;
> +				};
> +
> +				partition@80000 {
> +					label = "fsbl2";
> +					reg = <0x80000 0x80000>;
> +				};
> +
> +				partition@100000 {
> +					label = "matadata1";
> +					reg = <0x100000 0x80000>;
> +				};
> +
> +				partition@180000 {
> +					label = "matadata2";
> +					reg = <0x180000 0x80000>;
> +				};
> +
> +				partition@200000 {
> +					label = "fip-a1";
> +					reg = <0x200000 0x400000>;
> +				};
> +
> +				partition@600000 {
> +					label = "fip-a2";
> +					reg = <0x600000 0x400000>;
> +				};
> +
> +				partition@a00000 {
> +					label = "fip-b1";
> +					reg = <0xa00000 0x400000>;
> +				};
> +
> +				partition@e00000 {
> +					label = "fip-b2";
> +					reg = <0xe00000 0x400000>;
> +				};
> +
> +				partition@1200000 {
> +					label = "system";
> +					reg = <0x01200000 0>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c4_pins_a>;
> +	pinctrl-1 = <&i2c4_sleep_pins_a>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	pmic: pmic@33 {
> +		compatible = "st,stpmic1";
> +		reg = <0x33>;
> +		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		regulators {
> +			compatible = "st,stpmic1-regulators";
> +			buck1-supply = <&vin_som>;
> +			buck2-supply = <&vin_som>;
> +			buck3-supply = <&vin_som>;
> +			buck4-supply = <&vin_som>;
> +			ldo1-supply = <&v3v3>;
> +			ldo4-supply = <&vin_som>;
> +			vref_ddr-supply = <&vin_som>;
> +			boost-supply = <&vin_som>;
> +			pwr_sw1-supply = <&bst_out>;
> +			pwr_sw2-supply = <&bst_out>;
> +
> +			vddcore: buck1 {
> +				regulator-name = "vddcore";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd_ddr: buck2 {
> +				regulator-name = "vdd_ddr";
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd: buck3 {
> +				regulator-name = "vdd";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				st,mask-reset;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			v3v3: buck4 {
> +				regulator-name = "v3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdda: ldo1 {
> +				regulator-name = "vdda";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			vtt_ddr: ldo3 {
> +				regulator-name = "vtt_ddr";
> +				regulator-always-on;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd_usb: ldo4 {
> +				regulator-name = "vdd_usb";
> +				regulator-over-current-protection;
> +			};
> +
> +			vref_ddr: vref_ddr {
> +				regulator-name = "vref_ddr";
> +				regulator-always-on;
> +			};
> +
> +			bst_out: boost {
> +				regulator-name = "bst_out";
> +			};
> +
> +			vbus_otg: pwr_sw1 {
> +				regulator-name = "vbus_otg";
> +				regulator-active-discharge = <1>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vbus_sw: pwr_sw2 {
> +				regulator-name = "vbus_sw";
> +				regulator-active-discharge = <1>;
> +				regulator-over-current-protection;
> +			};
> +		};
> +
> +		onkey: onkey {
> +			compatible = "st,stpmic1-onkey";
> +			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
> +			interrupt-names = "onkey-falling", "onkey-rising";
> +			power-off-time-sec = <10>;
> +		};
> +	};
> +
> +	eeprom: eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +		num-addresses = <8>;
> +		wp-gpios = <&gpioa 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		macaddr0: mac-address@90 {
> +			reg = <0x90 6>;
> +		};
> +
> +		macaddr1: mac-address@96 {
> +			reg = <0x96 6>;
> +		};
> +	};
> +};
> +
> +&ipcc {
> +	status = "okay";
> +};
> +
> +&iwdg2 {
> +	timeout-sec = <32>;
> +	status = "okay";
> +};
> +
> +&m4_rproc {
> +	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
> +			<&vdev0vring1>, <&vdev0buffer>;
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
> +	interrupt-parent = <&exti>;
> +	interrupts = <68 IRQ_TYPE_EDGE_RISING>;
> +	status = "okay";
> +};
> +
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
> +};
> +
> +&rng1 {
> +	status = "okay";
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	st,neg-edge;
> +	bus-width = <8>;
> +	vmmc-supply = <&v3v3>;
> +	vqmmc-supply = <&vdd>;
> +	mmc-ddr-3_3v;
> +	status = "okay";
> +};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
