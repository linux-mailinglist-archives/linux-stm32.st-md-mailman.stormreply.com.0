Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F1ABE318
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 20:48:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4F28C7A822;
	Tue, 20 May 2025 18:48:16 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4C1AC7A821
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 18:48:14 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso7643912b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 11:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747766893; x=1748371693;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=NEGW8OYP6vqNIYspfG7hwW+otQHfZSlN8GWZjQQt5E8=;
 b=Fd9k1QUasTcXqSjNwjgn/CSpVapt5KN4FDx5SUKI5KgCya7VWZ4dECNGKmMTh+Je+D
 mauN6N6SPrT2QJXSNF25j7DAUnUe8DNS6uJ99tfcgdyhQH4JS9A48+5zixZmynVegsZe
 p5VOfk2mF2k3/uVyU18k+Clso4/BgNa0l/XxGBKsrAQwkTcuK8VlFukjmuhQpbbnIW+t
 tF1uvJgTRwroTp7sruD6Rgu+8P7efcHdh/EXJP1rymdzSs9AJeqtNnc7UWpV4qKTTlgV
 9qUCZpdDUTGNOtgqiArmIEeGj2iAIl7sUmCcNgy8Y7yFPZHMHZfLDckq/iPaPis+tShD
 3RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747766893; x=1748371693;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEGW8OYP6vqNIYspfG7hwW+otQHfZSlN8GWZjQQt5E8=;
 b=OjIzJ2uCCJm8sMx+mEhpIwJ9FAwGCUtSAGmkmldfhDwGNVmqOi8a6MpjxIsBfiD+4v
 z0/aGnPSnd0D34ssS/4Ggx+TTjsPsnmR7/dDIhBDHZZaSFOr9zYh1c83WVW/fP8rwlm7
 edRr8Tf3C8GUU+qQabJ+MD/xQ6vKZWrP0LmtE0IwhhwEARsyWaIRem7ybuP14qIGHwQJ
 XUyMEjw2MA6jKW51bJLmgVJ0nma9dbZevv+ZakhNI8Cz0cJ50JcQljrv/MxzD1tOENDH
 JgUWZMBLV5BxazsG4TYjsxhTF8xTWkNO4N2RnTfFZ60naq0W824WOV4C8Vg91bHtFxun
 soyA==
X-Gm-Message-State: AOJu0YyJO6qFG2CcL1T4CUYZmq5JXLUs0wO9X36wtivf5bXi1XykiUyH
 KY0nM0yC7PliBfYLm4KfHjgYIlK6k9TnCifhdiBhTwoJxNGqO4b2S/tJ
X-Gm-Gg: ASbGncvbJXibLQWWyO0cEqghstYFvB6WAFzhv9OHY5pycXeGQvPnj1JVM6txLF54Zfm
 vm2JYvOnMNir9MAjZdvAWrQAoTg7piyUgJSPnL3r1sFtFZW3ZPYiviCr3YG6GVIIosvUaICwt66
 rORkIAcPtdiiED+qwV2eOVcwWNzZZg+eK/JO4Ngm5j9xLFnLGpoOI+fn7pnAuD8hJBIcLECdwpe
 qYwsxqHmtif1HVW3UxcsOKr59JutiSem/nJUautjby5GuO5VLCRz/8/C9FNAdW2aYInfy39Sl6Q
 Wy8cTXVjt8rxKI6nDicwQMB1KsBB+DpGHb4MKWRh/LsxUOw7CIH80c1Ou6AIZLS/BcX2vr+TtNM
 w2+kcOf24iEeNyWWbOoGtRMJt
X-Google-Smtp-Source: AGHT+IFWWb7cBfTk9OMRuDtWVVYPpXEqxfFx0itPACSefZ+pOiztCqmjtWe0mkzSLDRwWK1il9criQ==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-217ff4bcc70mr19982865637.39.1747766893374; 
 Tue, 20 May 2025 11:48:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a982ba69sm8544242b3a.91.2025.05.20.11.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 11:48:12 -0700 (PDT)
Message-ID: <c45c7b81-9952-43e2-91a8-e92d0860fa5e@roeck-us.net>
Date: Tue, 20 May 2025 11:48:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
 <20250520085952.210723-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250520085952.210723-1-antonio.borneo@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] watchdog: arm_smc_wdt: get wdt status
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

On 5/20/25 01:59, Antonio Borneo wrote:
> The optional SMCWD_GET_TIMELEFT command can be used to detect if
> the watchdog has already been started.
> See the implementation in OP-TEE secure OS [1].
> 
> At probe time, check if the watchdog is already started and then
> set WDOG_HW_RUNNING in the watchdog status. This will cause the
> watchdog framework to ping the watchdog until a userspace watchdog
> daemon takes over the control.
> 
> Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/arm_smc_wdt.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005fb..bbba23ace7b85 100644
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
> @@ -131,10 +133,19 @@ static int smcwd_probe(struct platform_device *pdev)
>   
>   	wdd->info = &smcwd_info;
>   	/* get_timeleft is optional */
> -	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
> -		wdd->ops = &smcwd_ops;
> -	else
> +	err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
> +	switch (err) {
> +	case 0:
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
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
