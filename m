Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3702556DD
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 10:49:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08326C32E90;
	Fri, 28 Aug 2020 08:49:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E55DC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 08:49:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07S8msxc023749; Fri, 28 Aug 2020 10:49:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=NO6Yc71DfpjB1W1WKXZ+g/NfoSKXm/Yli92Ixf3WMhA=;
 b=WoFVOLxB0E7RO/pxCoAohwrW6kIXB7qWmaCqbJdY/g2cI+LcE2r+dKgsUqOg9MA5C379
 FYZyi6vnO/M3NbE4PDZ6TfU2XMD35hUTifm+FQeImhsbYxp99FpUscKo/QgrNqolDXR4
 X+aoB36ii3BVKrbtfYbaE7cKuB/xCFaMtOkfMdBvhLEWhDYI3R343psHccYLGEm9ODN+
 ganbdUSO644N+iZNcKRZeQevQaDrneO4MP+zp3pdhDObpukT04382eIGs9q9xI9WqiGl
 4Im4hdx3qAduL9YtV5hCsxLKOshPcNc0cw0PTutI+sepzTE4l6WNIaqZya0K0SFWZBEu Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b2n2jvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 10:49:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5E0B100034;
 Fri, 28 Aug 2020 10:49:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B94932A6C3E;
 Fri, 28 Aug 2020 10:49:18 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 10:49:18 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200729165141.114968-1-marex@denx.de>
 <20200729165141.114968-2-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <f4bbe079-ee16-5a73-31ac-abdc074e4183@st.com>
Date: Fri, 28 Aug 2020 10:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729165141.114968-2-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_05:2020-08-28,
 2020-08-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 2/2] ARM: dts: stm32: Add DHSOM based
	DRC02 board
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

Hi Marek

On 7/29/20 6:51 PM, Marek Vasut wrote:
> Add DT for DH DRC02 unit, which is a universal controller device.
> The system has two ethernet ports, two CANs, RS485 and RS232, USB,
> capacitive buttons and an OLED display.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Invert the RS485 RE/DE polarity
>      - Write electronics with lowercase e
> ---
>   arch/arm/boot/dts/Makefile                    |   1 +
>   arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts |  35 ++++
>   arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts  |   4 +-
>   .../arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi | 157 ++++++++++++++++++
>   4 files changed, 195 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> 

Series applied on stm32-next.

Regards
Alex


> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4572db3fa5ae..8cdcf7316ca2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1047,6 +1047,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32746g-eval.dtb \
>   	stm32h743i-eval.dtb \
>   	stm32h743i-disco.dtb \
> +	stm32mp153c-dhcom-drc02.dtb \
>   	stm32mp157a-avenger96.dtb \
>   	stm32mp157a-dhcor-avenger96.dtb \
>   	stm32mp157a-dk1.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts b/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
> new file mode 100644
> index 000000000000..02a39132958e
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020 Marek Vasut <marex@denx.de>
> + *
> + * DHCOM STM32MP1 variant:
> + * DHCM-STM32MP153C-C065-R102-F0819-SPI-E2-CAN2-RTC-I-01D2
> + * DHCOM PCB number: 587-200 or newer
> + * DRC02 PCB number: 568-100 or newer
> + */
> +/dts-v1/;
> +
> +#include "stm32mp153.dtsi"
> +#include "stm32mp15xc.dtsi"
> +#include "stm32mp15xx-dhcom-som.dtsi"
> +#include "stm32mp15xx-dhcom-drc02.dtsi"
> +
> +/ {
> +	model = "DH electronics STM32MP153C DHCOM DRC02";
> +	compatible = "dh,stm32mp153c-dhcom-drc02", "dh,stm32mp153c-dhcom-som",
> +		     "st,stm32mp153";
> +};
> +
> +&m_can1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can1_pins_a>;
> +	pinctrl-1 = <&m_can1_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&m_can2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can2_pins_a>;
> +	pinctrl-1 = <&m_can2_sleep_pins_a>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
> index 197aa98d49e2..d3b81382f97c 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
> @@ -4,7 +4,7 @@
>    *
>    * DHCOM STM32MP1 variant:
>    * DHCM-STM32MP157C-C065-R102-F0819-SPI-E2-CAN2-SDR104-RTC-WBT-T-DSI-I-01D2
> - * DHCOR PCB number: 587-200 or newer
> + * DHCOM PCB number: 587-200 or newer
>    * PDK2 PCB number: 516-400 or newer
>    */
>   /dts-v1/;
> @@ -15,7 +15,7 @@
>   #include "stm32mp15xx-dhcom-pdk2.dtsi"
>   
>   / {
> -	model = "DH Electronics STM32MP157C DHCOM Premium Developer Kit (2)";
> +	model = "DH electronics STM32MP157C DHCOM Premium Developer Kit (2)";
>   	compatible = "dh,stm32mp157c-dhcom-pdk2", "dh,stm32mp157c-dhcom-som",
>   		     "st,stm32mp157";
>   };
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> new file mode 100644
> index 000000000000..62ab23824a3e
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &uart4;
> +		serial1 = &usart3;
> +		serial2 = &uart8;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&adc {
> +	status = "disabled";
> +};
> +
> +&dac {
> +	status = "disabled";
> +};
> +
> +&gpiob {
> +	/*
> +	 * NOTE: On DRC02, the RS485_RX_En is controlled by a separate
> +	 * GPIO line, however the STM32 UART driver assumes RX happens
> +	 * during TX anyway and that it only controls drive enable DE
> +	 * line. Hence, the RX is always enabled here.
> +	 */
> +	rs485-rx-en {
> +		gpio-hog;
> +		gpios = <8 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "rs485-rx-en";
> +	};
> +};
> +
> +&gpiod {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "Out1",
> +			  "Out2", "", "", "";
> +};
> +
> +&gpioi {
> +	gpio-line-names = "In1", "", "", "",
> +			  "", "", "", "",
> +			  "In2", "", "", "",
> +			  "", "", "", "";
> +
> +	/*
> +	 * NOTE: The USB Hub on the DRC02 needs a reset signal to be
> +	 * pulled high in order to be detected by the USB Controller.
> +	 * This signal should be handled by USB power sequencing in
> +	 * order to reset the Hub when USB bus is powered down, but
> +	 * so far there is no such functionality.
> +	 */
> +	usb-hub {
> +		gpio-hog;
> +		gpios = <2 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "usb-hub-reset";
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c04";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&i2c5 {	/* TP7/TP8 */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +};
> +
> +&sdmmc3 {
> +	/*
> +	 * On DRC02, the SoM does not have SDIO WiFi. The pins
> +	 * are used for on-board microSD slot instead.
> +	 */
> +	/delete-property/broken-cd;
> +	cd-gpios = <&gpioi 10 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	disable-wp;
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi1_pins_a>;
> +	cs-gpios = <&gpioz 3 0>;
> +	/* Use PIO for the display */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "disabled";	/* Enable once there is display driver */
> +	/*
> +	 * Note: PF3/GPIO_A , PD6/GPIO_B , PG0/GPIO_C , PC6/GPIO_E are
> +	 * also connected to the display board connector.
> +	 */
> +};
> +
> +&usart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usart3_pins_a>;
> +	status = "okay";
> +};
> +
> +/*
> + * Note: PI3 is UART1_RTS and PI5 is UART1_CTS on DRC02 (uart4 of STM32MP1),
> + *       however the STM32MP1 pinmux cannot map them to UART4 .
> + */
> +
> +&uart8 {	/* RS485 */
> +	linux,rs485-enabled-at-boot-time;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart8_pins_a>;
> +	rts-gpios = <&gpioe 6 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};
> +
> +&usbh_ehci {
> +	phys = <&usbphyc_port0>;
> +	status = "okay";
> +};
> +
> +&usbphyc {
> +	status = "okay";
> +};
> +
> +&usbphyc_port0 {
> +	phy-supply = <&vdd_usb>;
> +	vdda1v1-supply = <&reg11>;
> +	vdda1v8-supply = <&reg18>;
> +};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
