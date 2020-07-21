Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BE22795C
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 09:16:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F1ECC36B2A;
	Tue, 21 Jul 2020 07:16:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE4B1C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 07:16:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L77RKS010258; Tue, 21 Jul 2020 09:16:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=73dAVS9zUnqZ8WATP62hAGazNOj36cZliVUS8oX7h4U=;
 b=zv/sNEUL05QFtuyXeubVy9UghJ47mfJ+LITSloTtydnx8AyIyOUG90UXZDK5nh6WlYj4
 yCGAMF4CrYHmVG8tPA5lDMnXLLjhU3fouCZXgYuJBnUEDeiVPiylOXf7ncEAI5rhGhde
 Ab6eUKuu8qTh9IC0Yvyq4MzBMrXZHHnjrMQDOcxXj5OTlwn7iN/kqXTObosvjFYfIUpn
 5w/82ZpxNwgbePUmSVpJt/pV5mXw8iLDVSDCnOhy6mnjC/tiu31tJxRmVXbHAYlH9Xq3
 J/lvBl+eUZTeAdV05MAZZI0sYAnddRZp97gdGAXmXQoIwC/x6Ah3bySZUHqpH+dnXeZJ 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpcana-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 09:16:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF3FB10002A;
 Tue, 21 Jul 2020 09:16:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF0CA220CCB;
 Tue, 21 Jul 2020 09:16:02 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 09:16:02 +0200
To: Patrick Delaunay <patrick.delaunay@st.com>, <linux-kernel@vger.kernel.org>
References: <20200616153329.15148-1-patrick.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <b18bd7f8-f63c-13ad-6220-f7745600a7a6@st.com>
Date: Tue, 21 Jul 2020 09:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200616153329.15148-1-patrick.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: cosmetic update in
 stm32mp15-pinctrl.dtsi
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

Hi Patrick

On 6/16/20 5:33 PM, Patrick Delaunay wrote:
> Use tabs where possible and remove multiple blanks lines.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 

Applied on stm32-next.

Thanks.
Alex

> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 7eb858732d6d..7d351757f2f8 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -210,8 +210,8 @@
>   				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
>   				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
>   				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
> -			         <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
> -			         <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
>   				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
>   				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
>   				 <STM32_PINMUX('H', 7, ANALOG)>, /* ETH_RGMII_RXD3 */
> @@ -453,7 +453,7 @@
>   	i2c5_pins_b: i2c5-1 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 0, AF4)>, /* I2C5_SCL */
> -			         <STM32_PINMUX('D', 1, AF4)>; /* I2C5_SDA */
> +				 <STM32_PINMUX('D', 1, AF4)>; /* I2C5_SDA */
>   			bias-disable;
>   			drive-open-drain;
>   			slew-rate = <0>;
> @@ -463,7 +463,7 @@
>   	i2c5_sleep_pins_b: i2c5-sleep-1 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 0, ANALOG)>, /* I2C5_SCL */
> -			         <STM32_PINMUX('D', 1, ANALOG)>; /* I2C5_SDA */
> +				 <STM32_PINMUX('D', 1, ANALOG)>; /* I2C5_SDA */
>   		};
>   	};
>   
> @@ -1072,7 +1072,6 @@
>   		};
>   	};
>   
> -
>   	sai2a_pins_b: sai2a-1 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('I', 6, AF10)>,	/* SAI2_SD_A */
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
