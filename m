Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AF8FC565
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 10:09:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD528C6C855;
	Wed,  5 Jun 2024 08:09:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB949C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 08:09:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4557koNd013306;
 Wed, 5 Jun 2024 10:08:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LeQEzYZve89QVXcn8RulqOlwly2vbEhfirVc4S0tvq0=; b=InuT3Skthn7AKw5j
 VvZORuChatpzNr2TAmakZJ5BIIINPGE1d8JIwTvaNmXtgYD/IJVia0eaG9rRw54H
 sdFTm1vyvh7/YtpfItJVGN2rlXyuAvFpqNJo2AINuuUay6YarvNqMa9K7F6hjNRS
 PXYdlAPBTeOFlmFftChE/8pSYtYodzAzrfycbK0a+ZZAsvA/UuCeF4e28cnY6ttD
 rjbo4sysR6MjH0sa5WR6fM8HBfjpKslagsHPuWjStUSECNGS8t7MOgVTkqGIWJ09
 PkMe3XLd40ur7E0q7lgOi2/FGwcMRuQdWR685bwxa262h2EyDqKXfeiBMaO7KAxk
 oPAIcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw30fd55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 10:08:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68D2940045;
 Wed,  5 Jun 2024 10:08:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA9D7211F0C;
 Wed,  5 Jun 2024 10:08:21 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 10:08:21 +0200
Message-ID: <802522eb-c226-446c-b03a-ebe6f511ddcf@foss.st.com>
Date: Wed, 5 Jun 2024 10:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240425174519.1.I443a218decda670093bc621165e3052db14d4c02@changeid>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240425174519.1.I443a218decda670093bc621165e3052db14d4c02@changeid>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] arm64: dts: st: add power domain on
	stm32mp25
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

Hello Patrick

On 4/25/24 17:45, Patrick Delaunay wrote:
> Add power domains on STM32MP25x SoC for supported low power modes:
> - CPU_PD0/1: domain for idle of each core Cortex A35 (CStop)
> - CLUSTER_PD: D1 domain with Stop1 and LP-Stop1 modes support when
>    the Cortex A35 cluster and each device assigned to CPU1=CA35
>    are deactivated
> - RET_PD: D1 domain retention (VDDCore is reduced) to support
>            the LPLV-Stop1 mode
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 

Applied on stm32-next.

Thanks!!
Alex


>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp253.dtsi |  9 +++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index af1444bf9442..4beb0a0bef4f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -18,6 +18,8 @@ cpu0: cpu@0 {
>   			device_type = "cpu";
>   			reg = <0>;
>   			enable-method = "psci";
> +			power-domains = <&CPU_PD0>;
> +			power-domain-names = "psci";
>   		};
>   	};
>   
> @@ -104,6 +106,20 @@ intc: interrupt-controller@4ac00000 {
>   	psci {
>   		compatible = "arm,psci-1.0";
>   		method = "smc";
> +
> +		CPU_PD0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +		};
> +
> +		CLUSTER_PD: power-domain-cluster {
> +			#power-domain-cells = <0>;
> +			power-domains = <&RET_PD>;
> +		};
> +
> +		RET_PD: power-domain-retention {
> +			#power-domain-cells = <0>;
> +		};
>   	};
>   
>   	timer {
> diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> index af48e82efe8a..79c02ef2e51e 100644
> --- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> @@ -12,6 +12,8 @@ cpu1: cpu@1 {
>   			device_type = "cpu";
>   			reg = <1>;
>   			enable-method = "psci";
> +			power-domains = <&CPU_PD1>;
> +			power-domain-names = "psci";
>   		};
>   	};
>   
> @@ -20,4 +22,11 @@ arm-pmu {
>   			     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
>   		interrupt-affinity = <&cpu0>, <&cpu1>;
>   	};
> +
> +	psci {
> +		CPU_PD1: power-domain-cpu1 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +		};
> +	};
>   };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
