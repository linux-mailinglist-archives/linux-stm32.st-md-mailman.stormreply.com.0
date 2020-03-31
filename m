Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C201198C83
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 08:47:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D92F8C36B0B;
	Tue, 31 Mar 2020 06:47:58 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F948C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 06:47:57 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i13so9890775pfe.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xzBzTtyv/ik/5EBBE5B9QBIPXEM25PMpqUtEZkO+j2o=;
 b=YWiJoWdxOokr0IV/cq7x5S7oImQ3xpSnBWJaj/CnjT9pp1xdd61+UWDi4ViiQoAXeC
 RIk6lzC2DdfPIEjFecCeaTAk3EHi9Ivm30yknHCQUtMXrC+gmtxNKep1BuDiBX2MbBDe
 v/KaqM9xH/cOJv38hF6Wfgx6IJMQiklpPy1fv/QRIWXaBbj/q6JEvJB5lmPBbx+dJgzz
 SEa3LZlJ3FGT7zIrO6uFSAFN3O8ncCy0ARu+niB3CeiEEmsrsbkBHiSi1atwPNptN5zy
 8La0T84o34UgCrlbYm649ZDPs37IqnM0gtSJHoAChDFAG3GfoOqpPjv2vGAgmJW2VCNJ
 0qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xzBzTtyv/ik/5EBBE5B9QBIPXEM25PMpqUtEZkO+j2o=;
 b=ZARNCcYuAofIe3OCxTSDLmHtm0OfQIiKHjAiQifur3so1BKt8t92qycLYa5EJoA8D7
 Oc+DgbRJryjBcLJUrSZd0QCQ+JgyxkLm0xJ2afeHU6QxpSeWmJkxRgkRFjEEMwEzGfTh
 Itx2bRh6bnQ+Vr3FtuHeSem8GACPoxBSQQrPLeQ0OQqArUbzD7DJ/HU5vQC7bgnXSb6h
 GAjctZ1VBeaiLoywR9/lG3i5yy13NGiQrL/eNp3ONiIB+O8zm22YssdUOp2DBHqIH+Je
 LZTcvOgfXYmtV4ivx7Owx7F6RADqoZ3bC67MVA92AXeIV5itwaNWrArq7l7uebJvgHd9
 8Ktg==
X-Gm-Message-State: AGi0PuaDoGmZYnQwhDoU30rPE12k2yqOeyUyuSDawduL9H1pFSm01x+o
 qDlCLSiaHfm0w3Wzhgz/vpJm
X-Google-Smtp-Source: APiQypIEAbi6y8ZieLWWZV5hNFsKxVPMpUpaUafWP3vaBcDMbP+sPBBj/4VNd+xWoSMenMebveeTjQ==
X-Received: by 2002:a63:1053:: with SMTP id 19mr2930152pgq.60.1585637276025;
 Mon, 30 Mar 2020 23:47:56 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id h11sm11741855pfq.56.2020.03.30.23.47.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 23:47:55 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:17:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331064749.GF17400@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-18-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-18-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 17/22] ARM: dts: stm32: Enable
	Bluetooth on AV96
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

On Tue, Mar 31, 2020 at 02:56:56AM +0200, Marek Vasut wrote:
> The WiFi/Bluetooth chip is attached to USART2 on AV96 as well, describe
> it in DT to make it available. Remove BT LED and turn it into a shutdown
> GPIO, because the GPIO line controls the BT_REG_ON signal. The LED is just
> an indicator connected to the same line, but not the primary function.
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
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 23 ++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 12ee95d5adb1..29af5ed2ebb3 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -21,6 +21,7 @@ aliases {
>  		mmc0 = &sdmmc1;
>  		serial0 = &uart4;
>  		serial1 = &uart7;
> +		serial2 = &usart2;
>  		spi0 = &qspi;
>  	};
>  
> @@ -63,13 +64,6 @@ led4 {
>  			default-state = "off";
>  			panic-indicator;
>  		};
> -
> -		led5 {
> -			label = "blue:bt";
> -			gpios = <&gpioz 6 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "bluetooth-power";
> -			default-state = "off";
> -		};
>  	};
>  
>  	sd_switch: regulator-sd_switch {
> @@ -421,3 +415,18 @@ &uart7 {
>  	pinctrl-0 = <&uart7_pins_a>;
>  	status = "okay";
>  };
> +
> +/* Bluetooth */
> +&usart2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&usart2_pins_a>;
> +	pinctrl-1 = <&usart2_sleep_pins_a>;
> +	st,hw-flow-ctrl;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		max-speed = <3000000>;
> +		shutdown-gpios = <&gpioz 6 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
