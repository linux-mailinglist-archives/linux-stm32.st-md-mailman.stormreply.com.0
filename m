Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED478D5FA
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 14:51:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0F6C6A613;
	Wed, 30 Aug 2023 12:51:26 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48E94C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 12:51:25 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9a2185bd83cso732256766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693399884; x=1694004684;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HTek1JDo93XROD/lSZ/9cXAC6x0L5iWTFM9OoCcAjWQ=;
 b=RVe0XL+HXKGwZcdXMhC4rKO3NMRJAY9Nzwz1dMqyqxfcOqSYM28OwTqhFMtInUAq37
 9HjyGbBAfSVsGhLeE3SnZfxhYIjfPlScQrjrQIP9w3lTCSitXlSX/NfJhhwYvZNNPEQV
 jxQ/HAysYP7YKUIY+RYIVZlnyXFyFzGzUa8s0YWt+vPDmt7TELljFcORrYPM+LrY5SQ3
 pzxzeAyS4syXSSwfbOcjrzXDzWOgA7+wQl8w0GBxpU1EzOYSITUYZI91RZtQnryqy93B
 YzVjYvI07N8udwCihOxyzsZQ9vlwHnMw9skHEGss3ilS/Thw0RdqCQd/B1MAKf04Eptn
 pVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693399884; x=1694004684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HTek1JDo93XROD/lSZ/9cXAC6x0L5iWTFM9OoCcAjWQ=;
 b=VZFhL/3YXOwyJ6jrhvQi4LkVHYTV4em1YkqwGWuS77Te509Xzn6c/Pb0nI68cW24iW
 gqy11se1DhyYJlP8v6kXPsfO7aVApQ9381e6PA93XSyvdHPKwY4/Ao5ImfP+pJXWpb5E
 OtR8/EP0T2wZTSI0j9fW4273xBOf4bVcriIYjJjbCH6YdT1bO+9n2l2svw6RdhGrXvAD
 wBL4dq1qX0Wwj6i5FnsfmbmvQC4ULlJD8K7BW0EUVtpyanGcRHA1wCc+z8H3HphgRH/D
 fhE/dA3x/pJ7Pmu8qCrmn/kKX8xjJtqavh+oinq3cGDwXirNwG6C1NDztZ9gDGl2PC1b
 at3Q==
X-Gm-Message-State: AOJu0Yx/R35Cxc+QbZ+l9u2vrPjX7pIpdXrbbT7gzVw5QaAtv11p4lHw
 SmsIov632me8ASPk73QkThYy1A==
X-Google-Smtp-Source: AGHT+IHHmGgRahFDSXkoM+UuzB/MFE/rq4kXZQkhhozAtSuTpyvbKFVKIaL8DHV8lVX+gGudzueOqA==
X-Received: by 2002:a17:906:10d2:b0:9a1:ab86:5f22 with SMTP id
 v18-20020a17090610d200b009a1ab865f22mr1446501ejv.56.1693399884638; 
 Wed, 30 Aug 2023 05:51:24 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238]) by smtp.gmail.com with ESMTPSA id
 d7-20020a1709064c4700b0099bd453357esm7096196ejw.41.2023.08.30.05.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 05:51:24 -0700 (PDT)
Message-ID: <e2dc91a9-d027-dc69-14bf-3a1184045254@linaro.org>
Date: Wed, 30 Aug 2023 14:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230830114335.106344-1-eagle.alexander923@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830114335.106344-1-eagle.alexander923@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add MyirTech
 MYD-YA15XC-T development board support
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

On 30/08/2023 13:43, Alexander Shiyan wrote:
> Add support for the MyirTech MYD-YA15XC-T development board.
> 
> General features:
>  - STM32MP151
>  - 256MB RAM
>  - 2xUSB HOST
>  - USB-C OTG
>  - Gigabit ethernet
>  - UART
>  - Boot from NAND, eMMC, SD
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  arch/arm/boot/dts/st/Makefile                 |   3 +-
>  .../boot/dts/st/stm32mp15x-myirtech-myc.dtsi  | 351 ++++++++++++++
>  .../boot/dts/st/stm32mp15x-myirtech-myd.dts   | 457 ++++++++++++++++++
>  3 files changed, 810 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi
>  create mode 100644 arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts
> 
> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
> index b3e9d29390e3..5b18767bbd4f 100644
> --- a/arch/arm/boot/dts/st/Makefile
> +++ b/arch/arm/boot/dts/st/Makefile
> @@ -57,7 +57,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
>  	stm32mp157c-ev1-scmi.dtb \
>  	stm32mp157c-lxa-mc1.dtb \
>  	stm32mp157c-odyssey.dtb \
> -	stm32mp157c-phycore-stm32mp1-3.dtb
> +	stm32mp157c-phycore-stm32mp1-3.dtb \
> +	stm32mp15x-myirtech-myd.dtb
>  dtb-$(CONFIG_ARCH_U8500) += \
>  	ste-snowball.dtb \
>  	ste-hrefprev60-stuib.dtb \
> diff --git a/arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi
> new file mode 100644
> index 000000000000..7fe858c9622f
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi
> @@ -0,0 +1,351 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/mfd/st,stpmic1.h>
> +
> +#include "stm32mp151.dtsi"
> +#include "stm32mp15-pinctrl.dtsi"
> +#include "stm32mp15xxac-pinctrl.dtsi"
> +
> +/ {
> +	model = "MYIR MYC-YA15XC-T";
> +	compatible = "myir,myc-stm32mp15x", "st,stm32mp151";

Undocumented compatible.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> +
> +	aliases {
> +		i2c0 = &i2c1;
> +		i2c1 = &i2c2;
> +		i2c2 = &i2c3;
> +		i2c3 = &i2c4;
> +		i2c4 = &i2c5;
> +		i2c5 = &i2c6;
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
> +	vin_som: vin_som {

No underscores in node names. Generic prefix or suffix (regulator).

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
> +		led_cpu: led_cpu {

No underscores in node names.

It does not look like you tested the DTS against bindings (at least at
first glance). Please run `make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

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
> +&bsec {
> +	board_id: board_id@ec {

Underscores...

...

> +	pmic: stpmic@33 {

Generic node names, so "pmic"

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
> +				regulator-over-current-protection;
> +				regulator-initial-mode = <0>;
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
> +			};
> +
> +			vdd_usb: ldo4 {
> +				regulator-name = "vdd_usb";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
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
> +			};
> +
> +			vbus_otg: pwr_sw1 {
> +				regulator-name = "vbus_otg";
> +				regulator-active-discharge;
> +			};
> +
> +			vbus_sw: pwr_sw2 {
> +				regulator-name = "vbus_sw";
> +				regulator-active-discharge;
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
> diff --git a/arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts
> new file mode 100644
> index 000000000000..ad8dd9ee085c
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts
> @@ -0,0 +1,457 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
> +
> +/dts-v1/;
> +
> +#include "stm32mp15x-myirtech-myc.dtsi"
> +
> +#include <dt-bindings/net/qca-ar803x.h>
> +
> +/ {
> +	model = "MYIR MYD-YA15XC-T";
> +	compatible = "myir,myd-stm32mp15x", "myir,myc-stm32mp15x", "st,stm32mp151";

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> +
> +	aliases {
> +		ethernet0 = &ethernet0;
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
> +		compatible = "panel-lvds";
> +		backlight = <&backlight>;
> +		data-mapping = "vesa-24";
> +		enable-gpios = <&gpioi 3 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> +		power-supply = <&vdd_3v3>;
> +		height-mm = <0>;
> +		width-mm = <0>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&ltdc_out>;
> +			};
> +		};
> +	};
> +
> +	vin: vin {

Same comments as before.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vin";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	vdd_3v3: vdd_3v3 {

Same comments as before.

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
> +	led_live: led_live {

Same comments as before.

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
> +	extgpio: pcf8575@20 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "nxp,pcf8575";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	typec: stusb1600@28 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		pinctrl-names = "default";
> +		pinctrl-0 = <&stusb1600_pins>;
> +		compatible = "st,stusb1600";
> +		reg = <0x28>;
> +		interrupt-parent = <&gpioa>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&vin>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			power-opmode = "default";
> +
> +			port {
> +				con_usbotg_hs_ep: endpoint {
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


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
