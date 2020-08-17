Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B40246D79
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Aug 2020 18:57:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D94BC32E8F;
	Mon, 17 Aug 2020 16:57:54 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E8F1C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 16:57:52 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id df16so12845225edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 09:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3FrKyZ4bgiqRw6fMNXhefxjUO50+4ZZhHM2k568ceUE=;
 b=d1J06FDoPZKNZeiyAb/XQgCJ9RZggnO3794vyxsL/Ct2MckuP+O22Jv5hgtMnvHSKk
 5cKnJcvcu6Ql5DKcUINjtj9RpoCDlIWs5BHt6pSEmjLQrabYb0b0aN/iLuLblsZ8j/zQ
 MUnbv2FbBv8UWf9Q/jgvW/Xqp1eJjJ0v+aaUO19NYaIiyAgI6ablgU7Ceh27WQSTNdjA
 K+Nw5nsUiuN+PLAjvVbVQcd1O3cL7tjTGOn0auGZFtMN2K0UvD7ESHRny7/nYpIrd+P/
 kCvApA5CfHZfxXRyemUtpEtiDMiTtqK5ZpWtmuff64eFZec+tBVsPH5Kpzu66bVkLcy2
 XkGg==
X-Gm-Message-State: AOAM533yXCVVeQujB/gcBZrdU2ymWXIFQ+fwHP77EhwPzQWgYpghq3Xm
 RuxYEtKDRPToxsc1Wp8Ehgs=
X-Google-Smtp-Source: ABdhPJwXGUSxJY2KPJAkdjrQkP68EfvY0m+GPVkx6BxNteF9/a1Q2fay39xFJBTtva4bNXqbU3on7w==
X-Received: by 2002:a50:ec95:: with SMTP id e21mr15439113edr.250.1597683472383; 
 Mon, 17 Aug 2020 09:57:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id
 lc10sm14820453ejb.22.2020.08.17.09.57.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 09:57:51 -0700 (PDT)
Date: Mon, 17 Aug 2020 18:57:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tomasz.figa@gmail.com>
Message-ID: <20200817165748.GA29664@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804192654.12783-7-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Lihua Yao <ylhuajnu@outlook.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Sergio Prado <sergio.prado@e-labworks.com>, Arnd Bergmann <arnd@arndb.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/13] ARM: samsung: remove
 HAVE_S3C2410_WATCHDOG and use direct dependencies
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

On Tue, Aug 04, 2020 at 09:26:47PM +0200, Krzysztof Kozlowski wrote:
> A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs is not
> really needed and the s3c24xx watchdog driver can depend on Samsung ARM
> architectures instead.
> 
> The "HAVE_xxx_WATCHDOG" pattern of dependency is not popular and Samsung
> platforms are here exceptions.  All others just depend on
> CONFIG_ARCH_xxx.
> 
> This makes the code slightly smaller without any change in
> functionality.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Re-add the dependency on architectures to keep same functionality.

Hi Guenter, Tomasz,

Does such removal of HAVE_S3C2410_WATCHDOG makes sense for you?

Best regards,
Krzysztof


> ---
>  arch/arm/Kconfig              |  1 -
>  arch/arm/mach-exynos/Kconfig  |  1 -
>  arch/arm/mach-s3c64xx/Kconfig |  2 --
>  arch/arm/mach-s5pv210/Kconfig |  1 -
>  arch/arm64/Kconfig.platforms  |  1 -
>  drivers/watchdog/Kconfig      | 10 ++--------
>  6 files changed, 2 insertions(+), 14 deletions(-)
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
> index 4f4687c46d38..297af1c40643 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -478,16 +478,10 @@ config IXP4XX_WATCHDOG
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
> +	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || \
> +		   COMPILE_TEST
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
