Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56735124D
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 11:33:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62E3CC57B54;
	Thu,  1 Apr 2021 09:33:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE9CAC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 09:33:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1319MkMn028970; Thu, 1 Apr 2021 11:32:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=B5bCLuR+tIRgSSrhoYLefbSqeEQMh0fuudveVqWxlWQ=;
 b=K/Fmz8Qoc3qLv/FCvtoB/NXEIM0I74h9SNS+QrUAw9Hhue/KWWhwjc6kCB0pmPd2V0Fe
 unHhkgCuFv5IAf5doj+V2ik2RCLLSCDNaddErZ2rN7owcRQYf1T8bGcmp40DSFlV7hcF
 rxueidZSQrG3iZb9e7Adwa4HlSE7/4sSP/VJISQW3JJduac1tn1NPxEmcxiVGPaKDbkt
 HcZgtCWbRrelA15ZtG+1H2b3PqQQqddXONM/kOhv1DyHS5+O7HSEb+uq6+kgRvvl7fY+
 rrYhnj9mP1UIX/fEc5mcBWM8Xach47KIUM4KjYWt4C+t2z6L4p2gFnwoPM98BFpWMOSk Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37nbeg83f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 11:32:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 332FB100034;
 Thu,  1 Apr 2021 11:32:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C72522D603;
 Thu,  1 Apr 2021 11:32:59 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 11:32:58 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210325214533.80061-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <1e7f0712-1b02-8e6d-af0b-ce3d46b14a12@foss.st.com>
Date: Thu, 1 Apr 2021 11:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210325214533.80061-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_04:2021-03-31,
 2021-04-01 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable crc1 and cryp1
 where applicable on DHSOM
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

On 3/25/21 10:45 PM, Marek Vasut wrote:
> Enable the CRC accelerator on all STM32MP15xx DHSOM based systems
> and CRYP accelerator on all STM32MP15x[CF] DHSOM based systems.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---

Applied on stm32-next.

Thanks.
Alex


>   arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts   | 4 ++++
>   arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts    | 4 ++++
>   arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts | 4 ++++
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi    | 4 ++++
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi    | 4 ++++
>   5 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts b/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
> index 02a39132958e..b4e504f026ce 100644
> --- a/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
> +++ b/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
> @@ -20,6 +20,10 @@ / {
>   		     "st,stm32mp153";
>   };
>   
> +&cryp1 {
> +	status = "okay";
> +};
> +
>   &m_can1 {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&m_can1_pins_a>;
> diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
> index d3b81382f97c..6dd8216c235e 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
> @@ -20,6 +20,10 @@ / {
>   		     "st,stm32mp157";
>   };
>   
> +&cryp1 {
> +	status = "okay";
> +};
> +
>   &m_can1 {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&m_can1_pins_a>;
> diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
> index cfb8f8a0c82d..7067a860aaff 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
> @@ -20,6 +20,10 @@ / {
>   		     "st,stm32mp157";
>   };
>   
> +&cryp1 {
> +	status = "okay";
> +};
> +
>   &m_can1 {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&m_can1_pins_a>;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 7365be965979..50806c84432a 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -92,6 +92,10 @@ adc2: adc@100 {
>   	};
>   };
>   
> +&crc1 {
> +	status = "okay";
> +};
> +
>   &dac {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index 803eb8bc9c85..013ae369791d 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -21,6 +21,10 @@ memory@c0000000 {
>   	};
>   };
>   
> +&crc1 {
> +	status = "okay";
> +};
> +
>   &dts {
>   	status = "okay";
>   };
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
