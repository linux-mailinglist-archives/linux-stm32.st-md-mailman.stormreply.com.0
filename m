Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE295A2566E
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 10:56:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80B76C78F7C;
	Mon,  3 Feb 2025 09:56:03 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 175B2CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 09:55:56 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5139ernf019717;
 Mon, 3 Feb 2025 10:55:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0cuvriwkfmJtYDf/PvfPdgkXE5JOeO4tCaf0VGbGxw8=; b=B+EYdwgsPHVgdja7
 /tM1un0H4BDPuz5/xqTHZ4trEFd6/GdBrgwYtTiL8xHE5RzyUapg2Aem88ApycUD
 088YeFbZKk49NPUzt0Ud01Chz/HqNF7NJl8+x1c0U5xf/vltcfSTjEX0bFQrNWgP
 FGiwgZOYE0a7+pxqR8fTCZ5UOmcKytBLuIFkYrXi/Lvf+5OgMqrFmWHX028c2UC7
 wuA/SLoMhDu9Gge/FhMuDmVxuG93gSqUV43wE4CIvYh2V7ogOr4NG0pOA+0CsHce
 4cdE0UJWseqXGQoeq07/wYE+iyxDmNCnoeQSRR1pa0IYlZHUOfstZGWNvjtxmNbw
 a/WQNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44hyemkh9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2025 10:55:51 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E3D640062;
 Mon,  3 Feb 2025 10:54:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54D9E28EA95;
 Mon,  3 Feb 2025 10:51:49 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:51:48 +0100
Message-ID: <7b225c1d-3026-455a-bb7c-3af72184ab54@foss.st.com>
Date: Mon, 3 Feb 2025 10:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Parant <c.parant@phytec.fr>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20250110150216.309760-1-c.parant@phytec.fr>
 <20250110150216.309760-5-c.parant@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250110150216.309760-5-c.parant@phytec.fr>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH 04/11] ARM: dts: stm32mp15: Add new pinmux
 groups for phycore and phyboard
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

Hi Christophe

On 1/10/25 16:02, Christophe Parant wrote:
> Add add alternate pinmux for following interfaces used on
> phyBOARD-Sargas:
> - UART4
> - LTDC
> - DCMI
> - TIM5
> - SAI2
> 
> Fix "ethernet0_rgmii_pins_d" pinmux used on phyCORE-STM32MP15x:
> ETH_RGMII_GTX_CLK pin was missing.
> 
> Signed-off-by: Christophe Parant <c.parant@phytec.fr>
> ---
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 164 ++++++++++++++++++++
>   1 file changed, 164 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
> index 95fafc51a1c8..7b1063295da6 100644
> --- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
> @@ -216,6 +216,45 @@ pins {
>   		};
>   	};

...

> +	/omit-if-no-ref/
> +	uart4_idle_pins_e: uart4-idle-4 {
> +			pins1 {
> +					pinmux = <STM32_PINMUX('B', 9, ANALOG)>; /* UART4_TX */
> +			};
> +			pins2 {
> +					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> +					bias-disable;
> +			};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_sleep_pins_e: uart4-sleep-4 {
> +			pins {
> +					pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* UART4_TX */
> +							 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */

Check indent here.

> +			};
> +	};
> +
>   	/omit-if-no-ref/
>   	uart5_pins_a: uart5-0 {
>   		pins1 {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
