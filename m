Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C580198AD7
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:07:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57EEFC36B0B;
	Tue, 31 Mar 2020 04:07:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FB63C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:07:46 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id z3so522226pjr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZcPtGhA2QrKGzIux62bHyWTBJE/VY8bdpVEAh0BEh0s=;
 b=MASrn00AGpaEK9XRuvlqy3HDJvFT0PnNi4JJrReygnWYwkQB7XHl9Ef0sBwgN1yl8H
 NNbmyXSGPrGxNEORd7WsSdDly5lL0MKA64Zb+Q2UToA8sRHM8JJWcmBbXD9XU9HvwxZv
 R4R0GwsTSz/n8EArtFo3MIJsbNQsmb8RQYwyi0Vu4n7dXfxCfQhwLO9gaq44t0E/DYBF
 23im8KXnOXoFSRkZPW6XJYGagqdS3IYy/HwMZHXOfn/+MfM8SAAA9O4K/uDVI3CcQC4j
 h6eXh6l+TdMIphYmKXy4xtr7sDztrWrZsAZw7D7MrdVcb36oMHxKUPaIl3QnkLfWor5E
 ugsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZcPtGhA2QrKGzIux62bHyWTBJE/VY8bdpVEAh0BEh0s=;
 b=YV3EB/fWXaSFaYR1fhCAYHdyYG0SDpj7Ox+4ogeVX/74D5WGz4KZO2xGUA1AZkHqiw
 W2gP5bhEFgCE09bSW7MUObzfxcofUxmql+vT6YTcOdrH8xafTLhFDrijLyoXA19tml6H
 pOmP2+j9dU/0DJqcI07RnXAqY4Dxknpme60+WUDUKdxx0gCr2G93JGMAYfDjZfaIICy5
 JlTqeHnxqrX9QIQOChyvhCnHaCxDJbJQhoNGfTYbTJHY2mMPrphMmBOTjgwnazGr4keB
 zwR8oEvp27zS9uk+4s6keBb19E2AJUNtNBYF4qYVd7oBnDwVS11OY3Xn1ZXjH+M2KUL7
 MyaA==
X-Gm-Message-State: AGi0PuZ9tx4YAmUPiSy2BM/Ge3iZMoFk09sGYJtgIU+xoWVt7trpUkHo
 JulQ7hS1p3L5NsYK7DtZaGft
X-Google-Smtp-Source: APiQypKgkux6EMavjoWrH4W01+XW+GyUgz5j1WsJGkyQmilLYP2nJ5JJFlLeSPwTiOeb2zy8Syvx+Q==
X-Received: by 2002:a17:90b:2318:: with SMTP id
 mt24mr1683137pjb.66.1585627664435; 
 Mon, 30 Mar 2020 21:07:44 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id my15sm832311pjb.28.2020.03.30.21.07.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:07:43 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:37:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331040736.GA14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-1-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 00/22] ARM: dts: stm32: Repair AV96
	board
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

Hi Marek,

Thanks for the series. 

On Tue, Mar 31, 2020 at 02:56:39AM +0200, Marek Vasut wrote:
> The AV96 board device tree is completely broken and does not match the
> hardware. This series fixes it up.
> 

Completely broken? The patch submitted previously was an initial one and there
were many interfaces not enabled. I agree that there are few _obvious_ things
like SDMMC1/Ethernet pinmux, LED naming were wrong. This was due to the fact the
board was on early bringup stage and I couldn't test Ethernet due to my setup
issue at that time (yeah I know it is bad). Also, I don't get access to DHCOR
schematics as well for things like PMIC. Do you have access to it? If possible
can you share a link to that if available publicly?

I will test this series and also the uboot one on my board and give my
Tested-by tag soon.

Anyway, I think the patchset subject could be something like,
"Improve AV96 support" :)

Thanks,
Mani

> Marek Vasut (22):
>   ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
>   ARM: dts: stm32: Repair ethernet operation on AV96
>   ARM: dts: stm32: Add missing ethernet PHY reset on AV96
>   ARM: dts: stm32: Add missing ethernet PHY skews on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC1 direction pins
>   ARM: dts: stm32: Repair SDMMC1 operation on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC2 pins 4-7
>   ARM: dts: stm32: Add eMMC attached to SDMMC2 on AV96
>   ARM: dts: stm32: Repair PMIC configuration on AV96
>   ARM: dts: stm32: Repair PMIC interrupt on AV96
>   ARM: dts: stm32: Add QSPI NOR on AV96
>   ARM: dts: stm32: Add configuration EEPROM on AV96
>   ARM: dts: stm32: Enable GPU on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC3 pins
>   ARM: dts: stm32: Enable WiFi on AV96
>   ARM: dts: stm32: Add alternate pinmux for USART2 pins
>   ARM: dts: stm32: Enable Bluetooth on AV96
>   ARM: dts: stm32: Add alternate pinmux for LTDC pins
>   ARM: dts: stm32: Add bindings for HDMI video on AV96
>   ARM: dts: stm32: Add bindings for audio on AV96
>   ARM: dts: stm32: Add bindings for USB on AV96
>   ARM: dts: stm32: Rename LEDs to match silkscreen on AV96
> 
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi    | 248 +++++++++++++++
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 328 ++++++++++++++++++--
>  2 files changed, 543 insertions(+), 33 deletions(-)
> 
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
