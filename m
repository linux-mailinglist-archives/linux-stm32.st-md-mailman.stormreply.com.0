Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32532221CEC
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jul 2020 09:00:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEE1AC36B29;
	Thu, 16 Jul 2020 07:00:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FA97C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jul 2020 07:00:34 +0000 (UTC)
Received: from Mani-XPS-13-9360 (unknown [157.50.199.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE6DC2064C;
 Thu, 16 Jul 2020 07:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594882833;
 bh=Qct6MZ1QaNERKb7aX6s5WHVRW6dIsCv2vuonJPxJwfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U46Azy+KKOewokELUn/94s4XOAIPTR23B1XiYwcSU/SqGgvTviw/VrHQv4h4JAwxI
 wjE6GyCvV6HKwjzn5dKgNnCkbJzbhtwsy3ltt/SLMdTQfMi1u9QGm29qLwlNnbCDmD
 xXPwaj0ZHWxvERqvk5uXNHDsvxDfP2xDGK098dA0=
Date: Thu, 16 Jul 2020 12:30:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200716070025.GF3271@Mani-XPS-13-9360>
References: <20200708114324.7309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708114324.7309-1-patrick.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Correct spi4 pins in
 stm32mp15-pinctrl.dtsi
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

On Wed, Jul 08, 2020 at 01:43:24PM +0200, Patrick Delaunay wrote:
> Move spi4_pins_a nodes from pinctrl_z to pinctrl
> as the associated pins are not in BANK Z.
>

Yikes, that's a nasty misplacement! Thanks for fixing.

> Fixes: 498a7014989dfdd9a47864b55704dc829ed0dc90

Fixes tag should be of below:

Fixes: 498a7014989d ("ARM: dts: stm32: Add missing pinctrl entries for STM32MP15")

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> 
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 28 ++++++++++++------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 7eb858732d6d..6aedbd7077ff 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1574,6 +1574,20 @@
>  		};
>  	};
>  
> +	spi4_pins_a: spi4-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
> +				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
> +			bias-disable;
> +		};
> +	};
> +
>  	usart2_pins_a: usart2-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
> @@ -1776,18 +1790,4 @@
>  			bias-disable;
>  		};
>  	};
> -
> -	spi4_pins_a: spi4-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
> -				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
> -			bias-disable;
> -		};
> -	};
>  };
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
