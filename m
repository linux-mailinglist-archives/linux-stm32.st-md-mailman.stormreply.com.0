Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD1F19F0B4
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 09:24:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5D72C36B0B;
	Mon,  6 Apr 2020 07:24:11 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 359AEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 07:24:10 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id m17so1115919pgj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Apr 2020 00:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cvdiiK8A3JfX89bAM/u1sbYNdDSep2Av2QFgQXdtYrM=;
 b=tAoEfKySvi5LDswAHvkoW/8ngcqm+NeEur0VYfo62g7qmEAbreqA5S1+7wEDFeJboI
 U2a1vWqACk6zF8t/rfwVfFrFMfHGrXDD9fP+T1GqNDUNDdqkrLk28wYV41boMO+7ML/3
 HgD1wnIsTuuVoQrQy+tkWpJPrKr9mPE1ZHJ3epoyYItf1+hiQqw4BhgEUFeXZ9kQ+ilD
 e+G+extmXUk/lBsB3jIRgnhGbZH3JWq7OxhGeQzR8lVNppf0t920ExjMqrNQqdC4r/pg
 cCS8OEdlfW6hgwslzzh5UcWTKPNHshdJUPeTh10xa+l/ZdK0PNpr6duA1ieshzHEkA9Z
 GHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cvdiiK8A3JfX89bAM/u1sbYNdDSep2Av2QFgQXdtYrM=;
 b=dFptARw1+coGed50AlJAH53X8QmEgt++Uu0ZXnNN5Kwr2Ko8AlclNCwOVWhdY6T6w+
 Rx0T13rBSCfm4DH41vzE6roQlUgu5pRaXNYWrrMQDuVLqM1EkgGIH411Uu1LEGMvZsnH
 KZkd7+wV9nFYvq+6/TJBeTjpBCs0gjEbG0aiL5zGI1QpR+WwdJncnHwiQfXC0NV8qMgx
 7grdqx/CwHKD5R7hldsIuSGWREKdHN2jza7AGVuraawAD9synu0Hu3WRI83CLaYa15c0
 c8OGwQOrdd591+KZPqeOEynETlee/kAx3EpfhBwDCVz15CHUZCBMtvU6Y5kNjRdckYDa
 uqPg==
X-Gm-Message-State: AGi0PuaZWh46bzcwQ20nF0TY99C3MkOlptDLx1XkHj9eGP9V556nVVyX
 bv9wUHhF6hwYZV5pKM5rF8EX
X-Google-Smtp-Source: APiQypJHNV4GcrdOMLjdcSUcX2b+lOkDfpG5uZeoHwrwNHwEWBEMXPmZWfl/FaOJPk437Blp/k7hPw==
X-Received: by 2002:a62:cfc5:: with SMTP id
 b188mr20902217pfg.135.1586157848647; 
 Mon, 06 Apr 2020 00:24:08 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id v8sm7159491pfn.213.2020.04.06.00.24.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 00:24:08 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:54:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406072401.GH2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-23-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-23-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 22/22] ARM: dts: stm32: Rename LEDs to
 match silkscreen on AV96
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

On Wed, Apr 01, 2020 at 03:22:37PM +0200, Marek Vasut wrote:
> The LED labels do not match the silkscreen on the board, fix it.
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
> V3: No change
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 31f23e60629f..9fcc15b6e76d 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -55,21 +55,21 @@ memory@c0000000 {
>  	led {
>  		compatible = "gpio-leds";
>  		led1 {
> -			label = "green:user1";
> +			label = "green:user0";
>  			gpios = <&gpioz 7 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  			default-state = "off";
>  		};
>  
>  		led2 {
> -			label = "green:user2";
> +			label = "green:user1";
>  			gpios = <&gpiof 3 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "mmc0";
>  			default-state = "off";
>  		};
>  
>  		led3 {
> -			label = "green:user3";
> +			label = "green:user2";
>  			gpios = <&gpiog 0 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "mmc1";
>  			default-state = "off";
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
