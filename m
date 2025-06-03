Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26300ACEBF8
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C702EC32EBF;
	Thu,  5 Jun 2025 08:33:02 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FEB0C349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:54:40 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3124f18c214so3549157a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 10:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748973279; x=1749578079;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
 b=u//8xjLhCI5rSVEyDh0cn07YwcCcyJtnkTsli3uAedo9urNhx/JOTU9V3zpmLtOtJ2
 TnIanEbhpJKJGNwfvnxilAK/93aKxsGU1pqyeeiemcFDQcBh++ARnJm8573KLMd71GI6
 zvFDtGhoRHD4Q9k10wsMmtQW9FzFTh1MKcd5N+RoH0crJpE/ZaipaDcBwhtnLFHx4z6B
 GI00SJnS95BG3K0kcf+KRMQoktNHHpzMuokqpwY/YBZaDy5zOxhl30Uakv2tIqvXv/qB
 P1/zY/NnG3xH8gjniojAdSa/flsk4E8OWR39ewtXfVWoPsRmiqfqzQqK/JDk6J1mzV+L
 /m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973279; x=1749578079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
 b=ubXF2QVq0FaSeK7+oKESJVzkRkYyWN/99Kr+3Z+c11Go07KpLzmzMLbpEX0+faG+/I
 AN6BcEFr6YPbNsXwb/L8r9G33o+qDEsEKbLOuOy52qWo6sMAVX8/f/dgFG1X9/j/3fDG
 VihmbFH3PKjphrTQBCpex6HaG/TkNFnLqeK4qIG+KYayxkeGGLytM0YQ+hdfPcyvjxNn
 JKeZSOu2BTrNmJgPNgYhdkpvZn1XxSURfdB3sEm3sl9oV+PtHQgwCZn78IYzg4IuzB7O
 eJ7UUz0CN56q4uifgcn1FVDbE/16FCxU21r1+IBFZDkyLynHvOdFTUFD34U9ZQ6v++lO
 NDOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyHQlGlM0qn9RDakHksHb5N04aogAixlmcjI6zkEJZ5jfUQD79clU4NfF1sw8tkMgLtIc3Moxv+/a/mA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyY1dpsCRVNFHvE1kbbxHrecUs4xVZDfq9ZGPZC+iVZsZ32Hr/U
 4UmSu3R6CtavFVlB+69HbD9YvnjBdqVQFWFpupYmvt2kQ2jyNXSD047fnkoPcaNUPg==
X-Gm-Gg: ASbGncv4TRgFwsSKJ7qKuPu2c8aEqpLrFAQoHPZ5ZqRbgSsthXf6b1MG38jkWxpEVIT
 PpBeGIXgtRFCNq2NXwqf6JJFgXduPFZaf3LzW5EE8IFPnbGQ79hrXZGNd8YYH6m32PVwXkOpGcl
 yuCrj34my3zHa+oZ/X4AnLfeBgb0RHsZPjIoXXuOU2CXsq3sK4+eNrYokn7Pkk2R2ZSNh9Q4cWy
 XJkKT/bnUqBDUiEyq/qdQBqHARLc2q42uImhMX+Yq8ziNkasnqH0AJrXHvV+Wqsskx6gpX4pXhI
 1juFVpj76mH8g9FNA3U+aColanRTovNn8yfJx93d5pgPTzqWBWGYJr73s9bmxZ5cAFEtyttczUr
 bIqGzdjRkdA9d2T9XEeUWihIuImg=
X-Google-Smtp-Source: AGHT+IFTvlmrdVshd5QxHXcEQ6MKKQjAV8TvJ2nBjRVCK5/HXrreUCJZBUa7P7G7vUU+2pvwwgQ3Ww==
X-Received: by 2002:a17:90b:55cf:b0:311:df4b:4b8a with SMTP id
 98e67ed59e1d1-3130ccf69ffmr22034a91.3.1748973278786; 
 Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2e9474sm7517618a91.29.2025.06.03.10.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:54:34 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD822umlHEamq_bA@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-3-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-3-daniel.lezcano@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add
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
>  drivers/clocksource/timer-stm32-lp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index 928da2f6de69..cf1423ca00d0 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
>  	priv->clkevt.rating = STM32_LP_RATING;
>  	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
>  	priv->clkevt.resume = stm32_clkevent_lp_resume;
> +	priv->clkevt.owner = THIS_MODULE;
>  
>  	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
>  					STM32_LPTIM_MAX_ARR);
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
