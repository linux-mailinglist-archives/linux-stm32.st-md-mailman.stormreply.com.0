Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD2198C78
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 08:44:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDDCCC36B0B;
	Tue, 31 Mar 2020 06:44:05 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F267EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 06:44:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b1so9903670pgm.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z+ad/AWMVaWRvptdozo50uEsB6n25R2bp8xmB/EVVHI=;
 b=cK6WXAGJWAgkLzgsTyMMFHsNdm+WOz51RJktFnvwl5kknooE3uxcdncHymwx0+W8np
 DgCZ0yEqr7jBUgc5TPLUcJ9tDGq8zBdsYUEy6XWJ5/2jcK2eSA6j5rXDHiqFgn28Ig01
 QDrpxppXZmOfVv6Chd+NsPOlopFtactyfHdLN8/e1ngRzQYThBUl4H3zSpEziIJHDDtX
 ckvtc4089MHhQajo0K4Er1k3eGjEzyXVWNtnMt/JwsQe6FAZbKczfKJBxWmgbmSHZcDj
 p9V3FOOjIjHZrgViBM3ChaUMoMb7HHeXf4isI2272dVHFAX/UazhUumrIwgs6axYSUwh
 2W/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z+ad/AWMVaWRvptdozo50uEsB6n25R2bp8xmB/EVVHI=;
 b=A3auA2mSE/oCkCToc8vAFSHgp7e4r6ofdwkgE5ZdO+Tw5bwtdjYODb6QlpIQ4ZjH94
 VtBQnFWKb5h34NOUJnRcZjXW62Hg/lsbbUuNeRNG49Oyy/PEY7H0Ulq0KJ0Oe7lAp7pm
 SEk660g/2w8AKNJiNZuQpqqFWTHXgdoSoNNgJb+63p6MeR0ef685HlNFC1ZoLqn60ZMq
 ip3/OAiRWj7DLZ7e6CzkkFwxt8IyXuB1wn7E8xVmDpN4PN0eOZkbpWfDpmbnDXSFwJlh
 BD/B8UiJZH6UNQ3mB89K2xNGBmagP/0CD31F7llPJVDyNf4iHzBKAtLRx6PxPdKVyShD
 dCPg==
X-Gm-Message-State: ANhLgQ0TveWP7pUmixP6W0YfSVKXJaYBKa40Fe4shHi4hKvqz4xjxi2R
 nZtlCk2amGU7ySd4l+Jn2uQE
X-Google-Smtp-Source: ADFU+vscCJ2nCjmi6TZ6TEEmlGsEhXPbM6dqLetJ/Oov7NHmHbKjjP0RJGQtbtda/pJrVNsroQQKjg==
X-Received: by 2002:a62:16d2:: with SMTP id 201mr15765745pfw.295.1585637042073; 
 Mon, 30 Mar 2020 23:44:02 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id i13sm7454761pfa.113.2020.03.30.23.43.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 23:44:01 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:13:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331064356.GD17400@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-16-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-16-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 15/22] ARM: dts: stm32: Enable WiFi on
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

On Tue, Mar 31, 2020 at 02:56:54AM +0200, Marek Vasut wrote:
> The WiFi/Bluetooth SDIO chip is attached to SDMMC3 on AV96, describe it
> in DT to make it available. Remove WiFi LED and turn it into a regulator,
> because it is a GPIO controlling the WL_REG_ON input of the WiFi chip.
> The LED is just an indicator connected to the same line, but not the
> primary function.
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
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 38 +++++++++++++++++----
>  1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 3aeb3afa37d9..12ee95d5adb1 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -65,13 +65,6 @@ led4 {
>  		};
>  
>  		led5 {
> -			label = "yellow:wifi";
> -			gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "phy0tx";
> -			default-state = "off";
> -		};
> -
> -		led6 {
>  			label = "blue:bt";
>  			gpios = <&gpioz 6 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "bluetooth-power";
> @@ -103,6 +96,17 @@ vdd_io: regulator-buck-io {
>  		regulator-boot-on;
>  		vin-supply = <&vdd>;
>  	};
> +
> +	wlan_pwr: regulator-wlan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "wl-reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
>  };
>  
>  &ethernet0 {
> @@ -382,6 +386,26 @@ &sdmmc2 {
>  	status = "okay";
>  };
>  
> +&sdmmc3 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc3_b4_pins_b>;
> +	pinctrl-1 = <&sdmmc3_b4_od_pins_b>;
> +	pinctrl-2 = <&sdmmc3_b4_sleep_pins_b>;
> +	broken-cd;
> +	non-removable;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&wlan_pwr>;
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	brcmf: bcrmf@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
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
