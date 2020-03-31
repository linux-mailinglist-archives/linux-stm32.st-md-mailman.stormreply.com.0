Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EB198C71
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 08:40:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99A12C36B0B;
	Tue, 31 Mar 2020 06:40:58 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3B38C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 06:40:55 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ng8so665462pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NMixT5EyaYc59LtBYv/IS9+oVWN+dyQvKFglLW9hNR8=;
 b=PrNSmbVf32WLlENs27teTJaSQfj1vc/sbohunckkJp9nTim8JjO3nHFo9BSawhBL2S
 zclu+fux4K2RVn+D05aK4GziYUlYU4VjvpUAlEE8u6nqipiTT7cwPjd6eXV6RTRK0X2M
 u62oZ841WNHdbnh0QdCTqn9HZTP6m4WVOr5LsgN4FUj/9GxuYqhPdCu621JxKjZIak8e
 qaB5t+HhxPcBJCw4M5Au2lBHjDW0FZZrkQqkB0tfSTKe06+BZqBtkyG5QlMHCb5dNVI9
 s+vWTcwT9hhvV1hE/5AIUmLd2PjmoAUphX5jUEOvZttQHjqlqKFzEso/dE+taTXHxLPL
 FPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NMixT5EyaYc59LtBYv/IS9+oVWN+dyQvKFglLW9hNR8=;
 b=tHwQcjd1X+BJoUKhr2xOrBgYZnJgE/q/LRQH9no6pTelkWQnVxTyD+mrQ9uPqYB6iI
 75hV1nsnqWNyTyjpVuVUdIErQ+JFXOqrZsITc+oc/qLYOWtcWV7qnNtSuX2xuXAmzr+T
 enOIa0FvadROXWxrC3yLOPK6cx3vwrl8TKRIdlzXvTxUWzYOXSNJYWgm9ekU5XSNMyrO
 6oZbs+iJMxdFci44ipxM/zlcxc1s16i2xVXIPlz814AkkziaCa4NsqX+DTUwyK8+eGRQ
 mk97heS90gGhdiuZk/PimgbXFV83D8zw7IiyqdMicvlv5W8ZWyjr3PSkS/z0T3kMTZIq
 CVWA==
X-Gm-Message-State: AGi0PuYHn6j2bAoQT0y0h76790aM74yPeRWJ4zoIzEYbqdHBAvzqWn8l
 aY6PquxBnUbG3aJhrvOL188w
X-Google-Smtp-Source: APiQypINjHafIOsXhyHeCgBp4iX7F7FlFDW8eO+YYZJby8ZiKp5j6fUGl1wRfmCmgCq9cp/Q2gPwlA==
X-Received: by 2002:a17:90a:4d43:: with SMTP id
 l3mr2013351pjh.165.1585636854015; 
 Mon, 30 Mar 2020 23:40:54 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id s22sm658195pfh.18.2020.03.30.23.40.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 23:40:53 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:10:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331064047.GC17400@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-15-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-15-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 14/22] ARM: dts: stm32: Add alternate
 pinmux for SDMMC3 pins
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

On Tue, Mar 31, 2020 at 02:56:53AM +0200, Marek Vasut wrote:
> Add another mux option for SDMMC3 pins, in particular PD5_SDMMC3_D2 and
> PD0_SDMMC3_CMD, this is used on AV96 board.
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
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 54 ++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index ec3621e0ff08..f3f9fc4a3503 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1137,6 +1137,60 @@ pins {
>  		};
>  	};
>  
> +	sdmmc3_b4_pins_b: sdmmc3-b4-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
> +				 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
> +				 <STM32_PINMUX('D', 5, AF10)>, /* SDMMC3_D2 */
> +				 <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
> +				 <STM32_PINMUX('D', 0, AF10)>; /* SDMMC3_CMD */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc3_b4_od_pins_b: sdmmc3-b4-od-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
> +				 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
> +				 <STM32_PINMUX('D', 5, AF10)>, /* SDMMC3_D2 */
> +				 <STM32_PINMUX('D', 7, AF10)>; /* SDMMC3_D3 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* SDMMC2_CMD */
> +			slew-rate = <1>;
> +			drive-open-drain;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc3_b4_sleep_pins_b: sdmmc3-b4-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC3_D0 */
> +				 <STM32_PINMUX('F', 4, ANALOG)>, /* SDMMC3_D1 */
> +				 <STM32_PINMUX('D', 5, ANALOG)>, /* SDMMC3_D2 */
> +				 <STM32_PINMUX('D', 7, ANALOG)>, /* SDMMC3_D3 */
> +				 <STM32_PINMUX('G', 15, ANALOG)>, /* SDMMC3_CK */
> +				 <STM32_PINMUX('D', 0, ANALOG)>; /* SDMMC3_CMD */
> +		};
> +	};
> +
>  	spdifrx_pins_a: spdifrx-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
