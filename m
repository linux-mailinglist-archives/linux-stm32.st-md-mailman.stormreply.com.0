Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0846ACEC00
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B178C3F930;
	Thu,  5 Jun 2025 08:33:03 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1182FC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 18:01:32 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-311e46d38ddso4730598a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748973691; x=1749578491;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
 b=3u1j+z7UgVVrjxhTvKCeJxv1bckZR1cFGKnJ2PB+ZB2Ea2LsCfmDl3DGVrYQjgRNsc
 KWl6+PtJqoGAGG52K8S6PhfyxoqYvc0oZSEgiSiZuWdxs3NwmvTUgkcgHsHD8ZHUoW4j
 WQegOQVSHdlpt51U8pQeGxzvI4FFoXMA1Extjc2LhubKm6DXFxFLI01JruH/D+CwHcqc
 TORq7Sh/5J1dHVwWu6v46O3Fmg4zjp2BSA8gECqZCcEegSBgIMEOMRn9mDA0ncX0y/fh
 nUZA8pgXebyM0xo2ZwPWoz4a4botl8f7BVR7RJl0qy2DnRzoSrsRT7UUBfMkDIhBAGe0
 OnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973691; x=1749578491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
 b=jOb30DIUJNI0BfYMEtiAAeHfSzQrPH1xwuixsAZXq8+BkkwLaOs5kYiAEEf8Ip6r4C
 w/Y7vM03KRNbS0Qdj/V5AIMFKaqosulSLNeZirBpyvfUahauFoXU1kiM5WnjjinEo2p1
 mDEQJYD3uyKXXhJU1vyfZp02T3toBQ/Y22BV1GacabQ4D1iH1omIUm7uxsAqqVLoSTsq
 gtH0EvSETvtl5+97yRP8KbEPMcack0EoaHsWDiWgCQ8OyAZ6OgwpWA32SdIXV2lRf4kj
 LCW/GCXbN9NL2SNI7O+nQxrW7wGWmCQmuRDvoPngoHHN3zGqx9Sr9GtxfQ25RevVSP2h
 Cb1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWxkP1hIJKbcKRjajMTjU2/YNyIFTiz8gTDXQmWOxfA8czFidH6JQbnxrbTTfw1gYAAPvEL4tMPSWtRg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhZlVr5eF5DxLW9LSK2EZ/Ry7PK13wqrd1lb9lNaICVHEabjcG
 nIVSgcslFUQwd+uOOR2M20tkbC4tskhwsIBVgpbaERdk66JWx3W4cqjSChVNoSWAYw==
X-Gm-Gg: ASbGnctZnFgApfajrxZwVRluiPSfkCnZsXje9DLnYTlRzLjmh2CDfqTLFR9V2KBUq68
 mrOl79l76qzaekGcc1ZnDDzmpwwluviHr8JDRpxbgF2UotHFObhwRoWzfTHFXiHsqjQg6Tonp3j
 pEnNsjZCIicgyH04sCUCiAviGhKeos5gokbdez61ZkYh3csETIARaQpGt6P43/b0zp+kL7GwPxb
 s28LfnZ2hIsjpz8LF2eCqu6H7mBqcitD9A3nzjzB8lQUy3ADzcPGmSSrQiro8JrnzckkVP3g1Jc
 +q5gRk5hUAGsk5B6E+VGkErG9SRNfpzwJ1tfhdO2P25ovHd6FdjozQZFmsMt7ekRINnorV6hiVz
 SMyHk4iWJs+5AnXLmxSHhQ2G4hgA=
X-Google-Smtp-Source: AGHT+IGJVe96mQDhzEhZqYJnC27O9vMFUAoTp1xS/H2NANso8WpCr6YJ9fd9Q8qaZg1NI2W+7g1xJw==
X-Received: by 2002:a17:90b:3f10:b0:312:f263:954a with SMTP id
 98e67ed59e1d1-3130ccaa125mr73097a91.5.1748973691331; 
 Tue, 03 Jun 2025 11:01:31 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e29f899sm7572695a91.6.2025.06.03.11.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 11:01:30 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:01:27 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD84d4WArf_terBP@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v1 7/7] time: Export symbol for
 sched_clock register function
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
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
> 
> Export the symbols so the drivers using this function can be converted
> into modules.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  kernel/time/sched_clock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> index cc15fe293719..cc1afec306b3 100644
> --- a/kernel/time/sched_clock.c
> +++ b/kernel/time/sched_clock.c
> @@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>  	return HRTIMER_RESTART;
>  }
>  
> -void __init
> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  {
>  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>  	u32 new_mult, new_shift;
> @@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  
>  	pr_debug("Registered %pS as sched_clock source\n", read);
>  }
> +EXPORT_SYMBOL_GPL(sched_clock_register);
>  
>  void __init generic_sched_clock_init(void)
>  {
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
