Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A96991BD6BF
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 10:02:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A135C36B0D;
	Wed, 29 Apr 2020 08:02:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F9A0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 08:02:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T82Tc2000920; Wed, 29 Apr 2020 10:02:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xAKjtR7pf94l044PtIdkC1ZExxD4NPo7DesKo4PrcN0=;
 b=ECJAvqakrfmc6W3Gk6rr/m6ljTZDc5CCcVoECs20CuUENnn9eh2yq74yVHTyJ1Q08jQo
 D0yuJtLf65sJCPYqpssUQc23oDo7FUNBwGEZlJSgmYaP1movHgXD2QnIval1xsMtN7xO
 WzDamNRELBsJNjqQ6HmeRYlwTawwIBAoN//VKGqJhsTLLTMyGq6EqHPKcKlzU+Ep5x/v
 Ujo/MgmnKuVlcAP6nDS9R84FfP4zMui5+Vc14DQu/8Bzk69FREzTp7i5fPsU1o7uLe0h
 D+fqCN7H1CL29MKuYLj8xwWf4PP7NhwjPFCKQORuNK+OcPTLCnqHfcTljeZIRpctsqfL 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjwvwd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 10:02:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1213410002A;
 Wed, 29 Apr 2020 10:02:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 003F1206653;
 Wed, 29 Apr 2020 10:02:30 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 10:02:27 +0200
To: <mani@kernel.org>, <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>
References: <20200420173124.27416-1-mani@kernel.org>
 <20200420173124.27416-7-mani@kernel.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <210a98b3-feea-8faf-316c-d45e1697ea21@st.com>
Date: Wed, 29 Apr 2020 10:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200420173124.27416-7-mani@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_02:2020-04-28,
 2020-04-29 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 6/6] ARM: dts: stm32mp1: Add IoT Box board
	support
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

Hi Mani

On 4/20/20 7:31 PM, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> IoT Box is an IoT gateway device based on Stinger96 board powered by
> STM32MP1 SoC, designed and manufactured by Shiratech Solutions. This
> device makes use of Stinger96 board by having it as a base board with
> one additional mezzanine on top.
> 
> Following are the features exposed by this device in addition to the
> Stinger96 board:
> 
> * WiFi/BT
> * CCS811 VOC sensor
> * 2x Digital microphones IM69D130
> * 12x WS2812B LEDs
> 
> Following peripherals are tested and known to work:
> 
> * WiFi/BT
> * CCS811
> 
> More information about this device can be found in Shiratech website:
> https://www.shiratech-solutions.com/products/iot-box/
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>   arch/arm/boot/dts/Makefile                |  1 +
>   arch/arm/boot/dts/stm32mp157a-iot-box.dts | 92 +++++++++++++++++++++++
>   2 files changed, 93 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp157a-iot-box.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 966b81dfffd6..455ec6eb6303 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1030,6 +1030,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32h743i-disco.dtb \
>   	stm32mp157a-avenger96.dtb \
>   	stm32mp157a-dk1.dtb \
> +	stm32mp157a-iot-box.dtb \
>   	stm32mp157a-stinger96.dtb \
>   	stm32mp157c-dhcom-pdk2.dtb \
>   	stm32mp157c-dk2.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp157a-iot-box.dts b/arch/arm/boot/dts/stm32mp157a-iot-box.dts
> new file mode 100644
> index 000000000000..fa1c006ce531
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157a-iot-box.dts
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2020 Manivannan Sadhasivam
> + */
> +
> +/dts-v1/;
> +#include "stm32mp157a-stinger96.dtsi"
> +
> +/ {
> +	model = "Shiratech STM32MP157A IoT Box";
> +	compatible = "shiratech,stm32mp157a-iot-box", "st,stm32mp157";
> +
> +	wlan_pwr: regulator-wlan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "wl-reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpiog 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&i2c2 {
> +	ccs811@5b {
> +		compatible = "ams,ccs811";
> +		reg = <0x5b>;
> +		wakeup-gpios = <&gpioa 12 GPIO_ACTIVE_LOW>;
> +		reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&pinctrl {

Currently all pinmux definition are done in stm32mp15-pinctrl.dtsi file.
Can you move it ?

Otherwise (except commit title) it is ok for me.

thanks
alex

> +	/*
> +	 * Note: The SDMMC2 pins lack external pullups on data lines. Hence,
> +	 * we need to enable it in the SoC.
> +	 */
> +	sdmmc2_b4_pins_pull: sdmmc2-b4-pull {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
> +				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
> +				 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
> +				 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
> +			slew-rate = <1>;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +};
> +
> +/* WiFi */
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_pull>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_b>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
> +	broken-cd;
> +	non-removable;
> +	st,neg-edge;
> +	bus-width = <1>;
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
> +/* Bluetooth */
> +&uart4 {
> +	/* Note: HW flow control is broken, hence using custom CTS/RTS gpios */
> +	/delete-property/st,hw-flow-ctrl;
> +	cts-gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
> +	rts-gpios = <&gpiob 0 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	bluetooth {
> +		shutdown-gpios = <&gpiog 2 GPIO_ACTIVE_HIGH>;
> +		compatible = "brcm,bcm43438-bt";
> +		max-speed = <115200>;
> +	};
> +};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
