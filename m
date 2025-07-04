Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 395FFAF8E53
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 11:22:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4012C35E3F;
	Fri,  4 Jul 2025 09:22:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2680C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 09:22:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZvmT028297;
 Fri, 4 Jul 2025 11:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xsJ35DXIFyb8IUUDkRLbnd+X8cIaumQnRj2kaGGtJi8=; b=sNef83OIHgj3F115
 o4AALg+zZxQDdJCTO6KCuqgN/pa5mBGofZMlMVo+nveSjlE5cIFp4k8voMjRgUd9
 nFbIfhETkVp2+ZH3XAYApA6FgTFwhVfzudS0Ai1+wz373rWqbrUws4vo4K6MPyuT
 5jotQEMIhZG/ggNhBMCXEh3hiurcV8nK8Amcjy96DMGzMQXjj8Cnb0OGW5EncJAT
 hKb7F7T6VtpEmcu7Mx2k9o6NqSGRm4ue7qI7TYkcwTDszxDDfGekhrj/cSZFZwgO
 PIlXznP+370DUfnC5BpQ2oeuVy2jNhWPMk0FahSGvblDDyolZ8dU2dCHFOpSXfN4
 AwvQ2w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmmj89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 11:22:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 53E7D4004F;
 Fri,  4 Jul 2025 11:21:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60B8BA5594F;
 Fri,  4 Jul 2025 11:20:37 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:20:36 +0200
Message-ID: <ec89779f-2193-42a1-b980-de904be9d388@foss.st.com>
Date: Fri, 4 Jul 2025 11:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Olivier Moysan <olivier.moysan@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250521150418.488152-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250521150418.488152-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add
 system-clock-direction-out on stm32mp15xx-dkx
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

Hi Olivier

On 5/21/25 17:04, Olivier Moysan wrote:
> The commit 5725bce709db
> ("ASoC: simple-card-utils: Unify clock direction by clk_direction")
> corrupts the audio on STM32MP15 DK sound cards.
> The parent clock is not correctly set, because set_sai_ck_rate() is not
> executed in stm32_sai_set_sysclk() callback.
> This occurs because set_sysclk() is called with the wrong direction,
> SND_SOC_CLOCK_IN instead of SND_SOC_CLOCK_OUT.
> 
> Add system-clock-direction-out property in SAI2A endpoint node of
> STM32MP15XX-DKX device tree, to specify the MCLK clock direction.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> index a5511b1f0ce3..c74e36676d1b 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> @@ -515,6 +515,7 @@ sai2a_endpoint: endpoint {
>   				remote-endpoint = <&cs42l51_tx_endpoint>;
>   				dai-format = "i2s";
>   				mclk-fs = <256>;
> +				system-clock-direction-out;
>   				dai-tdm-slot-num = <2>;
>   				dai-tdm-slot-width = <32>;
>   			};

Applied on stm32-next.

Thanks !!
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
