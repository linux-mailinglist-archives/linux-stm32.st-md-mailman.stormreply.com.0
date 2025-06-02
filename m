Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E04ACB692
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:19:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900C2C3F94D;
	Mon,  2 Jun 2025 15:19:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93C30C3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:19:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so49224205e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877540; x=1749482340;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
 b=K59GBZLy/ugAK16n8fS3YPh+g0H1EDgibqrZbs8DSP5/jToE0FYykzwHh0HEBgKZnR
 1sKm/l0kOUt23emuezHYpR2YHWJEcVbHc2sFcoPjRRlWFF1djQPidrAybAMEtslEGN3k
 FErTv5z1fpMnhnvPgsy68U2w/DOmb+s8LTxJvPaLtZ549jx7puEQSN/KwKlfDpAPpIpk
 w0txkhA5dikNAUMXy0J1OWEoRFudrrx6rQL/NkB9k55i34uc7uGqKM2ijFRUrkshuhpJ
 NItoGnIfGy3fqYWhEQeXyySYeqTwc/4PlEp/V21ZWxnsZVMfOVm6stFuNEYDHrkqCkWB
 8TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877540; x=1749482340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
 b=aw6LoHIyuxzjOdkvbUkL9TdUvrCO7VjX37SNmUMVWdJFx4uWG+coblgl7ICUpd31pY
 MBL7AdXoLgYOpS+DcZnaSmQfPAstXCAxgxz60Et3yHUbir5ss8ix3GzJpgOHpt+g2wK2
 /GZxHW1/ICaqNYYhNXTYPUInYnY71iEUnMS5Z7JNAP04tl4gbuK2+rxCE6r4wQ3/XYaq
 RMuQKI+3B/1oXjNFxqFPGi0HVuXs0Qfg2o8/1TmRwDgT5+MNrRxWEW5w3Jal7SpP9+yu
 r6gBMrVSx7RrsIRLQK+00RWzZ3I8fXJe4/oN8VyMX3kGWTvtvFGkcGo6kMN3dezgp+ZE
 DIvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdTmIQNQVjcfGL2lqNhS0hE0JVgxQrg8q9CcYtohIzqujtGONFCFiQV0M83deCRIFf/7NhFJSmlqkTYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yybb6tw+fm80nOvBi7u7fAcwOgqoSrGrYakuh44oKBrzrKr5PbD
 xGJaGqaLIKNhA2xnV5RPMbgfN4+Wdfrfn3tCLEJ3JoaufRK3NXA1rsN8F793K7tH9NM=
X-Gm-Gg: ASbGnctJw4Ymp35PmiSXwE6xL3NqsPpNkR/QU8SAVTRvXQoTiEWUVBFa+p8G+Dxm6qr
 xihmkrFXmTkPJD5rFktr/Vz9VkMeIZYLpaxdhHmEdW7/0D9R00LYa26dTDKSQkCYeGzgCKRa1i6
 5vI0jHnypJYAcgBjAk1BsnKOyYScfaPJ4egglr9E95nU0o5aGUJjtMTOLcFhBmdj86zQEDjMcYD
 j2mwEs0Ilt784MdBKQ2l591rQIMzUz+ZD4fVb060zcqwQXla0G5FfqdGUQuOjf6Jw1AstxWMH4X
 NKV4/FaYzlZmEg51n3DQxpkdyX8St4rASDoPy7QDfUk7WzHVTfk1d4M4uLAdTWKAZFwsVG0PZ1w
 FAjkbP5H0QymW
X-Google-Smtp-Source: AGHT+IFyISAqwMHhCGLRj9aCfOACSARamwm5CChRIpOs6jPFxpI1R1pUgcUMERHo5kjL0SIXDlP4UA==
X-Received: by 2002:a05:6000:18ab:b0:3a4:fb33:85ce with SMTP id
 ffacd0b85a97d-3a4fb3388bbmr9485326f8f.46.1748877540038; 
 Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:18:59 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:46 +0200
Message-ID: <20250602151853.1942521-3-daniel.lezcano@linaro.org>
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
Subject: [Linux-stm32] [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add
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
 drivers/clocksource/timer-stm32-lp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index 928da2f6de69..cf1423ca00d0 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
 	priv->clkevt.rating = STM32_LP_RATING;
 	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
 	priv->clkevt.resume = stm32_clkevent_lp_resume;
+	priv->clkevt.owner = THIS_MODULE;
 
 	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
 					STM32_LPTIM_MAX_ARR);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
