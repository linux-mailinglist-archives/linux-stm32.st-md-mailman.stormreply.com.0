Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE96C1E2F
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 18:38:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C71C6A603;
	Mon, 20 Mar 2023 17:38:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35081C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 17:38:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KF0RNa019975; Mon, 20 Mar 2023 18:37:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WMN8vT8Td1QlVJ4T/XWJ/pLHZuQeZQ1S2Du/K00/wiY=;
 b=OfGgDhX7rFpNoP8vxO6S0Rn34MxDO4hMojWkpZqVOQMQ4egXCk+QpA1ln6gUn7Jhfo+e
 A2Hpcj059IH+7e3aHVu1dGOJNLRrrfqgylUorR7NJXRY4JXvxFvLORaJ78zrWVEWOASM
 BuCK9SjMc/U3CpY7MTqL1z43+CK7zisAnXPyRnTzH7mT2uMhvIGv/Wdbmg4ohlMLHySf
 jeyMIxM6AMz2ZxHeBLJnE9Qn8Q7eAr3zxToLIQajDg6alCnJI9/HaryLEYxDMooVCi/E
 vC6AdX1svMeL6zZkKSstGvgqqJA2rLS8WgHXC4VEckeukP2NA1i+E6uwUF66+OnXzkPv Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pekqx3rbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 18:37:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52E77100034;
 Mon, 20 Mar 2023 18:37:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C10521A23E;
 Mon, 20 Mar 2023 18:37:53 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 20 Mar
 2023 18:37:52 +0100
Message-ID: <a37db3a8-a3e6-8755-2b7c-c33a1fdca469@foss.st.com>
Date: Mon, 20 Mar 2023 18:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20230320132755.2150384-1-s.trumtrar@pengutronix.de>
 <20230320132755.2150384-10-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230320132755.2150384-10-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_15,2023-03-20_02,2023-02-09_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v5 09/10] ARM: dts: stm32: add
	STM32MP1-based Phytec SoM
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

Hi Steffen

On 3/20/23 14:27, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB
> eMMC, up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> 
> Notes:
>      checkpatch warns about un-documented binding
>      
>      According to checkpatch the binding for "winbond,w25q128"
>      used in this dtsi is un-documented.
>      However, 'jedec,spi-nor.yaml' defines the pattern
>      
>          (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
>      
>      so, this should be good!?

We recently added some yaml fixes and we continue to send others (i.e., 
GPU yaml error fix is under review) so please don't add new ones. Some 
of follownig errors are directly linked to your board so please fix them.

Thanks

Alex

/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
codec@18: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
		From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
/soc/i2c@40012000/touch@44: failed to match any schema with compatible: 
['st,stmpe811']
arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
/soc/i2c@40012000/touch@44/touchscreen: failed to match any schema with 
compatible: ['st,stmpe-ts']
arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
/soc/i2c@40012000/leds@62: failed to match any schema with compatible: 
['nxp,pca9533']
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
sai@4400b000: audio-controller@4400b004:port:endpoint: Unevaluated 
properties are not allowed ('format' was unexpected)
		From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
sai@4400b000: audio-controller@4400b024:port:endpoint: Unevaluated 
properties are not allowed ('format' was unexpected)
		From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
usbphyc@5a006000: usb-phy@0: 'vbus-supply' does not match any of the 
regexes: 'pinctrl-[0-9]+'
		From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
pmic@33: regulators: 'vref-ddr', 'vref_ddr-supply' do not match any of 
the regexes: '^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$', 
'^(buck[1-4]|ldo[1-6]|boost|vref_ddr|pwr_sw[1-2])$', '^buck[1-4]$', 
'^ldo[1-2,5-6]$', '^pwr_sw[1-2]$', 'pinctrl-[0-9]+'
		From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: 
gpu@59000000: 'contiguous-area' does not match any of the regexes: 
'pinctrl-[0-9]+'
		From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/gpu/vivante,gc.yaml


> 
>   .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 609 ++++++++++++++++++
>   1 file changed, 609 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> new file mode 100644
> index 0000000000000..230863daca60b
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> @@ -0,0 +1,609 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2022-2023 Steffen Trumtrar <kernel@pengutronix.de>
> + * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/leds/leds-pca9532.h>
> +#include <dt-bindings/mfd/st,stpmic1.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "stm32mp15-pinctrl.dtsi"
> +
> +/ {
> +	model = "PHYTEC phyCORE-STM32MP15 SOM";
> +	compatible = "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
> +
> +	aliases {
> +		ethernet0 = &ethernet0;
> +		rtc0 = &i2c4_rtc;
> +		rtc1 = &rtc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		key-home {
> +			label = "Home";
> +			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_HOME>;
> +		};
> +
> +		key-enter {
> +			label = "Enter";
> +			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_ENTER>;
> +		};
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
> +		gpu_reserved: gpu@f8000000 {
> +			reg = <0xf8000000 0x8000000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "audio-graph-card";
> +		label = "STM32MP1-PHYCORE";
> +		routing =
> +			"Playback", "MCLK", /* Set a route between "MCLK" and "playback" widgets */
> +			"Capture", "MCLK";
> +		dais = <&sai2b_port>,
> +		       <&sai2a_port>;
> +	};
> +
> +	regulator_vin: regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vin";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&ethernet0 {
> +	pinctrl-0 = <&ethernet0_rgmii_pins_d>;
> +	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_d>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;
> +	phy-handle = <&phy0>;
> +	st,eth-clk-sel;
> +	clock-names = "stmmaceth",
> +		      "mac-clk-tx",
> +		      "mac-clk-rx",
> +		      "eth-ck",
> +		      "syscfg-clk",
> +		      "ethstp";
> +	clocks = <&rcc ETHMAC>,
> +		 <&rcc ETHTX>,
> +		 <&rcc ETHRX>,
> +		 <&rcc ETHCK_K>,
> +		 <&rcc SYSCFG>,
> +		 <&rcc ETHSTP>;
> +	status = "okay";
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
> +&gpu {
> +	contiguous-area = <&gpu_reserved>;
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c1_pins_b>;
> +	pinctrl-1 = <&i2c1_sleep_pins_b>;
> +	i2c-scl-rising-time-ns = <100>;
> +	i2c-scl-falling-time-ns = <7>;
> +	status = "okay";
> +
> +	codec@18 {
> +		compatible = "ti,tlv320aic3007";
> +		reg = <0x18>;
> +		#sound-dai-cells = <0>;
> +
> +		ai3x-micbias-vg = <2>;
> +
> +		AVDD-supply = <&v3v3>;
> +		IOVDD-supply = <&v3v3>;
> +		DRVDD-supply = <&v3v3>;
> +		DVDD-supply = <&v1v8_audio>;
> +
> +		clocks = <&sai2b>;
> +		clock-names = "MCLK";
> +
> +		port {
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
> +	touch@44 {
> +		compatible = "st,stmpe811";
> +		reg = <0x44>;
> +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&gpioi>;
> +		vio-supply = <&v3v3>;
> +		vcc-supply = <&v3v3>;
> +
> +		touchscreen {
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
> +	leds@62 {
> +		compatible = "nxp,pca9533";
> +		reg = <0x62>;
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_RED>;
> +			function = LED_FUNCTION_POWER;
> +			type = <PCA9532_TYPE_LED>;
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_POWER;
> +			type = <PCA9532_TYPE_LED>;
> +		};
> +
> +		led-2 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			type = <PCA9532_TYPE_LED>;
> +			linux,default-trigger = "heartbeat";
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
> +	pmic@33 {
> +		compatible = "st,stpmic1";
> +		reg = <0x33>;
> +		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		regulators {
> +			compatible = "st,stpmic1-regulators";
> +			buck1-supply = <&regulator_vin>;
> +			buck2-supply = <&regulator_vin>;
> +			buck3-supply = <&regulator_vin>;
> +			buck4-supply = <&regulator_vin>;
> +			ldo1-supply = <&v3v3>;
> +			ldo2-supply = <&v3v3>;
> +			ldo3-supply = <&vdd_ddr>;
> +			ldo4-supply = <&regulator_vin>;
> +			ldo5-supply = <&v3v3>;
> +			ldo6-supply = <&v3v3>;
> +			vref_ddr-supply = <&regulator_vin>;
> +			boost-supply = <&regulator_vin>;
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
> +			vref_ddr: vref-ddr {
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
> +				regulator-active-discharge = <1>;
> +			};
> +
> +			vbus_sw: pwr_sw2 {
> +				regulator-name = "vbus_sw";
> +				interrupts = <IT_OCP_SWOUT 0>;
> +				regulator-active-discharge = <1>;
> +			};
> +		};
> +
> +		onkey {
> +			compatible = "st,stpmic1-onkey";
> +			interrupts = <IT_PONKEY_F 0>,
> +				     <IT_PONKEY_R 0>;
> +			interrupt-names = "onkey-falling",
> +					  "onkey-rising";
> +			power-off-time-sec = <10>;
> +		};
> +
> +		watchdog {
> +			compatible = "st,stpmic1-wdt";
> +		};
> +	};
> +
> +	i2c4_eeprom: eeprom@50 {
> +		compatible = "microchip,24c32",
> +			     "atmel,24c32";
> +		reg = <0x50>;
> +	};
> +
> +	i2c4_rtc: rtc@52 {
> +		compatible = "microcrystal,rv3028";
> +		reg = <0x52>;
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
> +&m_can2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can2_pins_a>;
> +	pinctrl-1 = <&m_can2_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&m4_rproc {
> +	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
> +			<&vdev0vring1>, <&vdev0buffer>;
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
> +	interrupt-parent = <&exti>;
> +	interrupts = <68 1>;
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
> +	status = "okay";
> +
> +	flash0: flash@0 {
> +		compatible = "winbond,w25q128", "jedec,spi-nor";
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
> +&sai2 {
> +	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "x8k", "x11k";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai2a_pins_b>, <&sai2b_pins_d>;
> +	pinctrl-1 = <&sai2a_sleep_pins_b>, <&sai2b_sleep_pins_d>;
> +	status = "okay";
> +};
> +
> +&sai2a {
> +	dma-names = "rx";
> +	st,sync = <&sai2b 2>;
> +	clocks = <&rcc SAI2_K>, <&sai2b>;
> +	clock-names = "sai_ck", "MCLK";
> +	#clock-cells = <0>;
> +
> +	sai2a_port: port {
> +		sai2a_endpoint: endpoint {
> +			remote-endpoint = <&tlv320_rx_endpoint>;
> +			format = "i2s";
> +			mclk-fs = <256>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <16>;
> +		};
> +	};
> +};
> +
> +&sai2b {
> +	dma-names = "tx";
> +	#clock-cells = <0>;
> +
> +	sai2b_port: port {
> +		sai2b_endpoint: endpoint {
> +			remote-endpoint = <&tlv320_tx_endpoint>;
> +			format = "i2s";
> +			mclk-fs = <256>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <16>;
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_b>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_b>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_b>;
> +	cd-gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_e>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_e>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_e>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	st,neg-edge;
> +	bus-width = <8>;
> +	vmmc-supply = <&v3v3>;
> +	vqmmc-supply = <&v3v3>;
> +	mmc-ddr-3_3v;
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&spi1_pins_a>;
> +	pinctrl-1 = <&spi1_sleep_pins_a>;
> +	cs-gpios = <&gpioz 3 0>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	pinctrl-1 = <&uart4_sleep_pins_a>;
> +	pinctrl-2 = <&uart4_idle_pins_a>;
> +	pinctrl-3 = <&uart4_pins_a>;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "okay";
> +};
> +
> +&usart1 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&usart1_pins_b &usart1_pins_a>;
> +	pinctrl-1 = <&usart1_sleep_pins_b &usart1_sleep_pins_a>;
> +	pinctrl-2 = <&usart1_idle_pins_b &usart1_idle_pins_a>;
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

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
