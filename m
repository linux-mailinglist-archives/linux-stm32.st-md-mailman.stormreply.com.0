Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D80DA727B51
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 11:29:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87BADC6905A;
	Thu,  8 Jun 2023 09:29:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86651C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 09:29:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3586H0pE024757; Thu, 8 Jun 2023 11:28:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F4pyCRuUe4o5DvW+WPN9psEiiRx1S0h4gHiilDLeFmg=;
 b=a+CM1Dls4E1UlSBY2eXE9rvEHh/69PRSgv3kX5sfQXEdjRWXoHXAxYyTW8PcHqdD+gED
 6VAeTMXOhzVZ25IIvcPrLjjaDLstAOgTuMF1dNY7V24CEKoreiZQYeJlVpreI7IPTiDn
 7o6cgN9vmjl3WOv7QtORqAxQXlxgdzjFDWDf2RIsT1UxPsBzVmquUV/Z4y+im8jIna8U
 6qpmOjtMLRbFz0J6p7lNHhXP/frsFrIMmP2i+I1b4XzY9FR0TJXH8PsHUHVyS/sfss9H
 pkCahOp+b0r4MiodhMpMoNB3mv0Pe27HzC3o/RGY5F16FdWEeMi+o9Mau7vTrjq2UfSe gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r348936kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 11:28:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E98510002A;
 Thu,  8 Jun 2023 11:28:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3607A21D3FA;
 Thu,  8 Jun 2023 11:28:34 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 11:28:33 +0200
Message-ID: <6b6ed9e3-c420-8777-3c39-5fe558077388@foss.st.com>
Date: Thu, 8 Jun 2023 11:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20230606180112.215896-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230606180112.215896-1-marex@denx.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_06,2023-06-07_01,2023-05-22_02
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix audio routing on
 STM32MP15xx DHCOM PDK2
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

On 6/6/23 20:01, Marek Vasut wrote:
> The audio routing flow is not correct, the flow should be from source
> (second element in the pair) to sink (first element in the pair). The
> flow now is from "HP_OUT" to "Playback", where "Playback" is source
> and "HP_OUT" is sink, i.e. the direction is swapped and there is no
> direct link between the two either.
> 
> Fill in the correct routing, where "HP_OUT" supplies the "Headphone Jack",
> "Line In Jack" supplies "LINE_IN" input, "Microphone Jack" supplies "MIC_IN"
> input and "Mic Bias" supplies "Microphone Jack".
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> index 4709677151aac..46b87a27d8b37 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> @@ -137,10 +137,13 @@ reg_panel_supply: regulator-panel-supply {
>   
>   	sound {
>   		compatible = "audio-graph-card";
> -		routing =
> -			"MIC_IN", "Capture",
> -			"Capture", "Mic Bias",
> -			"Playback", "HP_OUT";
> +		widgets = "Headphone", "Headphone Jack",
> +			  "Line", "Line In Jack",
> +			  "Microphone", "Microphone Jack";
> +		routing = "Headphone Jack", "HP_OUT",
> +			  "LINE_IN", "Line In Jack",
> +			  "MIC_IN", "Microphone Jack",
> +			  "Microphone Jack", "Mic Bias";
>   		dais = <&sai2a_port &sai2b_port>;
>   		status = "okay";
>   	};

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
