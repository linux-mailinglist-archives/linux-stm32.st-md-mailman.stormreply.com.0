Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7AACEBFB
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 109FEC3089F;
	Thu,  5 Jun 2025 08:33:03 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52E32C349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:59:56 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7406c6dd2b1so154760b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 10:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748973595; x=1749578395;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
 b=cRyaosaKISMLSwhHIv5v3VVm0QI0AGgkOvO/GekL90gw4/tt5cjZOZmuvarfOLlOit
 OyBBeJbiSDc4R9yKWJu7PNPukuhSSOs1HYzS8jwcoZA4pJkOToqJ83a4Tt8k6oy+PUcw
 RhIvzvxr0ubauSz2NMocYq6k4geljghH6QL/MR3n24exuhBPTfI6dPopBUxEigspmrSj
 hMSU2ntuXxiGK2aA8i4uqpvReGq4UJLyYAh0JxQT3g4hZ0n11UpY/gFeeXky7mvxB7aT
 Xgvn4zM9g3HuPW2arhr/OSEg/cZhUQ5knUBAaXIxnq3ya+HzIAMVFH4dGW4eULZufaSD
 5UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973595; x=1749578395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
 b=oMHg+zcf+cA08luYNkCgQe/3hL3GcdaKFSHG0//GnYrylzpR3DrxVqUmelvjGo8UhG
 1tt+RLaXJW4REJEWAbmZ4L6AIGcKX3tEkMm2ZwGcNOaOpircIWbX3WO6hqi7LjzVOIRG
 QavdKBzZpS3nq+OhrcExeJkcVwvxNVURxDorAQcAeMXYqCkOp6X+6OLqVsAgXIzF6XH3
 B17l0IfxqDfFTlxoKd5KpcLEZz/t/ecyzTTFSYFJJyd1ibNUiQk1rX9ggsIgxElyCkMo
 mO5vKZpiWaJ+Yh/mTgjZKsVzEjZMWMQlNdKO5umOdbObx0KRkYB+bTNKQ807M9clFQRn
 47RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqzpe0sCgsqG8+vGl0sj2aWKkSQLmXNNpMyMY4bHXs0qDgxBGUKhRbTYU/aQMag3YHnrJFkopPu3ZVcw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytEANfE0xG+1RakpWXkFWbTEWi8XHQi9bWD9cXudQ7yIQkzGLs
 yHtouc6KqTZpJuXn0jJLHLyOOtAY/eMEHRhbcXPmbZ78PaKQmpykHlC11ugJpKOtwg==
X-Gm-Gg: ASbGncvts6t6XTED8e7SzXNsxtzV2yXdO4/y/sZuFv9kDcSk53+kN7LdSbgUkJb8oFi
 NqE4DKeHT7IbUbbXerFGLJGqYqr9V72/qq93NNbfZhKXGng5qW/CNlLUtxRzymTGH4feiX9kTJB
 xynMUn95rSowarVizsnonenYv8vdDN1upwTJaB0sNOMEU0woEBIdtXr1otftQt8J5qN5WO/0oOw
 wnxjkBfCxvl5/xK/JiUD9yJ5NFdMWwCEs8PZaqxvEdv+iBqVqTUIdR+NkONFOThesuA7K18752J
 mfpemP+4gp9Cr4YDqprmMBJViVaF7US44j/6T1yZU3D3E/pirfoEhnpsk0dEhLYNnJBMSoVOZus
 1AZ1K9U0MNVE0CrDIawSwF9ymZj8=
X-Google-Smtp-Source: AGHT+IGjgStLfRgl5mcLbCo1SeqO3sImaOglz5V740eKF1RoVh4hQTng1HI7HfjGR1PadljmDx9/GQ==
X-Received: by 2002:a05:6a00:ccf:b0:736:4d05:2e35 with SMTP id
 d2e1a72fcca58-747fe24f7dfmr4701490b3a.3.1748973594522; 
 Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affcf703sm9619170b3a.129.2025.06.03.10.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:59:49 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD84FVFtggGP-FF2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-6-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-6-daniel.lezcano@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v1 5/7] clocksource/drivers/stm: Add
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
>  drivers/clocksource/timer-nxp-stm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
> index d7ccf9001729..bbc40623728f 100644
> --- a/drivers/clocksource/timer-nxp-stm.c
> +++ b/drivers/clocksource/timer-nxp-stm.c
> @@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
>  	stm_timer->cs.resume = nxp_stm_clocksource_resume;
>  	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
>  	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	stm_timer->cs.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
>  	if (ret)
> @@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
>  	stm_timer->ced.cpumask = cpumask_of(cpu);
>  	stm_timer->ced.rating = 460;
>  	stm_timer->ced.irq = irq;
> +	stm_timer->ced.owner = THIS_MODULE;
>  
>  	per_cpu(stm_timers, cpu) = stm_timer;
>  
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
