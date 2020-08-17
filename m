Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D45247017
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Aug 2020 20:02:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF43C32E8F;
	Mon, 17 Aug 2020 18:02:10 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DACEBC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 18:02:05 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u10so7910295plr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d6RmxVO3e5dCO9zbmZgrNKEKctYuqiCp0bPkTg+Mb/Y=;
 b=fRqJmYBpViYk4Fr3exnfrXUqWwYI/r0KQVO5T3O2RaoQMUp6+ai4eXSzdGn543hHrt
 COgMa7E/8Wd5OT1uCE8cXHejkJDUdij0CgWYzsMrbU4lNn1pYdC1m2fCp5kEyBPHgbwI
 OIO2wR0sFI6zGgFGPU870qem6LEYv9IgcFTfghi7HbW4mo6noF9H4dfjNUCwaxAM0DMq
 ErNX9lFNOi6WVUiXcQsz9Kb4o29TOceH1krd9TjbiUvJLCj+lWRmMCwHUdqf5rXZ64w7
 d1uOfPPbGUAZYzKdJQZttnsaXYllcWBKTL9SdlXJF3HyFoJ85KQ2T5zKAsoADP+S4Od/
 qCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=d6RmxVO3e5dCO9zbmZgrNKEKctYuqiCp0bPkTg+Mb/Y=;
 b=Mg/leBx794rOKCCNYKFxAlZ97C+zBRqcCWiSHb1f9xRcjn9Rn0/1H1+eKxCZZw0dMX
 UodDGsQb7J+7HYUPDKE+B4NMAypF/owX8mLcSkMT3ur25QBtwfWT75XDLFwoIosWvPof
 1q/mlQ+meBqB54abyJNd+7tRVMnf31cucvpVQvZUccCtTeu3mQZEQKL+9zvAX2NNBxh2
 UdcOKjAFZlpFrNgv5/nYWhPuvODmeOpBvXHD2FyYFyRPBr2qLbptQmTTd64aFQydr4ZE
 eRp8aROYOOGOOXv663/ecgAHGcSKQ1MnRYC91Ag+gT/d9/T91NA1Fq/Do//GZ3MU5SaW
 blHQ==
X-Gm-Message-State: AOAM533Q7yGR6os66KmW3Ow3WTUcNufjJ0OkDWfJLEsmeWzXyJAHaFQ8
 +pl8AAxVf9FMTGpzHl0m/4A=
X-Google-Smtp-Source: ABdhPJwBMpU0vB5aZe3DJlmlnylDbORFLOxW46LWz/7af6KXVWl6Jr50JA/md7vE6y/AlVaXC5ZKhA==
X-Received: by 2002:a17:90b:349:: with SMTP id
 fh9mr12887220pjb.73.1597687324214; 
 Mon, 17 Aug 2020 11:02:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 5sm21434604pfw.25.2020.08.17.11.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 11:02:03 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-7-krzk@kernel.org> <20200817165748.GA29664@kozik-lap>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <743454b8-a36f-e757-075d-c8207fa7196c@roeck-us.net>
Date: Mon, 17 Aug 2020 11:02:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817165748.GA29664@kozik-lap>
Content-Language: en-US
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

On 8/17/20 9:57 AM, Krzysztof Kozlowski wrote:
> On Tue, Aug 04, 2020 at 09:26:47PM +0200, Krzysztof Kozlowski wrote:
>> A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs is not
>> really needed and the s3c24xx watchdog driver can depend on Samsung ARM
>> architectures instead.
>>
>> The "HAVE_xxx_WATCHDOG" pattern of dependency is not popular and Samsung
>> platforms are here exceptions.  All others just depend on
>> CONFIG_ARCH_xxx.
>>
>> This makes the code slightly smaller without any change in
>> functionality.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Re-add the dependency on architectures to keep same functionality.
> 
> Hi Guenter, Tomasz,
> 
> Does such removal of HAVE_S3C2410_WATCHDOG makes sense for you?
> 

Umm ... answering the question, no, it doesn't make sense to me. If I were
to immediately change all code under my "jurisdiction" whenever something
runs out of favor, I'd do nothing else, and in this case the only real
difference I can see is that the code will be more difficult to maintain
going forward.

Having said that, I don't really care one way or another as long as the
change does not result in compile failures for other architectures/platforms.
With that in mind, feel free to add

Acked-by: Guenter Roeck <linux@roeck-us.net>

to the patch.


Thanks,
Guenter

> Best regards,
> Krzysztof
> 
> 
>> ---
>>  arch/arm/Kconfig              |  1 -
>>  arch/arm/mach-exynos/Kconfig  |  1 -
>>  arch/arm/mach-s3c64xx/Kconfig |  2 --
>>  arch/arm/mach-s5pv210/Kconfig |  1 -
>>  arch/arm64/Kconfig.platforms  |  1 -
>>  drivers/watchdog/Kconfig      | 10 ++--------
>>  6 files changed, 2 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 7564f293f107..fe95777af653 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -504,7 +504,6 @@ config ARCH_S3C24XX
>>  	select GPIOLIB
>>  	select GENERIC_IRQ_MULTI_HANDLER
>>  	select HAVE_S3C2410_I2C if I2C
>> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>>  	select HAVE_S3C_RTC if RTC_CLASS
>>  	select NEED_MACH_IO_H
>>  	select SAMSUNG_ATAGS
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index f185cd3d4c62..d2d249706ebb 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -24,7 +24,6 @@ menuconfig ARCH_EXYNOS
>>  	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
>>  	select HAVE_ARM_SCU if SMP
>>  	select HAVE_S3C2410_I2C if I2C
>> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>>  	select HAVE_S3C_RTC if RTC_CLASS
>>  	select PINCTRL
>>  	select PINCTRL_EXYNOS
>> diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
>> index ac3e3563487f..e208c2b48853 100644
>> --- a/arch/arm/mach-s3c64xx/Kconfig
>> +++ b/arch/arm/mach-s3c64xx/Kconfig
>> @@ -13,7 +13,6 @@ menuconfig ARCH_S3C64XX
>>  	select GPIO_SAMSUNG if ATAGS
>>  	select GPIOLIB
>>  	select HAVE_S3C2410_I2C if I2C
>> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>>  	select HAVE_TCM
>>  	select PLAT_SAMSUNG
>>  	select PM_GENERIC_DOMAINS if PM
>> @@ -165,7 +164,6 @@ config MACH_SMDK6410
>>  	bool "SMDK6410"
>>  	depends on ATAGS
>>  	select CPU_S3C6410
>> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>>  	select S3C64XX_SETUP_FB_24BPP
>>  	select S3C64XX_SETUP_I2C1
>>  	select S3C64XX_SETUP_IDE
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
>> index 03984a791879..b3db1191e437 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -14,7 +14,6 @@ config ARCH_S5PV210
>>  	select COMMON_CLK_SAMSUNG
>>  	select GPIOLIB
>>  	select HAVE_S3C2410_I2C if I2C
>> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>>  	select HAVE_S3C_RTC if RTC_CLASS
>>  	select PINCTRL
>>  	select PINCTRL_EXYNOS
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index cd58f8495c45..d235b27cf372 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -80,7 +80,6 @@ config ARCH_EXYNOS
>>  	select EXYNOS_CHIPID
>>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>>  	select EXYNOS_PMU
>> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>>  	select HAVE_S3C_RTC if RTC_CLASS
>>  	select PINCTRL
>>  	select PINCTRL_EXYNOS
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 4f4687c46d38..297af1c40643 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -478,16 +478,10 @@ config IXP4XX_WATCHDOG
>>  
>>  	  Say N if you are unsure.
>>  
>> -config HAVE_S3C2410_WATCHDOG
>> -	bool
>> -	help
>> -	  This will include watchdog timer support for Samsung SoCs. If
>> -	  you want to include watchdog support for any machine, kindly
>> -	  select this in the respective mach-XXXX/Kconfig file.
>> -
>>  config S3C2410_WATCHDOG
>>  	tristate "S3C2410 Watchdog"
>> -	depends on HAVE_S3C2410_WATCHDOG || COMPILE_TEST
>> +	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || \
>> +		   COMPILE_TEST
>>  	select WATCHDOG_CORE
>>  	select MFD_SYSCON if ARCH_EXYNOS
>>  	help
>> -- 
>> 2.17.1
>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
