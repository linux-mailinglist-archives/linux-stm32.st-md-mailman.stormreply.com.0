Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE712106B96
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 11:45:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78859C36B0C;
	Fri, 22 Nov 2019 10:45:54 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F30B4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 10:45:52 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t8so2890509plr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 02:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2io4k/iq1gwW+3Ml4L4lOh1AzuywwhhqM/bGXIM0Dfg=;
 b=iMZkNX+PGvb23ecBpYgNQRQUaO8mtr3kGqYmRlTO9CWrFfM75lItHURi2rzgm9oq06
 r28HwxF0sYxRLtuBx3lJzz/TC+/bz8eCPuZ/ic524dTjXYTJNjf/L+nTapgjLmDUPrOC
 DZ+zu/haiL/BnkGR6wysoLGx+ryVj+yvLXp9c9D2g0G9Nwb04yo8tz1miD1VSBJumtBT
 vrDTl+2KIi2z3IMnGVfGcRjyYWPSjzLXOZqJ0+oVcxXjQ3wU7PnczHv5xratdBBiKuEN
 1hjBUbZXIBl+zHucz+0MXvvyK4a5w5vEJ1zQE48XNOTY84kQb5L8NgiAuCM47y35qCse
 h/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2io4k/iq1gwW+3Ml4L4lOh1AzuywwhhqM/bGXIM0Dfg=;
 b=SAgLsq3gL2dc2oPZwEohL8MCVpjJf1K69RtnFn6osud1zUqFEIpOIKg3T3fbl7cprf
 y9DMLKtre99Wpp53QvBDlfBizk6QYXMkAzyDz2W8aFU+ziTcTyA6oF+kbG3HiJh7lyyE
 rgIzpt3dzE3Amjqfwjk9wc0ocyxH01tP0S3zja4Uc85vt7dlcLrGEZHniKOF3zhJvfky
 RV1FQPu6323Zd/yaHSQdxT74ytNZkraTNgofhQRBtPUyCot1E9bt+f1mbUZjSz195WN9
 MjGrQ98rPUeEOVUVNbiCBsnw8s6t6IvAbch4RvdTvLWoI9Qsk3/6YXw1YeSAni0OClyt
 cYig==
X-Gm-Message-State: APjAAAXDyWdQa4nRj0UjHd1z/gsOKEoEnGMGmbHXmTQkYGwaD7gTvxfO
 7LP+dfty5zT8qRM3Xlbw7YM=
X-Google-Smtp-Source: APXvYqxNbupSKQWXBXy0M3HLAZgGsZHVaATRyTWbQLfH0dXjq7jJ7Ve2vFUF3xJ5pA3CN94az8rCuw==
X-Received: by 2002:a17:902:d211:: with SMTP id
 t17mr7562415ply.141.1574419551426; 
 Fri, 22 Nov 2019 02:45:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v16sm2714213pje.1.2019.11.22.02.45.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Nov 2019 02:45:50 -0800 (PST)
To: Christophe Roullier <christophe.roullier@st.com>, wim@linux-watchdog.org, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
References: <20191122082442.21695-1-christophe.roullier@st.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ffa20f2f-1ca2-9d8f-6594-33b906cbb74a@roeck-us.net>
Date: Fri, 22 Nov 2019 02:45:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122082442.21695-1-christophe.roullier@st.com>
Content-Language: en-US
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 11/22/19 12:24 AM, Christophe Roullier wrote:
> If the watchdog hardware is already enabled during the boot process,
> when the Linux watchdog driver loads, it should start/reset the watchdog
> and tell the watchdog framework. As a result, ping can be generated from
> the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
> until the userspace watchdog daemon takes over control
> 
> Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
> Changes since v1:
> According to Guenter
> I follow the guidance from intel-mid_wdt.c
> and I added test to check if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
> because we need to be flexible (depends on customer config, but watchdog
> not always start by bootloader (Uboot, ..))
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
>   drivers/watchdog/stm32_iwdg.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a3a329011a06..7f454a6e17ba 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -50,6 +50,9 @@
>   #define TIMEOUT_US	100000
>   #define SLEEP_US	1000
>   
> +static bool handle_boot_enabled =
> +	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
> +
>   struct stm32_iwdg_data {
>   	bool has_pclk;
>   	u32 max_prescaler;
> @@ -262,6 +265,24 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>   	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
>   	watchdog_init_timeout(wdd, 0, dev);
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
> +	if (handle_boot_enabled) {

You don't need that variable. Just use
	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
directly.

> +		ret = stm32_iwdg_start(wdd);
> +		if (ret)
> +			return ret;
> +
> +		/* Make sure the watchdog is serviced */
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +	}
> +
>   	ret = devm_watchdog_register_device(dev, wdd);
>   	if (ret)
>   		return ret;
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
