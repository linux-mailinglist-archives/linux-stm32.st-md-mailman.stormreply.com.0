Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 261C13370D7
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 12:08:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0DE4C5718D;
	Thu, 11 Mar 2021 11:08:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 806C2CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 11:08:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BB71vr007933; Thu, 11 Mar 2021 12:08:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OkqMTQRlY95MowGjpWpOMwJs3OwDCODKW0EREFO2LDk=;
 b=PlSp072KAq0ETEh1TFvqP2wtL9xTdVJdnTtJXhyNum/M6GAoI7C7FaBx3I5LoqDR5smm
 IdT1nwOO8beOSN1d/WNSZx5RmL5eBjwh8i3UtYgBNC/rV+CihAgYIO77l4cqoBD9Zdr0
 2Sc+2tgp6IKLNmbFMD0o6oGwUtWmOdrckR2PFRa4ajB5+e690VP8loPrmRSMgezl5iEH
 pKcE9S5nOa+5FBooh2XYK285ojD6hbSOMqJFE/dVO+6ZYpNkULvX7KIPdTKtX9b6DuQv
 I+rTYduy6IM3CZmQsyo23rLMSLl1TdBzSJv1xyjxLDE/6e13gCUxUuQzZoj4an52rIUB sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3740376aw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 12:08:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 114C810002A;
 Thu, 11 Mar 2021 12:08:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3CEA231DEA;
 Thu, 11 Mar 2021 12:08:32 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 12:08:32 +0100
To: Valentin CARON - foss <valentin.caron@foss.st.com>
References: <20210211110620.31594-1-valentin.caron@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <6dffddbe-235b-a607-a82c-5f3c3756e3a7@foss.st.com>
Date: Thu, 11 Mar 2021 12:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211110620.31594-1-valentin.caron@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_04:2021-03-10,
 2021-03-11 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix usart 2 & 3 pinconf
 to wake up with flow control
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

Hi Valentin

On 2/11/21 12:07 PM, Valentin CARON - foss wrote:
> Modify usart 2 & 3 pins to allow wake up from low power mode while the
> hardware flow control is activated. UART RTS pin need to stay configure
> in idle mode to receive characters in order to wake up.
> 
> Fixes: 842ed898a757 ("ARM: dts: stm32: add usart2, usart3 and uart7 pins in stm32mp15-pinctrl")
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---

Applied on stm32-fixes.

Thanks
Alex

>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 7b4249ed1983..060baa8b7e9d 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1891,10 +1891,15 @@
>   	usart2_idle_pins_c: usart2-idle-2 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
> -				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
>   				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
>   		};
>   		pins2 {
> +			pinmux = <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <3>;
> +		};
> +		pins3 {
>   			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
>   			bias-disable;
>   		};
> @@ -1940,10 +1945,15 @@
>   	usart3_idle_pins_b: usart3-idle-1 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> -				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
>   				 <STM32_PINMUX('I', 10, ANALOG)>; /* USART3_CTS_NSS */
>   		};
>   		pins2 {
> +			pinmux = <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
>   			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>   			bias-disable;
>   		};
> @@ -1976,10 +1986,15 @@
>   	usart3_idle_pins_c: usart3-idle-2 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> -				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
>   				 <STM32_PINMUX('B', 13, ANALOG)>; /* USART3_CTS_NSS */
>   		};
>   		pins2 {
> +			pinmux = <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
>   			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>   			bias-disable;
>   		};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
