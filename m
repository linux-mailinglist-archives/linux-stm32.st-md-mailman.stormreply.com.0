Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB7E198C5E
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 08:35:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44C61C36B0B;
	Tue, 31 Mar 2020 06:35:08 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3569C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 06:35:06 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g2so7754044plo.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P4TjTEWn3ck8x5s4IcpItd1LhZEtYHKZMU09E6GN1j0=;
 b=C4GaVpvEJRwygIyccMeRL35V0FN8wSGmapRh+R8nqP1b9v+NKPKSaAxhaqAG6TddEI
 MQS/IaakuP1sBB1mDwSuoswqLqSJ1jb8NvHi6ilFma/Kgv+e0t9G0hR6dm74ShJuve7c
 JuNLlxRmxRgcbb0iFEk2FrvlNlnB3GMAMJ1QWbm4QzAL25W6WdPazrJhVljnbNH1vK+d
 qsfKhE62EHUGHJHtHuncyvaLQhyKcNEEVsTTPxtjLhW+cXQzVo5Yh28VYidrq2CScpW3
 drve9Ocy7gLxa3uJhen6/FRxwz5Yk35D2DqBrOUZgpO7acMtjQ0jiwWKOFCReiw3IJBu
 Aw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P4TjTEWn3ck8x5s4IcpItd1LhZEtYHKZMU09E6GN1j0=;
 b=HZOKPahhpD+euKZRvnc33Br/tuctc/++G/32lGXD2kRZWtoq6MDTJ3YuPXvdrxYoB3
 +mdsjELT6lJhA6GddkiAFx+WweTQ0c9FTrhHjy+X1ET7V/Oz2UWMpXuWfESVKThP+5/y
 wlkKCyNze9Nahyd7nUXGScQAdPkfWp/bZBc16oINbS1a9Q6IzDrC4TgINSykWYf2GCxM
 GtwomvzgSt8w/T1yGClUpV6eG6gflNN6GDBs3wQeMPxuLh8lMi2/dY8pc3jIAr2aAQtL
 GYneyFhkBSoYZBMjeU1UDjdtOe6GAMm/3NaTV0hKpBYxMcklUWnQ8xxC/hbWw+Rtgi1o
 2uqg==
X-Gm-Message-State: ANhLgQ0W+W/roRQnEPa+xnR5fsRcEGXxfWwZ+NQsd9ZSpMvOxiazNIfM
 5hcqwwf4kYlrwRVpEhbqCPTd
X-Google-Smtp-Source: ADFU+vukxyUjWn7YY1yPGxQIcb2AMQPk/vqyb9dJz476TRLfSPnRAU4SpTqzmVeYPO5OvIgxIA3Wcg==
X-Received: by 2002:a17:902:9a42:: with SMTP id
 x2mr17022371plv.194.1585636505008; 
 Mon, 30 Mar 2020 23:35:05 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id q43sm1062783pjc.40.2020.03.30.23.35.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 23:35:04 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:04:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331063457.GA17400@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-13-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-13-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 12/22] ARM: dts: stm32: Add
 configuration EEPROM on AV96
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

On Tue, Mar 31, 2020 at 02:56:51AM +0200, Marek Vasut wrote:
> The board has an EEPROM on the same I2C bus as PMIC, at address 0x53.
> The EEPROM contains the board MAC address.
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
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index de347453db6c..3dfc51f65709 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -302,6 +302,12 @@ watchdog {
>  			status = "disabled";
>  		};
>  	};
> +
> +	eeprom@53 {
> +		compatible = "atmel,24c02";
> +		reg = <0x53>;
> +		pagesize = <16>;
> +	};
>  };
>  
>  &iwdg2 {
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
