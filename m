Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69321E5ED
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 04:49:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F36C36B29;
	Tue, 14 Jul 2020 02:49:17 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B7DBC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 02:49:15 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id o3so12998662ilo.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2020 19:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DdQRU+re2daApc1buZh/NOScJMoADL35yGQLsQdXB0M=;
 b=WYWmEOvPVEs/+jUgDkbFN2voiDOffT+s1Da0xJXG6NDdI8SGnBs5CNhBSddeLqKMrL
 8p/te+WZK2yINVF1BgBEVvH0ldECM/mJDTjMEtbWxOq78vzuz6jQYoWISXbU5RjvA+lJ
 U+Erz2cvANlhGBmntul1YTtpnjUa3tPTfvRChuRNYK/tg7mbziAft+gCEAWU0tNaci6W
 hztyOC+oAHzi7ptfebDe5A/PBNMvPXlccHePk3saWa29yzCH84mtzntXY5BSnmMl6AEo
 KLGlXytiF0PkxEYg0rWEsq5V4Q+xj2E4/FDQuelkE9HlHfO72cdxH9Pwy7yqAfYPyfuB
 WxhA==
X-Gm-Message-State: AOAM532ntqQQ7/1USA9q4oqR3Y9ZmT3K0sKgdTyTfa42VphdfPSzj0l7
 bzO9t0XKylLmraPW8mvqiw==
X-Google-Smtp-Source: ABdhPJz9igZQqkIyHCZ5N1hs9WTl0MnTGAZmaW5l4R56IePZCqGF6EM/cUpsjUEx18PhvChQvcjoqA==
X-Received: by 2002:a92:c00d:: with SMTP id q13mr2499962ild.222.1594694954000; 
 Mon, 13 Jul 2020 19:49:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id f18sm8489104ion.47.2020.07.13.19.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 19:49:13 -0700 (PDT)
Received: (nullmailer pid 1187292 invoked by uid 1000);
 Tue, 14 Jul 2020 02:49:12 -0000
Date: Mon, 13 Jul 2020 20:49:12 -0600
From: Rob Herring <robh@kernel.org>
To: Adrian Pop <pop.adrian61@gmail.com>
Message-ID: <20200714024912.GA1184333@bogus>
References: <20200702172714.158786-1-pop.adrian61@gmail.com>
 <20200702172714.158786-2-pop.adrian61@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702172714.158786-2-pop.adrian61@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Jul 02, 2020 at 08:27:14PM +0300, Adrian Pop wrote:
> STM32f769-disco features a 4" MIPI DSI display: add support for it.
> On Cortex-M7 DMA can't use cached memory. For this reason I use a dedicated
> memory pool for DMA with no-cache attribute which is located at the end of
>  RAM.
> 
> Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
> ---
>  arch/arm/boot/dts/stm32f746.dtsi      | 34 +++++++++++++++++++
>  arch/arm/boot/dts/stm32f769-disco.dts | 49 +++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> index 93c063796780..577a812ca01c 100644
> --- a/arch/arm/boot/dts/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/stm32f746.dtsi
> @@ -48,6 +48,19 @@ / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		linux,dma {

Build your DT with W=1. This will have a warning.

> +			compatible = "shared-dma-pool";
> +			linux,dma-default;
> +			no-map;
> +			reg = <0xc0f00000 0x100000>;
> +		};
> +	};
> +
>  	clocks {
>  		clk_hse: clk-hse {
>  			#clock-cells = <0>;
> @@ -75,6 +88,27 @@ clk_i2s_ckin: clk-i2s-ckin {
>  	};
>  
>  	soc {
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
>  		timer2: timer@40000000 {
>  			compatible = "st,stm32-timer";
>  			reg = <0x40000000 0x400>;
> diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
> index 1626e00bb2cb..a9e81b49809c 100644
> --- a/arch/arm/boot/dts/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/stm32f769-disco.dts
> @@ -153,3 +153,52 @@ &usbotg_hs {
>  	pinctrl-names = "default";
>  	status = "okay";
>  };
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

Don't need status. Enabled is the default.

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
> -- 
> 2.27.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
