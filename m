Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE2D19EC16
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Apr 2020 16:43:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7032DC36B0B;
	Sun,  5 Apr 2020 14:43:16 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95BEEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Apr 2020 14:43:14 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id z3so5305320pjr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Apr 2020 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kksYcodGsgJN93lR/yuLls+Kf4sbHQlz9HuaAXuMDok=;
 b=vk5a3Wa+p6KfMVfeTymhQ2DekbHmJCDGB2j16j6WBRjMwoql7dBqvD/m3hhzyTvFUe
 BO+c0RJ5UGo7ef6DIglvAAhg9qJp7gAB9SwL3yOACdOgYCDfTO9bprvG8NUEGTo385YE
 wN2B5mDvcfPFzaHG7MPVcS7djY75E40UsqgM0JdiIvGw9AUxUAF5LnjndYmRmPvk7vPK
 i0cMhAPsIqCWsZIL8h18sif11xjALM/kLyZ+kn+yCdwJIuvOnXG9wYysPZmWJUiDN316
 VKGKirmp+ytDGiPAZfGnO4QVQPkyQddp0EDmmgNtKj3K2lsemWGHiwVRdy3XJUC/2hj2
 zaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kksYcodGsgJN93lR/yuLls+Kf4sbHQlz9HuaAXuMDok=;
 b=iKNJBGQqT/HSpGLXsfLUhjmMc9gLdaSbnq3eYLCWbqigd79FC1rkRPj1a6nDB4aLEg
 /3DGakviVeiQRFq2fch5inpa7S4owWSJ8o+WoUr2+IbTUddMGdE6u90WMSQKU7m5OkpM
 Ipg83juHZBS0gQoaV9JWXR67t2a1Hjo1sfLEQU3ZQzXHmb5ptRjiBua41lnSHWg2GQPb
 11rI9tMnR15h2V/z0v9jVjSmSV5kepGrl4Svm2XjKF1Lo4mEz126F13fyM0ML2356QRk
 Q94odx1SacFxClA7naFs9b9qdw6G+PBBL4a+VU7T1qmPmN5X/+E0AkYK73NTVMa96M24
 eAlg==
X-Gm-Message-State: AGi0PuYz1F4fAvP54GsvFAnXQYoYhFYACiUtbQ8Mpq1qHg9Fc49W2SuB
 Bei7JGqrPuRSmv96k/o+qV1i
X-Google-Smtp-Source: APiQypKhBSzwKnPiV0YD7ynK27J1OgP/xvaiH505eyBuyDawrKXtgfN0BKZ9frLondKcu15Ah7XnBg==
X-Received: by 2002:a17:90a:f004:: with SMTP id
 bt4mr20037713pjb.83.1586097792679; 
 Sun, 05 Apr 2020 07:43:12 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e83:b2ab:75aa:fbdc:e9da:9d96])
 by smtp.gmail.com with ESMTPSA id w24sm9958015pjn.14.2020.04.05.07.43.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 07:43:11 -0700 (PDT)
Date: Sun, 5 Apr 2020 20:13:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200405144305.GT8912@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-1-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
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

On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
> The AV96 board device tree is completely broken and does not match the
> hardware. This series fixes it up.
> 

Can you please share a git tree with all these patches? These are not
applying cleanly on top of mainline/master or linux-next/master.

Thanks,
Mani

> Marek Vasut (22):
>   ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
>   ARM: dts: stm32: Repair ethernet operation on AV96
>   ARM: dts: stm32: Add missing ethernet PHY reset on AV96
>   ARM: dts: stm32: Add missing ethernet PHY skews on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC1 direction pins
>   ARM: dts: stm32: Repair SDMMC1 operation on AV96
>   ARM: dts: stm32: Repair PMIC configuration on AV96
>   ARM: dts: stm32: Repair PMIC interrupt on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC2 pins 4-7
>   ARM: dts: stm32: Add eMMC attached to SDMMC2 on AV96
>   ARM: dts: stm32: Add QSPI NOR on AV96
>   ARM: dts: stm32: Add configuration EEPROM on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC3 pins
>   ARM: dts: stm32: Enable WiFi on AV96
>   ARM: dts: stm32: Add alternate pinmux for USART2 pins
>   ARM: dts: stm32: Enable Bluetooth on AV96
>   ARM: dts: stm32: Add alternate pinmux for LTDC pins
>   ARM: dts: stm32: Add bindings for HDMI video on AV96
>   ARM: dts: stm32: Add alternate pinmux for SAI2 pins
>   ARM: dts: stm32: Add bindings for audio on AV96
>   ARM: dts: stm32: Add bindings for USB on AV96
>   ARM: dts: stm32: Rename LEDs to match silkscreen on AV96
> 
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi    | 280 +++++++++++++++++
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 324 ++++++++++++++++++--
>  2 files changed, 571 insertions(+), 33 deletions(-)
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
