Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6024198B02
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:13:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 620A1C36B0B;
	Tue, 31 Mar 2020 04:13:24 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 336D6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:13:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 22so9701483pfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+OJAcK9vuUh2eZ2xf+ImnOd/B9bsqmjxoIB8uGrB1fk=;
 b=K+xdyeFAzZknu1SssKl0JANLQ0AEz4lbBWnDWdU+OxTib+3PfH6PsQNOTPcVkxFVKR
 QtH902B7EDp/tGu6f6ynjV7Hmv8l9vEIrtIerBLjFu2+CH5E6s4T7nfZS6WEl4TaT92h
 Y44XfZKAbBAo3KHREO9V8DWy81Wpb58BXjpWY7yuS+oiI2H8eEDyKeHeRWxDj7IAYwRu
 qq5ApLlaZRMcmKpxt2Mo/whCGjTbybkMVSk1wtKxZ3dJEVSL2xpyx0tLFaMvaTLff0z8
 PTopuEJ8C/VZ2m233haN7N1bIjIs/UzqoCPfAuEi3PeuqgalvITXn+rB8GAhfx4lnaHt
 GoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+OJAcK9vuUh2eZ2xf+ImnOd/B9bsqmjxoIB8uGrB1fk=;
 b=VKUD1Ucst590HI3rvrwLZm4WH0BTyVyWRilAx107BCEv8CHW1DRhZ50f42oaKIhgdg
 0i+Rlk8njc1UAwR2FU2DLbReC7a+T1um7cVIBZTq077F/PMfsmcrNCV7v85jsE1M2G+A
 HNu1Y9RUmN354GyVRnVVhnLPlFoCKyAvXNr13w/v5+gQaQIUDxfsbfVDWDXEz2ijPh8z
 1w95FyKXAXj4YqqMciWbRB7vn18KQJc1jzSp8nw/UejCni3ko0aF+uEkVYkHuw9ryUWp
 DwooEVHjO7pQjmKOObqqu29brla/0MLv3Xdqu6dzI65tveBKafiruoOSCiU7lTX7pzkS
 lbew==
X-Gm-Message-State: ANhLgQ1tRo+w2k9SukVgzEtJaDGlpi9lSNeK0/kPgW2s0lpREMI/Boca
 CfUKeuH/2W983/c/SXC1oPDG
X-Google-Smtp-Source: ADFU+vsrIFyboLyg57kEr85d9ydwcsSitFBjLAdRWZuBGBNejWStZ3jPNdFjzU2++hmb84cKG5LASg==
X-Received: by 2002:a62:ed19:: with SMTP id u25mr16220469pfh.114.1585628000578; 
 Mon, 30 Mar 2020 21:13:20 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id j126sm11097325pfg.60.2020.03.30.21.13.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:13:20 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:43:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331041313.GC14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-2-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-2-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 01/22] ARM: dts: stm32: Add alternate
 pinmux for ethernet RGMII
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

On Tue, Mar 31, 2020 at 02:56:40AM +0200, Marek Vasut wrote:
> Add another mux option for DWMAC RGMII, this is used on AV96 board.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> ---
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 51 ++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 73c07f0dfad2..4569dc16e5a1 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -196,6 +196,57 @@ pins1 {
>  		};
>  	};
>  
> +	ethernet0_rgmii_pins_b: rgmii-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
> +				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('B', 12, AF11)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('G', 11, AF11)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('H', 6, AF11)>, /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
> +				 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
> +			bias-disable;
> +		};
> +	};
> +
> +	ethernet0_rgmii_pins_sleep_b: rgmii-sleep-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
> +				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('B', 12, ANALOG)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
> +				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
> +				 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
> +		};
> +	};
> +
>  	fmc_pins_a: fmc-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
