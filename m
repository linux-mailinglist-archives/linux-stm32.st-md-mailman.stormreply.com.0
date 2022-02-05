Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B41394AC4EA
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:11:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 793BBC60465;
	Mon,  7 Feb 2022 16:11:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 657CFC60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:10:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA9E161146;
 Sat,  5 Feb 2022 17:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E90C340E8;
 Sat,  5 Feb 2022 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644081885;
 bh=6w/99GRGMgWgYWe4X+KfojXSRYWk/PfNkbE0hES5fiM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vEptM6qr2UhahzEMsHKHAI5fI/NvwY4hHTg5yr6Nwen7w0VGgwmS1F7ntE3krzCWJ
 EJX4oTvBObppZGwzwEMahBSyBLY/gPloCdWW1EqguPmwMkRTyW7kIbvHbRVvdRu6BV
 N9BARRQfKKvVPUQhd5/6xrZZGCxDqq2DhaPHDqC81mx1/d2Ua7yLXBepVOMyIhjQuS
 i3iRMYcPArqq+B68TBnTyFopBk9cNNvfh9q5JcEKcK3DeT/l0cV83F26XBGpR2Yobw
 RLPKjpYEiQx8Kk/UGGB2pTJBU+8Z/CY34M/R+Mv7+CVx5e3sMcWkitA58bohHPT6sK
 d8ay07M1QlJ7Q==
Date: Sat, 5 Feb 2022 17:31:14 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20220205173114.5a60fc47@jic23-huawei>
In-Reply-To: <20220202204112.57095-1-andriy.shevchenko@linux.intel.com>
References: <20220202204112.57095-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/1] iio: trigger: stm32-timer: Make
 use of device properties
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

On Wed,  2 Feb 2022 22:41:12 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Looks fine to me.  The stm32 drivers are well maintained so I'll
leave this one on list a little longer for feedback.

+Cc: Fabrice

> ---
> v2: dropped depends on OF
>  drivers/iio/trigger/Kconfig               |  2 +-
>  drivers/iio/trigger/stm32-timer-trigger.c | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/trigger/Kconfig b/drivers/iio/trigger/Kconfig
> index 8cef2f7452e8..7ecb69725b1d 100644
> --- a/drivers/iio/trigger/Kconfig
> +++ b/drivers/iio/trigger/Kconfig
> @@ -38,7 +38,7 @@ config IIO_STM32_LPTIMER_TRIGGER
>  
>  config IIO_STM32_TIMER_TRIGGER
>  	tristate "STM32 Timer Trigger"
> -	depends on (ARCH_STM32 && OF && MFD_STM32_TIMERS) || COMPILE_TEST
> +	depends on (ARCH_STM32 && MFD_STM32_TIMERS) || COMPILE_TEST
>  	help
>  	  Select this option to enable STM32 Timer Trigger
>  
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 4f9461e1412c..5049d9ecfc1a 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -11,9 +11,10 @@
>  #include <linux/iio/timer/stm32-timer-trigger.h>
>  #include <linux/iio/trigger.h>
>  #include <linux/mfd/stm32-timers.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/of_device.h>
> +#include <linux/property.h>
>  
>  #define MAX_TRIGGERS 7
>  #define MAX_VALIDS 5
> @@ -771,11 +772,11 @@ static int stm32_timer_trigger_probe(struct platform_device *pdev)
>  	unsigned int index;
>  	int ret;
>  
> -	if (of_property_read_u32(dev->of_node, "reg", &index))
> -		return -EINVAL;
> +	ret = device_property_read_u32(dev, "reg", &index);
> +	if (ret)
> +		return ret;
>  
> -	cfg = (const struct stm32_timer_trigger_cfg *)
> -		of_match_device(dev->driver->of_match_table, dev)->data;
> +	cfg = device_get_match_data(dev);
>  
>  	if (index >= ARRAY_SIZE(triggers_table) ||
>  	    index >= cfg->num_valids_table)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
