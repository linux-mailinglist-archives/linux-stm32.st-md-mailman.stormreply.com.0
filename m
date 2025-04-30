Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E81AA433D
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 08:42:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 632B3C78F74;
	Wed, 30 Apr 2025 06:42:35 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB46ACFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 06:42:34 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZVDU026607;
 Wed, 30 Apr 2025 08:42:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JzZVq/fjsWYxZI6f7ZSLLSgCG96lHBZGmkDw/IbXKNo=; b=nK98GykpHV+rAGjG
 26I4b5dRGewwj4dKBq7N+81FkrpR4VJ3KlfI5TtWr16oRSUSPiqv/XPO1Ly+5UDO
 YotXr94Aj5pTgbByru/zv2ciJljauu+DBQ9ZXLR5qmUqhumDr9zwDuUOX5LHSfE6
 6LU2JNLKLkZ9B4hHiDjOJZnU2uwomTEV6CKn/OrItvHsZ3qgdLc+Lt30vj+GLV8Q
 f966Irk5NprnPGyS+M7kClmk+kGjgjFd9XgppQVVstm670FDA2tQaWm/6t8f5wYs
 cgvucTmmIn3lX/6sJDaoWSPerGrMBYPePDuGt7Ub7SsHrEThWrDazNPi/0OWW+3/
 umNmvw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmse9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 08:42:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D54DA40050;
 Wed, 30 Apr 2025 08:41:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E054A375E3;
 Wed, 30 Apr 2025 08:39:47 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 08:39:46 +0200
Message-ID: <011681f1-a327-44de-b5d0-5230303f7540@foss.st.com>
Date: Wed, 30 Apr 2025 08:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250404143514.860126-1-ben.wolsieffer@hefring.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250404143514.860126-1-ben.wolsieffer@hefring.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add low power timer on
	STM32F746
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

Hi Ben

On 4/4/25 16:35, Ben Wolsieffer wrote:
> Add device tree node for the low power timer on the STM32F746.
> 
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
>   arch/arm/boot/dts/st/stm32f746.dtsi | 34 +++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
> index 2537b3d47e6f..208f8c6dfc9d 100644
> --- a/arch/arm/boot/dts/st/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/st/stm32f746.dtsi
> @@ -43,6 +43,7 @@
>   #include "../armv7-m.dtsi"
>   #include <dt-bindings/clock/stm32fx-clock.h>
>   #include <dt-bindings/mfd/stm32f7-rcc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>   
>   / {
>   	#address-cells = <1>;
> @@ -245,6 +246,39 @@ pwm {
>   			};
>   		};
>   
> +		lptimer1: timer@40002400 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x40002400 0x400>;
> +			interrupts-extended = <&exti 23 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&rcc 1 CLK_LPTIMER>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			trigger@0 {
> +				compatible = "st,stm32-lptimer-trigger";
> +				reg = <0>;
> +				status = "disabled";
> +			};
> +
> +			counter {
> +				compatible = "st,stm32-lptimer-counter";
> +				status = "disabled";
> +			};
> +
> +			timer {
> +				compatible = "st,stm32-lptimer-timer";
> +				status = "disabled";
> +			};
> +		};
> +
>   		rtc: rtc@40002800 {
>   			compatible = "st,stm32-rtc";
>   			reg = <0x40002800 0x400>;

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
