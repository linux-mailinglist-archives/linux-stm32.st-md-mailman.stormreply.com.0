Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E59EDACB694
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:19:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9AF8C3F956;
	Mon,  2 Jun 2025 15:19:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E239EC3F958
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:19:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so2627301f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877542; x=1749482342;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
 b=VBsasS73Et86JEQ2dQH6qYkvZbMMXT1DWXYRcEYia+2L/gwGeA50LdDWqEM86B2E8w
 hKykU2vUJ14SK1pucHvppCJ2qNQn3uthB0ZPbhmeyPU4UfrFnR2ULJqPvZ3t1twBs3n7
 jEVmq11QbAiQg1cmjdQbhXAaO8eOQ/9X08KJ1x/r2jpMp/47+tul42NXu3DFBFwoh/Kv
 VjJUjYFICmnzZnW+5Ilu0OuGhjsQUq5NtwCJfFctO1idEN8aPKTMW24GgiFinWqqLKYv
 8ncjJuwUp4Z3X0AkLcozkzDcFNVj2ERtn/SDBGqbSmBOMWrBV6w8iwKC7ZuRkKQJxfvd
 kuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877542; x=1749482342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
 b=OO/p/eZJKb7DeC/JYNq5PmrBTGsAQEXMNsCBAXkOwVqVhGhNiu59Devi7f1zeiZ+CV
 DmHxS+DWTGJwC0KG2fbqmN5ZDo0g22LNjpT8bl4hUQSyGQgqwiEslRwMZZE3mb8IBbKD
 fzCYA5FZ8+ib38NirRGlmOuUrYjByeNx4/I6MC/tR5SrfRYP/rRtECydvtYU4hzE/rKL
 bmxsbjIW0pQqXxa1OS2pXPzI9qvfageq+Neq8qS6vVkDKVl9YhAvUkFPJt/NXGH0CS2/
 ZFND4K0Zby2Nvag8XDtbKBbIMsQQsdwsiMwM0ZrW7AqtZ/B3TBHGBMFJQb0CZ1OWNLo+
 f/ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXShkOb3aTZY+M4FoaQMbg6JMISuawUekPmztackR/MvnBdM5c8ppuOXNBP8T/el6JbaEpYrm/RLOo+ZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxf+zH6+4ySc4ofq22752UZ4VWaTKIfiQljX6AZDY+lHnrRlsaV
 fq4yn9TpvIfCgpc+lSoL2mZKx6s7TNroDfCF3Vtefex1M/ym+SqdncnrfSqVIENZlqvEZVc7lDT
 M1QY9ufM=
X-Gm-Gg: ASbGncvrYVOMlzcn2F8HLCHsieW1rYYMdssShvgSmG37+v4fdLvwxvuAgDClghscAP2
 D5g9sbp1ntIdGl2dOXJ3dsSrEK/zHXJYYyaSJFj5Fi3lF+S8L5gvDVAI8piYcd7LzZKBBSquIl8
 T3VrAvF1HNJ5zAtypzkwRF/ujayBt7IxecoIpK3ooHjso0Oe0ayUy+npe4H6A2vtBeaS7TCRYpO
 0MApmd9S8DjheA9PO+BPluih6RwOlrcCCVqokO/qK39dd4HbbXbCnhmFQ4/AQRItUMW2vMnVL1m
 uIoGRpwl+sRWWG2lKhjr/1a1mET7eeroWpbTnJWHuaD1TO+/5QUflWxW6fa//j7jCWv+SRAmyNh
 v7fsRzGMxXEnrATRHzqeUK4U=
X-Google-Smtp-Source: AGHT+IHj81bY8BwahqqDfoqRAaq8f0rnARhmXR6p0QX+Wj5JW6k3OiLTjugCeEjr1Ne+gZ4EEgbmkg==
X-Received: by 2002:a05:6000:2906:b0:3a4:e2f4:a86b with SMTP id
 ffacd0b85a97d-3a4f7a6d22emr10375633f8f.37.1748877542385; 
 Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:48 +0200
Message-ID: <20250602151853.1942521-5-daniel.lezcano@linaro.org>
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
Subject: [Linux-stm32] [PATCH v1 4/7] clocksource/drivers/tegra186: Add
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
 drivers/clocksource/timer-tegra186.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..56a5342bcf78 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
 	tegra->tsc.read = tegra186_timer_tsc_read;
 	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
 	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->tsc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->tsc, 31250000);
 }
@@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
 	tegra->osc.read = tegra186_timer_osc_read;
 	tegra->osc.mask = CLOCKSOURCE_MASK(32);
 	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->osc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->osc, 38400000);
 }
@@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	tegra->usec.read = tegra186_timer_usec_read;
 	tegra->usec.mask = CLOCKSOURCE_MASK(32);
 	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->usec.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
