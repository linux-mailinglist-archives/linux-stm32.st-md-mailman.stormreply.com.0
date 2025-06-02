Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7AACB693
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:19:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BD0EC3F957;
	Mon,  2 Jun 2025 15:19:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC82DC3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:19:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so28506595e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877541; x=1749482341;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
 b=JO5mRpwLD4Cc1f4b5rYd5bel4v9dkHsakFDFLi9Jm+wgf9Q7L4bXpR1dMVQWMOsAis
 mGHI3iW0o4yoIjbST3rn31MmBCoJitospL5b7wMW97Rog7JUK8YZx3hN8pkwUEwnCO39
 NzLYDYMqnldt/YrD1+NYLjMLNHlhzGyd1+XTnXdflSPKQIckl00+zO5XFdg/ZZn6Q8jo
 NoVLQ/p1pWe3E4rxItpnnkRYSdFr4HaqP0OjXUkumrelSg76qVKMN4V3nD4bAyybNVsS
 TFaQUP0x8PJJ66qFG4KUnewkgb4skhhn7VNbAxAof+9BNFKsOer1ViTtQDaooDtIt6m5
 oxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877541; x=1749482341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
 b=Otzw27/FQIAPtzZ3ju+ZiDKhI35gZy5uxjv618MM6ZcM3VCmK6jjvxcwMnjiLbVnGG
 7RWKZQoW5a5HJoSJ90V78jDqfyWK0RFID9lAMzQAp1757lDUSx3wjaKPnzZwFbfF1Zo4
 tSJDJB/RsAdpunZwxfaVoynzyBWeJIy1sMr+LjTSbog6bqwII+0ToYOl/Lf1TlUw90uO
 fAsR4O4jawjrP28HyeJb+jSLudI1lvJmA73m44DrBSyXIDzZ4JrMNBxDYpFTv30WyARw
 E/kwhnqrsAlKIaSFj5eU2aqhMoe70eO951azdMcVPkz0O8ISdV29M5ed+aah0meQalr4
 niAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFNIjVKy7ETBryXfcua/3dsw42e4JD2JUPaK8xuLKg0gChH+JZR8TXw4IlKpK+LVrRJ32FJBJKt2mxBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyAl43IJZ/KkQKGU+whTXhmhEbDxrPg3+TOaDTrDoyq0N+cJEAn
 EnHenjNXLK9jA0+sL78tYxDPTyM+6gtWGnKRpQp0EkSwnXx9+7XRBZ1P1+jgK0enNFU=
X-Gm-Gg: ASbGncvfi1AkKE2/fNkOu613gju9MUuzXEdC/Vb0E+TaO5hU57eECsntB5mMsEiOgNz
 3578Hh/R43QTG93/baOMby24s7675oQ6pz1R+lGxi40myKxxDYFtjF3xBaQGfQi7/F51mbWjKO8
 jRHwk+6Dj6bPO1BclwWNdp0koBJliorlkIURdqmePqv+I6g7SU56ynpXnYgPCuDR3vxay6q+6WU
 KchvVrpKQbVKZbk8VHZLQG2TdwZLh6P75hLw1XlxextjfDlQuwQ3KWCwJpUAAIcu+DCpssqS/2H
 Mr/U1SHtVa9/7b3w2AMg8F+ySqS601pZrkpEOMZVJ83FnR5M5zEA73FSmJV132GvCxGEBsu6JxJ
 hXzOqq5djlZdB
X-Google-Smtp-Source: AGHT+IGm8o6nqRRjiZlM8OEtcH7Giz5iqVqvOKIqNhMfKW6+DVKKTld7vkKIltD7iNqNITzYzwGGxA==
X-Received: by 2002:a5d:5c84:0:b0:3a3:7ba5:960e with SMTP id
 ffacd0b85a97d-3a4fe3a8214mr6931603f8f.59.1748877541180; 
 Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:47 +0200
Message-ID: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
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
Subject: [Linux-stm32] [PATCH v1 3/7] clocksource/drivers/sun5i: Add module
	owner
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

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-sun5i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 6b48a9006444..f827d3f98f60 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
 	cs->clksrc.read = sun5i_clksrc_read;
 	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
 	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	cs->clksrc.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&cs->clksrc, rate);
 	if (ret) {
@@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 	ce->clkevt.rating = 340;
 	ce->clkevt.irq = irq;
 	ce->clkevt.cpumask = cpu_possible_mask;
+	ce->clkevt.owner = THIS_MODULE;
 
 	/* Enable timer0 interrupt */
 	val = readl(base + TIMER_IRQ_EN_REG);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
