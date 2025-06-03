Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC6ACEBF9
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA7A9C3087B;
	Thu,  5 Jun 2025 08:33:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DEACC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:55:20 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2349f096605so73280065ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748973319; x=1749578119;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
 b=pLwoemTghfQVONw6zIG7nOy20YdpN7d7pICmVu/KEAK8fsRpiTEOGUSj2Lv0dnBoKR
 qK4druVrS2Df3qDGYMHEZ3O5P6cco6c/YQ+QIXcGBkTimIhxuZuxY30DCp3inszx7tuC
 IwX846JpNpxEwdLfPkTrCUPXbhzjNl9joA3DUQdGcuMWrajaAmyxr0poVCplUvHTWr3+
 47gdrxElUtjEAmw4ahoNUffwJ+bzmAS3URiMDZnlJa11sJIhOrL28meMJd3V7Jyb7D8H
 sUJJuzvQz5fz+5owgfxQk+F5uE9vPKAeu3XtilbUgC/0BK3TwxLW97TWkuVLgsjy5SMV
 patA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973319; x=1749578119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
 b=ZlzcLltnWigR1fNlIleSwZkN90MnANUHVxVnm037qOxR34bNmrYwgAa69qoht2yDmC
 5exXkS8do3SbeyV4OhphSLH7+//jYU4Ev0tqR2+IPAucrDvy+N6PR4c6tH4k9ytEc8dW
 UKmnkwiXtWKS1CeMvGw1IwDepMKK65GI/AI1PLO4Uk189YH9mRdMfo4eGGLdFlkroWdU
 cRmLzwlgxIYiwX53q6jouyb8gwsx2pHOBOwRXgVw4r64c5X7b233832UMojpjxbPgq/0
 tunnzSjn4lCvKFd2KFgkEXEKlrh6cafTpUuGXWoN8Du7YRKePWSjh9K/HJT+2LNHkKTo
 3DYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK5LqJVrslyJi2Tp/wbNqnKwBFA9JcUKvpboFLQupyEeI2+svAVWdoj7/lAiuiqEcjQjWzPyu+wE+hRg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDcjnOHnQ44Mui59N8sheIGNMsU0WC9HmiuuX+LzoDqA6g929v
 ifzPWNssOyzbnpYlgqp5KUcOZJcu9ed1aUWb/s9cjnDhL5EhAudkqLvAwwzixljtEw==
X-Gm-Gg: ASbGncunnIyXvqCbifkUgNO1+ytFbmY/LgwQQ7vebeypQOdh/ffWK3iE33BdxlDuUDh
 HfQsftMnAhZzC/Yc7+rXPxH6cZYZhSzKO06HKBuAKAxHnpe9FDeH5gWzivUtWOVs82b22+e+WLC
 q0SHTmBSXtPnoVLslDr405BlArJh0Z02/5S8mawdeOhbCenjJK0r0kdHbgdGg+JXjkVNyeMp7Cc
 x0lsZJ/yKHqKemZkqllO7Z5/DCibaXJrXeejSyc53YvPP8GbYWCFRsZJ0/1N6p+TLfiJsOvR2FL
 HlzMAqq+5CxFloEl6bAt3BbQfnVzKjm6wM8/ctDNxX78gUSPtci3Xu0MiAMLg89+4ggezIEtwcf
 GBeMOxe1gd7+WwD7IAx41kY2CAB4=
X-Google-Smtp-Source: AGHT+IEL8qWQXsZH17HCYlbbIw9UGPDhlEkxpYMP6+pX9reecYXFMezlkTqgJADRlqe4EFkksHLW1w==
X-Received: by 2002:a17:903:b50:b0:235:779:ede3 with SMTP id
 d9443c01a7336-2355f9ef557mr237428345ad.41.1748973318650; 
 Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506d14bcfsm90207425ad.236.2025.06.03.10.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:55:14 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD83ArjAx463xOx2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-4-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v1 3/7] clocksource/drivers/sun5i: Add
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
>  drivers/clocksource/timer-sun5i.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
> index 6b48a9006444..f827d3f98f60 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
>  	cs->clksrc.read = sun5i_clksrc_read;
>  	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
>  	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	cs->clksrc.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&cs->clksrc, rate);
>  	if (ret) {
> @@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
>  	ce->clkevt.rating = 340;
>  	ce->clkevt.irq = irq;
>  	ce->clkevt.cpumask = cpu_possible_mask;
> +	ce->clkevt.owner = THIS_MODULE;
>  
>  	/* Enable timer0 interrupt */
>  	val = readl(base + TIMER_IRQ_EN_REG);
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
