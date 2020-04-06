Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6054419F04C
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 08:25:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15C4AC36B0B;
	Mon,  6 Apr 2020 06:25:10 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69D24C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 06:25:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c20so7043737pfi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Apr 2020 23:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SwRnMHrrRPFwcR/UVU/6SoqwmQfw/mrKNkhaRPco2G0=;
 b=r7YfxMgY9GHw01vR75xMnw5tvYS/W55Pu1w0/p8MT+U5DZYWQ33DMqrJdPWF2bATui
 dNdNteN5UyPjxKazCPYjEP5lwXSkG14yG16TB7m6t3aqMkBdwx2+3aNMHHJUY+MMr6kU
 rwFQQLttCrVVM0JmdoncduruJGNDBhnRUg1j9PmH/EwZ+wWMt34br8Kq6IvDPwpOoyNw
 IqN9WqMrYM08OrKnqKojc64H/lxojDP5pRPtvR00F0uXlbe6VCNRXmvsFUO8oBElfZ5s
 KgG4mM2Ab0dE9KRxIgdfMNBEOsaTo9qyYXhkVgENAY2m/+QwUVKVD8xupXAZL1G42Xr0
 GW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SwRnMHrrRPFwcR/UVU/6SoqwmQfw/mrKNkhaRPco2G0=;
 b=f1lCSBX2yWkADonUBHeKr7JkvhPFVRIgtkNWt3JKmxj/gW0QpmM0594sDSdlnnHTeE
 QfqWGOlfsa1Y/vhSwOdBGITA6IuV8cjEKq7KkHiW2op2+zTQM/RmOop2CMR6UZ3bD8x8
 DWObSguw91S9X4mvovTXpvaUVocV6YH1qUH2arTeGcyJbEzhIHA9we87oCSzP93X/48l
 2WgcejwAmsA7lIia8hGc14cwgcahc6fWFClx4LQXhEwqAfdqo/+kO2jz3r4FGhSHjgjG
 WVlTPvvp3ISr3piarH6BxSVdqgloFefy8V63XA/l79bznD8VwqcAwasADqpny3rn05o1
 9+pw==
X-Gm-Message-State: AGi0PuaAQMT+97aNXLayZIiCeflbs6SHmUL3jE4k7pGveEkiAZ207/4W
 0zaHKxawzymd9/lJhxYOJctI
X-Google-Smtp-Source: APiQypLI2KEsiOIato+Be+sFRZsyceTFufCm6dUg+LuwT6AfwBM1VoVWJ3cUpOabZZCqrChVioQLKg==
X-Received: by 2002:a63:700f:: with SMTP id l15mr16817684pgc.375.1586154306692; 
 Sun, 05 Apr 2020 23:25:06 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id np4sm11714918pjb.48.2020.04.05.23.25.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 23:25:05 -0700 (PDT)
Date: Mon, 6 Apr 2020 11:54:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406062459.GC2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-7-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-7-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 06/22] ARM: dts: stm32: Repair SDMMC1
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

On Wed, Apr 01, 2020 at 03:22:21PM +0200, Marek Vasut wrote:
> The SD uses different pinmux for the D123DIRline, use such a pinmux,
> otherwise there is a pinmux collision on the AV96. Add missing SD
> voltage regulator switch.
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
> V2: Disable SDR104, it seems unstable thus far
> V3: No change
> V4: Rebase on stm32-next
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index edcc57864495..a6f21ac5a94a 100644
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
> @@ -304,9 +318,9 @@ &rtc {
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
>  	disable-wp;
>  	st,sig-dir;
> @@ -314,6 +328,7 @@ &sdmmc1 {
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
