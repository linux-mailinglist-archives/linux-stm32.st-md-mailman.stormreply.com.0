Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23656927B5A
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 18:41:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDA71C78006;
	Thu,  4 Jul 2024 16:41:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A6DEC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 16:41:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464BFGiD013833;
 Thu, 4 Jul 2024 18:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 bmmQUp+jFbHjiIBageXqkOiFhrcZ73MqxH8zToqMlX0=; b=TdVAIo1Ekpkp1Lqm
 1LsWBgu407zii/wO0Mfl8I/SstNrB1jhxdbbRijk30gISA3CtkBWUHI8yYbVHxjY
 wB4O7ibFEWkG80snKjxuNYDGR6dyJD9sIIxzzfyj87jji0J6g3rbRRYK4tK/Axvq
 y/0U2Zcc2f0zp2cZ8MmSJkObgYed/3kqKO38qOIiWZjEid4ICzzd0TgzA3Gt/omp
 n1+JBMRRTNKvhVrGuaGP6uNtmK6bYn0WsnLBEen/vtz355jP4oGlY7Ml04gLusIP
 x7FG5jhdMJdyLORGH2WW/4U466eRrSz4lxGh1YT9VVLn+X3S9Q0iErOZUCt245hZ
 JBphgQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40295dnut8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 18:41:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4954640044;
 Thu,  4 Jul 2024 18:41:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 991FD22AFFA;
 Thu,  4 Jul 2024 18:40:50 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Jul
 2024 18:40:49 +0200
Message-ID: <f303a45a-3844-485c-8971-f71a46b8b0fb@foss.st.com>
Date: Thu, 4 Jul 2024 18:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240629203706.93145-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240629203706.93145-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_12,2024-07-03_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: omit unused pinctrl
 groups from stm32mp13 dtb files
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

On 6/29/24 22:36, Marek Vasut wrote:
> stm32mp13-pinctrl.dtsi contains nearly all pinctrl groups collected from
> all boards. Most of them end up unused by a board and only waste binary
> space. Add /omit-if-no-ref/ to the groups to scrub the unused groups
> from the dtbs.
> 
> Use the following regex to update the file and drop two useless newlines too:
> s@^\t[^:]\+: [^ ]\+ {$@\t/omit-if-no-ref/\r&@

I understand the aim of this patch but I'm just wondering about DT 
overlay that would need one of those configurations. IMO, in this case 
the DT overlay will not apply.

Alex

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 92 ++++++++++++++++++++-
>   1 file changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> index d3deec602ae7a..ca19c8c6b6771 100644
> --- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
> @@ -6,12 +6,14 @@
>   #include <dt-bindings/pinctrl/stm32-pinfunc.h>
>   
>   &pinctrl {
> +	/omit-if-no-ref/
>   	adc1_pins_a: adc1-pins-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1 in12 */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	adc1_usb_cc_pins_a: adc1-usb-cc-pins-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
> @@ -19,6 +21,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	adc1_usb_cc_pins_b: adc1-usb-cc-pins-1 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 5, ANALOG)>, /* ADC1_INP2 */
> @@ -26,6 +29,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	dcmipp_pins_a: dcmi-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H',  8,  AF13)>,/* DCMI_HSYNC */
> @@ -43,6 +47,7 @@ pins1 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	dcmipp_sleep_pins_a: dcmi-sleep-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H',  8,  ANALOG)>,/* DCMI_HSYNC */
> @@ -59,6 +64,7 @@ pins1 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	eth1_rgmii_pins_a: eth1-rgmii-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
> @@ -83,9 +89,9 @@ pins2 {
>   				 <STM32_PINMUX('D', 7, AF10)>; /* ETH_RGMII_RX_CLK */
>   			bias-disable;
>   		};
> -
>   	};
>   
> +	/omit-if-no-ref/
>   	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
> @@ -105,6 +111,7 @@ pins1 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	eth1_rmii_pins_a: eth1-rmii-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH_RMII_TXD0 */
> @@ -124,9 +131,9 @@ pins2 {
>   				 <STM32_PINMUX('C', 1, AF10)>; /* ETH_RMII_CRS_DV */
>   			bias-disable;
>   		};
> -
>   	};
>   
> +	/omit-if-no-ref/
>   	eth1_rmii_sleep_pins_a: eth1-rmii-sleep-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RMII_TXD0 */
> @@ -141,6 +148,7 @@ pins1 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	eth2_rgmii_pins_a: eth2-rgmii-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 7, AF11)>, /* ETH_RGMII_TXD0 */
> @@ -167,6 +175,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
> @@ -186,6 +195,7 @@ pins1 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	eth2_rmii_pins_a: eth2-rmii-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 7, AF11)>, /* ETH_RMII_TXD0 */
> @@ -207,6 +217,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	eth2_rmii_sleep_pins_a: eth2-rmii-sleep-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RMII_TXD0 */
> @@ -221,6 +232,7 @@ pins1 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	goodix_pins_a: goodix-0 {
>   		/*
>   		 * touchscreen reset needs to be configured
> @@ -243,6 +255,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	i2c1_pins_a: i2c1-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
> @@ -253,6 +266,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	i2c1_sleep_pins_a: i2c1-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
> @@ -260,6 +274,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	i2c5_pins_a: i2c5-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
> @@ -270,6 +285,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	i2c5_sleep_pins_a: i2c5-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
> @@ -277,6 +293,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	i2c5_pins_b: i2c5-1 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
> @@ -287,6 +304,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	i2c5_sleep_pins_b: i2c5-sleep-1 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
> @@ -294,6 +312,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	ltdc_pins_a: ltdc-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D',  9, AF13)>, /* LCD_CLK */
> @@ -324,6 +343,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	ltdc_sleep_pins_a: ltdc-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_CLK */
> @@ -351,6 +371,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	m_can1_pins_a: m-can1-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('G', 10, AF9)>; /* CAN1_TX */
> @@ -364,6 +385,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	m_can1_sleep_pins_a: m_can1-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('G', 10, ANALOG)>, /* CAN1_TX */
> @@ -371,6 +393,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	m_can2_pins_a: m-can2-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('G', 0, AF9)>; /* CAN2_TX */
> @@ -384,6 +407,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	m_can2_sleep_pins_a: m_can2-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('G', 0, ANALOG)>, /* CAN2_TX */
> @@ -391,6 +415,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	mcp23017_pins_a: mcp23017-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('G', 12, GPIO)>;
> @@ -398,6 +423,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm3_pins_a: pwm3-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 1, AF2)>; /* TIM3_CH4 */
> @@ -407,12 +433,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm3_sleep_pins_a: pwm3-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 1, ANALOG)>; /* TIM3_CH4 */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm4_pins_a: pwm4-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 13, AF2)>; /* TIM4_CH2 */
> @@ -422,12 +450,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm4_sleep_pins_a: pwm4-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 13, ANALOG)>; /* TIM4_CH2 */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm5_pins_a: pwm5-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('H', 12, AF2)>; /* TIM5_CH3 */
> @@ -437,12 +467,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm5_sleep_pins_a: pwm5-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('H', 12, ANALOG)>; /* TIM5_CH3 */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm8_pins_a: pwm8-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('E', 5, AF3)>; /* TIM8_CH3 */
> @@ -452,12 +484,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm8_sleep_pins_a: pwm8-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('E', 5, ANALOG)>; /* TIM8_CH3 */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm13_pins_a: pwm13-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 6, AF9)>; /* TIM13_CH1 */
> @@ -467,12 +501,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm13_sleep_pins_a: pwm13-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 6, ANALOG)>; /* TIM13_CH1 */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm14_pins_a: pwm14-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 9, AF9)>; /* TIM14_CH1 */
> @@ -482,12 +518,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	pwm14_sleep_pins_a: pwm14-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 9, ANALOG)>; /* TIM14_CH1 */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	qspi_clk_pins_a: qspi-clk-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 10, AF9)>; /* QSPI_CLK */
> @@ -497,12 +535,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	qspi_bk1_pins_a: qspi-bk1-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
> @@ -515,6 +555,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
> @@ -524,6 +565,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	qspi_cs1_pins_a: qspi-cs1-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 2, AF9)>; /* QSPI_BK1_NCS */
> @@ -533,12 +575,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	qspi_cs1_sleep_pins_a: qspi-cs1-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 2, ANALOG)>; /* QSPI_BK1_NCS */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sai1a_pins_a: sai1a-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 4, AF12)>, /* SAI1_SCK_A */
> @@ -550,6 +594,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sai1a_sleep_pins_a: sai1a-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* SAI1_SCK_A */
> @@ -558,6 +603,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sai1b_pins_a: sai1b-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 0, AF6)>; /* SAI1_SD_B */
> @@ -565,12 +611,14 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sai1b_sleep_pins_a: sai1b-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 0, ANALOG)>; /* SAI1_SD_B */
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> @@ -584,6 +632,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> @@ -602,6 +651,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> @@ -613,6 +663,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc1_clk_pins_a: sdmmc1-clk-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> @@ -622,6 +673,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC2_D0 */
> @@ -635,6 +687,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC2_D0 */
> @@ -653,6 +706,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
> @@ -664,6 +718,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc2_clk_pins_a: sdmmc2-clk-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC2_CK */
> @@ -673,6 +728,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 0, AF10)>, /* SDMMC2_D4 */
> @@ -685,6 +741,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC2_D4 */
> @@ -694,6 +751,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	spi2_pins_a: spi2-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('B', 10, AF6)>, /* SPI2_SCK */
> @@ -709,6 +767,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	spi2_sleep_pins_a: spi2-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* SPI2_SCK */
> @@ -717,6 +776,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	spi3_pins_a: spi3-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H', 13, AF6)>, /* SPI3_SCK */
> @@ -732,6 +792,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	spi3_sleep_pins_a: spi3-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* SPI3_SCK */
> @@ -740,6 +801,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	spi5_pins_a: spi5-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H', 7, AF6)>, /* SPI5_SCK */
> @@ -755,6 +817,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	spi5_sleep_pins_a: spi5-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('H', 7, ANALOG)>, /* SPI5_SCK */
> @@ -763,6 +826,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	stm32g0_intn_pins_a: stm32g0-intn-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('I', 2, GPIO)>;
> @@ -770,6 +834,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart4_pins_a: uart4-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('D', 6, AF8)>; /* UART4_TX */
> @@ -783,6 +848,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart4_idle_pins_a: uart4-idle-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('D', 6, ANALOG)>; /* UART4_TX */
> @@ -793,6 +859,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart4_sleep_pins_a: uart4-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 6, ANALOG)>, /* UART4_TX */
> @@ -800,6 +867,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart4_pins_b: uart4-1 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('A', 9, AF8)>; /* UART4_TX */
> @@ -813,6 +881,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart4_idle_pins_b: uart4-idle-1 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* UART4_TX */
> @@ -823,6 +892,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart4_sleep_pins_b: uart4-sleep-1 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 9, ANALOG)>, /* UART4_TX */
> @@ -830,6 +900,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart7_pins_a: uart7-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H', 2, AF8)>, /* UART7_TX */
> @@ -845,6 +916,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart7_idle_pins_a: uart7-idle-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
> @@ -862,6 +934,7 @@ pins3 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart7_sleep_pins_a: uart7-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
> @@ -871,6 +944,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart8_pins_a: uart8-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
> @@ -884,6 +958,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart8_idle_pins_a: uart8-idle-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* UART8_TX */
> @@ -894,6 +969,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	uart8_sleep_pins_a: uart8-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* UART8_TX */
> @@ -901,6 +977,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart1_pins_a: usart1-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('C', 0, AF7)>, /* USART1_TX */
> @@ -916,6 +993,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart1_idle_pins_a: usart1-idle-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
> @@ -933,6 +1011,7 @@ pins3 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart1_sleep_pins_a: usart1-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
> @@ -942,6 +1021,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart1_pins_b: usart1-1 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('C', 0, AF7)>; /* USART1_TX */
> @@ -955,6 +1035,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart1_idle_pins_b: usart1-idle-1 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('C', 0, ANALOG)>; /* USART1_TX */
> @@ -965,6 +1046,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart1_sleep_pins_b: usart1-sleep-1 {
>   		pins {
>   			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
> @@ -972,6 +1054,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart2_pins_a: usart2-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H', 12, AF1)>, /* USART2_TX */
> @@ -987,6 +1070,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart2_idle_pins_a: usart2-idle-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('H', 12, ANALOG)>, /* USART2_TX */
> @@ -1004,6 +1088,7 @@ pins3 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart2_sleep_pins_a: usart2-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('H', 12, ANALOG)>, /* USART2_TX */
> @@ -1013,6 +1098,7 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart2_pins_b: usart2-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 11, AF1)>, /* USART2_TX */
> @@ -1028,6 +1114,7 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart2_idle_pins_b: usart2-idle-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
> @@ -1045,6 +1132,7 @@ pins3 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
>   	usart2_sleep_pins_b: usart2-sleep-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
