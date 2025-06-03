Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2DACEBFE
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54FD9C3F932;
	Thu,  5 Jun 2025 08:33:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 776AEC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 18:04:27 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-742c2ed0fe1so5750039b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748973866; x=1749578666;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
 b=UYHIv6hr2/titI8gcwC1cM8DCEAAq+f6VVhktz+LV5k3toelFROVsK0sucOBSTiXVY
 dBfVS8WJQZgLZ/1vhw5f/rX2kKXhxFrvaQtR8ghEJIlPKyDGXBPvCnjlOaGNzxQ9nmVR
 VDQYP9KZwalkE9qVeVmXnJn0SpjcSoAZBzgRQmDHmg7sBw+7aQEJ3SK90P9dc9p5jHMo
 oS/8hN2PuUOsZsL8xbe1a7MFKUAt3drfiDGpUeAKcOijqlD64GWk+Bw+jQiQ+enrKgPt
 ZGvmx/sJB5ccZVBLaPjH+D+7RlB7+wokpQYjj+1nb4GISuujob5UcR/OK+YPG+lMdNl2
 6rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973866; x=1749578666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
 b=UgyZtk9ZRaNKz8qOs2+dSJ6BfZ6ZFsddG9QE2iKsHasUJujP08Pu/7y1tqET96bKZZ
 rFo5M5U0Tp3LpG9iwsNZLBudPXanZXKSzQNRSDVk1WhsqxSBV70ZNdM9OV+TxmGKpOG3
 KjwvhLGHTS54+i7Ct/CRHmtKCNq+7vyZyfFQ1yf5+7AdpxdmHclswGbdf7XktQSk00CY
 YjeXrlRi5twkLpC87zA0oOy5b6Fi/SeU6UQHdTTdA97F3XQYsGDgeKzDplx0545ZhMi5
 8XnRrTXuDj8RiuHI8sfCsSkZO+z2OrYlqyl6MQuulPBqxMU7rZBvwqV2CgWy/CAzeHOn
 En/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnslc31wmdq0K1X8P0SxrX3nm1XHAuGKAKbQydRIs1/S/gqVpwssPyzZEKd9n/a1c/IEpiT6V7AIlJww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yysg2wzbeo3X3VQXohUBbkvpQ/mN3s4CWV2OKAnZLDBE0MXkrUi
 55YdAdMdU+IHm2bmJLu1tR2IGJGhOi9BoiNx60Wz+zvOD02k8ZGvk+ZbReULdv9y0g==
X-Gm-Gg: ASbGncvSgGWZPmRT2oLgaLTzpHASH2hdvXIbIQ5R+ZVoGiy+4dGwjDy3KJI+5MrM8NQ
 k4vR7x7XkLUIxRu5LegLa75CQo92SCeO0pdp3UfVedBNQL9CTHhy5eYMeEKukdoOYFgIOgImcXC
 NrzUlb2XS5U9H9Erzi/0BwLR/TUzGYtKFoT9tHv7MtNlRazOc3wJcvvqzR1JkTiI6kvWCSOHaeZ
 QdtDioKsjMtc9FcGVN0EnoInjAV6ocS1QZkC2LGrw1eoQBenaLFBs4sptvML1ZWLi8sBXgOd24A
 Rej6Pc/IlvVchaYrjCcONWv40UxZcgf/odi2qxGNzR/Jp74n7Hflc6H8Pfw+k4Ffmcs5kS+Gq09
 yKuAAkrK7EgGJyB/fuPDkVYhCGRE=
X-Google-Smtp-Source: AGHT+IH7hVHc0tlAgXxgFaCxYRaYIJQ3DQ+FY7DmQvhi6XPfShjmFssaz9Z/mtpKobWUSTQxJxN8MQ==
X-Received: by 2002:a05:6a20:e68c:b0:1f5:889c:3cbd with SMTP id
 adf61e73a8af0-21ad98b31f0mr31767222637.35.1748973865748; 
 Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe966d4sm9999195b3a.11.2025.06.03.11.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:04:21 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD85JdXveNWlWDn4@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v1 0/7] Setting the scene to convert the
 timers into modules
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
> The timer drivers are all compiled-in. The initial pre-requisite is to
> have them available as soon as possible in the boot process. While
> this statement made sense a long time ago, the platforms have today
> multiple timers for different purposes along with architected timers
> which are initialized very early. For example, a timer can be used as
> a backup timer when the local timers are belonging to a power domain
> which is shutted down, or used a watchdog timer when the counter are
> shared, or also as a pulse width modulation counter. Another use case
> is the platform user may want to switch to a timer different from the
> architected timers because they have interesting characteristics in
> the context of a dedicated platform (eg. automotive).
> 
> In some existing drivers, there is already the code to load and unload
> a timer driver even if the Kconfig does not allow that. It means, the
> need is there but partially upstream.
> 
> There were multiple attempts to configure the timer drivers into
> modules but it faced the fact that we were unsure if it is correctly
> supported by the time framework.
> 
> After investigating deeper in the core code it appears we have
> everything set for the modularization of the timer drivers.
> 
>  - When a clocksource is registered with a better rating, the current
>    clocksource is swapped with the new one. The userspace allows to
>    change the current clocksource via sysfs
> 
>  - A clocksource can be unregistered
> 
>  - When a clockevent is registered with a better rating, it becomes
>    the active one
> 
>  - A clockevent can not be unregistered
> 
> A timer driver can be loaded later because of all the supported
> above. However unloading is unsupported because a clockevent can not
> be unregistered and that will lead to a crash.
> 
> But if the timer driver has the module owner set, the core framework
> will handle the refcount correctly and will prevent to unload the
> module if a clockevent is registered. All the refcounting is working
> in different use cases.
> 
>  - A clocksource is the current clocksource, the refcount is held
> 
>  - A current clocksource is switched to another one, the refcount is
>    released
> 
>  - A broadcast timer is registered, the refcount is held
> 
>  - A local timer is registered, the refcount is held
> 
> Consequently, it is possible to unload a module which is only used as
> a clocksource. As soon as a clockevent is registered, the refcount is
> held and can not be released thus preventing the module to be
> unloaded.
> 
> That mechanism ensure it is safe to convert the different timer
> drivers into modules.
> 
> This series adds the module owner in the different driver which are
> initialized with the module_platform_driver() function and export the
> symbols for the sched_clock_register() function.
> 

Thanks Daniel for taking the time to dig into this deeper to help identify how
we can safely convert the timer drivers to modules! The series LGTM. I'll go
ahead and address the review comments on my MCT series and rebase it on top of
your patch series.

Thanks,
Will

<cut>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
