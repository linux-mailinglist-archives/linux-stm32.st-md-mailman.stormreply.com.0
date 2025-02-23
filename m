Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE1A415F1
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 08:08:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A05C78F95;
	Mon, 24 Feb 2025 07:08:24 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DADFEC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Feb 2025 12:35:33 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-abbac134a19so552122766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Feb 2025 04:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740314133; x=1740918933;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TLE5QRlgSqhogEgkoGJ4zyn6Ko/y3vd8C0Jq9omSNas=;
 b=JorlSVboaq8JeHG458X2ZhJqic7uMqv6BVpbpGcFzMN+LW8oZ6hKFg7RcGdgXyt2Wa
 yrEFG24LVYyetKjsp7gBJPu7ivZ7SzQkAAamE0Fp1dzlQ9xy3aKQaHZbHuOEfcO3nQBp
 dXMp9t7kkx4vxnrYR/ObYYX4I8gy2GHTyOfbfMd4qKC+ieIDqennFauWlvDxHsmQafnP
 uZb56NOtTttaASCBXFh8+9LiMnDaPzZSyLbe0U/Vn4Anq090J56v1ohztmuUubcyGkjU
 DXgL1PadUIkUdjMKli6rlA/mD12jI0XqorOojuqhRyGKHEwaycMldwbtTqM92R98RkMq
 GLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740314133; x=1740918933;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TLE5QRlgSqhogEgkoGJ4zyn6Ko/y3vd8C0Jq9omSNas=;
 b=fq3lFwtQvR9fGWDCm8hYtrETnyVMmOM4+uNRTClOj7zx7eq/arAxvxy4/5V8zb06Qx
 8R02WdxgZrcl676QG1M6XFqKpq23ZZdiVhEG0OeHqrdv/VtZXHtYx9aw5F9yHfaQ7I6+
 OKzLqE45SY6e+SGBVsHhCWIbDDmg5K5jKekqQjliaoicX6AFd7arHW5XVkHLgNKJ4YaC
 FGpXuqxo4m0Do8n9Sa6PomTC9+uKOwHtZ1AHGDbR1CnoRy4qOYvmW1ErrY3VrKB5DYbg
 1SP55L7wVh5Qs6BopjcJ+9ZU2IM/SlGHB+yGARwNX3iykR3aerX96Z8TqfNXFtplR3FL
 tV0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLvX0nY/zJ6dTEESqnLkUickM1gTzNr4RInmQw3EmAyIAmQoN7BmiuEb5qzKKVlWqGMb01fgiaFqnWQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzsoJhUMu/yF+Pn7MekUVGoFxaTvyG3sbnR/3GBRGwrPJv+Wmx6
 Cl5X8rRu1QAcAQ7ii7fVMdqJGfFMPK/4IUo3N9tDga61TCCK0qnN
X-Gm-Gg: ASbGncuEa7yo49wwVwM0cEG29A9YLImsYgmPo/1y3mvaNBLiuRVZ4q+oMfxz1GnXS5Q
 LUBE2l9mMql2m0Z0i4SvbHZilI+Op4rsos9ITPpmQwxyZMnZjuyTfiBAQCMNrvPBHXNAryLRGic
 RUBAungbY3DnKz+m57m3S2s2ZLRKi1F8FBbzcYW/evuGq92cFFt8AQgkKCDwiJbHeUknXG2W5Mu
 nXPAkPQURMdrx/fZFwOgb5slCpSR86pzEgXuW2NQCOOtpO5d9RDAZyowWu1g09NzgZkNdfdot6s
 eyAbqMqc3Atqt2mMOvoXbW2/yCYzXBwRT+Mwlag=
X-Google-Smtp-Source: AGHT+IFUfiW1GQDllxCKAXgvBAa6DM3kms//5wkJayxFfKOqMm0f7VR/HR8dda+cBQ6ZDNh4uZKJLg==
X-Received: by 2002:a17:906:3087:b0:ab7:da56:af9f with SMTP id
 a640c23a62f3a-abc09d33a64mr885264066b.49.1740314132874; 
 Sun, 23 Feb 2025 04:35:32 -0800 (PST)
Received: from localhost.localdomain ([165.51.10.62])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53280ee4sm2020878666b.78.2025.02.23.04.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 04:35:31 -0800 (PST)
From: Salah Triki <salah.triki@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 23 Feb 2025 13:19:31 +0100
Message-Id: <20250223121931.579031-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2025 07:08:23 +0000
Cc: Salah Triki <salah.triki@gmail.com>
Subject: [Linux-stm32] [PATCH] gpio: gpio-stmpe: Use str_hi_lo() helper in
	stmpe_dbg_show_one()
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

Remove hard-coded strings by using str_hi_lo() helper function.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpio/gpio-stmpe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 222279a9d82b..bd4122a6f670 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -15,7 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
-
+#include <linux/string_choices.h>
 /*
  * These registers are modified under the irq bus lock and cached to avoid
  * unnecessary writes in bus_sync_unlock.
@@ -283,7 +283,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 	if (dir) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo");
+			   str_hi_lo(val));
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -352,7 +352,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo",
+			   str_hi_lo(val),
 			   edge_det_values[edge_det],
 			   irqen ? "IRQ-enabled" : "IRQ-disabled",
 			   rise_values[rise],
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
