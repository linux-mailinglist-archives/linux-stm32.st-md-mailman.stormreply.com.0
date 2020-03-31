Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87305198C7E
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 08:46:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF6AC36B0B;
	Tue, 31 Mar 2020 06:46:50 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7865CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 06:46:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id h11so7746248plr.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ozvP2af89tauDdl3uwnfBwoXG01io6pHPiam1L9z8h0=;
 b=joKWJfXn0RRBCCYer0QQpI5clTHBMrOBU81FoGWbvYbTztY9663GnwVeTNOWbjukiN
 pT1xT8xuMA1a8oPVgqshm+GFz+MSKuf0u8oj9j2kgqIKKqhrIWfZFzkJZeXqEJowmkdI
 ByQ3YUogfrpOdaZyySGP8KkXZtFyq11iuz640qeJg0mg9JZih7Sg2aZCDjPHaviua5d/
 V54oWU/nMHrGvRFab0joFjvLkLgd5R/Hed0pnHNEnAXiON/vCitkoEHQucLku7UkyFya
 LaNWAojX8AGC7+j/zS3iP+/iEGR3lcmR5ohdl+KvE8LB+kbmOvdDXWB4vXSoTkiaHsDp
 Jpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ozvP2af89tauDdl3uwnfBwoXG01io6pHPiam1L9z8h0=;
 b=VRA35PGhgtOJw+rzvzLnstQVE53LHHt0LNfEeYmGy262ctyK+qQeS76kcDnJ9X1gn2
 bNh40AetFWX2jH/jWcpA6NrpqmLchNLRf8YLWxjcHdFvbHGYAxsX3uQz8SnOQyf2do5N
 Mi/CzVUxB+zSNd73NnPJzhJi/AICnO+S1CAR8abbsonZhUyz1DGlnqYufr30ee/Xo99d
 B7OuJESxHd8z/5VaAIGzdN2DAXKA3qWC/qg62Wn/oSbcjZ+G0L1fSDBxbogs8zXo0NZg
 89+AaTcz+FRSL8D0Le3xZARZzuqQnnpgTQpoy2lFYpP//rXX4pLemyfOf1vSbgrzbMGc
 iaQw==
X-Gm-Message-State: ANhLgQ1VoWlfgOlIy/OWlGJc8b9ADiJu33b5AExBsdjTTH+m8pD6X/1M
 8LTl8ZbdwuZwi039aiDbN5AE
X-Google-Smtp-Source: ADFU+vvgBzkgIbpFBd6cy7s7oA9i/Y2hvnVHA/LEq2oeOUqVKEAGpbz9kF7MFwbhGRlCmXwub+2Xkg==
X-Received: by 2002:a17:902:b113:: with SMTP id
 q19mr15697950plr.202.1585637205753; 
 Mon, 30 Mar 2020 23:46:45 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id d26sm11641709pfo.37.2020.03.30.23.46.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 23:46:44 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:16:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331064638.GE17400@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-17-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-17-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 16/22] ARM: dts: stm32: Add alternate
 pinmux for USART2 pins
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

On Tue, Mar 31, 2020 at 02:56:55AM +0200, Marek Vasut wrote:
> Add mux option for USART2 pins, this is used on AV96 board.
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
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index f3f9fc4a3503..4f3b40d5751f 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1204,6 +1204,30 @@ pins {
>  		};
>  	};
>  
> +	usart2_pins_a: usart2-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
> +				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
> +				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart2_sleep_pins_a: usart2-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
> +				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
> +				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
> +				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
> +		};
> +	};
> +
>  	usart3_pins_a: usart3-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
