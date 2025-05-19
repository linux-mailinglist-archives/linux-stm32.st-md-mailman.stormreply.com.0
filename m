Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3CABC663
	for <lists+linux-stm32@lfdr.de>; Mon, 19 May 2025 19:58:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 280C3C78F90;
	Mon, 19 May 2025 17:58:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E95AC78F8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 17:58:33 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-73972a54919so4501013b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677512; x=1748282312;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Karrir3qGfnZexw7hDw/No/aef2xlPMTVGkHG+coGOo=;
 b=J/XiZ+kDLTEBa1s8rpxe1pwoHpXc5b8ZySXo/RCYQzidlZUUWH7nDLTnmkCnSEBy+d
 o0KFfHwkO6d7dg4k+LMf/RdSFKHeeRjzv2DENb1iehAynla9zJNTMkcF78fsJQwqdzq8
 WFSF1b32H9j0vSZrg/Fv9hh2jbXsNyMH8qHwmfaBKsN+SC6BGE3zGVvbLNv6M3BNtgNF
 dP3CH0IhWHJdAl9ohHd2YciLHFHVcg+qxPT1WVue6FO1rRgkilHpDH2algu76CVKn+pg
 +ujQKfHBJspMMNTxPs8/F8ocReOG5pEd69jpVsMwbwgaIwxirCxu/0pq3KC/atc8ZW69
 y53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677512; x=1748282312;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Karrir3qGfnZexw7hDw/No/aef2xlPMTVGkHG+coGOo=;
 b=by46WZPzkes1xAPjf6Z1HdXcClWk8gIPoflobxj3sK//pTjuiV2hofJWkv0JVkeLTw
 e816rQTek8nMJJ+K88xeqCfRJyXl7jle6YZl+laYZkmheuryEkdJW/t8XN1qnLDNmqxj
 Gu6wqYW1Fx8QjrjaC4QIo8YOyj5rx8RBA74vHLA7UngTnRbF7D122H1//oMq6Wd3oF+c
 JfZJKxj7BEE+8FOpMxPew4bSFvWGvi4YwtsoAsS32A26WCYtcaehrGhGKq6wkFvFdljm
 bbAyxoblyb7oWWT3YfDQscZjypOPgW3Vg7ioxUV7VLgHqMVwsZmlXLtCLT8FpA7nl51e
 t4PA==
X-Gm-Message-State: AOJu0YzfeYLbd9dj3YN2DR8CkmUaqNmx2dVqoJlxvzBrEczEEJAyHNSe
 8aJXI0JgwL55onCkqdcFRidT7RumKdmZnq7YDw1kYrC7aMlGnISgXJdh
X-Gm-Gg: ASbGnctx+P0l+4M2zWa/gTpXQQs0dlimF8AXBdw9yr61oJMDaB+t8KLVptLFs+UR88D
 CrboViZnv6ySXH5wfxU0SOYnbj11KmwoSEnbBNSmdbjIIjpo5qhQuChh2HL96I/k8inTutP6Fay
 y/CmzzZeOBWNw0qemoPb8ds2/nph0ECwmAQPrEr3lNajQCTskUkzeN7Rn+iYLFyrHtKxVP9zqZi
 Pa3KBksCf+4MYM4F8VXsn3C7QRsBOYd1RqFY3mbxUu0bdqymhMm8tAtbwkiy0PqrdxETxQc+/dV
 yvYA67vHomnWfAkd+mF0GRFKWMGHuxHkOePH95kGPtqqt/6oyE29YVchPz8zoLLyibDbbUssQtU
 3eP65/5wObsUj1E4v37aAjUCEjNLmdOlELQs=
X-Google-Smtp-Source: AGHT+IGO5VhCfHqzwe45oRjW0HQKf7V5Mdw6UX6FnmvfK7pEEurQpJKwXL6VZzmbMg6xgYUW3QBNXA==
X-Received: by 2002:a17:90b:3c45:b0:30a:4c29:4c9c with SMTP id
 98e67ed59e1d1-30e7d4eeecdmr20887688a91.6.1747677511640; 
 Mon, 19 May 2025 10:58:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e87575c61sm6513115a91.41.2025.05.19.10.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 10:58:31 -0700 (PDT)
Message-ID: <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
Date: Mon, 19 May 2025 10:58:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250519170055.205544-1-antonio.borneo@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] watchdog: arm_smc_wdt: get wdt status
 through SMCWD_GET_TIMELEFT
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

On 5/19/25 10:00, Antonio Borneo wrote:
> The optional SMCWD_GET_TIMELEFT command can be used to detect if
> the watchdog has already been started.
> See the implementation in OP-TEE secure OS [1].
> 
> If CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set, at probe time check
> if the watchdog is already started and then set WDOG_HW_RUNNING in
> the watchdog status. This will cause the watchdog framework to
> ping the watchdog until a userspace watchdog daemon takes over the
> control.
> 
> Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>   drivers/watchdog/arm_smc_wdt.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005fb..f1268f43327ea 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, enum smcwd_call call,
>   		return -ENODEV;
>   	if (res->a0 == PSCI_RET_INVALID_PARAMS)
>   		return -EINVAL;
> +	if (res->a0 == PSCI_RET_DISABLED)
> +		return -ENODATA;
>   	if (res->a0 != PSCI_RET_SUCCESS)
>   		return -EIO;
>   	return 0;
> @@ -131,10 +133,20 @@ static int smcwd_probe(struct platform_device *pdev)
>   
>   	wdd->info = &smcwd_info;
>   	/* get_timeleft is optional */
> -	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
> -		wdd->ops = &smcwd_ops;
> -	else
> +	err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
> +	switch (err) {
> +	case 0:
> +		if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED))
> +			set_bit(WDOG_HW_RUNNING, &wdd->status);

This is the wrong use of this configuration option. It is only needed
in a driver if the watchdog status can not be read from hardware.
That is not the case here. Worse, using it in a driver like this
overrides the watchdog core module parameter "handle_boot_enabled".

Guenter

> +		fallthrough;
> +	case -ENODATA:
>   		wdd->ops = &smcwd_timeleft_ops;
> +		break;
> +	default:
> +		wdd->ops = &smcwd_ops;
> +		break;
> +	}
> +
>   	wdd->timeout = res.a2;
>   	wdd->max_timeout = res.a2;
>   	wdd->min_timeout = res.a1;
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
