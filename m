Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D107A25F74B
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Sep 2020 12:08:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DFBBC36B37;
	Mon,  7 Sep 2020 10:08:11 +0000 (UTC)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72174C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Sep 2020 10:08:08 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id a16so7050116vsp.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Sep 2020 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZ0cXtIu18O1k22F/ZDQa/bXyptLZb81gkafcnjYNcM=;
 b=O2L0eLGdR+6+ZhRzQIz42SKnDGT0lu7O6LKXrLLcRyWaY3A4BOwdgSFgeWg0bN/Efh
 Fak+f85L/g4Qpl1UXC9ta/tPAic75s2ru0IsLhvDD2XT0lreXQnG2ksFAt+N7DJC4PPi
 wFXZ9JNFr9qbD8MbzUBRhihO6wvFInG8xlAksZhYEBTIuKx37atFH1d1LsgK4GPU86nj
 ntwGoA9ZTlttMtr4Shq+5qxC2Je3wJUNjtyK4S35317lToJbFRdKk5QfAkZfAFYxeGNP
 dLMfjTTk1zo1FLQYxPqUOg6XydIgz4lUKW6utGB7GnMK2FNEU3y6QkiZCiXYZSJ4NHbq
 cTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZ0cXtIu18O1k22F/ZDQa/bXyptLZb81gkafcnjYNcM=;
 b=Pryp9TRPi+EGWaD/6CszQSVSXaa4QixJ7B6Wkr+cUbkeks76vyuoHCZ2+onvqiIrp/
 sy9bFo9SFMx6UWVNGdmZLrbf+E0f79dEPmKK3/+fN/MHt4mMqMFyQiaSwKcaq76DngG7
 s0SeAvcYSXn+awTLQuERjHlEAnTgiJra6A1L7MFsWOxX3/zPlgEAhyLs/X6+pEsmWlIH
 gBTQkQ0DXh//PohKGWi4qMeCqsRlt24IMjBtljYFVSKkdlBAqTojayrup79cscHxQRh/
 HreSB8ANVxq5HGs/N3Nc8XGYVDA9uL2TdZvtgrr+N18hJTiVZLW8siFJ0x7QA1FKcnDv
 MoXw==
X-Gm-Message-State: AOAM530J6Ri5YCyjlsk++NA5lHPMydSGRaPHkZBzPzO//zF5xD/0Z3uj
 fu1eTCaHFN0asEzApB/QMhOY7WiElHDkPJ5Wj/FZZA==
X-Google-Smtp-Source: ABdhPJzK8imxVzFICBf5slUvnoT+nIGcFmxhDDZ+N5lgeyXxY/MWgnT4W+c7RvwPtr/PAV7TEjJg1KFBqInVadg+qOY=
X-Received: by 2002:a67:308c:: with SMTP id w134mr10855802vsw.8.1599473287226; 
 Mon, 07 Sep 2020 03:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200904164315.24618-1-krzk@kernel.org>
 <20200904164315.24618-2-krzk@kernel.org>
In-Reply-To: <20200904164315.24618-2-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 12:07:30 +0200
Message-ID: <CAPDyKFo2Kqcpjb7QmsNgyD_kji2vXt3G2SqdDp9DUnvotKyojA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@axis.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Manjunath M B <manjumb@synopsys.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Manuel Lauss <manuel.lauss@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] mmc: host: Enable compile testing
	of multiple drivers
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

On Fri, 4 Sep 2020 at 18:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Multiple MMC host controller driver can be compile tested as they do not
> depend on architecture specific headers.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I tried to apply this, but there was a conflict around the SDHCI_S3C.
Can you please rebase.

Kind regards
Uffe


>
> ---
>
> Changes since v1:
> 1. Add COMMON_CLK dependency to MESON_GX to fix errors like:
>    ERROR: modpost: "devm_clk_register" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ---
>  drivers/mmc/host/Kconfig | 41 +++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index eea01fde0591..93db789cf8ec 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -178,7 +178,7 @@ config MMC_SDHCI_OF_AT91
>  config MMC_SDHCI_OF_ESDHC
>         tristate "SDHCI OF support for the Freescale eSDHC controller"
>         depends on MMC_SDHCI_PLTFM
> -       depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE
> +       depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
>         select MMC_SDHCI_IO_ACCESSORS
>         select FSL_GUTS
>         help
> @@ -216,7 +216,7 @@ config MMC_SDHCI_OF_DWCMSHC
>  config MMC_SDHCI_OF_SPARX5
>         tristate "SDHCI OF support for the MCHP Sparx5 SoC"
>         depends on MMC_SDHCI_PLTFM
> -       depends on ARCH_SPARX5
> +       depends on ARCH_SPARX5 || COMPILE_TEST
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
>           found in the MCHP Sparx5 SoC.
> @@ -238,7 +238,7 @@ config MMC_SDHCI_CADENCE
>
>  config MMC_SDHCI_CNS3XXX
>         tristate "SDHCI support on the Cavium Networks CNS3xxx SoC"
> -       depends on ARCH_CNS3XXX
> +       depends on ARCH_CNS3XXX || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         help
>           This selects the SDHCI support for CNS3xxx System-on-Chip devices.
> @@ -262,7 +262,7 @@ config MMC_SDHCI_ESDHC_MCF
>
>  config MMC_SDHCI_ESDHC_IMX
>         tristate "SDHCI support for the Freescale eSDHC/uSDHC i.MX controller"
> -       depends on ARCH_MXC
> +       depends on ARCH_MXC || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
> @@ -276,7 +276,7 @@ config MMC_SDHCI_ESDHC_IMX
>
>  config MMC_SDHCI_DOVE
>         tristate "SDHCI support on Marvell's Dove SoC"
> -       depends on ARCH_DOVE || MACH_DOVE
> +       depends on ARCH_DOVE || MACH_DOVE || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         help
> @@ -289,7 +289,7 @@ config MMC_SDHCI_DOVE
>
>  config MMC_SDHCI_TEGRA
>         tristate "SDHCI platform support for the Tegra SD/MMC Controller"
> -       depends on ARCH_TEGRA
> +       depends on ARCH_TEGRA || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
> @@ -301,7 +301,8 @@ config MMC_SDHCI_TEGRA
>
>  config MMC_SDHCI_S3C
>         tristate "SDHCI support on Samsung S3C SoC"
> -       depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
> +       depends on MMC_SDHCI
> +       depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
>           often referrered to as the HSMMC block in some of the Samsung S3C
> @@ -313,7 +314,7 @@ config MMC_SDHCI_S3C
>
>  config MMC_SDHCI_SIRF
>         tristate "SDHCI support on CSR SiRFprimaII and SiRFmarco SoCs"
> -       depends on ARCH_SIRF
> +       depends on ARCH_SIRF || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         help
> @@ -351,7 +352,8 @@ config MMC_SDHCI_PXAV2
>
>  config MMC_SDHCI_SPEAR
>         tristate "SDHCI support on ST SPEAr platform"
> -       depends on MMC_SDHCI && PLAT_SPEAR
> +       depends on MMC_SDHCI
> +       depends on PLAT_SPEAR || COMPILE_TEST
>         depends on OF
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
> @@ -374,7 +376,7 @@ config MMC_SDHCI_S3C_DMA
>
>  config MMC_SDHCI_BCM_KONA
>         tristate "SDHCI support on Broadcom KONA platform"
> -       depends on ARCH_BCM_MOBILE
> +       depends on ARCH_BCM_MOBILE || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         help
>           This selects the Broadcom Kona Secure Digital Host Controller
> @@ -422,7 +424,8 @@ config MMC_SDHCI_IPROC
>
>  config MMC_MESON_GX
>         tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
> -       depends on ARCH_MESON
> +       depends on ARCH_MESON || COMPILE_TEST
> +       depends on COMMON_CLK
>         help
>           This selects support for the Amlogic SD/MMC Host Controller
>           found on the S905/GX*/AXG family of SoCs.  This controller is
> @@ -458,7 +461,7 @@ config MMC_MESON_MX_SDIO
>
>  config MMC_MOXART
>         tristate "MOXART SD/MMC Host Controller support"
> -       depends on ARCH_MOXART
> +       depends on ARCH_MOXART || COMPILE_TEST
>         help
>           This selects support for the MOXART SD/MMC Host Controller.
>           MOXA provides one multi-functional card reader which can
> @@ -467,7 +470,7 @@ config MMC_MOXART
>
>  config MMC_SDHCI_ST
>         tristate "SDHCI support on STMicroelectronics SoC"
> -       depends on ARCH_STI || FSP2
> +       depends on ARCH_STI || FSP2 || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         help
> @@ -587,7 +590,7 @@ config MMC_TIFM_SD
>
>  config MMC_MVSDIO
>         tristate "Marvell MMC/SD/SDIO host driver"
> -       depends on PLAT_ORION
> +       depends on PLAT_ORION || (COMPILE_TEST && ARM)
>         depends on OF
>         help
>           This selects the Marvell SDIO host driver.
> @@ -599,7 +602,7 @@ config MMC_MVSDIO
>
>  config MMC_DAVINCI
>         tristate "TI DAVINCI Multimedia Card Interface support"
> -       depends on ARCH_DAVINCI
> +       depends on ARCH_DAVINCI || COMPILE_TEST
>         help
>           This selects the TI DAVINCI Multimedia card Interface.
>           If you have an DAVINCI board with a Multimedia Card slot,
> @@ -628,7 +631,7 @@ config MMC_SPI
>
>  config MMC_S3C
>         tristate "Samsung S3C SD/MMC Card Interface support"
> -       depends on ARCH_S3C24XX
> +       depends on ARCH_S3C24XX || COMPILE_TEST
>         depends on S3C24XX_DMAC
>         help
>           This selects a driver for the MCI interface found in
> @@ -681,7 +684,7 @@ config MMC_SDRICOH_CS
>
>  config MMC_SDHCI_SPRD
>         tristate "Spreadtrum SDIO host Controller"
> -       depends on ARCH_SPRD
> +       depends on ARCH_SPRD || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_HSQ
> @@ -698,7 +701,7 @@ config MMC_TMIO_CORE
>
>  config MMC_TMIO
>         tristate "Toshiba Mobile IO Controller (TMIO) MMC/SD function support"
> -       depends on MFD_TMIO || MFD_ASIC3
> +       depends on MFD_TMIO || MFD_ASIC3 || COMPILE_TEST
>         select MMC_TMIO_CORE
>         help
>           This provides support for the SD/MMC cell found in TC6393XB,
> @@ -971,7 +974,7 @@ config MMC_REALTEK_USB
>
>  config MMC_SUNXI
>         tristate "Allwinner sunxi SD/MMC Host Controller support"
> -       depends on ARCH_SUNXI
> +       depends on ARCH_SUNXI || COMPILE_TEST
>         help
>           This selects support for the SD/MMC Host Controller on
>           Allwinner sunxi SoCs.
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
