Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BFB2B5E63
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 12:33:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CE78C3FADD;
	Tue, 17 Nov 2020 11:33:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11A26C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 11:33:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHBRSLs020691; Tue, 17 Nov 2020 12:33:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ei86713KuUltdKABZNeQOgRtPDi76ulCQadc6PBDtxY=;
 b=Nx54zsS1oMzUNCdnUisN3QAVRY3Xf3UkFl4YNrxpaszW1UdrPvBCAgrUtojlNtAmOWm9
 P1nOVjpTvIskJnOWBIzoYo6a5cX5jv9dtkdCDUt37nbW4EAxdCx81R0pbIUE5+UBkfxB
 vsg2qNA8SI5LP1BN3uspfJFI/tBn4cQSC4Gtxpoz/iveWJ/z9W7Jty9MkSEVUYT97EeZ
 o+lUztupxqMhwDm0I6t4pXW2X4v0iD82m0Xz5nZ9F3MdrTD0ExNfwZrGkt9WCHdFbUzf
 1Yx4dq4Xx/SblbOymtXG9NblXuSpQoeeWMW3+bm6hFJQGM70Utc9xv7DoIZeVbrJv8XA Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5k50vsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 12:33:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82FFF10002A;
 Tue, 17 Nov 2020 12:33:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7772624487A;
 Tue, 17 Nov 2020 12:33:44 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 12:33:43 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201103181137.443586-1-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2b044ab0-71cf-0b09-ad7d-c84b71659096@st.com>
Date: Tue, 17 Nov 2020 12:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103181137.443586-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-17,
 2020-11-17 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add DHCOM based PicoITX
	board
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

Hi Marek,

On 11/3/20 7:11 PM, Marek Vasut wrote:
> Add DT for DH PicoITX unit, which is a bare-bones carrier board for
> the DHCOM. The board has ethernet port, USB, CAN, LEDs and a custom
> board-to-board expansion connector.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/Makefile                    |   1 +
>   .../boot/dts/stm32mp157c-dhcom-picoitx.dts    |  35 +++++
>   .../boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 143 ++++++++++++++++++
>   3 files changed, 179 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> 

Thanks to enhance STM32 family.

Applied on stm32-next.

Thanks.
Alex

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index db0223cf47da..36ec449a8b4e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1066,6 +1066,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp157a-iot-box.dtb \
>   	stm32mp157a-stinger96.dtb \
>   	stm32mp157c-dhcom-pdk2.dtb \
> +	stm32mp157c-dhcom-picoitx.dtb \
>   	stm32mp157c-dk2.dtb \
>   	stm32mp157c-ed1.dtb \
>   	stm32mp157c-ev1.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
> new file mode 100644
> index 000000000000..cfb8f8a0c82d
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020 Marek Vasut <marex@denx.de>
> + *
> + * DHCOM STM32MP1 variant:
> + * DHCM-STM32MP157C-C065-R102-F0819-SPI-E-CAN2-SD-RTC-T-DSI-I-01D2
> + * DHCOM PCB number: 587-200 or newer
> + * PicoITX PCB number: 487-600 or newer
> + */
> +/dts-v1/;
> +
> +#include "stm32mp157.dtsi"
> +#include "stm32mp15xc.dtsi"
> +#include "stm32mp15xx-dhcom-som.dtsi"
> +#include "stm32mp15xx-dhcom-picoitx.dtsi"
> +
> +/ {
> +	model = "DH electronics STM32MP157C DHCOM PicoITX";
> +	compatible = "dh,stm32mp157c-dhcom-picoitx", "dh,stm32mp157c-dhcom-som",
> +		     "st,stm32mp157";
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
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> new file mode 100644
> index 000000000000..356150d28c42
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> @@ -0,0 +1,143 @@
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
> +
> +	led {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "yellow:led";
> +			gpios = <&gpioi 3 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
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
> +&gpioa {
> +	/*
> +	 * NOTE: The USB Port on the PicoITX needs a PWR_EN signal to enable
> +	 * port power. This signal should be handled by USB power sequencing
> +	 * in order to turn on port power when USB bus is powered up, but so
> +	 * far there is no such functionality.
> +	 */
> +	usb-port-power {
> +		gpio-hog;
> +		gpios = <13 GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "usb-port-power";
> +	};
> +};
> +
> +&gpioc {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "In1", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +};
> +
> +&gpiod {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "Out1",
> +			  "Out2", "", "", "";
> +};
> +
> +&gpiog {
> +	gpio-line-names = "In2", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +};
> +
> +&i2c2 {	/* On board-to-board connector (optional) */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +};
> +
> +&i2c5 {	/* On board-to-board connector */
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
> +&usart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usart3_pins_a>;
> +	status = "okay";
> +};
> +
> +&uart8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
> +	status = "okay";
> +};
> +
> +&usbh_ehci {
> +	phys = <&usbphyc_port0>;
> +	status = "okay";
> +};
> +
> +&usbh_ohci {
> +	phys = <&usbphyc_port0>;
> +	status = "okay";
> +};
> +
> +&usbotg_hs {
> +	dr_mode = "otg";
> +	pinctrl-0 = <&usbotg_hs_pins_a>;
> +	pinctrl-names = "default";
> +	phy-names = "usb2-phy";
> +	phys = <&usbphyc_port1 0>;
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
> +	vdda1v1-supply = <&reg11>;
> +	vdda1v8-supply = <&reg18>;
> +};
> +
> +&usbphyc_port1 {
> +	phy-supply = <&vdd_usb>;
> +	vdda1v1-supply = <&reg11>;
> +	vdda1v8-supply = <&reg18>;
> +};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
