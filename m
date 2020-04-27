Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B81B9A2E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 10:28:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 846D3C36B0B;
	Mon, 27 Apr 2020 08:28:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30DC2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 08:28:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R8S5vl013283; Mon, 27 Apr 2020 10:28:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Ei68grOKsJeFCI9Ca78skkgOqw6dCGCXLGk/fJEiqBQ=;
 b=sFhbk/PUGRpNN8m9TEoWF1RDKSXWZyAp1ZJqe7r8Zl6YSgIgHU7/LLKpwJ3b45gk2nzv
 ZZMB0BGoLBP9z/Ln1Cwatp3WUkv0pjMiSRYpV95YPvoEahvX6oH7wG+CzsbXHO+P1MVB
 wEzvmrDBGOh48YrNRb8reSLJoSq5b5f46bhkbnPmSMNTZIvEg+nI8agtmaEcz1B6F8Eh
 qIxF0Z5mVwu3dAxH+1CsP/O6scKxCROl3hvX6IRqX5Au0NylIm2HSOqkvA9GZxEFdih0
 eZfhwUrMQePmnshfemoCQMJskFrh5O7ohtRRGzBzH0UFirRLo/g/c9/ND/VhkrkzhCaq UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq5rky9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 10:28:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 906D0100034;
 Mon, 27 Apr 2020 10:28:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D5E52AC589;
 Mon, 27 Apr 2020 10:28:45 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Apr
 2020 10:28:42 +0200
To: Adrian Pop <pop.adrian61@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20200424182139.32190-1-pop.adrian61@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <3efb57a1-283b-f2f0-66a4-97e88c6c02d6@st.com>
Date: Mon, 27 Apr 2020 10:28:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200424182139.32190-1-pop.adrian61@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_03:2020-04-24,
 2020-04-27 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] arm: dts: stm32f769-disco: Enable
 MIPI DSI display support
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

Hi Adrian

On 4/24/20 8:21 PM, Adrian Pop wrote:
> STM32f769-disco features a 4" MIPI DSI display: add support for it.
> 
> Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
> ---

Commit title should be ARM: dts: stm32: ...

Can you explain a bit more in your commit message why do you use a 
reserved memory pool for DMA and where this pool is located. (I assume 
it's linked to a story of DMA and cache memory attribute on cortexM7...)

Did you try this configuration with XIP boot ?

regards
alex

>   arch/arm/boot/dts/stm32f746.dtsi      | 34 ++++++++++++++++++
>   arch/arm/boot/dts/stm32f769-disco.dts | 50 +++++++++++++++++++++++++++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> index 93c063796780..202bb6edc9f1 100644
> --- a/arch/arm/boot/dts/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/stm32f746.dtsi
> @@ -48,6 +48,19 @@ / {
>   	#address-cells = <1>;
>   	#size-cells = <1>;
>   
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		linux,dma {
> +			compatible = "shared-dma-pool";
> +			linux,dma-default;
> +			no-map;
> +			size = <0x10F000>;
> +		};
> +	};
> +
>   	clocks {
>   		clk_hse: clk-hse {
>   			#clock-cells = <0>;
> @@ -75,6 +88,27 @@ clk_i2s_ckin: clk-i2s-ckin {
>   	};
>   
>   	soc {
> +		ltdc: display-controller@40016800 {
> +			compatible = "st,stm32-ltdc";
> +			reg = <0x40016800 0x200>;
> +			interrupts = <88>, <89>;
> +			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
> +			clocks = <&rcc 1 CLK_LCD>;
> +			clock-names = "lcd";
> +			status = "disabled";
> +		};
> +
> +		dsi: dsi@40016c00 {
> +			compatible = "st,stm32-dsi";
> +			reg = <0x40016c00 0x800>;
> +			interrupts = <98>;
> +			clocks = <&rcc 1 CLK_F769_DSI>, <&clk_hse>;
> +			clock-names = "pclk", "ref";
> +			resets = <&rcc STM32F7_APB2_RESET(DSI)>;
> +			reset-names = "apb";
> +			status = "disabled";
> +		};
> +
>   		timer2: timer@40000000 {
>   			compatible = "st,stm32-timer";
>   			reg = <0x40000000 0x400>;
> diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
> index 1626e00bb2cb..30ebbc193e82 100644
> --- a/arch/arm/boot/dts/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/stm32f769-disco.dts
> @@ -153,3 +153,53 @@ &usbotg_hs {
>   	pinctrl-names = "default";
>   	status = "okay";
>   };
> +
> +&dsi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			dsi_in: endpoint {
> +				remote-endpoint = <&ltdc_out_dsi>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			dsi_out: endpoint {
> +				remote-endpoint = <&dsi_in_panel>;
> +			};
> +		};
> +
> +	};
> +
> +	panel: panel {
> +		compatible = "orisetech,otm8009a";
> +		reg = <0>; /* dsi virtual channel (0..3) */
> +		reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
> +		status = "okay";
> +
> +		port {
> +			dsi_in_panel: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&ltdc {
> +	dma-ranges;
> +	status = "okay";
> +
> +	port {
> +		ltdc_out_dsi: endpoint {
> +			remote-endpoint = <&dsi_in>;
> +		};
> +	};
> +};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
