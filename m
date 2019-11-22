Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5610771C
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 19:15:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AE32C36B0B;
	Fri, 22 Nov 2019 18:15:18 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1B13C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 18:15:16 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f10so6985659oto.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 10:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ETqvKsN8Ki2d6xHH8hTbXwpsKjbO3HfYiexCJg5rHps=;
 b=Vz3gQ6O1BkWhfRXtLHeOZ1T4j0hc4HluEkr2GeygkgSlXNXYYls21eZu5tBmUxU+b0
 vujx+tMFlVWeq6L7c40pdigm6tdfzY+MBy430YjI91yH9k0WvHBwSELP2kByBZVikZIG
 40FJeXLCZrR2RuSbOsQxawVgBZ8YTfm36yX6kbjcsZyB0rtBH5OcPXNQrQ2mVaIxg0jI
 LLGoxqrDBzEvEVJ9Dn0joSrhUGIxdqivs5KIbC2/hIf5aeNpxRmeLJbE1uojbgcMDVn4
 eIDnamhHvrUYwjVCQmhijVLTXA7429vX9v4ZKh7JuBc6nORGyuKZZmZLF8UXPIurGpzX
 vHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ETqvKsN8Ki2d6xHH8hTbXwpsKjbO3HfYiexCJg5rHps=;
 b=eqK6hi0Syh3kVfpxVa7XXUFWijyU6wOPprvAi5qpa62brO7Q4KcaRujA8dmeRB/zOh
 ez4WveAwvhI70DWTCG+61vkD8Q3Y+8BAq9MT1utczWRWeHJEO4BcblLtOpRXE1H6XGxS
 LPl3VexoUmsaS0760MrrEVJIXWmEh6S4BXJTWUMIHs2a1vMS+GGyP0IAIwi2wDeq3cCo
 TWQ6nVJegRIPja7/HT0QrEc0HMnj6rNIPX81tDkgn9lsNb4PFNXoHPbSRbiZslFfMQdF
 8Zne36h0s8ghns1QOplP/EEsZSDycEBYj/XcAdu5blTjlVbRvMvjTbUdxBP2mk0l0CoZ
 5bPA==
X-Gm-Message-State: APjAAAUAaxrgUUXeCdOQpKanEWb+/EuPOCc+S7SBk9isKyuISSvTbC0l
 61Ypk9voOdnHn4iK4edo+bY=
X-Google-Smtp-Source: APXvYqwBL0X8maNi1+glH+XvII4//7Sep1yviT3f2IJKTzhTVDnXRxb6iMDaSdRlzAFvgdA3hxqlRg==
X-Received: by 2002:a9d:3b0:: with SMTP id f45mr4071239otf.92.1574446515684;
 Fri, 22 Nov 2019 10:15:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e23sm2391977otk.73.2019.11.22.10.15.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Nov 2019 10:15:15 -0800 (PST)
Date: Fri, 22 Nov 2019 10:15:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20191122181513.GF13514@roeck-us.net>
References: <20191122132246.8473-1-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122132246.8473-1-christophe.roullier@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 wim@linux-watchdog.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
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

On Fri, Nov 22, 2019 at 02:22:46PM +0100, Christophe Roullier wrote:
> If the watchdog hardware is already enabled during the boot process,
> when the Linux watchdog driver loads, it should start/reset the watchdog
> and tell the watchdog framework. As a result, ping can be generated from
> the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
> until the userspace watchdog daemon takes over control
> 
> Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v2:
> According to Guenter
> removed intermediate variable
> 
> I've tested some config and it is working as expected:
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE is not set + daemon watchdog in userland ON ==> No reset IWDG2
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE is not set ==> Reset IWDG2
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE=y ==> No reset IWDG2
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON puis OFF ==> Reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE is not set ==> No reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y ==> No reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON ==> No reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON puis OFF ==> Reset IWDG2
> 
> Thanks,
> Christophe
> 
>  drivers/watchdog/stm32_iwdg.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a3a329011a06..25188d6bbe15 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -262,6 +262,24 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>  	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
>  	watchdog_init_timeout(wdd, 0, dev);
>  
> +	/*
> +	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
> +	 * (Means U-Boot/bootloaders leaves the watchdog running)
> +	 * When we get here we should make a decision to prevent
> +	 * any side effects before user space daemon will take care of it.
> +	 * The best option, taking into consideration that there is no
> +	 * way to read values back from hardware, is to enforce watchdog
> +	 * being run with deterministic values.
> +	 */
> +	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
> +		ret = stm32_iwdg_start(wdd);
> +		if (ret)
> +			return ret;
> +
> +		/* Make sure the watchdog is serviced */
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +	}
> +
>  	ret = devm_watchdog_register_device(dev, wdd);
>  	if (ret)
>  		return ret;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
