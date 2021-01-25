Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9699130265D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 15:39:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F385AC5663B;
	Mon, 25 Jan 2021 14:39:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9FD8C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 14:38:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PEbl9t026481; Mon, 25 Jan 2021 15:38:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MIuVa7N9W1Fh67WY3zuMzD4+gl2zGit1w7lDqAqbRls=;
 b=b1WJZHMLUdC7ufEVjoNaD2PTQ7Oq27HEbSh2fiOjDzvji4HlrISf2xHfUJJ8DIqBaHwy
 F4Af9dAvwggjoqgNDGKhR4bqiySfhsRSlfR3Ce8AUm3SppsHe+/Go7HxWxc3j5RMOiQC
 koMGaEt67eUgsn9PlUQex5M8sXsAvW6vfjoasTahByc6cV4FPZDlnSS/LWa8sUSSCwbH
 hgq+xGcDTrD6X69408bBYjfJNUf/lz6JHQZvXIXowNdts0SZwwaqCpGejHV/Il+ScUqB
 9IB86VzOuOIvyV3kAtfT10EgxOtZYe4WsTjSooMaYbZsMkOksrEioPxTgY1EOU/8S+uH Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjn3ddn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 15:38:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4A4A100034;
 Mon, 25 Jan 2021 15:38:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CD202288B4;
 Mon, 25 Jan 2021 15:38:50 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 15:38:49 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20201223110757.126937-1-jagan@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <06748341-211c-c956-7ac2-d85ca0b582e2@foss.st.com>
Date: Mon, 25 Jan 2021 15:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201223110757.126937-1-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add STM32MP1 I2C6
	SDA/SCL pinmux
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

Hi,

On 12/23/20 12:07 PM, Jagan Teki wrote:
> Add SDA/SCL pinmux lines for I2C6 on STM32MP1.
> 
> This support adds both in default and sleep states.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 20a59e8f7a33..2036c1d0d798 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -2018,6 +2018,23 @@ pins {
>   		};
>   	};
>   
> +	i2c6_pins_a: i2c6-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 6, AF2)>, /* I2C6_SCL */
> +				 <STM32_PINMUX('Z', 7, AF2)>; /* I2C6_SDA */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c6_sleep_pins_a: i2c6-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 6, ANALOG)>, /* I2C6_SCL */
> +				 <STM32_PINMUX('Z', 7, ANALOG)>; /* I2C6_SDA */
> +		};
> +	};
> +
>   	spi1_pins_a: spi1-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
