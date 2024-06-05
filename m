Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D02828FC49B
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 09:33:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73E9EC6C855;
	Wed,  5 Jun 2024 07:33:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82309C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 07:33:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4556wo3X011636;
 Wed, 5 Jun 2024 09:33:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 A92N7DPum6K04dYwwSpN0JFQag+xU5B+2EfbUCGJxNg=; b=1REWpAQWm2p2T0On
 KccqSPZclAb+9kHh80SD9w4iLaDLQ2TuUka/m0AIabxG74+gLuQDQ0OT4pGZY1sk
 L5XlRBnq52WYRNk/8eaHWpzNFlhB6hYJhDuY2OQWzx2W//u2esWmnnJJMqqsxM0b
 Ub4Bw77wb5TNg170CZY1AOErIjKgnTRS9R+x+pMiNJOB0wIpSPbX3IJyowN4uwSK
 1bYhYFiwUv6s9BML8joNzmKas+BtcSxjhWa1AZVNq+PAsSGPfX7QY36Fp5wKXLFy
 wKtCh1RnkUF1QVWeoSmjAFikzD+UcGaXcfjopxLbIAI1eQt3nd8dvYl0CkKiBycn
 R20jqw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yg7r06bm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 09:33:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9CE2540045;
 Wed,  5 Jun 2024 09:33:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D8FE2115E2;
 Wed,  5 Jun 2024 09:32:36 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 09:32:35 +0200
Message-ID: <314f1f33-7f6b-4b10-a05e-f9e0d5456e31@foss.st.com>
Date: Wed, 5 Jun 2024 09:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <gabriel.fernandez@foss.st.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Dan Carpenter <dan.carpenter@linaro.or6g>
References: <20240529131310.260954-1-gabriel.fernandez@foss.st.com>
 <20240529131310.260954-4-gabriel.fernandez@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240529131310.260954-4-gabriel.fernandez@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] arm64: dts: st: enable STM32
 access controller for RCC
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

Hi Gabriel

On 5/29/24 15:13, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Use an STM32 access controller to filter the registration of clocks.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index dcd0656d67a8..602d02efc202 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -441,6 +441,7 @@ rcc: clock-controller@44200000 {
>   				<&scmi_clk CK_SCMI_TIMG2>,
>   				<&scmi_clk CK_SCMI_PLL3>,
>   				<&clk_dsi_txbyte>;
> +				access-controllers = <&rifsc 156>;
>   		};
>   
>   		exti1: interrupt-controller@44220000 {

Applied on stm32-next.

cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
