Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE43E1BF5
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2019 15:13:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 097ABC36B0B;
	Wed, 23 Oct 2019 13:13:28 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED2ACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:13:25 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l25so4467745edt.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 06:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o54Jyg7LaPMTM/R2ezpXAUg6vHkjUZaxwTxf8dd6jXk=;
 b=j4DqzMiQq6pLQAtLWAmu8d5Q8GZaPUvfonq0biV3UBqbZSbMW35pnixV4tMcCWCILg
 /VJtzN+9OcsOqsckF5CKdnQO64P1uvVzAkGS7ipCuqtEtbHw+2CRmRnFFjvfi85qCNHo
 Lf+0D0QIzQFKQXXeAGDe6xBAoaaWq5WIPmMy8mshxRBXUy7E15Gz1wgQtej9yGp4eOMB
 vTw1FCjv0fSEFIeSL4tTSkR/6cAqEHwn/bFqx/HQ64nyWbOvJOD/xcgfhtY9iEHcBzw3
 Dqv26gNQjVcmKGTdK285slFggAc1MPPbAyeZueBla6SWUqJBqwCTP8KriTWOfA5HxQSl
 FZHQ==
X-Gm-Message-State: APjAAAW4KcSn/uli5us97coDzlEKodzqF+vxhim+lB9B3Q5QNj8mGd5d
 yti1z96lkk/+ZzrRU5dY63w=
X-Google-Smtp-Source: APXvYqxJH5rltespiv1WDhAborQbNiDE5+2CReq8AP71JjFfyUdkdzYR7L1/bvADJTpzB8Q1SXMf1g==
X-Received: by 2002:a17:906:704:: with SMTP id
 y4mr32582518ejb.259.1571836404632; 
 Wed, 23 Oct 2019 06:13:24 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id v5sm269620edd.90.2019.10.23.06.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 06:13:23 -0700 (PDT)
Date: Wed, 23 Oct 2019 15:13:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191023131321.GH11048@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-28-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010203043.1241612-28-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kukjin Kim <kgene@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 28/36] fbdev: s3c2410fb: remove mach
	header dependency
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

On Thu, Oct 10, 2019 at 10:30:12PM +0200, Arnd Bergmann wrote:
> The s3c2410fb driver is too deeply intertwined with the s3c24xx
> platform code. Change it in a way that avoids the use of platform
> header files but having all interface data in a platform_data
> header, and the private register definitions next to the driver
> itself.
> 
> One ugly bit here is that the driver pokes directly into gpio
> registers, which are owned by another driver. Passing the
> mapped addresses in platform_data is somewhat suboptimal, but
> it is a small improvement over the previous version.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c24xx/include/mach/fb.h       |  2 --
>  arch/arm/mach-s3c24xx/mach-amlm5900.c         |  7 ++--
>  arch/arm/mach-s3c24xx/mach-anubis.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-at2440evb.c        |  3 +-
>  arch/arm/mach-s3c24xx/mach-bast.c             |  3 +-
>  arch/arm/mach-s3c24xx/mach-gta02.c            |  2 +-
>  arch/arm/mach-s3c24xx/mach-h1940.c            |  7 ++--
>  arch/arm/mach-s3c24xx/mach-jive.c             | 10 ++++--
>  arch/arm/mach-s3c24xx/mach-mini2440.c         |  9 +++--
>  arch/arm/mach-s3c24xx/mach-n30.c              |  3 +-
>  arch/arm/mach-s3c24xx/mach-osiris.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-qt2410.c           |  3 +-
>  arch/arm/mach-s3c24xx/mach-rx1950.c           |  8 +++--
>  arch/arm/mach-s3c24xx/mach-rx3715.c           |  7 ++--
>  arch/arm/mach-s3c24xx/mach-smdk2413.c         |  3 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-smdk2440.c         |  8 +++--
>  arch/arm/mach-s3c24xx/mach-smdk2443.c         |  3 +-
>  arch/arm/mach-s3c24xx/mach-vstms.c            |  3 +-
>  arch/arm/plat-samsung/devs.c                  |  2 +-
>  .../video/fbdev/s3c2410fb-regs-lcd.h          | 28 ++++------------
>  drivers/video/fbdev/s3c2410fb.c               | 16 +++++----
>  .../linux/platform_data}/fb-s3c2410.h         | 33 ++++++++++++++++++-
>  23 files changed, 98 insertions(+), 65 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/fb.h
>  rename arch/arm/mach-s3c24xx/include/mach/regs-lcd.h => drivers/video/fbdev/s3c2410fb-regs-lcd.h (84%)
>  rename {arch/arm/plat-samsung/include/plat => include/linux/platform_data}/fb-s3c2410.h (57%)
> 
> diff --git a/arch/arm/mach-s3c24xx/include/mach/fb.h b/arch/arm/mach-s3c24xx/include/mach/fb.h
> deleted file mode 100644
> index 4e539cb8b884..000000000000
> --- a/arch/arm/mach-s3c24xx/include/mach/fb.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <plat/fb-s3c2410.h>
> diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c24xx/mach-amlm5900.c
> index 40ad23b52bc0..ef6de1b1d0c6 100644
> --- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
> +++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
> @@ -30,9 +30,8 @@
>  #include <mach/hardware.h>
>  #include <asm/irq.h>
>  #include <asm/mach-types.h>
> -#include <mach/fb.h>
> +#include <linux/platform_data/fb-s3c2410.h>
>  
> -#include <mach/regs-lcd.h>
>  #include <mach/regs-gpio.h>
>  #include <mach/gpio-samsung.h>
>  
> @@ -194,13 +193,17 @@ static struct s3c2410fb_mach_info __initdata amlm5900_fb_info = {
>  
>  	.gpccon =	0xaaaaaaaa,
>  	.gpccon_mask =	0xffffffff,
> +	.gpccon_reg =	S3C2410_GPCCON,
>  	.gpcup =	0x0000ffff,
>  	.gpcup_mask =	0xffffffff,
> +	.gpcup_reg =	S3C2410_GPCUP,
>  
>  	.gpdcon =	0xaaaaaaaa,
>  	.gpdcon_mask =	0xffffffff,
> +	.gpdcon_reg =	S3C2410_GPDCON,
>  	.gpdup =	0x0000ffff,
>  	.gpdup_mask =	0xffffffff,
> +	.gpdup_reg =	S3C2410_GPDUP,
>  };
>  #endif
>  
> diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
> index 072966dcad78..e1a73274e90b 100644
> --- a/arch/arm/mach-s3c24xx/mach-anubis.c
> +++ b/arch/arm/mach-s3c24xx/mach-anubis.c
> @@ -29,7 +29,6 @@
>  #include <asm/mach-types.h>
>  
>  #include <mach/regs-gpio.h>
> -#include <mach/regs-lcd.h>
>  #include <mach/gpio-samsung.h>
>  #include <linux/platform_data/mtd-nand-s3c2410.h>
>  #include <linux/platform_data/i2c-s3c2410.h>
> diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
> index b2199906e678..bfda6dd2a9d5 100644
> --- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
> +++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
> @@ -25,12 +25,11 @@
>  #include <asm/mach/irq.h>
>  
>  #include <mach/hardware.h>
> -#include <mach/fb.h>
> +#include <linux/platform_data/fb-s3c2410.h>
>  #include <asm/irq.h>
>  #include <asm/mach-types.h>
>  
>  #include <mach/regs-gpio.h>
> -#include <mach/regs-lcd.h>
>  #include <mach/gpio-samsung.h>
>  #include <linux/platform_data/mtd-nand-s3c2410.h>
>  #include <linux/platform_data/i2c-s3c2410.h>
> diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
> index a7c3955ae8f6..cc941b5030ea 100644
> --- a/arch/arm/mach-s3c24xx/mach-bast.c
> +++ b/arch/arm/mach-s3c24xx/mach-bast.c
> @@ -40,10 +40,9 @@
>  #include <asm/mach/irq.h>
>  #include <asm/mach-types.h>
>  
> -#include <mach/fb.h>
>  #include <mach/hardware.h>
> +#include <linux/platform_data/fb-s3c2410.h>
>  #include <mach/regs-gpio.h>
> -#include <mach/regs-lcd.h>
>  #include <mach/gpio-samsung.h>
>  
>  #include <plat/cpu.h>
> diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
> index 61b8c6badeb8..1e42782dbd30 100644
> --- a/arch/arm/mach-s3c24xx/mach-gta02.c
> +++ b/arch/arm/mach-s3c24xx/mach-gta02.c
> @@ -57,8 +57,8 @@
>  #include <linux/platform_data/touchscreen-s3c2410.h>
>  #include <linux/platform_data/usb-ohci-s3c2410.h>
>  #include <linux/platform_data/usb-s3c2410_udc.h>
> +#include <linux/platform_data/fb-s3c2410.h>
>  
> -#include <mach/fb.h>
>  #include <mach/hardware.h>
>  #include <mach/regs-gpio.h>
>  #include <mach/regs-irq.h>
> diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
> index 446891e23511..d56e3befa459 100644
> --- a/arch/arm/mach-s3c24xx/mach-h1940.c
> +++ b/arch/arm/mach-s3c24xx/mach-h1940.c
> @@ -47,11 +47,10 @@
>  
>  #include <sound/uda1380.h>
>  
> -#include <mach/fb.h>
> +#include <linux/platform_data/fb-s3c2410.h>
>  #include <mach/hardware.h>
>  #include <mach/regs-clock.h>
>  #include <mach/regs-gpio.h>
> -#include <mach/regs-lcd.h>
>  #include <mach/gpio-samsung.h>
>  
>  #include <plat/cpu.h>
> @@ -211,12 +210,16 @@ static struct s3c2410fb_mach_info h1940_fb_info __initdata = {
>  	.lpcsel =	0x02,
>  	.gpccon =	0xaa940659,
>  	.gpccon_mask =	0xffffc0f0,
> +	.gpccon_reg =	S3C2410_GPCCON,
>  	.gpcup =	0x0000ffff,
>  	.gpcup_mask =	0xffffffff,
> +	.gpcup_reg =	S3C2410_GPCUP,
>  	.gpdcon =	0xaa84aaa0,
>  	.gpdcon_mask =	0xffffffff,
> +	.gpdcon_reg =	S3C2410_GPDCON,
>  	.gpdup =	0x0000faff,
>  	.gpdup_mask =	0xffffffff,
> +	.gpdup_reg =	S3C2410_GPDUP,
>  };
>  
>  static int power_supply_init(struct device *dev)
> diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
> index 885e8f12e4b9..3b33132b2334 100644
> --- a/arch/arm/mach-s3c24xx/mach-jive.c
> +++ b/arch/arm/mach-s3c24xx/mach-jive.c
> @@ -32,8 +32,7 @@
>  #include <linux/platform_data/i2c-s3c2410.h>
>  
>  #include <mach/regs-gpio.h>
> -#include <mach/regs-lcd.h>
> -#include <mach/fb.h>
> +#include <linux/platform_data/fb-s3c2410.h>
>  #include <mach/gpio-samsung.h>
>  
>  #include <asm/mach-types.h>
> @@ -321,6 +320,7 @@ static struct s3c2410fb_mach_info jive_lcd_config = {
>  	 * data. */
>  
>  	.gpcup		= (0xf << 1) | (0x3f << 10),
> +	.gpcup_reg =	S3C2410_GPCUP,

Nits: indentation before/after '=' looks wrong. Tab should be
before '=', one space after.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
