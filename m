Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA48619F075
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 08:50:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86751C36B0B;
	Mon,  6 Apr 2020 06:50:08 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D937FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 06:50:04 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id c5so1250488pgi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Apr 2020 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MMPUB+HHzN7dKOqTTqqjytQFC/PcyTkIQMgPj4MylwE=;
 b=ZnpiPztDgsYw+9vXL2teT93l9k68RjczlGHtwKTcttqmHbOujrN8ZLPXwUCacPhrQk
 xlrdOCrV1EHZq5UWJ0gSnPq92uV9uRH8eeJ3egSo9/R19/5C8Ss/1Qpv17FrkuQpzQdJ
 R17KaGKFx4PVHv+2HGS/AkyySzwT1+mYG2GA4S8GlM0cvqqPiDjl6Z4cYa0ciqX0ZaUW
 kTjrUZEddF78E6elPmevDgZtQU6367DonkkPeAkPs1HcTOl2SUEjbc1MH6QQdc5rikva
 1ZSPii/RuYNN7sKKDM2fGOyyKumqOIbYcz6cKUFEBL5OYxvoyPREFEl1SlPoxPt+j/Es
 FJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MMPUB+HHzN7dKOqTTqqjytQFC/PcyTkIQMgPj4MylwE=;
 b=KhrNpVp+ElXngWmDO7uxEa1zIMft3AOIja+70U/x+qLbLmlJPuFHjgS8zh3N3MKM6r
 FNYEPCrHUTZo4anatfia0TfAlyZXVFn6p/yglHP5V9SXYzU7nVqJccr1IohsY1e870RT
 5VWRoyy9QNGoqQlOml43OOWRsKTo/QurkzK9w8Bnq32E+MyatfD9IhypdUVvjMsWzX3J
 kVAN/cQ7md4HBBH5bKh8jNLg5+M74tdaRS7y/r0DhzWNeHwUFozGciHnBGp3c4MRPNqW
 4YVIgfL8zejbjSugh/SfJ+AbPECDPLgKF9tr5HYYnW0rArfBxcCvl1UibBKqnymtXSvn
 LqWA==
X-Gm-Message-State: AGi0PuZMEsbkGPLbETyu8m0MkEUlvNlDbYP66OZnSAfoFYIEHzpeFFuQ
 I05ZOpgAQQYHNXmYXAo19byL
X-Google-Smtp-Source: APiQypKPJDqADLLcdB+8wh5E+jloFCkTq+rOrF8OZA8T5WTGxGxpOi/+ptvpg/Qra9KNyK/yauiv1w==
X-Received: by 2002:a63:1d52:: with SMTP id d18mr19243226pgm.443.1586155803350; 
 Sun, 05 Apr 2020 23:50:03 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id o5sm9894098pgm.70.2020.04.05.23.49.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 23:50:02 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:19:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406064954.GE2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-12-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-12-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 11/22] ARM: dts: stm32: Add QSPI NOR on
	AV96
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

On Wed, Apr 01, 2020 at 03:22:26PM +0200, Marek Vasut wrote:
> The DH Electronics DHCOR SOM has QSPI NOR on the SoM itself, add it
> into the DT.
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
> V2: Use spi-flash in the DT node instead of explicit model name
> V3: Reduce the SPI controller window to 2 MiB, which is the flash size
> V4: Rebase on stm32-next
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index df68768e8a12..5831280f78ee 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -21,6 +21,7 @@ aliases {
>  		mmc0 = &sdmmc1;
>  		serial0 = &uart4;
>  		serial1 = &uart7;
> +		spi0 = &qspi;
>  	};
>  
>  	chosen {
> @@ -312,6 +313,25 @@ &pwr_regulators {
>  	vdd_3v3_usbfs-supply = <&vdd_usb>;
>  };
>  
> +&qspi {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
> +	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
> +	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	flash0: spi-flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <108000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +};
> +
>  &rng1 {
>  	status = "okay";
>  };
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
