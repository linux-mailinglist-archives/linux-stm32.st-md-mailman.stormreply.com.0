Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152F2340D5
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 10:08:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D950CC36B35
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 08:08:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2135C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 08:08:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V82cGL009807; Fri, 31 Jul 2020 10:08:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=duijA74hn6cm6wjqcWG4BwM4Dv82QSirbDAGiYHEvbM=;
 b=fLOANyb1hL4UcnLzmtSnyAC+bCnklq28UwMCQw8LGYbSEWnrtUkfqzOPhaN8eZkthTWb
 IdIi7n8B3stKbTXiKUcL8O0Z3PxVPeojF0kYa83H21mzMk9XArRCq3FcfOavqFSYCi6d
 1UpqDWbopf03RKVYE90xjiVmM2Z6Y8xScv1v4552RAOH/tcw/4ahs92nBYqClxdvX15d
 hI4edFbJSPeTjfhHfrQc2j5n0VUs3iKkM/HxyyS8Z1xKNMMgDDTQY1NOHFdMQTxir9UW
 dW8prnb+XWqykVIJQb7kpgQG5QEhJxhGRJuLfcrZ9+VV99ffw9gCd5gu2MCU+HWJxHuw Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga72cdk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 10:08:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67CFB10002A;
 Fri, 31 Jul 2020 10:08:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30CAB21EB47;
 Fri, 31 Jul 2020 10:08:14 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 10:08:13 +0200
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, <linux-arm-kernel@lists.infradead.org>
References: <20200724145107.35772-1-marcin.sloniewski@gmail.com>
 <20200724145107.35772-3-marcin.sloniewski@gmail.com>
 <4a160bb6-bc73-0a18-86c4-decd985104ad@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <9ab39ee2-d6db-73f5-5914-befd22a9bcfb@st.com>
Date: Fri, 31 Jul 2020 10:08:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a160bb6-bc73-0a18-86c4-decd985104ad@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, devicetree@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 3/3] ARM: dts: stm32: add initial
 support for stm32mp157-odyssey board
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


...

>> +
>> +&sdmmc2_d47_pins_a {
>> +	pins {
>> +		pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
>> +			 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
>> +			 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
>> +			 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
>> +	};
>> +};
>> +
>> +&sdmmc2_d47_sleep_pins_a {
>> +	pins {
>> +		pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
>> +			 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
>> +			 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
>> +			 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
>> +	};
>> +};
> 
> When I sent out the device trees for the lxa-mc1, Alex wanted
> all pinctrl nodes to be collected in stm32mp15-pinctrl.dtsi.
> 
> @Alex, should this be done here as well?

Hi,

Sorry for the late answer. Yes it has to be defined in 
stm32mp15-pinctrl.dtsi. If at the end there are too much definitions for 
the same pins or group of pins, I'll find a smarter way for pin 
definition, but currently all pin definitions have to be done in 
stm32mp15-pinctrl.dtsi.

cheers
Alex

> 
>> +
>> +&sdmmc2 {
>> +	pinctrl-names = "default", "opendrain", "sleep";
>> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
>> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
>> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
>> +	non-removable;
>> +	no-sd;
>> +	no-sdio;
>> +	st,neg-edge;
>> +	bus-width = <8>;
>> +	vmmc-supply = <&v3v3>;
>> +	vqmmc-supply = <&v3v3>;
>> +	mmc-ddr-3_3v;
>> +	status = "okay";
>> +};
>> +
>> diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
>> new file mode 100644
>> index 000000000000..619243807842
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
>> @@ -0,0 +1,73 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +/*
>> + * Copyright (C) 2020 Marcin Sloniewski <marcin.sloniewski@gmail.com>.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "stm32mp157c-odyssey-som.dtsi"
>> +
>> +/ {
>> +	model = "Seeed Studio Odyssey-STM32MP157C Board";
>> +	compatible = "seeed,stm32mp157c-odyssey",
>> +		     "seeed,stm32mp157c-odyssey-som", "st,stm32mp157";
>> +
>> +	aliases {
>> +		ethernet0 = &ethernet0;
>> +		serial0 = &uart4;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +};
>> +
>> +&ethernet0 {
>> +	status = "okay";
>> +	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
>> +	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
>> +	pinctrl-names = "default", "sleep";
>> +	phy-mode = "rgmii-id";
>> +	max-speed = <1000>;
>> +	phy-handle = <&phy0>;
>> +
>> +	mdio0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "snps,dwmac-mdio";
>> +		phy0: ethernet-phy@7 { /* KSZ9031RN */
>> +			reg = <7>;
> 
> reset-gpios is missing. I see that the vendor u-boot does it
> in board code, but you don't want Linux to depend on this.
> 
>> +		};
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&i2c1_pins_a>;
>> +	pinctrl-1 = <&i2c1_sleep_pins_a>;
>> +	i2c-scl-rising-time-ns = <100>;
>> +	i2c-scl-falling-time-ns = <7>;
>> +	status = "okay";
>> +	/delete-property/dmas;
>> +	/delete-property/dma-names;
>> +};
>> +
>> +&sdmmc1 {
>> +	pinctrl-names = "default", "opendrain", "sleep";
>> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
>> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
>> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
>> +	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>> +	disable-wp;
>> +	st,neg-edge;
>> +	bus-width = <4>;
>> +	vmmc-supply = <&v3v3>;
>> +	status = "okay";
>> +};
>> +
>> +&uart4 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart4_pins_a>;
>> +	status = "okay";
>> +};
>> +
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
