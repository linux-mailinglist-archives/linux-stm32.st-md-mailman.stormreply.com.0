Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F847198B63
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:43:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BE23C36B0B;
	Tue, 31 Mar 2020 04:43:33 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47DCEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:43:30 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id nu11so558912pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zeAZTOcQMXT5nA+5GmtSltIMIUp94GmpV1W9h0pkYMY=;
 b=ev3qAl7oT4/8F1UfZg/770ctK4+PYkaLVYDZT5o5YPyFUOXH2win/o1ELDSpbC2Yyz
 xOWMZ+4V4cJO3io68zdwBT0iaCSjzDLFpFbWhxjLEqPkgoKKjSCoZ/nkN0VeutZP+9di
 jldEHu7uR4xaeGn+tP0k8r5p8BW7hARhTWvFtTd3SIsI7jINcnTD/15fPsG2+iVejD6k
 17S9LK+f+N1CSOdhEH9IYPfP+yV+sjlEIVlZSjYw6lcWUoBMtCNcnqw9bz6l+ZLETNxu
 e7ftamOKGHD1jlvul1nejz0bvJJM2l3VX7J56nmeo2EqDxcCC3SLXVKKGYCoVvdYhgdu
 jeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zeAZTOcQMXT5nA+5GmtSltIMIUp94GmpV1W9h0pkYMY=;
 b=BaUhfLqljDcbTxD8n8YftsSyfNcOT1UVjNE4R77YT1d5TFc3QzOMSrLbRUbGY/CYnN
 pEy3tyl2J3AwX0UxLoaklNVUbAP+eWRpd+vGF+ZrCh7roR6gWlMo3w9zGofNSFFDWCnF
 tjqyBIg0EJaCOihypEMkx7mmkxwEr0jE0tXC320/607wEeHqhiyhifgd+wVvf/YGRwOS
 DcoyAeS92J3tSL4UevtRFVnPOAAYvjxjvaqPR6JvdppMwHpqspM7xgnaIXJ2blFtoDFs
 mxBFbW16F/G5k1HeUbbG2Q362ZP8+SFcBpT0G9fg6+ZsHi5QQhJ+dHFQXPHDfifaXH95
 5F1g==
X-Gm-Message-State: AGi0PubO2QGnBLL0rAL/W4dWduq2+YxNBhfqZyIuLKdz00aWA+yR0ZZH
 RiGhaMuT07TIcLcioS2BnuvD
X-Google-Smtp-Source: APiQypJRpzBdJ1JJdERj/vam8ih8UjRqlNMs1t79AVs5fpylf2A+UsycAIqR7xycx1qEXq5IeWx/iQ==
X-Received: by 2002:a17:90a:9f88:: with SMTP id
 o8mr1664774pjp.145.1585629809075; 
 Mon, 30 Mar 2020 21:43:29 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id y3sm11358793pfy.158.2020.03.30.21.43.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:43:28 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:13:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331044321.GJ14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-9-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-9-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 08/22] ARM: dts: stm32: Add eMMC
 attached to SDMMC2 on AV96
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

On Tue, Mar 31, 2020 at 02:56:47AM +0200, Marek Vasut wrote:
> Add DT node describing the eMMC attached to SDMMC2 controller
> of the STM32MP1 on DHCOR SoM, which is the SoM soldered on AV96.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
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
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 04280353fdbe..6c34a003c3f6 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -333,6 +333,21 @@ &sdmmc1 {
>  	status = "okay";
>  };
>  
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_b>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_b>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_b>;
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	st,neg-edge;
> +	vmmc-supply = <&v1v8>;

As per the latest schematics, vmmc supply is 3v3 and vqmmc supply is 1v8.
With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +	status = "okay";
> +};
> +
>  &uart4 {
>  	/* On Low speed expansion header */
>  	label = "LS-UART1";
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
