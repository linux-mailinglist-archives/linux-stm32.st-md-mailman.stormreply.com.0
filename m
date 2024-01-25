Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E464C83C617
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 16:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 984EAC6B476;
	Thu, 25 Jan 2024 15:08:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B01AC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 15:08:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PF6dnU032526; Thu, 25 Jan 2024 16:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=8rJa20GotSKJ5iYLJMiNzR9xpxHOsQ8NoAB1sa07s0g=; b=D7
 TTtkalkFoqSjrmtTbzqkEYWf0T9ZV2gREaUJrJBA6R89gghKylLEWavUGl/yhfUW
 LsgT5tRu2FGKkxLV1YcVYsM5qdum550LZMRIjjN6PVF0GH59+luVtlAwZVYlLyQk
 C/Lh5MyAQbLXsHzvuGtWWFUrMsJSCP/H96EhyIAQdPywk6mPj6PJ7h+xrjKFvRHO
 HEE2ccs/0GVK33P/2T81jub7vFEW+mBGdeEBMkU7HeFUcoz4YU6xvi0nTzmnABgg
 W7hJ+DOKNnajkVafpjnInEiAIRNaTEehwt0TUZVVX/aEiwBvJamIQOf9JadE4lFW
 Wb0fmGr/Ojqv837nFzYQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vtmf9gpa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 16:08:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B2EF10005D;
 Thu, 25 Jan 2024 16:08:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54B5429D7EE;
 Thu, 25 Jan 2024 16:08:10 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 25 Jan
 2024 16:08:09 +0100
Message-ID: <bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.st.com>
Date: Thu, 25 Jan 2024 16:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
 <20240104134434.744497-5-raphael.gallais-pou@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240104134434.744497-5-raphael.gallais-pou@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/4] arm: dts: st: fix DSI peripheral
 clock on stm32mp15 boards
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

Hi

On 1/4/24 14:44, Raphael Gallais-Pou wrote:
> In RCC driver, 'DSI_K' is a kernel clock while 'DSI' has pclk4 as parent
> clock, which means that it is an APB peripheral clock. Swap the clocks
> in the DSI peripheral clock reference.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---

After updating commit title:

Applied on stm32-next.

Thanks
Alex

>   arch/arm/boot/dts/st/stm32mp157.dtsi          | 2 +-
>   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 2 +-
>   arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 2 +-
>   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 2 +-
>   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157.dtsi b/arch/arm/boot/dts/st/stm32mp157.dtsi
> index 6197d878894d..97cd24227cef 100644
> --- a/arch/arm/boot/dts/st/stm32mp157.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp157.dtsi
> @@ -20,7 +20,7 @@ gpu: gpu@59000000 {
>   		dsi: dsi@5a000000 {
>   			compatible = "st,stm32-dsi";
>   			reg = <0x5a000000 0x800>;
> -			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
> +			clocks = <&rcc DSI>, <&clk_hse>, <&rcc DSI_PX>;
>   			clock-names = "pclk", "ref", "px_clk";
>   			phy-dsi-supply = <&reg18>;
>   			resets = <&rcc DSI_R>;
> diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> index afcd6285890c..8634699cc65e 100644
> --- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> @@ -30,7 +30,7 @@ &cpu1 {
>   };
>   
>   &dsi {
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
> index 39358d902000..3a897fa7e167 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
> @@ -36,7 +36,7 @@ &cryp1 {
>   
>   &dsi {
>   	phy-dsi-supply = <&scmi_reg18>;
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> index 07ea765a4553..29d6465b1fe6 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> @@ -35,7 +35,7 @@ &cryp1 {
>   };
>   
>   &dsi {
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> index 813086ec2489..5acb78f0a084 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> @@ -37,7 +37,7 @@ &cryp1 {
>   
>   &dsi {
>   	phy-dsi-supply = <&scmi_reg18>;
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
