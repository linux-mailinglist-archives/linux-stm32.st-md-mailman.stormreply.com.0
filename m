Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C44ACB68F
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:18:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 720DFC3F952;
	Mon,  2 Jun 2025 15:18:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 794DFC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:18:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so29000905e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877538; x=1749482338;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
 b=Oy4t2vDijr494GHCVgyrM5XRUInMwyDrgG3VQMpbSJyLP3wY/egHzqaw1Ly5cIVbEY
 XWNamCiKCAcEUmACmF+merjxkvU7gRxyCviiPo2VUV3WMZ6jCPN08nhgl+L4ONYCPYBO
 ncHMQz6OEapF5SjzY7lJxyBddGUj17RFIiry9dzs7txIUVv8kfxmJi9j7NZv9VBP1unp
 vT9i0LT8ZSeHUpO6IxW6ZQywsSXhU0Y4sP2t2F0GJUkVymPhwWZ3L70fZ6i7mUKDFrqN
 yKQ9YUIrB23hoYYad4rkbV7L+KovMM3td0sWf6wbD7Lf1+O5CxfKeFpyxUVNCXbyKD0X
 Pi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877538; x=1749482338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
 b=hqIeSdovanZgsw8Mgq8V8ZK9V1Yj2gl/ax3xxAW7KPSIzeSpFb9U1yYshXkfQS34Yt
 MY3PaSirNZvDtt9roq17VqqauXhWM24qffrcEjwsEAY6FVhTi/xlr8IEmvu4T9OesFX+
 Y5qm0aZmI3ASoV7PFlHao/F7T+DabUc7urdF4doheuhB0MO2gWKjH757Ot1sEr1He5e7
 cPhiThR1GBaRuTE+EIuID493jOyBrwfS351khp3Xz++jBKU23LiYuhFAxY0hzLA5PDOK
 K77LgxCVaWcOtX5emDD2w3pTmkD8CJeMf1GTrKImuAWEmJF7S3aN6Mp/kmvzV6I6BzY8
 8saw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ2mwS5g/JYoSYOloN2wL5U9OP2zGTDNKLih4pk02MsO2YswEFgzxCF6oJW9IrDEC7Kxm/RfCwSaFESg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfkiKul/PVuHK0N+EK9UMaUNU1jiTzdNPV4r0/r7a5TsnYvllA
 T6XDAmE6esHM+AGnTQmEiRM0MOmvpj21fyK6d7ctcMQ96N+cwlzUlCCrwabL03vf3Hg=
X-Gm-Gg: ASbGnctRqlnzipEPw0cFskRhuvCSj4B6EEb8z1DNI+SVu0phNKyZmsEWHCINhvIhgFJ
 ecvY8GItSkycCReF+GweXc1vHL+AJFvv35F54OUViYKu1WrYpR/75hIiRlZUwIbNSa7hJERfpft
 qAFYuy43MM6O4Envw/4FLtz+VSbiQKbdeyOLlgyZzQDIZIchBF501fhku93kl0CSheGdfxUe3fP
 XKnwh7/Vlp+RgUguTNh3Q6TN/ztdN+r8n4o0nY8Q089obOGa0/CTks6EZ+YG83JoGwq7lZSo7kD
 bINdaaGoHpWv0Cd6RXTfJDXXmsL4q5XCzDjkmC9/pJsQmOVcWE7oxSEac9gcdnA9SbD+s4mjtZK
 84CxZOVRTsONr
X-Google-Smtp-Source: AGHT+IGd9hG5YHfH76nGmto9bsoX9DJOOYs0jiBYnyQonK2UIDx2uNqiKNlTaeCJzRAT0d46DtaI3w==
X-Received: by 2002:a05:600c:4fce:b0:450:d367:c385 with SMTP id
 5b1f17b1804b1-450d886f21bmr129966005e9.16.1748877537630; 
 Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:44 +0200
Message-ID: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Will McVicker <willmcvicker@google.com>, Saravan Kanna <saravanak@google.com>,
 Samuel Holland <samuel@sholland.org>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stulz <jstultz@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 0/7] Setting the scene to convert the
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

The timer drivers are all compiled-in. The initial pre-requisite is to
have them available as soon as possible in the boot process. While
this statement made sense a long time ago, the platforms have today
multiple timers for different purposes along with architected timers
which are initialized very early. For example, a timer can be used as
a backup timer when the local timers are belonging to a power domain
which is shutted down, or used a watchdog timer when the counter are
shared, or also as a pulse width modulation counter. Another use case
is the platform user may want to switch to a timer different from the
architected timers because they have interesting characteristics in
the context of a dedicated platform (eg. automotive).

In some existing drivers, there is already the code to load and unload
a timer driver even if the Kconfig does not allow that. It means, the
need is there but partially upstream.

There were multiple attempts to configure the timer drivers into
modules but it faced the fact that we were unsure if it is correctly
supported by the time framework.

After investigating deeper in the core code it appears we have
everything set for the modularization of the timer drivers.

 - When a clocksource is registered with a better rating, the current
   clocksource is swapped with the new one. The userspace allows to
   change the current clocksource via sysfs

 - A clocksource can be unregistered

 - When a clockevent is registered with a better rating, it becomes
   the active one

 - A clockevent can not be unregistered

A timer driver can be loaded later because of all the supported
above. However unloading is unsupported because a clockevent can not
be unregistered and that will lead to a crash.

But if the timer driver has the module owner set, the core framework
will handle the refcount correctly and will prevent to unload the
module if a clockevent is registered. All the refcounting is working
in different use cases.

 - A clocksource is the current clocksource, the refcount is held

 - A current clocksource is switched to another one, the refcount is
   released

 - A broadcast timer is registered, the refcount is held

 - A local timer is registered, the refcount is held

Consequently, it is possible to unload a module which is only used as
a clocksource. As soon as a clockevent is registered, the refcount is
held and can not be released thus preventing the module to be
unloaded.

That mechanism ensure it is safe to convert the different timer
drivers into modules.

This series adds the module owner in the different driver which are
initialized with the module_platform_driver() function and export the
symbols for the sched_clock_register() function.

Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>
Cc: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: John Stulz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Saravan Kanna <saravanak@google.com>


Daniel Lezcano (7):
  clocksource/drivers/scx200: Add module owner
  clocksource/drivers/stm32-lp: Add module owner
  clocksource/drivers/sun5i: Add module owner
  clocksource/drivers/tegra186: Add module owner
  clocksource/drivers/stm: Add module owner
  clocksource/drivers/cs5535: Add module owner
  time: Export symbol for sched_clock register function

 drivers/clocksource/scx200_hrt.c     | 1 +
 drivers/clocksource/timer-cs5535.c   | 1 +
 drivers/clocksource/timer-nxp-stm.c  | 2 ++
 drivers/clocksource/timer-stm32-lp.c | 1 +
 drivers/clocksource/timer-sun5i.c    | 2 ++
 drivers/clocksource/timer-tegra186.c | 3 +++
 kernel/time/sched_clock.c            | 4 ++--
 7 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
