Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1E6C14EB
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 15:37:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D919BC6A5F6;
	Mon, 20 Mar 2023 14:37:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F1FAC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 14:37:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KCvn1f031691
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 20 Mar 2023 15:37:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wJpFpNQDFRCPo1QMp+2gARfdxAgny+w2V6hC2nmAz+0=;
 b=nETLjjk2Hi4akpZVU4d7VlbogJpuXCsoD2z2oMh5lW5FqqkdmfxqSgj3rkygFzFb/FH5
 zKMImJWY0deP8RmoEW7UUdZq4YLpWk15bEx6kX3ieyD2ahEKq9Nor2QYPkuB2bTp1FKN
 MIRBlPnGNZFj12Uvgk1v+qt7AkBA6P1D/7FzHLSmCA39np3lp2tV16KyEEBoRSvsMrck
 3VyO4hvzzP2RXqYC3NANR0Gc//4UHCde/T0PAfE05MOC2Ki3OJmvvREhtuuttlHsm6iK
 onqk8QbnoGHpKQcU94FFavnXyYDBXtmdz35C2GjoIjOUx/Y9qvLLPnK4Ep3HVw5Hmeso IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pd3kq3ped-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 20 Mar 2023 15:37:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A5831000A7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 15:37:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E197321A22D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 15:37:18 +0100 (CET)
Received: from [10.252.0.87] (10.252.0.87) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 20 Mar
 2023 15:37:18 +0100
Message-ID: <755b2129-8e60-cc3b-fca6-823a6a575d5d@foss.st.com>
Date: Mon, 20 Mar 2023 15:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: <linux-stm32@st-md-mailman.stormreply.com>
References: <20230320132755.2150384-1-s.trumtrar@pengutronix.de>
 <20230320132755.2150384-3-s.trumtrar@pengutronix.de>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20230320132755.2150384-3-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.252.0.87]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_10,2023-03-20_02,2023-02-09_01
Subject: Re: [Linux-stm32] [PATCH v5 02/10] ARM: dts: stm32: Add alternate
 pinmux for sai2b
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

Hi Steffen,

You can add my:
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs
Olivier

On 3/20/23 14:27, Steffen Trumtrar wrote:
> Add another option for the SAI2B pins.
> 
> This is used on the Phycore STM32MP1.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 1c97db4dbfc6d..0062f8ea17aab 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1491,6 +1491,30 @@ pins {
>   		};
>   	};
>   
> +	sai2b_pins_d: sai2b-3 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('H', 2, AF10)>, /* SAI2_SCK_B */
> +				 <STM32_PINMUX('C', 0, AF8)>, /* SAI2_FS_B */
> +				 <STM32_PINMUX('H', 3, AF10)>; /* SAI2_MCLK_B */
> +			slew-rate = <0>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
> +			bias-disable;
> +		};
> +	};
> +
> +	sai2b_sleep_pins_d: sai2b-sleep-3 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* SAI2_SCK_B */
> +				 <STM32_PINMUX('C', 0, ANALOG)>, /* SAI2_FS_B */
> +				 <STM32_PINMUX('H', 3, ANALOG)>, /* SAI2_MCLK_B */
> +				 <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
> +		};
> +	};
> +
>   	sai4a_pins_a: sai4a-0 {
>   		pins {
>   			pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
