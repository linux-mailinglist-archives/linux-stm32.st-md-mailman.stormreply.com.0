Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD6198B5A
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:33:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62405C36B0B;
	Tue, 31 Mar 2020 04:33:49 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7465C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:33:47 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id m15so546516pje.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KHj39y5fdH9Uv51+nxOzjv4v2uANykWV5CO0Mi85N6I=;
 b=vCDPFgxTTiWo5KOk4iJIiAKcSrHBIauour4dahxzyJugvrzYps5/MAuuYqxjfbDw/L
 vIYUm9DmpFEqeQts9+aLrGP8wGqW99S6SHoNgxNaIv/ZfefuVRD/2NdqWyNXS36XQM8H
 BCAEiQSZ9faEw9fyxplPGCRUgl4NSnR6BlX+lIPS18Qy4RrGTb+r81D4AlE/ZEPu3hhI
 Fl1vlZUsf/mJTkJl7MmlG7CnPtliOj/5RPyCxZ5cwBhUK1HD7meNEA7ub3RNiyWabNhQ
 v9UMXgxhQGtsgVPLXSFMnGSwMeMtzYoYrqwSOjqbx2/rErLLIURuOL4r/Q4NF2UbRHXt
 NjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KHj39y5fdH9Uv51+nxOzjv4v2uANykWV5CO0Mi85N6I=;
 b=jqQfw6jG9BDIu8Nhn3T0yGDJeMWK7VxLv9fqO8wpZOkQZo/eoe5Iz/cvJGmmYhQY/R
 uPeJ4KRavrGh2URjFOtrzDW5tDRBzRSPIvrJ2wUxDJq0hjDIK9axpSn3drLR9h0m4Cid
 ywRjlWi47cImLwrGcNp2MuFPHovfZy26aLkKdFmrENtVVbVtwtD0UZUrg1LfgzAlgCmf
 9YtIq1piLFYKXHH0Vsmw42ORLX/7g1bdoLfMC4j6o1nrKv5ks5G5Ei7OmefbzHgfvb/w
 TvT7/yXMppzOVQY7yrIdGYmoRj+NQOlfwKAWOOPZa0h5muZsU/3PTg7/3nqyUncB5uKQ
 W3Rw==
X-Gm-Message-State: AGi0Pub5xtA1nMd+jHGrXJhSfdQIoRSx5IGwCnDlJ/Ih4siE1jV7fA8B
 JXq+l38cAQgsb1/EM2JjY6GZ
X-Google-Smtp-Source: APiQypIPQMHA7xCDE37J1tm9V8LvIzT94pFuOlkJKUqV9VsympLng+X6jurgccQ3cev51Tc0bVEhjg==
X-Received: by 2002:a17:90a:868b:: with SMTP id
 p11mr1769236pjn.34.1585629225956; 
 Mon, 30 Mar 2020 21:33:45 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id go9sm850663pjb.27.2020.03.30.21.33.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:33:45 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:03:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331043338.GH14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-7-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-7-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 06/22] ARM: dts: stm32: Repair SDMMC1
	operation on AV96
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

On Tue, Mar 31, 2020 at 02:56:45AM +0200, Marek Vasut wrote:
> The SD uses different pinmux for the D123DIRline, use such a pinmux,
> otherwise there is a pinmux collision on the AV96. Add missing SD
> voltage regulator switch.
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
> V2: Disable SDR104, it seems unstable thus far
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index e58653ccb60f..04280353fdbe 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -77,6 +77,20 @@ led6 {
>  			default-state = "off";
>  		};
>  	};
> +
> +	sd_switch: regulator-sd_switch {
> +		compatible = "regulator-gpio";
> +		regulator-name = "sd_switch";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2900000>;
> +		regulator-type = "voltage";
> +		regulator-always-on;
> +
> +		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <0>;
> +		states = <1800000 0x1>,
> +			 <2900000 0x0>;
> +	};
>  };
>  
>  &ethernet0 {
> @@ -305,9 +319,9 @@ &rtc {
>  
>  &sdmmc1 {
>  	pinctrl-names = "default", "opendrain", "sleep";
> -	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
> -	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> -	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_b>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_b>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_b>;
>  	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;

The "cd-gpios" change is not present in mainline. I think you can add it to
this patch as well with relevant commit description.

With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

>  	disable-wp;
>  	st,sig-dir;
> @@ -315,6 +329,7 @@ &sdmmc1 {
>  	st,use-ckin;
>  	bus-width = <4>;
>  	vmmc-supply = <&vdd_sd>;
> +	vqmmc-supply = <&sd_switch>;
>  	status = "okay";
>  };
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
