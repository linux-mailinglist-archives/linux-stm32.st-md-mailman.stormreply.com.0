Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E9ACEBFC
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29E91C3F92E;
	Thu,  5 Jun 2025 08:33:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D331AC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 18:00:43 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-73972a54919so5262701b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 11:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748973642; x=1749578442;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
 b=CSekFxLYmLFN18cJpsqY3nKePxnGprbuyX5Ded/oDhWvM2ZkqarDShWpPVuHkTyHYa
 w3KxA5u1EC7Swq2x1L7VJlRZ7p7JQlWhKA1VVTh8ed6p03hxG+2IYj1g5SxoTZ53cz37
 tXp9sRNPEhmOlPnGOSYFvkmiP4Gybl+x/QjODUS5dX4x9wTfdwVf3di3G5YNoom/kltd
 xtIVM9SSrH5jXzsNH+abn+VU/852cvWqCYkVoWldzNvlP6m+qiq5/drQn2eQpYxKXktQ
 3w7EV/zBG33aECd6t5qPZXGwth6fYqiy5fzdyZjWeea3unAyJdSZKlXTdSzSOESvXTPt
 ZR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973642; x=1749578442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
 b=khMwc59PAoyaxGZvf6Pbs3xWpUgfyJH1EIXPhYqrpd/HEfQlfIyZl4E95p9LuE7lJM
 jWvPFELVAK+ly1cqmwYekXGuE6BYN8tY3BVv9OuCCe0S95C7qxkb9V0sS1GroxxFVvm+
 mIXwgNltf5tN4/JxsYS/gZ+SL+0JuE/tGjZwfgHW0Y0xqrjKBHN6Y/RfUswg7ilWF7zY
 0AFgQqnXGyLhxRaFgHJcNyPe3G69Sbvyr3knKnDs1qeZJfQGuYSVr9J90eIPiIOFMgzJ
 b77nwTsondTOeX52CbrOJK3KpypfgwQKoFy8zV53vvTNMqSf2SkEdeND5akO5eNUSXHs
 qj2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTD++7ngIET48rcelrIacCT5RGTJP5iLsVeIAINjz+UfWuZ50SmNnG4GfI5MMKEif2QXqC1l7VxeVA/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxuTbM74dBbXaYjdSxNVJaElyBOPXKcoSEL76E5lLgnJH5gPyLU
 WZ0ozGHRPpNKLc3MIGujvqhTfsedfbpCL0btyEGLbWgukVJ+QJEMLzwkgt6P3adXWTvfhwXgtMJ
 W8+iC3Q==
X-Gm-Gg: ASbGncvzio7MuFQMod/meAr5GOaCuQ3tQe90LSBw7GlWNf2Zy2e3FWPmUHa+O7+f5z2
 F7JlwWWGClLEtmh2AFSAJr9iTWcg2Fup6Hg9w+wr+uaowfiXr06nMnvpDW2doYdc3zOb8TEP/wS
 aAySoTGiRk4r/dslnFJNT/a7iWW5XMWZRj7PjaaxtCcnF4jtTI31lr4bm/2NyJx9JJvcXWrIFmA
 VIaQxBkHjPLze7d52fUZYbAP6ZBBzreH/N/LPNGXpdcBRvbDktalR9Agpv66uitVKXC8r5lQDPl
 v7/HBBWij0RtbDKAG41X+FTgY1GKWgAnlDF//nt7Jr9Ai01jBkz3o57zQYgD5LqlHFX0lDqwDMI
 po3bZRC65deeKVL0F8dOuetqCDU4=
X-Google-Smtp-Source: AGHT+IEodTIVtAPtf3Z5cQ4Uq1uQBXjGOn+G7Y9GhI4s+r7QBMKm7jSlhasASzLhvPxxrzys9RVm6Q==
X-Received: by 2002:a05:6a00:1a8d:b0:742:a77b:8c4 with SMTP id
 d2e1a72fcca58-7480b1f6371mr74882b3a.3.1748973641368; 
 Tue, 03 Jun 2025 11:00:41 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2ecebb4834sm6427681a12.74.2025.06.03.11.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 11:00:40 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:00:37 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD84RUX4Tt4jg62m@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-7-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-7-daniel.lezcano@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v1 6/7] clocksource/drivers/cs5535: Add
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
>  drivers/clocksource/timer-cs5535.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
> index d47acfe848ae..8af666c39890 100644
> --- a/drivers/clocksource/timer-cs5535.c
> +++ b/drivers/clocksource/timer-cs5535.c
> @@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
>  	.tick_resume = mfgpt_shutdown,
>  	.set_next_event = mfgpt_next_event,
>  	.rating = 250,
> +	.owner = THIS_MODULE,
>  };
>  
>  static irqreturn_t mfgpt_tick(int irq, void *dev_id)
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
