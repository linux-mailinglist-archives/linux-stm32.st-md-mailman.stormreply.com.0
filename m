Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635923230B
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 19:02:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 113E8C36B29;
	Wed, 29 Jul 2020 17:02:50 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C59C4C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 17:02:48 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e8so14550778pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xtqCPAZNxab7obAfm7++LTbvH7dNhg0P0KIRGD5EzeI=;
 b=aGqeuLKOzgNcfhya9sQK3coK1kl3GVMYKFr3x1SV5UCfe2X0O1AdN+tnxf+TeFg/o3
 iqW3kB4RJ5diJhHYeBcfy8SjrXvEGi1ZaplHoEFYp3e3r5Tbmfm+9Wp+MRcYd5JaPnyG
 S6iTXsgMH4xENZcjLPRikafGXw3xj6uTtqHEB7nWQc4JO3xsfk50GlSJfM71Y2bIodVK
 MjwSwKmoMRWsfEJPkcbAowlXzD3dUPjL1oaIh1rHFPyznOsO+atvXcseaSs1CCEEoQA7
 JWz7H9S7Wxtmd0lsQyOtiFlcDogOd9rv2KeCd01vQIUoAisWh4NUcqrEIZ18jmTiBEO2
 r3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xtqCPAZNxab7obAfm7++LTbvH7dNhg0P0KIRGD5EzeI=;
 b=IelwIEBZbmDDhzxYu6329nip8H0e7Is3OewQE/F5yRwZyLu9OFgDHPbO3VW0NN7cR1
 IexpeBlocsFB3cSbuUdfXIhkajJPnIG6e+45xNkgpXzseVMTTomUDRixW7wFJjDH+ptL
 ubipQwpYCn2Ps4Bg3b65LytDSLlaF8OOkQl+5lzVuFuheSoihrzHqKKrAW4IxLksZ0Kh
 tWNCE/yqU/I4sEITFk3R8np7gaDG/35A+yuoQuXVgn7EsZA86XVq/SrMLHjQ4Kuo7F9w
 kwnAkzardcM62cpMWKjEr4Lz2vsah8D2rOwnt1cqQyeimBxFHGJaWhiVyeB84xWvWo5z
 /jtg==
X-Gm-Message-State: AOAM531FzIfjd5E0wwHmkYJ/CNT9TW83h0EsyEla68paKau8TanFNcn2
 rbSR+x11CMzeyizAk7T1OwM=
X-Google-Smtp-Source: ABdhPJzULaOVQ0tOHf7TxVqsmf9UR8ysNODjrXMfRJJtpEZ0uM9i9DYpEFzw/2aHDHyHlfcNVuYGig==
X-Received: by 2002:a63:fc1f:: with SMTP id j31mr30573226pgi.104.1596042167176; 
 Wed, 29 Jul 2020 10:02:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b128sm2876722pfg.114.2020.07.29.10.02.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 10:02:46 -0700 (PDT)
Date: Wed, 29 Jul 2020 10:02:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200729170245.GA177035@roeck-us.net>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729160942.28867-6-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 Lihua Yao <ylhuajnu@outlook.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Sergio Prado <sergio.prado@e-labworks.com>, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Vincent Sanders <vince@simtec.co.uk>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 5/7] ARM: samsung: Kill useless
	HAVE_S3C2410_WATCHDOG
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

On Wed, Jul 29, 2020 at 06:09:40PM +0200, Krzysztof Kozlowski wrote:
> A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs does
> not have sense, because:
> 1. All ARMv7 and ARMv8 Samsung SoCs have watchdog,
> 2. All architecture Kconfigs were selecting it (if WATCHDOG framework is
>    chosen),
> 3. HAVE_S3C2410_WATCHDOG is doing nothing except being a dependency of
>    actual Samsung SoC watchdog driver, which is enabled manually by
>    specific defconfigs.
> 
> HAVE_S3C2410_WATCHDOG can be safely removed.
> 

That is not really correct. HAVE_S3C2410_WATCHDOG is used to ensure
that users can only enable S3C2410_WATCHDOG if the watchdog actually
exists in a system. With this change, it can be enabled for all
architectures and platforms.

NACK.

Guenter

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/Kconfig              | 1 -
>  arch/arm/mach-exynos/Kconfig  | 1 -
>  arch/arm/mach-s3c64xx/Kconfig | 2 --
>  arch/arm/mach-s5pv210/Kconfig | 1 -
>  arch/arm64/Kconfig.platforms  | 1 -
>  drivers/watchdog/Kconfig      | 8 --------
>  6 files changed, 14 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 7564f293f107..fe95777af653 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -504,7 +504,6 @@ config ARCH_S3C24XX
>  	select GPIOLIB
>  	select GENERIC_IRQ_MULTI_HANDLER
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select NEED_MACH_IO_H
>  	select SAMSUNG_ATAGS
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index f185cd3d4c62..d2d249706ebb 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -24,7 +24,6 @@ menuconfig ARCH_EXYNOS
>  	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PINCTRL_EXYNOS
> diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
> index ac3e3563487f..e208c2b48853 100644
> --- a/arch/arm/mach-s3c64xx/Kconfig
> +++ b/arch/arm/mach-s3c64xx/Kconfig
> @@ -13,7 +13,6 @@ menuconfig ARCH_S3C64XX
>  	select GPIO_SAMSUNG if ATAGS
>  	select GPIOLIB
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_TCM
>  	select PLAT_SAMSUNG
>  	select PM_GENERIC_DOMAINS if PM
> @@ -165,7 +164,6 @@ config MACH_SMDK6410
>  	bool "SMDK6410"
>  	depends on ATAGS
>  	select CPU_S3C6410
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select S3C64XX_SETUP_FB_24BPP
>  	select S3C64XX_SETUP_I2C1
>  	select S3C64XX_SETUP_IDE
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 03984a791879..b3db1191e437 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -14,7 +14,6 @@ config ARCH_S5PV210
>  	select COMMON_CLK_SAMSUNG
>  	select GPIOLIB
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PINCTRL_EXYNOS
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index cd58f8495c45..d235b27cf372 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -80,7 +80,6 @@ config ARCH_EXYNOS
>  	select EXYNOS_CHIPID
>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select EXYNOS_PMU
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PINCTRL_EXYNOS
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 4f4687c46d38..ae86ea135d2b 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -478,16 +478,8 @@ config IXP4XX_WATCHDOG
>  
>  	  Say N if you are unsure.
>  
> -config HAVE_S3C2410_WATCHDOG
> -	bool
> -	help
> -	  This will include watchdog timer support for Samsung SoCs. If
> -	  you want to include watchdog support for any machine, kindly
> -	  select this in the respective mach-XXXX/Kconfig file.
> -
>  config S3C2410_WATCHDOG
>  	tristate "S3C2410 Watchdog"
> -	depends on HAVE_S3C2410_WATCHDOG || COMPILE_TEST
>  	select WATCHDOG_CORE
>  	select MFD_SYSCON if ARCH_EXYNOS
>  	help
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
