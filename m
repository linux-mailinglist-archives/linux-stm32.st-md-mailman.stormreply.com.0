Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 756CC5072F1
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 18:29:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE83C6049A;
	Tue, 19 Apr 2022 16:29:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01E5FC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 16:29:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JFvplH028198;
 Tue, 19 Apr 2022 18:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=15Hg4u7y9lN6hOoARKdQVq4bpg2QHcH6bNABPOmsjfM=;
 b=M/40eMHUafTBrPv8zoXfqswkxoFmmWG7Kg5AGqACJD7L01roiCXsYesAo4w2trdejCZL
 mMeu3+ys2fpsN9G+dI4EjbJTiL9HdOkclmUmm5D0jVZtOr5HU0HXBmfxIQqJ6XR52TYu
 n5lCaupdwzmtO/rM6gi2q1invb43o7sBflw8Z5nR5VSgkkQN0qb/mWyk5LsWVy6zkGMH
 ePuvdD1BJhxEQFeLfbkOoFA0Q10BCW+w5YIoPsszT23sTZ0Y/MtanGR56kVa7IB9gL/m
 HxhEgGtO2jPnGz+gGMtcxdGLcwIJHrYSfyv9gtQ7QBP6IsLq1RSyIwsNNCXVkavdCR+U OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqgqax1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 18:29:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BC9310002A;
 Tue, 19 Apr 2022 18:29:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34A1C21B514;
 Tue, 19 Apr 2022 18:29:40 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 18:29:39 +0200
Message-ID: <625d4510-e390-49d0-e6b8-2456d22b4c00@foss.st.com>
Date: Tue, 19 Apr 2022 18:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20220414100700.1733914-1-s.trumtrar@pengutronix.de>
 <20220414100700.1733914-3-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220414100700.1733914-3-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: add STM32MP1-based
	Phytec board
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

On 4/14/22 12:07, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB eMMC,
> up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm/boot/dts/Makefile                    |   3 +-
>   .../dts/stm32mp157-phyboard-stm32mp1.dtsi     | 283 +++++++++++++
>   .../dts/stm32mp157c-phycore-stm32mp1-3.dts    |  57 +++
>   ...stm32mp157c-phycore-stm32mp15-pinctrl.dtsi | 318 +++++++++++++++
>   .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 373 ++++++++++++++++++
>   5 files changed, 1033 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/stm32mp157-phyboard-stm32mp1.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi

Can you split a bit those patches please ?

> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c16f8a2b738..72154fed7e8a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1174,7 +1174,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp157c-emsbc-argon.dtb \
>   	stm32mp157c-ev1.dtb \
>   	stm32mp157c-lxa-mc1.dtb \
> -	stm32mp157c-odyssey.dtb
> +	stm32mp157c-odyssey.dtb \
> +	stm32mp157c-phycore-stm32mp1-3.dtb
>   dtb-$(CONFIG_MACH_SUN4I) += \
>   	sun4i-a10-a1000.dtb \
>   	sun4i-a10-ba10-tvbox.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp157-phyboard-stm32mp1.dtsi b/arch/arm/boot/dts/stm32mp157-phyboard-stm32mp1.dtsi
> new file mode 100644
> index 000000000000..2b3afa3761d6
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157-phyboard-stm32mp1.dtsi
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) PHYTEC GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +
> +#include <dt-bindings/leds/leds-pca9532.h>
> +
> +/ {
> +	model = "Phytec GmbH phycore-stm32mp1 Sargas Dev Board";
> +	compatible = "phytec,pcm939-1517-2", "st,stm32mp157";
> +
> +	aliases {
> +		ethernet0 = &ethernet0;
> +		rtc0	= &i2c4_rtc;
> +		rtc1	= &rtc;
> +		serial0 = &uart4;
> +		serial1 = &usart3;
> +		serial2 = &usart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	sound {
> +		compatible = "audio-graph-card";
> +		label = "STM32MP1-PHYCORE";
> +		routing =
> +			"Playback", "MCLK", /* Set a route between "MCLK" and "playback" widgets */
> +			"Capture", "MCLK";
> +		dais = <&sai2b_port &sai2a_port>;
> +		status = "okay";
> +	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +		status = "okay";
> +
> +		home {
> +			label = "Home";
> +			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_HOME>;
> +		};
> +
> +		enter {
> +			label = "Enter";
> +			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_ENTER>;
> +		};
> +	};
> +};
> +
> +&m_can2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can2_pins_a>;
> +	pinctrl-1 = <&m_can2_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c1_pins_a>;
> +	pinctrl-1 = <&i2c1_pins_sleep_a>;
> +	i2c-scl-rising-time-ns = <100>;
> +	i2c-scl-falling-time-ns = <7>;
> +	status = "okay";
> +
> +	codec: tlv320@18 {
> +		compatible = "ti,tlv320aic3007";
> +		#sound-dai-cells = <0>;
> +		reg = <0x18>;
> +		status = "okay";
> +
> +		ai3x-micbias-vg = <2>;
> +
> +		/* gpio-reset = <&gpio5 8 GPIO_ACTIVE_LOW>; */
> +		AVDD-supply = <&v3v3>;
> +		IOVDD-supply = <&v3v3>;
> +		DRVDD-supply = <&v3v3>;
> +		DVDD-supply = <&v1v8_audio>;
> +
> +		clocks = <&sai2b>;
> +		clock-names = "MCLK";
> +
> +		tlv320_port: port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			tlv320_tx_endpoint: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&sai2b_endpoint>;
> +				frame-master;
> +				bitclock-master;
> +			};
> +
> +			tlv320_rx_endpoint: endpoint@1 {
> +				reg = <1>;
> +				remote-endpoint = <&sai2a_endpoint>;
> +				frame-master;
> +				bitclock-master;
> +			};
> +		};
> +	};
> +
> +	stmpe_touch: stmpe811@44 {
> +		compatible = "st,stmpe811";
> +		reg = <0x44>;
> +		interrupts = <3 2>;
> +		interrupt-parent = <&gpioi>;
> +		vio-supply = <&v3v3>;
> +		vcc-supply = <&v3v3>;
> +		status = "disabled";
> +
> +		stmpe_touchscreen {
> +			compatible = "st,stmpe-ts";
> +			st,sample-time = <4>;
> +			st,mod-12b = <1>;
> +			st,ref-sel = <0>;
> +			st,adc-freq = <1>;
> +			st,ave-ctrl = <1>;
> +			st,touch-det-delay = <2>;
> +			st,settling = <2>;
> +			st,fraction-z = <7>;
> +			st,i-drive = <1>;
> +		};
> +	};
> +
> +	leds: pca9533@62 {
> +		compatible = "nxp,pca9533";
> +		reg = <0x62>;
> +		status = "okay";
> +
> +		red-power {
> +			label = "pca:red:power";
> +			type = <PCA9532_TYPE_LED>;
> +		};
> +
> +		green-power {
> +			label = "pca:green:power";
> +			type = <PCA9532_TYPE_LED>;
> +		};
> +
> +		blue-power {
> +			type = <PCA9532_TYPE_LED>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
> +
> +&sai2 {
> +	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "x8k", "x11k";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai2a_pins_b>, <&sai2b_pins_a>;
> +	pinctrl-1 = <&sai2a_sleep_pins_b>, <&sai2b_sleep_pins_a>;
> +	status = "okay";
> +
> +	sai2a: audio-controller@4400b004 {
> +		compatible = "st,stm32-sai-sub-a";
> +		dma-names = "rx";
> +		st,sync = <&sai2b 2>;
> +		status = "okay";
> +		clocks = <&rcc SAI2_K>, <&sai2b>;
> +		clock-names = "sai_ck", "MCLK";
> +
> +		sai2a_port: port {
> +			sai2a_endpoint: endpoint {
> +				remote-endpoint = <&tlv320_rx_endpoint>;
> +				format = "i2s";
> +				mclk-fs = <256>;
> +				dai-tdm-slot-num = <2>;
> +				dai-tdm-slot-width = <16>;
> +			};
> +		};
> +	};
> +
> +	sai2b: audio-controller@4400b024 {
> +		compatible = "st,stm32-sai-sub-b";
> +		#clock-cells = <0>;
> +		dma-names = "tx";
> +		clocks = <&rcc SAI2_K>;
> +		clock-names = "sai_ck";
> +		status = "okay";
> +
> +		sai2b_port: port {
> +			sai2b_endpoint: endpoint {
> +				remote-endpoint = <&tlv320_tx_endpoint>;
> +				format = "i2s";
> +				mclk-fs = <256>;
> +				dai-tdm-slot-num = <2>;
> +				dai-tdm-slot-width = <16>;
> +			};
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	cd-gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	max-frequency = <10000000>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&spi1_pins_a>;
> +	pinctrl-1 = <&spi1_sleep_pins_a>;
> +	cs-gpios = <&gpioz 3 0>;
> +	status = "okay";
> +
> +	spi@0 {
> +		compatible = "linux,spidev";
> +		spi-max-frequency = <10000000>;
> +		reg = <0>;
> +	};
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	pinctrl-1 = <&uart4_sleep_pins_a>;
> +	pinctrl-2 = <&uart4_idle_pins_a>;
> +	pinctrl-3 = <&uart4_pins_a>;
> +	status = "okay";
> +};
> +
> +&usart1 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&usart1_pins_a &usart1_pins_b>;
> +	pinctrl-1 = <&usart1_sleep_pins_a &usart1_sleep_pins_b>;
> +	pinctrl-2 = <&usart1_idle_pins_a &usart1_idle_pins_b>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&usart3 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&usart3_pins_a>;
> +	pinctrl-1 = <&usart3_sleep_pins_a>;
> +	pinctrl-2 = <&usart3_idle_pins_a>;
> +	status = "okay";
> +};
> +
> +&usbh_ehci {
> +	phys = <&usbphyc_port0>;
> +	phy-names = "usb";
> +	status = "okay";
> +};
> +
> +&usbh_ohci {
> +	phys = <&usbphyc_port0>;
> +	phy-names = "usb";
> +	status = "okay";
> +};
> +
> +&usbotg_hs {
> +	phys = <&usbphyc_port1 0>;
> +	phy-names = "usb2-phy";
> +	vbus-supply = <&vbus_otg>;
> +	status = "okay";
> +};
> +
> +&usbphyc {
> +	vdd3v3-supply = <&vdd_usb>;
> +	status = "okay";
> +};
> +
> +&usbphyc_port0 {
> +	phy-supply = <&vdd_usb>;
> +	vbus-supply = <&vbus_sw>;
> +};
> +
> +&usbphyc_port1 {
> +	phy-supply = <&vdd_usb>;
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> new file mode 100644
> index 000000000000..574a345db943
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp157.dtsi"
> +#include "stm32mp15xc.dtsi"
> +#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
> +#include "stm32mp15xxac-pinctrl.dtsi"
> +#include "stm32mp157-phyboard-stm32mp1.dtsi"
> +
> +/ {
> +	model = "PHYTEC phyCORE-STM32MP1-3 Dev Board";
> +	compatible = "phytec,phycore-stm32mp1-3", "st,stm32mp157";
> +};
> +
> +&dts {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	status = "disabled";
> +};
> +
> +&gpu {
> +	status = "okay";
> +	contiguous-area = <&gpu_reserved>;
> +};
> +
> +&i2c4_eeprom {
> +	status = "okay";
> +};
> +
> +&i2c4_rtc {
> +	status = "okay";
> +};
> +
> +&qspi {
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	secure-status = "disabled";
> +};
> +
> +&sdmmc2 {
> +	status = "okay";
> +	secure-status = "disabled";
> +};
> +
> +&cryp1 {
> +	status = "okay";
> +};
> +
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi


Why create a new file pinctrl file for your board ? All groups are 
differents than existing ones ?

> new file mode 100644
> index 000000000000..7a856d3b3a85
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +#include "stm32mp15-pinctrl.dtsi"
> +
> +&pinctrl {
> +	dcmi_pins_a: dcmi-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
> +				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
> +				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
> +				 <STM32_PINMUX('H', 9,  AF13)>,/* DCMI_D0 */
> +				 <STM32_PINMUX('C', 7,  AF13)>,/* DCMI_D1 */
> +				 <STM32_PINMUX('E', 0,  AF13)>,/* DCMI_D2 */
> +				 <STM32_PINMUX('E', 1,  AF13)>,/* DCMI_D3 */
> +				 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
> +				 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
> +				 <STM32_PINMUX('E', 5,  AF13)>,/* DCMI_D6 */
> +				 <STM32_PINMUX('I', 7,  AF13)>,/* DCMI_D7 */
> +				 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
> +				 <STM32_PINMUX('H', 7,  AF13)>;/* DCMI_D9 */
> +			bias-disable;
> +		};
> +	};
> +
> +	dcmi_sleep_pins_a: dcmi-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 8,  ANALOG)>,/* DCMI_HSYNC */
> +				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
> +				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
> +				 <STM32_PINMUX('H', 9,  ANALOG)>,/* DCMI_D0 */
> +				 <STM32_PINMUX('C', 7,  ANALOG)>,/* DCMI_D1 */
> +				 <STM32_PINMUX('E', 0,  ANALOG)>,/* DCMI_D2 */
> +				 <STM32_PINMUX('E', 1,  ANALOG)>,/* DCMI_D3 */
> +				 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
> +				 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
> +				 <STM32_PINMUX('E', 5,  ANALOG)>,/* DCMI_D6 */
> +				 <STM32_PINMUX('I', 7,  ANALOG)>,/* DCMI_D7 */
> +				 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
> +				 <STM32_PINMUX('H', 7,  ANALOG)>;/* DCMI_D9 */
> +		};
> +	};
> +
> +	ethernet0_rgmii_pins_a: rgmii-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 4, AF11)>,	/* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('G', 13, AF11)>,	/* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, AF11)>,	/* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 2, AF11)>,	/* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('E', 2, AF11)>,	/* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('B', 11, AF11)>,	/* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('A', 2, AF11)>,	/* ETH_MDIO */
> +				 <STM32_PINMUX('C', 1, AF11)>;	/* ETH_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 4, AF11)>,	/* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, AF11)>,	/* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('H', 6, AF11)>,	/* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('B', 1, AF11)>,	/* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('A', 1, AF11)>,	/* ETH_RGMII_RX_CLK */
> +				 <STM32_PINMUX('A', 7, AF11)>;	/* ETH_RGMII_RX_CTL */
> +			bias-disable;
> +		};
> +	};
> +
> +	ethernet0_rgmii_pins_sleep_a: rgmii-sleep-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 4, ANALOG)>,  /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 2, ANALOG)>,  /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('E', 2, ANALOG)>,  /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('A', 2, ANALOG)>,  /* ETH_MDIO */
> +				 <STM32_PINMUX('C', 1, ANALOG)>,  /* ETH_MDC */
> +				 <STM32_PINMUX('C', 4, ANALOG)>,  /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, ANALOG)>,  /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('H', 6, ANALOG)>,  /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('B', 1, ANALOG)>,  /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('A', 1, ANALOG)>,  /* ETH_RGMII_RX_CLK */
> +				 <STM32_PINMUX('A', 7, ANALOG)>;  /* ETH_RGMII_RX_CTL */
> +		};
> +	};
> +
> +	i2c1_pins_a: i2c1-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
> +				 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c1_pins_sleep_a: i2c1-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
> +				 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
> +		};
> +	};
> +
> +	pwm5_pins_a: pwm5-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('I', 0, AF2)>; /* TIM5_CH4 */
> +			bias-pull-down;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	pwm5_sleep_pins_a: pwm5-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('I', 0, ANALOG)>; /* TIM5_CH4 */
> +		};
> +	};
> +
> +	sai2b_pins_a: sai2b-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('H', 2, AF10)>, /* SAI2_SCK_B */
> +				 <STM32_PINMUX('C', 0, AF8)>, /* SAI2_FS_B */
> +				 <STM32_PINMUX('H', 3, AF10)>; /* SAI2_MCLK_B */
> +			slew-rate = <0>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('E', 6, AF8)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> +				<STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('E', 6, AF8)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +			slew-rate = <1>;
> +			drive-open-drain;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> +				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> +		};
> +	};
> +
> +	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 8, AF9)>,	/* SDMMC2_D4 */
> +				 <STM32_PINMUX('A', 9, AF10)>,	/* SDMMC2_D5 */
> +				 <STM32_PINMUX('C', 6, AF10)>,	/* SDMMC2_D6 */
> +				 <STM32_PINMUX('D', 3, AF9)>;	/* SDMMC2_D7 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
> +				 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
> +				 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
> +				 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
> +		};
> +	};
> +
> +	usart1_pins_b: usart1-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* USART1_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 11, AF7)>; /* USART1_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart1_idle_pins_b: usart1-idle-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 12, ANALOG)>, /* USART1_RTS */
> +				 <STM32_PINMUX('A', 11, AF7)>; /* USART1_CTS_NSS */
> +		};
> +	};
> +
> +	usart1_sleep_pins_b: usart1-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 12, ANALOG)>, /* USART1_RTS */
> +				 <STM32_PINMUX('A', 11, ANALOG)>; /* USART1_CTS_NSS */
> +		};
> +	};
> +
> +	usart3_idle_pins_a: usart3-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 10, ANALOG)>; /* USART3_TX */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart3_sleep_pins_a: usart3-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> +				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
> +		};
> +	};
> +};
> +
> +&pinctrl_z {
> +	spi1_sleep_pins_a: spi1-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI1_SCK */
> +				 <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI1_MISO */
> +				 <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI1_MOSI */
> +		};
> +	};
> +
> +	usart1_idle_pins_a: usart1-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('Z', 7, ANALOG)>; /* USART1_TX */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('Z', 6, AF7)>; /* USART1_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart1_sleep_pins_a: usart1-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 7, ANALOG)>, /* USART1_TX */
> +				 <STM32_PINMUX('Z', 6, ANALOG)>; /* USART1_RX */
> +		};
> +	};
> +
> +	usart1_pins_a: usart1-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('Z', 7, AF7)>; /* USART1_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('Z', 6, AF7)>; /* USART1_RX */
> +			bias-disable;
> +		};
> +	};
> +};
> +
> +&sai2a_pins_b {
> +	pins {
> +		pinmux = <STM32_PINMUX('I', 6, AF10)>; /* SAI2_SD_A */
> +		bias-disable;
> +	};
> +};
> +
> +&sai2a_sleep_pins_b {
> +	pins {
> +		pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* SAI2_SD_A */
> +	};
> +};
> +
> +&sai2b_sleep_pins_a {
> +	pins {
> +		pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* SAI2_SD_B */
> +			 <STM32_PINMUX('H', 2, ANALOG)>, /* SAI2_SCK_B */
> +			 <STM32_PINMUX('C', 0, ANALOG)>, /* SAI2_FS_B */
> +			 <STM32_PINMUX('H', 3, ANALOG)>; /* SAI2_MCLK_B */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> new file mode 100644
> index 000000000000..cec13d11d832
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> @@ -0,0 +1,373 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +
> +#include "stm32mp157c-phycore-stm32mp15-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/mfd/st,stpmic1.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +	aliases {
> +		mmc0 = &sdmmc1;
> +		mmc1 = &sdmmc2;
> +		mmc2 = &sdmmc3;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		retram: retram@38000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x38000000 0x10000>;
> +			no-map;
> +		};
> +
> +		mcuram: mcuram@30000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x30000000 0x40000>;
> +			no-map;
> +		};
> +
> +		mcuram2: mcuram2@10000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10000000 0x40000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@10040000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10040000 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@10042000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10042000 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@10044000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10044000 0x4000>;
> +			no-map;
> +		};
> +
> +		gpu_reserved: gpu@f8000000 {
> +			reg = <0xf8000000 0x8000000>;
> +			no-map;
> +		};
> +	};
> +
> +	vin: vin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vin";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&sram {
> +	dma_pool: dma_pool@0 {
> +		reg = <0x50000 0x10000>;
> +		pool;
> +	};
> +};
> +
> +&dma1 {
> +	sram = <&dma_pool>;
> +};
> +
> +&dma2 {
> +	sram = <&dma_pool>;
> +};
> +
> +&ethernet0 {
> +	status = "okay";
> +	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
> +	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;
> +	phy-handle = <&phy0>;
> +	st,eth-clk-sel = "true";
> +	clock-names = "stmmaceth",
> +		      "mac-clk-tx",
> +		      "mac-clk-rx",
> +		      "eth-ck",
> +		      "syscfg-clk",
> +		      "ethstp";
> +	clocks = <&rcc ETHMAC>,
> +		<&rcc ETHTX>,
> +		<&rcc ETHRX>,
> +		<&rcc ETHCK_K>,
> +		<&rcc SYSCFG>,
> +		<&rcc ETHSTP>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +
> +		phy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			interrupt-parent = <&gpiog>;
> +			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,min-output-impedance;
> +			enet-phy-lane-no-swap;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c4_pins_a>;
> +	pinctrl-1 = <&i2c4_sleep_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +
> +	pmic: stpmic@33 {
> +		compatible = "st,stpmic1";
> +		reg = <0x33>;
> +		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		status = "okay";
> +		wakeup-source;
> +
> +		regulators {
> +			compatible = "st,stpmic1-regulators";
> +			buck1-supply = <&vin>;
> +			buck2-supply = <&vin>;
> +			buck3-supply = <&vin>;
> +			buck4-supply = <&vin>;
> +			ldo1-supply = <&v3v3>;
> +			ldo2-supply = <&v3v3>;
> +			ldo3-supply = <&vdd_ddr>;
> +			ldo4-supply = <&vin>;
> +			ldo5-supply = <&v3v3>;
> +			ldo6-supply = <&v3v3>;
> +			vref_ddr-supply = <&vin>;
> +			boost-supply = <&vin>;
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
> +				regulator-over-current-protection;
> +				regulator-initial-mode = <0>;
> +			};
> +
> +			v1v8_audio: ldo1 {
> +				regulator-name = "v1v8_audio";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				interrupts = <IT_CURLIM_LDO1 0>;
> +
> +			};
> +
> +			vdd_eth_2v5: ldo2 {
> +				regulator-name = "dd_eth_2v5";
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <2500000>;
> +				regulator-always-on;
> +				interrupts = <IT_CURLIM_LDO2 0>;
> +
> +			};
> +
> +			vtt_ddr: ldo3 {
> +				regulator-name = "vtt_ddr";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <750000>;
> +				regulator-always-on;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd_usb: ldo4 {
> +				regulator-name = "vdd_usb";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				interrupts = <IT_CURLIM_LDO4 0>;
> +			};
> +
> +			vdda: ldo5 {
> +				regulator-name = "vdda";
> +				regulator-min-microvolt = <2900000>;
> +				regulator-max-microvolt = <2900000>;
> +				interrupts = <IT_CURLIM_LDO5 0>;
> +				regulator-boot-on;
> +			};
> +
> +			vdd_eth_1v0: ldo6 {
> +				regulator-name = "vdd_eth_1v0";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				interrupts = <IT_CURLIM_LDO6 0>;
> +
> +			};
> +
> +			vref_ddr: vref_ddr {
> +				regulator-name = "vref_ddr";
> +				regulator-always-on;
> +				regulator-over-current-protection;
> +			};
> +
> +			bst_out: boost {
> +				regulator-name = "bst_out";
> +				interrupts = <IT_OCP_BOOST 0>;
> +			};
> +
> +			vbus_otg: pwr_sw1 {
> +				regulator-name = "vbus_otg";
> +				interrupts = <IT_OCP_OTG 0>;
> +				regulator-active-discharge;
> +			};
> +
> +			vbus_sw: pwr_sw2 {
> +				regulator-name = "vbus_sw";
> +				interrupts = <IT_OCP_SWOUT 0>;
> +				regulator-active-discharge;
> +			};
> +		};
> +
> +		onkey {
> +			compatible = "st,stpmic1-onkey";
> +			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
> +			interrupt-names = "onkey-falling", "onkey-rising";
> +			power-off-time-sec = <10>;
> +			status = "okay";
> +		};
> +
> +		watchdog {
> +			compatible = "st,stpmic1-wdt";
> +			status = "disabled";
> +		};
> +	};
> +
> +	i2c4_eeprom: eeprom@50 {
> +		compatible = "microchip,24c32", "atmel,24c32";
> +		reg = <0x50>;
> +		status = "disabled";
> +	};
> +
> +	i2c4_rtc: rtc@52 {
> +		compatible = "microcrystal,rv3028";
> +		reg = <0x52>;
> +		status = "disabled";
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
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> +	mbox-names = "vq0", "vq1", "shutdown";
> +	interrupt-parent = <&exti>;
> +	interrupts = <68 1>;
> +	interrupt-names = "wdg";
> +	recovery;
> +	status = "okay";
> +};
> +
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
> +};
> +
> +&qspi {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
> +	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
> +	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "disabled";
> +
> +	flash0: w25q128@0 {
> +		compatible = "winbond,w25q128jv", "jedec,spi-nor", "spi-flash";
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <50000000>;
> +		m25p,fast-read;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
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
> +	vqmmc-supply = <&v3v3>;
> +	mmc-ddr-3_3v;
> +	status = "disabled";
> +};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
