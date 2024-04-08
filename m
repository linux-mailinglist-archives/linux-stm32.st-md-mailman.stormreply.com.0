Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3789BAF3
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 10:55:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 461BCC6DD66;
	Mon,  8 Apr 2024 08:55:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 278B2C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 08:55:43 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4387LkXm002802; Mon, 8 Apr 2024 10:55:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=vqeMlJil1d4Uvh5eSb07G55oP9mOJmKI1taWJJHq3pw=; b=vb
 710pVKG1Jh6EgSswSo4VjZWMn32r8sHQPTp48FWW06zwjdYcrg7Rp140C+WMC6oM
 46YpR7zGQ6vZh1mC07vMmkq7HZcK3E7JvDvaxdrWvzUBtJmKABtxJAihwIcUwVwF
 XX07/T/nUdzErbsa4srelH6Zj6DEecqWnLF52CCAYSjoe3UziIkd0zGyCII2c+p6
 KJs7e9XGYasxi4E36+72yslTqO910vTCBahW2JUaFXOkV3brxOGfXIlOcckr2UCy
 wE+gHn2CbT9+UpBvRBRcec5ZP5/TOmJ67BoGi2OKXJkSB8nRoBYro+dA2rz8fBWs
 c0UXGWgvW1N1jXAmbUqg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbfy0ku7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 10:55:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9C67440045;
 Mon,  8 Apr 2024 10:55:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B70A32138C6;
 Mon,  8 Apr 2024 10:54:51 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:54:51 +0200
Message-ID: <79ec72ab-5451-4743-8cf9-229b8edb2b54@foss.st.com>
Date: Mon, 8 Apr 2024 10:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <patrice.chotard@foss.st.com>, <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20240326075438.2891335-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240326075438.2891335-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: add heartbeat led for
	stm32mp157c-ed1
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

Hi Patrice

On 3/26/24 08:54, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Add heartbeat led for stm32mp157c-ed1.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
> V2 changes :
>    _ add color and function properties.
> 
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
> index 66ed5f9921ba..525d9ca7d576 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
> @@ -10,6 +10,7 @@
>   #include "stm32mp15-pinctrl.dtsi"
>   #include "stm32mp15xxaa-pinctrl.dtsi"
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>   #include <dt-bindings/mfd/st,stpmic1.h>
>   
>   / {
> @@ -24,6 +25,17 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	led {
> +		compatible = "gpio-leds";
> +		led-blue {
> +			gpios = <&gpiod 9 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +			default-state = "off";
> +			function = LED_FUNCTION_HEARTBEAT;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};
> +	};
> +
>   	memory@c0000000 {
>   		device_type = "memory";
>   		reg = <0xC0000000 0x40000000>;

Applied on stm32-next.

thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
