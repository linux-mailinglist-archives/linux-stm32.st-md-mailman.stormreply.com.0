Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F06227B65
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 11:09:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A5CC36B2A;
	Tue, 21 Jul 2020 09:09:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 868CAC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 09:09:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L96o3N027673; Tue, 21 Jul 2020 11:09:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=3P6/CzI3nOMFBgAbJEh+SX9yJmO1KrFcTfM3aEnWuYw=;
 b=ozzmk79VdzsCLnZCUcx9GYPD52vFRITbbof6astgSHfxSf8gTuAmXiUuqy9W7sr+VLbB
 VuwC1+YIFSzLQ6lD8BGN6xiclI748KLvATyE5WFKWLwCOvA9vu2Y8YEpr/sSQVQ8wxyn
 wsrKJ6AsSsASzwmT8Fg8J3mXEbJ4x6l9Yg8/kX9Qn+/qTOz1R4fBNVGIdPqg+kmpJPo/
 PNOsBk9A773g60rmYIQ2oxdvwM6m/Wfp95oPOcaSXfBp6A7/Il908wNpSgDRZOC9T655
 uT6R3EVbXNENdb6PSFtHoMjAspspMVTjgx8QhWT5F8GLuWR/1LL3eqIXXFDXPVa9VttU CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsagw303-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:09:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6E2A100038;
 Tue, 21 Jul 2020 11:09:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C10AB2A8D8F;
 Tue, 21 Jul 2020 11:09:23 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 11:09:23 +0200
To: Adrian Pop <pop.adrian61@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Lee Jones
 <lee.jones@linaro.org>
References: <20200702172714.158786-1-pop.adrian61@gmail.com>
 <20200702172714.158786-2-pop.adrian61@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c9d8bfaa-9958-ad65-e59c-4f8a7ffdf208@st.com>
Date: Tue, 21 Jul 2020 11:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200702172714.158786-2-pop.adrian61@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ARM: dts: stm32: Enable MIPI DSI
	display support.
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

On 7/2/20 7:27 PM, Adrian Pop wrote:
> STM32f769-disco features a 4" MIPI DSI display: add support for it.
> On Cortex-M7 DMA can't use cached memory. For this reason I use a dedicated
> memory pool for DMA with no-cache attribute which is located at the end of
>   RAM.
> 
> Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
> ---
>   arch/arm/boot/dts/stm32f746.dtsi      | 34 +++++++++++++++++++
>   arch/arm/boot/dts/stm32f769-disco.dts | 49 +++++++++++++++++++++++++++
>   2 files changed, 83 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> index 93c063796780..577a812ca01c 100644
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
> +			reg = <0xc0f00000 0x100000>;
> +		};
> +	};
> +

Please check Rob's remark (make W=1). Furthermore this node should be 
declared in board dts file is should depend on SDRAM size embedded on board.

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

Nodes are ordered by address in soc dtsi file. Please follow it.

>   		timer2: timer@40000000 {
>   			compatible = "st,stm32-timer";
>   			reg = <0x40000000 0x400>;
> diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
> index 1626e00bb2cb..a9e81b49809c 100644
> --- a/arch/arm/boot/dts/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/stm32f769-disco.dts
> @@ -153,3 +153,52 @@ &usbotg_hs {
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
> +		reg = <0>;
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
> +	status = "okay";
> +
> +	port {
> +		ltdc_out_dsi: endpoint {
> +			remote-endpoint = <&dsi_in>;
> +		};
> +	};
> +};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
