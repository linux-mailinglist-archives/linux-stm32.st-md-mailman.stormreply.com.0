Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F72ACB697
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:19:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C293EC3F95B;
	Mon,  2 Jun 2025 15:19:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EED0C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:19:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so33055485e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877545; x=1749482345;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
 b=t627T7DtCwW4uE+jWTUV/7u72l0fLUCK+TNKZOxEvEk0DwLuoaO+GTUAX+UHtl0ncY
 gqXKD5t7BCrj9bL0u+E8Nf9U8tTfHbiJAWLrn/jRPbogF1wjKacVczBocvX+BpIFaT8Z
 Fg2E7/REgkXLYVXyAWY/ub5v1oN9xFJ70364p6V/0Z2u1fDcd6eo0a62ge12eKC9oa7J
 t2JLpFh/p4o+65pB/e0G8DLFoqJQNZQUY4c/NodEsTVq4UyrSsjkBfla4Y4+sw+RjPPU
 50lqD/OF57ZVy3O17xV/dLMrM9roVfbLwq+4fYiI0zXGLhotWUr4/FmbXbltbcBWV50b
 pZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877545; x=1749482345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
 b=eA+OVP9A1x0Burzlxn6EKrLYu9SDG8SF9hN4SZmqAhmSj315c3+j0bZ/3Dp2q1+k6F
 nlBU8NbRjaWKZFwvEEWvLGrcPszR6FZYERkuIyry5hY8S2Itx1zyZb2O5sLHBpCwnmHF
 U6jdwzrLbVcxd5rfnUYpomYjZM90OmTydRsp3FFh6K9mX7vLJy67zoSrPNLA+TIUo5cJ
 SzJMLFS73fvaLXKlGxtQgB4VgOG5tkv7JvDXP5UARFcOe2QaSiQZUkhs5oXINiHz/J74
 AOheW4VTE95dEVO9o4v2AlkoXoCn8F7qFhdegzfV1+WvLeSVz4GAsaaNiGIHA4PmxUa1
 z2ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4TnW2HMngauXdpOb3P2CB90LrcQbsdzlYl6MyLFHAzJdOjKYwIGzw095BFJ9gtwyymDHOB3u6NlX47Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4eZ53JZKQZCaFhH9rSH81UfKLSRCnpug85Mm8nwsbfi+F3zpb
 RlmpF4FTsaAJ3xUoYJ75oGFwmkT9wFsQ/X4u+S5nkuGceykQKRzVgJCJe7Cl2lVcq9Q=
X-Gm-Gg: ASbGncuYqY4/WMef8V7mrWLATcOWbYw9YlaiPeHJse8cWT/slsNoPxFQ2YrpXd+ADBv
 YE+LQkX5hVbgxr79437RObOUVEGODqalJSWucoAmOCJV9CCaZ59nW5B/6lBnPNLTIM+24rtyg/m
 IH3t3p/ebGUbwDawVIgSnTx/DFV8H2oCc1SJ1QLiytv3qM/JaYONg3N7CCbQroNtGJY224IVIOt
 yEprHkHJtynIIB1++6h2LDcNlv7Yg/C9LqQuZ3TcJtqUvaNeODawt3DvlDZAnrmxbbgM4gLSenU
 ++QwU6Ij1Sf4UEsSMYydWasJp+j3NBoq24REsjfdIBWeAMVneZJSOfTkYILJx7uKiz1XxURl3Vi
 Me3IOMFenJgZb
X-Google-Smtp-Source: AGHT+IGtDDtI7FhuuIjfq30FaLggo6siUgKsnVHXy0In7YrLSlYbl67D9UVPet7StdoKw8HT/BY3WA==
X-Received: by 2002:a05:600c:3e06:b0:43d:b3:f95 with SMTP id
 5b1f17b1804b1-450d888b0femr83074465e9.28.1748877544845; 
 Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:50 +0200
Message-ID: <20250602151853.1942521-7-daniel.lezcano@linaro.org>
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
Subject: [Linux-stm32] [PATCH v1 6/7] clocksource/drivers/cs5535: Add module
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
 drivers/clocksource/timer-cs5535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
index d47acfe848ae..8af666c39890 100644
--- a/drivers/clocksource/timer-cs5535.c
+++ b/drivers/clocksource/timer-cs5535.c
@@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
 	.tick_resume = mfgpt_shutdown,
 	.set_next_event = mfgpt_next_event,
 	.rating = 250,
+	.owner = THIS_MODULE,
 };
 
 static irqreturn_t mfgpt_tick(int irq, void *dev_id)
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
