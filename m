Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FD34EE78
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 18:50:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DA56C57B60;
	Tue, 30 Mar 2021 16:50:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95B71C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 16:50:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12UGgA3F007121; Tue, 30 Mar 2021 18:50:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0WVbvFJFkxqNn+aAOgONdxTifrUYipM9G5zeE9saWvw=;
 b=WqCpsP2DQhkNVgTxiCiJPavawSN4NnwvpVWNmdUIq15kYWtK3z+Q2cwwIEsrZzXlRoeE
 QaAjeEBAw6x+s6FloHAuHW1e9kyrSeOxcNENolQqbpjbLt6ppL0prUA7KvYNcjCXHPPG
 T+KtU+cuqzCHqcv4MkeJ0atYl61fF0T3KCVtreIArNteRK1ar7JCA0U2elsSjfE0L5cB
 IW4It8jD3XS8y1HySuE2gHGLKWGIYEwAmQjevosIiMISIoZ1dntobzQWV/hkNwswBSVo
 W5TNauVhr6gNO+oYPdU3cH+pMUJv75jfcpp/INQYGiTxXyU1MyCwMVQt5nJigG503pMd 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37ksfh55g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 18:50:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C4BC10002A;
 Tue, 30 Mar 2021 18:50:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D19425F41E;
 Tue, 30 Mar 2021 18:50:39 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 18:50:38 +0200
To: <dillon.minfei@gmail.com>, <robh@kernel.org>, <valentin.caron@foss.st.com>,
 <rong.a.chen@intel.com>, <a.fatoum@pengutronix.de>,
 <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux@armlinux.org.uk>, <afzal.mohd.ma@gmail.com>,
 <gregkh@linuxfoundation.org>, <erwan.leray@foss.st.com>,
 <erwan.leray@st.com>, <linux-serial@vger.kernel.org>, <lkp@intel.com>,
 <patrice.chotard@foss.st.com>
References: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
 <1617094704-10040-5-git-send-email-dillon.minfei@gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <4df8e7b8-826c-b1d4-0431-4f777e26c383@foss.st.com>
Date: Tue, 30 Mar 2021 18:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617094704-10040-5-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_08:2021-03-30,
 2021-03-30 signatures=0
Subject: Re: [Linux-stm32] [PATCH v8 4/6] ARM: dts: stm32: add support for
 art-pi board based on stm32h750xbh6
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



On 3/30/21 10:58 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This patchset has following changes:
> 
> - introduce stm32h750.dtsi to support stm32h750 value line
> - add stm32h750i-art-pi.dtb (arch/arm/boot/dts/Makefile)
> - add stm32h750-art-pi.dts to support art-pi board
> 
> art-pi board component:
> - 8MiB qspi flash
> - 16MiB spi flash
> - 32MiB sdram
> - ap6212 wifi&bt&fm
> 
> the detail board information can be found at:
> https://art-pi.gitee.io/website/
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v8:
> - move file stm32h743.dtsi submit position to [PATCH V8 3/6]
> 
>   arch/arm/boot/dts/Makefile              |   1 +
>   arch/arm/boot/dts/stm32h750.dtsi        |   6 +
>   arch/arm/boot/dts/stm32h750i-art-pi.dts | 229 ++++++++++++++++++++++++++++++++
>   3 files changed, 236 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8e5d4ab4e75e..a19c5ab9df84 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1071,6 +1071,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32746g-eval.dtb \
>   	stm32h743i-eval.dtb \
>   	stm32h743i-disco.dtb \
> +	stm32h750i-art-pi.dtb \
>   	stm32mp153c-dhcom-drc02.dtb \
>   	stm32mp157a-avenger96.dtb \
>   	stm32mp157a-dhcor-avenger96.dtb \
> diff --git a/arch/arm/boot/dts/stm32h750.dtsi b/arch/arm/boot/dts/stm32h750.dtsi
> new file mode 100644
> index 000000000000..41e3b1e3a874
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32h750.dtsi
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
> +
> +#include "stm32h743.dtsi"
> +

I know it's a bit odd, but you could directly include stm32h743.dtsi in 
your board as there are no SoC differences.


> diff --git a/arch/arm/boot/dts/stm32h750i-art-pi.dts b/arch/arm/boot/dts/stm32h750i-art-pi.dts
> new file mode 100644
> index 000000000000..9bb73bb61901
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32h750i-art-pi.dts
> @@ -0,0 +1,229 @@
> +/*
> + * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * For art-pi board resources, you can refer to link:
> + * 	https://art-pi.gitee.io/website/
> + */
> +
> +/dts-v1/;
> +#include "stm32h750.dtsi"
> +#include "stm32h7-pinctrl.dtsi"
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "RT-Thread STM32H750i-ART-PI board";
> +	compatible = "st,stm32h750i-art-pi", "st,stm32h750";
> +
> +	chosen {
> +		bootargs = "root=/dev/ram";
> +		stdout-path = "serial0:2000000n8";
> +	};
> +
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x2000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			no-map;
> +			size = <0x100000>;
> +			linux,dma-default;
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &uart4;
> +		serial1 = &usart3;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		led-red {
> +			gpios = <&gpioi 8 0>;
> +		};
> +		led-green {
> +			gpios = <&gpioc 15 0>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	v3v3: regulator-v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	wlan_pwr: regulator-wlan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "wl-reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&clk_hse {
> +	clock-frequency = <25000000>;
> +};
> +
> +&dma1 {
> +	status = "okay";
> +};
> +
> +&dma2 {
> +	status = "okay";
> +};
> +
> +&mac {
> +	status = "disabled";
> +	pinctrl-0	= <&ethernet_rmii>;
> +	pinctrl-names	= "default";
> +	phy-mode	= "rmii";
> +	phy-handle	= <&phy0>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	broken-cd;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
> +	broken-cd;
> +	non-removable;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&wlan_pwr>;
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	brcmf: bcrmf@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-0 = <&spi1_pins>;
> +	pinctrl-names = "default";
> +	cs-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
> +	dmas = <&dmamux1 37 0x400 0x05>,
> +	       <&dmamux1 38 0x400 0x05>;
> +	dma-names = "rx", "tx";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "winbond,w25q128", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <80000000>;
> +
> +		partition@0 {
> +			label = "root filesystem";
> +			reg = <0 0x1000000>;
> +		};
> +	};
> +};
> +
> +&usart2 {
> +	pinctrl-0 = <&usart2_pins>;
> +	pinctrl-names = "default";
> +	status = "disabled";
> +};
> +
> +&usart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usart3_pins>;
> +	dmas = <&dmamux1 45 0x400 0x05>,
> +	       <&dmamux1 46 0x400 0x05>;
> +	dma-names = "rx", "tx";
> +	st,hw-flow-ctrl;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
> +		device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
> +		max-speed = <115200>;
> +	};
> +};
> +
> +&uart4 {
> +	pinctrl-0 = <&uart4_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
