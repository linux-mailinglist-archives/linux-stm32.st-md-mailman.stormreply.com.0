Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD8D1F94DD
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 12:50:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60A3AC36B11;
	Mon, 15 Jun 2020 10:50:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91BBFC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 10:50:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FAWlLl003188; Mon, 15 Jun 2020 12:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=6uazfPAhQsttgP5kzZTw92A9LjEqdyZWqPnjXh89SHU=;
 b=oS6225LDlBacpl1Ddp48BwFpC3AjwYU6WszDnpBmvJyMVLu3A99UsTAMux5ThvFGXLdT
 EGKbmHBHT1RwwsvWZtGETAqqnfqJUn8hacHEZ8fWeieTN3j3BuFUGFh3AnWEgWcAmSDe
 8mEKZpYJa2klMIpGrfOVeHs2OeaCBiemAmW3pJWkC5OABdFKlKbicvxyJiDDzjeVZxCM
 MJZT7wGb5ubVnMS8az9TEu4JpUCXYdYVzFftMfgQePUKsu7F9mYpB8etX2ZAbDrUEgnW
 ifHB1d6k5wffirFxYAsBj1HrqL3hw5EirUI4TT0ugMkXEzN1omzOFHoJnSBUSMLSQI21 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvs6j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:50:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6828B10002A;
 Mon, 15 Jun 2020 12:50:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A0382B8A11;
 Mon, 15 Jun 2020 12:50:00 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun
 2020 12:49:59 +0200
To: Erwan Le Ray <erwan.leray@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <20200528074029.24962-1-erwan.leray@st.com>
 <20200528074029.24962-2-erwan.leray@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2ee07ea1-1336-3bc5-d978-c5dc5cd5f04f@st.com>
Date: Mon, 15 Jun 2020 12:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528074029.24962-2-erwan.leray@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
Cc: devicetree@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: add usart2,
 usart3 and uart7 pins in stm32mp15-pinctrl
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

Hi Erwan

On 5/28/20 9:40 AM, Erwan Le Ray wrote:
> Adds usart2_pins_c, usart3_pins_b, usart3_pins_c and uart7_pins_c pins
> configurations in stm32mp15-pinctrl.
> - usart2_pins_c pins are connected to Bluetooth chip on dk2 board.
> - usart3_pins_b pins are connected to GPIO expansion connector on evx board.
> - usart3_pins_c pins are connected to GPIO expansion connector on dkx board.
> - uart7_pins_c pins are connected to Arduino Uno connector on dkx board.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index fb98a66977fe..99e399e4e4c3 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1658,6 +1658,36 @@
>   		};
> 

...


> +	usart3_pins_b: usart3-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
> +				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */

On EVx board this line is shared with ETH_CLK. The choice between both 
is done thanks to SB23 and default choice is "ETH_CLK". So hardware 
update has to be done to use usart3_rts. some words around that in 
comment would be great.

Thanks
alex

> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
> +				 <STM32_PINMUX('I', 10, AF8)>; /* USART3_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart3_idle_pins_b: usart3-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> +				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
> +				 <STM32_PINMUX('I', 10, ANALOG)>; /* USART3_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart3_sleep_pins_b: usart3-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> +				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
> +				 <STM32_PINMUX('I', 10, ANALOG)>, /* USART3_CTS_NSS */
> +				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
> +		};
> +	};
> +
> +	usart3_pins_c: usart3-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
> +				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
> +				 <STM32_PINMUX('B', 13, AF7)>; /* USART3_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart3_idle_pins_c: usart3-idle-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> +				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
> +				 <STM32_PINMUX('B', 13, ANALOG)>; /* USART3_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart3_sleep_pins_c: usart3-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> +				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
> +				 <STM32_PINMUX('B', 13, ANALOG)>, /* USART3_CTS_NSS */
> +				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
> +		};
> +	};
> +
>   	usbotg_hs_pins_a: usbotg-hs-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
