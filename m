Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C39662D5
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 15:25:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D906C6DD9A;
	Fri, 30 Aug 2024 13:25:49 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D96B5C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 13:25:42 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UCSfch029881;
 Fri, 30 Aug 2024 15:25:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 o8btpO/cONHa3wl5inFcEt9BpKOPAQfxu+XbhlGEgtM=; b=1pFTjjXkj2hjXyBR
 wx+fKlVjN/2TSAXHk3z4YlXRpVRgpS+2jnJ8SPBq4WbvS85xHM/hN6NFfrI2OBdm
 jkWf9L7av8Bhb7/lQNmFW98ACaGnFXKF0dc16Wv5lID35CjzQSaUH1ANU4YPcugI
 3U0NJOtkengoyb1gPPx7yMnbjF1WXM7AvM1u2TMO+zZIcF1S6F4LM3wR/HD1vRlX
 oH3J7AQelWwoKEk0tOyffzEO4BmMnDJK24AfEaonzMmkzTTZ958ies+cZWbbZ2dD
 xxHIflAb2Aoux4jLPJXRYPmIFFQA0nmtotcAP0Goyy3uFnGKYG8JFl1LOcQZKtAw
 RPR7uA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41b14tb40r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 15:25:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 243BB4002D;
 Fri, 30 Aug 2024 15:25:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2E4C2681BF;
 Fri, 30 Aug 2024 15:24:28 +0200 (CEST)
Received: from [10.252.31.165] (10.252.31.165) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 15:24:28 +0200
Message-ID: <9961070c-9e8e-454d-ae85-4759da4b4e79@foss.st.com>
Date: Fri, 30 Aug 2024 15:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20240709121619.1588520-1-sean@geanix.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240709121619.1588520-1-sean@geanix.com>
X-Originating-IP: [10.252.31.165]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_08,2024-08-30_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add missing gpio options
 for sdmmc2_d47_pins_d
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

Hi Sean

On 7/9/24 14:16, Sean Nyekjaer wrote:
> This enables DDR50 mode for the eMMC on Octavo OSD32MP1-RED board.
> 
> Fixes: be78ab4f632c ("ARM: dts: stm32: add initial support for stm32mp157-odyssey board")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
> index ae83e7b10232..70e132dc6147 100644
> --- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
> @@ -2229,6 +2229,9 @@ pins {
>   				 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
>   				 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
>   				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
>   		};
>   	};
>   

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
