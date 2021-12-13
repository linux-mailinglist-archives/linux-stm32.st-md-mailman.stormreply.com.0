Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB1472AD7
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 12:07:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF51C5E2C6;
	Mon, 13 Dec 2021 11:07:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0893EC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 11:07:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BDB0qrZ026371;
 Mon, 13 Dec 2021 12:07:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=b+HsHRFaHh48h58DWF2zvvE7tLMBisSyPfnqh6tF6GE=;
 b=OuQMkt+oOASSzcT0h9mm0raBeTRYgEXAidt36SmYrlFla+brohD0wBmveZjtrDuTKbz4
 V9P1l7QBCmnPtDIR5/1zQ9L5A9A1D5vVatu6GUV7fg3WOhrtjAXoKKVGV40zubRGkCBB
 9mM/MTVsnsi65PvSJq1J1mOaqZyGEFX9kYqOWTAdLAkEG2/cJmhOYWn8EgwGmVzM1B81
 zxc6comnvMajUnLwwFa4E2/4fpCGt4Gm5EeHyxc3GoW0pRz7BaYJ0rgko5ueOBeoegux
 ITBw4n5+zpM+WegGmT439wgLRuPBKEgbpVUKCjnXbncGSy/p/CNKTkdztrxV4cyRf1/w SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cx0sqsmwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 12:07:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 85B3A100034;
 Mon, 13 Dec 2021 12:07:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 681CF235F68;
 Mon, 13 Dec 2021 12:07:21 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 13 Dec
 2021 12:07:20 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Rob Herring <robh+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20211203165435.8042-1-jagan@amarulasolutions.com>
 <20211203165435.8042-3-jagan@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <efee8492-e8fd-92e4-61a3-f61275459824@foss.st.com>
Date: Mon, 13 Dec 2021 12:07:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203165435.8042-3-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_04,2021-12-13_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: Add Engicam
 i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
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

On 12/3/21 5:54 PM, Jagan Teki wrote:
> Engicam C.TOUCH 2.0 is an EDIMM compliant general purpose Carrier
> board.
> 
> Genaral features:
> - Ethernet 10/100
> - Wifi/BT
> - USB Type A/OTG
> - Audio Out
> - CAN
> - 10" LVDS Panel (SN65DSI84 DSI-LVDS bridge on SoM)
> 
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> 10.1" OF is a capacitive touch 10.1" Open Frame panel solutions.
> 
> i.Core STM32MP1 needs to mount on top of C.TOUCH 2.0 carrier with
> pluged 10.1" OF for creating complete i.Core STM32MP1 C.TOUCH 2.0
> 10.1" Open Frame board.
> 
> Add support for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Series applied on stm32-next.

Thanks
Alex


> ---
> Changes for v3:
> - drop redundent commit details.
> - fix dtbs_check
> Changes for v2:
> - none
> 
>   arch/arm/boot/dts/Makefile                    |   1 +
>   ...tm32mp157a-icore-stm32mp1-ctouch2-of10.dts | 132 ++++++++++++++++++
>   2 files changed, 133 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8a2dfdf01ce3..47878c1e878b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1140,6 +1140,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
>   	stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb \
>   	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
> +	stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb \
>   	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
>   	stm32mp157a-stinger96.dtb \
>   	stm32mp157c-dhcom-pdk2.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> new file mode 100644
> index 000000000000..2a2829283456
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Engicam srl
> + * Copyright (c) 2020 Amarula Solutons(India)
> + */
> +
> +/dts-v1/;
> +#include "stm32mp157.dtsi"
> +#include "stm32mp157a-icore-stm32mp1.dtsi"
> +#include "stm32mp15-pinctrl.dtsi"
> +#include "stm32mp15xxaa-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1\" Open Frame";
> +	compatible = "engicam,icore-stm32mp1-ctouch2-of10",
> +		     "engicam,icore-stm32mp1", "st,stm32mp157";
> +
> +	aliases {
> +		serial0 = &uart4;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&gpiod 13 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	panel {
> +		compatible = "ampire,am-1280800n3tzqw-t00h";
> +		backlight = <&backlight>;
> +		power-supply = <&v3v3>;
> +
> +		port {
> +			panel_in_lvds: endpoint {
> +				remote-endpoint = <&bridge_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi {
> +	status = "okay";
> +	phy-dsi-supply = <&reg18>;
> +
> +	ports {
> +		port@0 {
> +			reg = <0>;
> +			dsi_in: endpoint {
> +				remote-endpoint = <&ltdc_ep0_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			dsi_out: endpoint {
> +				remote-endpoint = <&bridge_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	i2c-scl-falling-time-ns = <20>;
> +	i2c-scl-rising-time-ns = <185>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c6_pins_a>;
> +	pinctrl-1 = <&i2c6_sleep_pins_a>;
> +	status = "okay";
> +
> +	bridge@2c {
> +		compatible = "ti,sn65dsi84";
> +		reg = <0x2c>;
> +		enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				bridge_in: endpoint {
> +					remote-endpoint = <&dsi_out>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				bridge_out: endpoint {
> +					remote-endpoint = <&panel_in_lvds>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&ltdc {
> +	status = "okay";
> +
> +	port {
> +		ltdc_ep0_out: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&dsi_in>;
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	bus-width = <4>;
> +	disable-wp;
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	st,neg-edge;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	pinctrl-1 = <&uart4_sleep_pins_a>;
> +	pinctrl-2 = <&uart4_idle_pins_a>;
> +	status = "okay";
> +};
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
