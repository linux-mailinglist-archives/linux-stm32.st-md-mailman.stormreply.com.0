Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FD6B20D9
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 11:02:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7473EC6A60C;
	Thu,  9 Mar 2023 10:02:31 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49EA4C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 10:02:30 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id j11so4743171edq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678356150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tyBqH+cMIWCTfdE4Gm29OswUd4f8aEObyKOcPJTLAfY=;
 b=uEh3jMMY5KZ3a0T9w7MptefGy5a2cKAenFFEbcfcSJXX+jZ5qUpo8e6ibzr2DT8ti9
 kFWMcFIO2zH5PMU2bGXjMYf1pJGj/KWGkWRfJN5NfteRgCyBrXjCPmKiN/mz/EaUpV/c
 tyx7qlKuofnG/EVjdwZffYKgfcUUCk6V/bq/XaSzDR8EdW1g89q1B4Zw8h/hyTRDqrmC
 L1BIUbqhATty1u30EkOjpD86m8nsr118CgWGdBuqBoRlviAQXfP59A/Fzl2BgdBny/i/
 JzCTlJNgrd6B8ODnsYspT7hE7wp+4V8y/w7MCixHHpKKFtoCNQFjP7PiYVlpFgtABxZl
 16iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678356150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyBqH+cMIWCTfdE4Gm29OswUd4f8aEObyKOcPJTLAfY=;
 b=lwMYvK8g4FmryX9pmX483i/8QsFyr1FNcBYFiC+BfVVpdJ5uGp87vaCrxNfXQxQefj
 a9LVII7nMZ5goGJqYDw2sj1C1CH4almAKSe0Z5bhIHbX2eMA5DgS1kfbsX7/KRvp15jO
 QSxSeqmrPiQJVEAP6zAdS6bV/dfv1ZjsSt/OGlgzT859KQs7Q0WlZB4CI+tP6XyQHGed
 Sws17yR101ghqVZjdtNGzr2OD0s+chx9LMoRg9he92y91U0pOUM5C77UdjlaeXf1/rAy
 cedEqdJ/F+JWPcJnPIRRX5ktIzdDNT1raCN54/PBJCiPTXWx84iu+aACNAXHyyPevHxO
 aciQ==
X-Gm-Message-State: AO0yUKWDV2ERtyh5wkXUDZsVgmuMKLugHZyw8krzRcxKYtNkz3C4hSuC
 GNGJ7tb7lY1QXxWsO/OvjWVlMw==
X-Google-Smtp-Source: AK7set+7wcrPNy9gu3ndxv7qW12xk0eqFhcJpIbE5zGF9THLmYwTJ+DI0NbY2lpjPd68j6sRCUyxRQ==
X-Received: by 2002:aa7:dd06:0:b0:4aa:a4f1:3edb with SMTP id
 i6-20020aa7dd06000000b004aaa4f13edbmr18932904edv.29.1678356149769; 
 Thu, 09 Mar 2023 02:02:29 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1?
 ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
 by smtp.gmail.com with ESMTPSA id
 ch10-20020a170906c2ca00b008cf8c6f5c43sm8545234ejb.83.2023.03.09.02.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 02:02:29 -0800 (PST)
Message-ID: <d1cd22f2-8845-89cb-85fa-12985f0f67a1@linaro.org>
Date: Thu, 9 Mar 2023 11:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230308075532.672858-1-s.trumtrar@pengutronix.de>
 <20230308075532.672858-8-s.trumtrar@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308075532.672858-8-s.trumtrar@pengutronix.de>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v4 08/10] ARM: dts: stm32: add
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 08/03/2023 08:55, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB
> eMMC, up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> 
> Notes:
>     checkpatch warns about un-documented binding
>     
>     According to checkpatch the binding for "winbond,w25q128"
>     used in this dtsi is un-documented.
>     However, 'jedec,spi-nor.yaml' defines the pattern
>     
>         (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
>     
>     so, this should be good!?
> 
>  .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 606 ++++++++++++++++++
>  1 file changed, 606 insertions(+)
>  create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> new file mode 100644
> index 0000000000000..2a47feca697d7
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> @@ -0,0 +1,606 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
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
> +		status = "okay";

It's by default. Why do you need it?

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
> +		status = "okay";

It's by default. Why do you need it?

> +	};
> +
> +	regulator_vin: vin {

Generic node names, so at least with regulator prefix or suffix

> +		compatible = "regulator-fixed";
> +		regulator-name = "vin";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&ethernet0 {
> +	status = "okay";
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
> +		/* gpio-reset = <&gpio5 8 GPIO_ACTIVE_LOW>; */

Don't add dead code without proper comment/justification.

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
> +		stmpe_touchscreen {

No underscores in node names, generic node names.

This is just "touchscreen"

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
> +			status = "okay";

That's even weirder.


> +		};
> +
> +		watchdog {
> +			compatible = "st,stpmic1-wdt";
> +			status = "disabled";

Why? Either it is on the SoM or not...

> +		};
> +	};
> +
> +	i2c4_eeprom: eeprom@50 {
> +		compatible = "microchip,24c32",
> +			     "atmel,24c32";
> +		reg = <0x50>;
> +		status = "disabled";

Why? Either it is on the SoM or not...

> +	};
> +
> +	i2c4_rtc: rtc@52 {
> +		compatible = "microcrystal,rv3028";
> +		reg = <0x52>;
> +		status = "disabled";

Why? Either it is on the SoM or not...

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
> +	reg = <0x58003000 0x1000>,
> +	      <0x70000000 0x4000000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "disabled";

Why? Either it is on the SoM or not...

(...)

> +
> +&sai2 {
> +	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "x8k", "x11k";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai2a_pins_b>, <&sai2b_pins_d>;
> +	pinctrl-1 = <&sai2a_sleep_pins_b>, <&sai2b_sleep_pins_d>;
> +
> +	sai2a: audio-controller@4400b004 {
> +		compatible = "st,stm32-sai-sub-a";
> +		dma-names = "rx";
> +		st,sync = <&sai2b 2>;
> +		status = "okay";

???

> +		clocks = <&rcc SAI2_K>,
> +			 <&sai2b>;
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
> +};


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
