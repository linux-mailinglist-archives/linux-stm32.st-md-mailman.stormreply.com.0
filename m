Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F58302632
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 15:19:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B26B7C56639;
	Mon, 25 Jan 2021 14:19:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82C21C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 14:19:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PEGlfg032259; Mon, 25 Jan 2021 15:19:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oMdkZm40ACOSf8auj1kXawbXsXZ+gWEYe1elBBMLiag=;
 b=j8cgtIVdYfjqPMV3wigODycdPHCm2aHPbf/+HQ4Uyt0mz+CEozez1LIPnx/D9++Hhmbh
 nr8UZ1mfDwqsorBbgn2y+mHZSky6TzAbyrQLzLCUvyuQ0BYxHAbE6NvQMoqR5tt5b+kW
 5Tr8jP/GJWpc5KmglXnXgD9V1QavGJoNB4oHsaAIkxMPJp2BORCddxvaUV4X9bV3/QfM
 to4MtZZd5JvKyyPGDN3QnStlIL5didXmPUnPf7Be0+CEM2ILe2ZZDGrfbP8ZddAXQ7DT
 ehjVEK/eiyUhVZ0oxgAe8x9i0lkJHBSezFsJwWhLD2L+GfyxSXfPjCS10jXFcHhWzL0f PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3689tdkmvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 15:19:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D07110002A;
 Mon, 25 Jan 2021 15:19:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8974B2AD9F7;
 Mon, 25 Jan 2021 15:19:52 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 15:19:52 +0100
To: Marek Vasut <marex@denx.de>, <linux-mmc@vger.kernel.org>
References: <20210124170258.32862-1-marex@denx.de>
 <20210124170258.32862-4-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <6d8a1479-e9e7-27ad-6d41-d6d0e586c543@foss.st.com>
Date: Mon, 25 Jan 2021 15:19:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210124170258.32862-4-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 4/4] ARM: dts: stm32: Enable voltage
 translator auto-detection on DHCOM
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

On 1/24/21 6:02 PM, Marek Vasut wrote:
> The DHCOM SoM uSD slot has an optional voltage level translator, add
> DT bindings which permit the MMCI driver to detect the translator
> automatically.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: Rebase on next-20210122
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index ff70bd03a017..661d8d071296 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -408,14 +408,19 @@ &rtc {
>   };
>   
>   &sdmmc1 {
> -	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-names = "default", "opendrain", "sleep", "init";
>   	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
>   	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
>   	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
> +	pinctrl-3 = <&sdmmc1_b4_init_pins_a &sdmmc1_dir_init_pins_a>;
>   	cd-gpios = <&gpiog 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>   	disable-wp;
>   	st,sig-dir;
>   	st,neg-edge;
> +	st,use-ckin;
> +	st,cmd-gpios = <&gpiod 2 0>;
> +	st,ck-gpios = <&gpioc 12 0>;
> +	st,ckin-gpios = <&gpioe 4 0>;
>   	bus-width = <4>;
>   	vmmc-supply = <&vdd_sd>;
>   	status = "okay";
> 

DT patches applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
