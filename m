Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE98B1D47
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 11:02:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1F4AC7128B;
	Thu, 25 Apr 2024 09:02:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA840C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 09:02:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P7j7b9021437;
 Thu, 25 Apr 2024 11:02:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=r1ywst7LmHOnYaZwIPJ1djb4oIlKtBFwHRQjCkXMxNg=; b=rC
 6bMU6s9O14XtLRBbCQ+no3+xP+0AT2n5uU8O96Qrgc8WUu8GN4aTvdeXTGw2hYUH
 jZYFk2npsHF1iDyPMmPoNfMd2WeBfgkrt4LhS+hIZy+GVx6dwMX77mmD76OpmmmN
 LriNdsYKIaIV8XQLxBmB3PthbtyuTbmBiMrysKNwllSDHPROtt/51bBwhgeIMjRW
 rLsLXmEJ0e8ujvIlptlgk3ifXpvoB0fBNR5da23gtY4reP3I3fmzRzDG3wRG9+4e
 BEpMAT+oY5Tim5FUJQkCgSI9j7tP/RWapWZSpNSsL65C+rf28N7Bh2lA+3AMYVYc
 9CtTSn/7CekuXf6wX3VQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm51wd3gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 11:02:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D41E440044;
 Thu, 25 Apr 2024 11:02:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8FA82165EB;
 Thu, 25 Apr 2024 11:01:56 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 11:01:56 +0200
Message-ID: <138ac6aa-a633-459b-9315-db255e26053b@foss.st.com>
Date: Thu, 25 Apr 2024 11:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240424185329.1.I0e240ebf31af03c7c5b932e36d1d34a5fad576d2@changeid>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240424185329.1.I0e240ebf31af03c7c5b932e36d1d34a5fad576d2@changeid>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_09,2024-04-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] arm64: dts: st: correct masks for GIC PPI
 interrupts on stm32mp25
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



On 4/24/24 18:53, Patrick Delaunay wrote:
> Using GIC_CPU_MASK_SIMPLE(x), x should reflect the number of CPUs.
> STM32MP251 is a single core Cortex A35, STM32MP253 is a dual core CA35.
> 
> Fixes: 5d30d03aaf78 ("arm64: dts: st: introduce stm32mp25 SoCs family")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++----
>   arch/arm64/boot/dts/st/stm32mp253.dtsi | 7 +++++++
>   2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index af1444bf9442..ee29c838900b 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -109,10 +109,10 @@ psci {
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupt-parent = <&intc>;
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
>   		always-on;
>   	};
>   
> diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> index af48e82efe8a..029f88981961 100644
> --- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> @@ -20,4 +20,11 @@ arm-pmu {
>   			     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
>   		interrupt-affinity = <&cpu0>, <&cpu1>;
>   	};
> +
> +	timer {
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
>   };

Applied on stm32-next.

thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
