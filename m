Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C3552079
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jun 2022 17:21:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 163B6C5E2C6;
	Mon, 20 Jun 2022 15:21:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 957E8C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 15:21:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KCkVBp003757;
 Mon, 20 Jun 2022 17:21:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iNvcMe2flQlf3dbzDBQOml0Mrf6Ir6K4tA4jRCkw398=;
 b=Wrc7C+GqxJ0Y04P2yBFJFAkRKZ2knItSbkUW5gmRG62gkF0Idm7/PXRw+8CG4vqqCz7A
 t+asVFZVnfe7o+TgFqKCG2Rf8yJkyNqvwBSa09u2gI/ebVAZg9tlCokB76pdvt9S2cqI
 LX5Icvb5vMtkGHC5rTRlNmZ5B/H2TjtSh1LjftXKzun473I8JArnwcCpf2xgJG6MLYZY
 QakVr8dUEuNoTWPbjdKDs1kqoZd8fYrMCj4P3vfh8FLSk/tnpgOqWjD1lxIj3+L1fsLC
 Pb4g4n19IJCR2rITETuUvxeszS75EE6CF4ThaMSPlBDQITlEfzrt04QluCBLIJwiSHyp /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gs71tm7t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 17:21:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BED210002A;
 Mon, 20 Jun 2022 17:21:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83EDA22D195;
 Mon, 20 Jun 2022 17:21:44 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.117) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 17:21:44 +0200
Message-ID: <3d992f4d-e494-86d0-9e43-a4912f87e1d0@foss.st.com>
Date: Mon, 20 Jun 2022 17:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220615233310.90593-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220615233310.90593-1-marex@denx.de>
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix SPI2 pinmux pin
	comments
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

On 6/16/22 01:33, Marek Vasut wrote:
> Those pin comments refer to SPI2 pins, not SPI1 pins, update the comments.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 4f671045a0818..2cc9341d43d29 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1866,30 +1866,30 @@ pins {
>   
>   	spi2_pins_a: spi2-0 {
>   		pins1 {
> -			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI1_SCK */
> -				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
> +			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
> +				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
>   			bias-disable;
>   			drive-push-pull;
>   			slew-rate = <1>;
>   		};
>   
>   		pins2 {
> -			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
> +			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
>   			bias-disable;
>   		};
>   	};
>   
>   	spi2_pins_b: spi2-1 {

I don't have this reference (spi2-1). Do I miss something ?

>   		pins1 {
> -			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI1_SCK */
> -				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
> +			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
> +				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
>   			bias-disable;
>   			drive-push-pull;
>   			slew-rate = <1>;
>   		};
>   
>   		pins2 {
> -			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
> +			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
>   			bias-disable;
>   		};
>   	};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
