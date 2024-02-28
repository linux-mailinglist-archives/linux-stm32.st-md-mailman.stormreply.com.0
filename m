Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B74AD86B73E
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 19:36:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 673C5C6B460;
	Wed, 28 Feb 2024 18:36:35 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 814F4C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 18:36:34 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7c40863de70so348863339f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 10:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709145393; x=1709750193;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=i0qHuF8v5L5+UifsJbzCUW28nUptTePFPyiO2bCX6ks=;
 b=F9i8/HfLg8QtB7evYDr65KXlQDIgWjdig3s4Pm7GcZ32e23XUoNzSO/Whp8U/zTZ2v
 R1Uf5G/AUs8SB7CUH1aJTI05CxNBd01Yt97Oai9w/s45K+IT08VetiHfSgZfI7h6CVSq
 ZeOcO8tGa7HzC9TxUERDaLinFp0awODNUAeYVzH+XA9t76OGQMYtoDseCk2YL+NGemjY
 nzmUgBnlOTnlmaeMqNAo09fWZT9Ej58iAXDLsmGsdfQiV6ujZsjtSOqmqOkzfIJ249qx
 9Kcx8B4OEp65Fv8CvsWPKWVKA+JwgVDdRwN07WJh9RTNv5oVy9k0MPNRyVcrNRVc7UzB
 eh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709145393; x=1709750193;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0qHuF8v5L5+UifsJbzCUW28nUptTePFPyiO2bCX6ks=;
 b=gcNICkgon7JfNcwWpSbbLqQgpJvHMgTDT9t2QhhkJD33KGsLQ10rZp+EQca8ndGbzZ
 2ET8GXRTuac8Exb0FtORZs5baFfEog40UrHgI/k3LZiav9GQWpjoMpoh+gxOHy3fuSdX
 qcSlZFOh5x4AA5egYs06mntTg0Ea/Xbvh7qGs/ldXGX15WCHa8KmaTlnXK+r+cf0tTAD
 AfuYQfyH2p7EKerN42cVYOyOSSWvFxRfpyZRMb2iiyXCTKSczCdGcM+YVVXZnMMbzRkA
 NeHW1e0D+6uUX9GD5Ks4xDbuSPDGr/dDFqUdBsls8FhVEE01W4O69DHPJgJpAN3AmHrI
 hlLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVktV66NK0T9tPlf81ZI+pjzANMDPxbhKDgz9UEkAKrbNkwtueyBKSpep0CCjGM6YauY+rPtQsPNq52gOkNfqMDosvSrcKha/wfcCyA23vD/ASWipfK9DZA
X-Gm-Message-State: AOJu0Yx4kIeG0vAxet07JakvSnOyRoDfz+v/BGU9Jm0eCRq0EXi2bs2G
 PgYrVI3EikMjslRPDo3a7gA4+7oTt45AXy1f4j/r6W98JbjjgP6R
X-Google-Smtp-Source: AGHT+IFDZMMcmuBvVmAObjRdoqBHh0wc0R00rw745aI8/xyv00qLKbeH6c2EI5Ey7tACKdY1PTDGiw==
X-Received: by 2002:a5e:a911:0:b0:7c7:9185:e58e with SMTP id
 c17-20020a5ea911000000b007c79185e58emr317643iod.12.1709145393249; 
 Wed, 28 Feb 2024 10:36:33 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056602304100b007c782f6d55csm19518ioy.24.2024.02.28.10.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 10:36:32 -0800 (PST)
Message-ID: <f147ed12-8b7f-43c8-9b55-3000b6e4fd27@roeck-us.net>
Date: Wed, 28 Feb 2024 10:36:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20240228182723.12855-1-ben.wolsieffer@hefring.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240228182723.12855-1-ben.wolsieffer@hefring.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] watchdog: stm32_iwdg: initialize default
	timeout
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

On 2/28/24 10:27, Ben Wolsieffer wrote:
> The driver never sets a default timeout value, therefore it is
> initialized to zero. When CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is
> enabled, the watchdog is started during probe. The kernel is supposed to
> automatically ping the watchdog from this point until userspace takes
> over, but this does not happen if the configured timeout is zero. A zero
> timeout causes watchdog_need_worker() to return false, so the heartbeat
> worker does not run and the system therefore resets soon after the
> driver is probed.
> 
> This patch fixes this by setting an arbitrary non-zero default timeout.
> The default could be read from the hardware instead, but I didn't see
> any reason to add this complexity.
> 
> This has been tested on an STM32F746.
> 
> Fixes: 85fdc63fe256 ("drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at probe")
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/stm32_iwdg.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index d9fd50df9802..5404e0387620 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -20,6 +20,8 @@
>   #include <linux/platform_device.h>
>   #include <linux/watchdog.h>
>   
> +#define DEFAULT_TIMEOUT 10
> +
>   /* IWDG registers */
>   #define IWDG_KR		0x00 /* Key register */
>   #define IWDG_PR		0x04 /* Prescaler Register */
> @@ -248,6 +250,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>   	wdd->parent = dev;
>   	wdd->info = &stm32_iwdg_info;
>   	wdd->ops = &stm32_iwdg_ops;
> +	wdd->timeout = DEFAULT_TIMEOUT;
>   	wdd->min_timeout = DIV_ROUND_UP((RLR_MIN + 1) * PR_MIN, wdt->rate);
>   	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
>   				    1000) / wdt->rate;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
