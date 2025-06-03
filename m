Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B6ACEBFA
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA5AC3089D;
	Thu,  5 Jun 2025 08:33:02 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5E02C349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:57:07 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so6516613b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748973426; x=1749578226;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
 b=GIkqw7Fxs28yYRKsN+zxEqx9coF3DzcZvmcbhVmz8qR2n/YOcY1kx35h/sj8Ts0cZe
 1r6IB/ysuxMi5Ke1kqEQdcpQCSZa6FxzxY7IoPLyP0gMzhJ5Mpc+GqKcLZytE71vAh1v
 YKWTb/fQMDo5kg+EYgZ9Z3EhI/NOzCww5kajObvALUqESUpZQ2TkUApANgQd2FZ5Smzw
 ZwmNYpTP6ILg60DROHQ+bPzZxozMcABtbmtmaRZdXBkkeHCh2XAfu5vd22JUzBsarhfR
 q2BOCX9rPdjWb7zvF12ZMz3BvalnO6LVMBB6+WhgNxuUJGqegWKEW41vTYIvFhSzu/t3
 KXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973426; x=1749578226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
 b=K2JLvXZvfqDV/Jj52yRn+USqTVQIvKX/xM7ys0QVGl3zqxzi8gF/hxnwhnkoKEuWoO
 NgHfAEcWawQcB/y73oKpxXROaQaK65a2t4ACxFzotKdc/ytPw04QBf3mwzzGwsRhJuo8
 28xsBynhG5EUmMJZSAqvokkt1tKY0vAk1b4z/CvcmoD/pUZ5m9nKVpr4Irbj4EK6KM6k
 hF/W51PoPOeGeQdXILi5+lr9nI62VRrcuNSmdrWziSyQoab2meYgtVWpCOCreguvv5DZ
 Xt4jHBvhZlEIajuNlkJuChVhRsh1rTNF/sD6wGJYtReJtvmZLf2wBRkJ3tBCBh+gC8tx
 WWug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk154Bd4ZdrmSW+XvlY9sprKki//MBFogtXZqXmwENeNxGPVNMHTEw590UQtpYjlfxTDcn/mJ0/mEs3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLIgoNZD35GEROqELAbE4+uCZeeRec7hLOgrqvr5FnVep+AXfj
 3qJz4fWBiFuQ84jMhQaxtKpf7AwJ/BzQ8Mk4jnr5xEdc7zKatiQ/1SeDzTzM1TgxWg==
X-Gm-Gg: ASbGncsCMyxvcsWou/BqzAa9jTXIJ1sodBX2+bRyuSaT3Jd+hVoMbdNMssu/jOciVR+
 0NCQEk5+qxryrUCIfMkBymit2pZGbiaiyT2TopHjnPG1Rwm8jvd6dDYSQLA8tTcNiymdxIhxiek
 j/7ZPDgJg3oXlapyNThccy/h1IthFLEhRYA95gRXO+pv8fHyVbakaSWXcuNH+VYWf9rFKGfIRxp
 M5foeWy6KTKEamEjiFqoN0VQzMJtTM6Y9XJ8Xxs3TYsz2DLL7CCW/o4s7ZOWsLrNViGqWxuL9sF
 Fn4Ax5AUJRSxWdNuloOs0UEzhpWFGfBNqaAVBrksktRRCxn656Xi3cUPdrTO6OkC2aJgIo4Te0/
 D6Nf1G6haJlJ+0M9ax6KzWxiEuQI=
X-Google-Smtp-Source: AGHT+IFJjRiNTfrHUGA38dJeGT2+lFGgu3T7p+sKAbadh5LPG+wdrTfumVyLbKsTRptWC4Rroj128g==
X-Received: by 2002:a05:6a00:3d12:b0:737:678d:fb66 with SMTP id
 d2e1a72fcca58-7480b1f3b1amr53928b3a.5.1748973426129; 
 Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab4acsm9633273b3a.43.2025.06.03.10.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 10:57:05 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:57:01 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD83bbyEPKSDXv_T@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-5-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-5-daniel.lezcano@linaro.org>
X-Mailman-Approved-At: Thu, 05 Jun 2025 08:33:01 +0000
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Saravan Kanna <saravanak@google.com>, Samuel Holland <samuel@sholland.org>,
 Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stulz <jstultz@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, tglx@linutronix.de, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 4/7] clocksource/drivers/tegra186: Add
	module owner
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

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-tegra186.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..56a5342bcf78 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
>  	tegra->tsc.read = tegra186_timer_tsc_read;
>  	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
>  	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->tsc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->tsc, 31250000);
>  }
> @@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
>  	tegra->osc.read = tegra186_timer_osc_read;
>  	tegra->osc.mask = CLOCKSOURCE_MASK(32);
>  	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->osc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->osc, 38400000);
>  }
> @@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
>  	tegra->usec.read = tegra186_timer_usec_read;
>  	tegra->usec.mask = CLOCKSOURCE_MASK(32);
>  	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->usec.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
>  }
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
