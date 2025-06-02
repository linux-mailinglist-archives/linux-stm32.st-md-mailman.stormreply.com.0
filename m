Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F9ACB698
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:19:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE1C6C3F95C;
	Mon,  2 Jun 2025 15:19:07 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BC24C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:19:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-442ea341570so31275875e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877546; x=1749482346;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
 b=KdkmYPvA0qPn/3tt+VtA+FrC8KtlPDaO5MX3v+wFCLMwKj4D2b3Kr6axF+k2XnriLp
 BlmsjIxaV8jIcGYQ8Y8priGbvfRDCGEp6g6P55Mlwhlw6Oz44xSrQnebeLlP2OpkNTZE
 QKSFcywMnIqY53FLhslXMfw6KGUSZNhn2Q2uNCnczLFG07Smps5K0JsDUVqb0CkDmqks
 oJz1qsWa12WX+BtGrPkLQDyvRunuaSy7U36tfh3SAoys2+d5MzRxd6tHgQeQodjgybd1
 OxPTn6lPWREaCKX+Xxy6/s4ptAiEhwuE/gV6rPsQ9E2fd1RznTPEGkWemt4fLcINV9Yb
 n6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877546; x=1749482346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
 b=ch/ih+3NeqjZ0QXT+ci9BeaqwVMlS3dJ+ydv467TZ9QRJ3JdF9SepcQtqMv7i6OJa1
 MIsP/alWb5emSeOMJEj0t/1WrQ9YCSKxJnmYf+E56/5TXQStsmHcBDzak54tKeUPPW9C
 m2UbGL0C2alWFosmL0uDd0yYMMzhV/ywn6bmK+mnCKDCDcH1XG7h3DebQ1aeis2KGUdo
 npjI4TAKt0anX9fENd+BL+sBh+x+JN5sb7nOf8pQKLMSdujZRXRAcOCW/mdedv4WWfaz
 uWEkEhqQeCFnWqyqB4fjzzPB5Zf8dOSPzhqfk/2YkxM84m7Q9qETRv/lOpVQdXvYTo6B
 7BAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdGeVkbYUH20osjqmFmFv3SY+wG8bKKRhdXvZfxsgX1vwC0rZ18JBj26nYPZbeqTHG/MqM2LlD/qoT3Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztFdu4RjN5lrcY7fnnAAv3aZmU0LvOFAZZb6IYtxvdDP1YiopO
 OnekQbSsDsizmtmC5Ghhbodymz+YBvNBfIBDKgpm4u7pEPt5gTI6+Ni2RblPUI9PhL0=
X-Gm-Gg: ASbGncvgXSBJjfM+6Vb1tNbcBrnRioui558wts485LDuNhe8TyuMtdxoWv05/0TfXo9
 HgYCX/NYG3uE3Yz4V4lLxD1sODI32HkLAZW8bkFMnGQemND8fp49VwfBeiyk9c1IQrphmDgt/N9
 9GufmYxFRIWbakihuUMYPD/dQGYRbZj9qJ3m8Lr1nkJDQVP+uRk9SHxlznJ8xfxIdiFD6u9QaQa
 wm22NGXECBP/Gx7pWwQ1USDOW530WxVfJgNpDiDTCrMFtrqX+EKYnx/q6EoU24bWPMVY2e+dfgD
 p9q1lYDq+d1LSgckXaCjKQudnTTZpQjTzBPbZJnm+zCLzB413lgJEuv4Ael20Nh6RdgUZ1t5eCH
 1gw==
X-Google-Smtp-Source: AGHT+IGo3+b4mB4bJZk3jsrIr83JxAnU/93JoVte/2RVs9090BDS0xWFY0i+YN16EfaKcepr/Do0FQ==
X-Received: by 2002:a5d:588f:0:b0:3a4:de13:2a25 with SMTP id
 ffacd0b85a97d-3a4f89dcb7cmr10264360f8f.45.1748877546552; 
 Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:51 +0200
Message-ID: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
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
Subject: [Linux-stm32] [PATCH v1 7/7] time: Export symbol for sched_clock
	register function
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

The timer drivers could be converted into modules. The different
functions to register the clocksource or the clockevent are already
exporting their symbols for modules but the sched_clock_register()
function is missing.

Export the symbols so the drivers using this function can be converted
into modules.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 kernel/time/sched_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc15fe293719..cc1afec306b3 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 	return HRTIMER_RESTART;
 }
 
-void __init
-sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
+void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
 	u64 res, wrap, new_mask, new_epoch, cyc, ns;
 	u32 new_mult, new_shift;
@@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 
 	pr_debug("Registered %pS as sched_clock source\n", read);
 }
+EXPORT_SYMBOL_GPL(sched_clock_register);
 
 void __init generic_sched_clock_init(void)
 {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
