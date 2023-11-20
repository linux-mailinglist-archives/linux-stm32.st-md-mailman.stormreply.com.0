Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE07F19C1
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Nov 2023 18:22:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E80EC6B469;
	Mon, 20 Nov 2023 17:22:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FD57C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Nov 2023 17:22:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AKDD7BM009802; Mon, 20 Nov 2023 18:22:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=GN+TExBADZIgD/6fW2Y2dX8Ze6V3absRQgZQuZSO66A=; b=Wi
 2mTdrnU5J4QtQYCFnnmOm/644ZerzdbnFih4XOSa4ig9pICayO0iOd0iOQjIqyN1
 xEythqEmHxFNwpTY38FVNDUJZ72f0iO7/u4M01me5DEgbFu5T01NFAaGgHYv3bpG
 YvClUV9iRld04M5FpUnwx+itlcUw2FzDWd6nZLIIyqUHLV7m10opAmBQkntrv+cu
 qh5nCAaDVzfXdmzCvx6RozkYeQef8Kike0WgsFdIEgLo/P1rYqZ5sTIDXMgN25N6
 yECgAAv4Wl1C5TqvxxL9ObFiSDFiCz+zvxD6TTEEfDbr2AJQvzMZrEUENlU2JN+6
 8mHeW8/T0i+y1B5sWf/Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ueng2fup8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Nov 2023 18:22:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26C0C10002A;
 Mon, 20 Nov 2023 18:22:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1716723BE0A;
 Mon, 20 Nov 2023 18:22:43 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 20 Nov
 2023 18:22:42 +0100
Message-ID: <e0c92ad2-8ca5-4f38-bfca-c1811ba6fd16@foss.st.com>
Date: Mon, 20 Nov 2023 18:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20231108134426.4174699-1-dario.binacchi@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231108134426.4174699-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_17,2023-11-20_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH] ARM: dts: stm32f469-disco: use the
 same 3v3 for SD and DSI nodes
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

Hi Dario

On 11/8/23 14:44, Dario Binacchi wrote:
> In the board schematic, the power supply for the SD card is the same 3.3
> volts used to power the LCD panel and other peripherals. By generalizing
> the name of the voltage regulator, it simplifies the device tree and makes
> it more readable.
> 
> Link: https://www.st.com/en/evaluation-tools/32f469idiscovery.html#cad-resources
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Applied on stm32-next.

Thanks for this clean-up.

Alex


>   arch/arm/boot/dts/st/stm32f469-disco.dts | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
> index cbbd521bf010..8a4f8ddd083d 100644
> --- a/arch/arm/boot/dts/st/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
> @@ -69,16 +69,9 @@ aliases {
>   		serial0 = &usart3;
>   	};
>   
> -	mmc_vcard: mmc_vcard {
> +	vcc_3v3: vcc-3v3 {
>   		compatible = "regulator-fixed";
> -		regulator-name = "mmc_vcard";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -	};
> -
> -	vdd_dsi: vdd-dsi {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vdd_dsi";
> +		regulator-name = "vcc_3v3";
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
>   	};
> @@ -164,7 +157,7 @@ panel@0 {
>   		compatible = "orisetech,otm8009a";
>   		reg = <0>; /* dsi virtual channel (0..3) */
>   		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
> -		power-supply = <&vdd_dsi>;
> +		power-supply = <&vcc_3v3>;
>   		status = "okay";
>   
>   		port {
> @@ -219,7 +212,7 @@ timer@2 {
>   
>   &sdio {
>   	status = "okay";
> -	vmmc-supply = <&mmc_vcard>;
> +	vmmc-supply = <&vcc_3v3>;
>   	cd-gpios = <&gpiog 2 GPIO_ACTIVE_LOW>;
>   	broken-cd;
>   	pinctrl-names = "default", "opendrain";
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
