Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 545EC6D3FBF
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 11:11:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC8BFC65E70;
	Mon,  3 Apr 2023 09:10:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BAB8C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 09:10:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33392php004488; Mon, 3 Apr 2023 11:10:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=E6EGVKst8D+0Gk/EJvcw0vEtNpKhnEpfCWUrxagkj3I=;
 b=tjcYCKEyQqCHeAviFBthWAZgf9+bXppYmgj72WgkOFd0YjTUlb3kZeQCvMmhkcZW1kA8
 me2zsaCDOFVezcIUZXp3Yjjt4c9cFn4BL78x44ixwy8VqP2X5RHF8PyTGDKTlQp/Eq2x
 Er41s1RxEfz1Tu7sBH6cJp5R8WKxBRlnkdI9vv91rxHR21PiqJkewPhETPBY3R3wTmpk
 rpFLgbASbSuyu7rjsD0REjemfZg+0pY5oDQidz5/7rNRkRDE/t9KYMq/yMeV3j6tvJhn
 lbowmA85pvRDwESdV2eX0uFXyfUalP/cZsUM5iuV8f7wE5akkVx7RkJFMscJMnxHpvQT Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ppa1m9d13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 11:10:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0854E10002A;
 Mon,  3 Apr 2023 11:10:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F37332138D9;
 Mon,  3 Apr 2023 11:10:48 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 11:10:48 +0200
Message-ID: <dda2a928-dbdd-e8e7-fb5e-2bb062a3b2b9@foss.st.com>
Date: Mon, 3 Apr 2023 11:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20230330050408.3806093-1-s.trumtrar@pengutronix.de>
 <20230330050408.3806093-10-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230330050408.3806093-10-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-03-31_01,2023-02-09_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v7 09/10] ARM: dts: stm32: add
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

On 3/30/23 07:04, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB
> eMMC, up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---

I'm not so far to merge your series but I still have questions.

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
>      
>      Changes since v6:
>        - rename mdio0->mdio
>      
>      Changes since v5:
>        - cleanup dt_bindings_check warnings
>      
>      Changes since v4:
>        - cleanup usage of "status = okay|disabled"
>        - fix remaining non-generic node names
>        - rework sai nodes to not duplicate the existing settings in stm32mp151.dtsi
>      
>      Changes since v3:
>        - cleanup board-compatible
>        - cleanup aliases
>        - rename nodes according to schema
>        - use interrupt flag
> 
>   .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 594 ++++++++++++++++++
>   1 file changed, 594 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> new file mode 100644
> index 0000000000000..f612daa4c66a7
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> @@ -0,0 +1,594 @@
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

It seems that this region is not used. Furthermore if you plan to use it 
to GPU note that it doesn't respect YAMl verification. So please remove it.

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

Why do you re define those clocks ? They are all already defined in 
stm32mp151.dtsi

> +	status = "okay";
> +
> +	mdio {
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

...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
