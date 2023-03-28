Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A446CBB39
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 11:39:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 114FAC69069;
	Tue, 28 Mar 2023 09:39:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C77EEC65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 09:39:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32S8TEUR024888; Tue, 28 Mar 2023 11:39:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0RJ1bAOEsbrbBUbktgDCARu+ofitrNwEQZP29DHw0Xc=;
 b=FclllhCUSri2Sw8fWEu0rOCbbZELP+Wy/xR6/0eWvq4Q/agWyfx2GZEh5kMzDX3xvo/W
 /V/OA2zJQYmJvEiCVTuza6/33lH4ND65i75ZWVj36rHJvP15PLOM+2Vj4uOfmoE9RP2f
 zxNkgrXmSVRCcf4skHXVmRofVhDg0Qn1wHhFHAf3JhBBWgEw3B9RC56LgO398QXP8cSD
 oG0LCCT5jWKnk/hJoxi1ZVPbVWwg4xRu3g77ZkQihSuI/dC8sEAx9MxrH1XlON2RwADG
 r8GSuebN4fW5SKtpY2ZpILEAsXULJ20g7c3rzSl3evTOoP2hV/wqU0mzm1NdJvHFCbq2 bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkvs4rhjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:39:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCE9C10002A;
 Tue, 28 Mar 2023 11:39:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2B1521160B;
 Tue, 28 Mar 2023 11:39:20 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 11:39:20 +0200
Message-ID: <30a9f919-ff6b-57cf-de34-e145a4474643@foss.st.com>
Date: Tue, 28 Mar 2023 11:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <linux@rempel-privat.de>
References: <20230320171123.6263-1-alexandre.torgue@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230320171123.6263-1-alexandre.torgue@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix spi1 pin assignment
	on stm32mp15
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

On 3/20/23 18:11, Alexandre Torgue wrote:
> Bank A and B IOs can't be handled by the pin controller 'Z'. This patch
> assign spi1 pin definition to the correct controller.
> 
> Fixes: 9ad65d245b7b ("ARM: dts: stm32: stm32mp15-pinctrl: add spi1-1 pinmux group")
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index a9d2bec99014..e15a3b2a9b39 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1880,6 +1880,21 @@
>   		};
>   	};
>   
> +	spi1_pins_b: spi1-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 5, AF5)>, /* SPI1_SCK */
> +				 <STM32_PINMUX('B', 5, AF5)>; /* SPI1_MOSI */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 6, AF5)>; /* SPI1_MISO */
> +			bias-disable;
> +		};
> +	};
> +
>   	spi2_pins_a: spi2-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
> @@ -2448,19 +2463,4 @@
>   			bias-disable;
>   		};
>   	};
> -
> -	spi1_pins_b: spi1-1 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('A', 5, AF5)>, /* SPI1_SCK */
> -				 <STM32_PINMUX('B', 5, AF5)>; /* SPI1_MOSI */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -
> -		pins2 {
> -			pinmux = <STM32_PINMUX('A', 6, AF5)>; /* SPI1_MISO */
> -			bias-disable;
> -		};
> -	};
>   };

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
