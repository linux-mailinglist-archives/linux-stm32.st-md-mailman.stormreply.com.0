Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9386B720
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 19:28:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF259C6B460;
	Wed, 28 Feb 2024 18:28:00 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 807B7C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 18:27:59 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcbc00f6c04so87695276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 10:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1709144878; x=1709749678;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EF1KPzXNNkHhE7yYlv+hV5FrLPYFNCzXyE0ge4E72Xc=;
 b=n/Uj10074Q2lJqWRUzhI1zg7n2v99AqZzJSnZ/xtZCCc3EJnBhtJINSLFKbkeGBxO/
 zD5ikHRlHyHpYr9xNwU3dmzdfQ+9341palZ4psU10ZYkpUoR0mHsCDJpML+ZEXRb9RBO
 NdwPRZU4T7MT8bdF0t0Y+YZyHhLdHR2srIUvkJbzXSa7rQJE8nw6hAewnCstDMph9BjS
 DKZsbeVFWd9TuKHWiohtAWtqhfMbDCnsgmh4/uMOBvnIB5aeAcZ0TX5yMzykPzIxQzAo
 tIKtpjFtwGT5eZ8Jqg/04lUXzQjhlKaeZzf+1kCo2QCSnXJiPG+OnSp1TExHWw8tCGMD
 8hGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709144878; x=1709749678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EF1KPzXNNkHhE7yYlv+hV5FrLPYFNCzXyE0ge4E72Xc=;
 b=RmVxcn4kwHvUFLYFnuuliBzMIS/LPt0HqLi1paTIepNnQAVbmtJmPr05sA19hFn05M
 HyBqHdrpFYClXYWk2SQf3gaIr5WwADYBlhroKGC0vucGJUKc6TUl4SBwubuP5ImJZzB4
 xK2PRqRuFMEkiigQh7V+71BmDKzjBYHuzprwvqJQAO26iFyq/xVXch9qNa7rAG3+9jTb
 zBr96/yJgw/m8dAwBKR2gO55jgriPqKCUo8KQTtNFaEH7NdnApyHYTOsmLSHoo1It86a
 eQNT+T+qlH/qTGMEnBsky7f3o0b8Z6rPrWMuEhEJ0g3F/Iqyk2KDNpYUK65g9si45T3U
 z+Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeZ1Ik0xKNJfGLVkFuorKKHFvCJ1Oqw1cimWjnBSZsgBqIxlRHxbo7s2F/e/v2pAvf0LqjoC3BKhik9pFqfx0WU3iOXJl+TvYZ1dMQBsEy3pBWHvDs3i3E
X-Gm-Message-State: AOJu0YyzWssiDR5iAR5pMID4YtkN7t8A3ANCd1n0iamyQj/aIKzNk1wM
 xUUFPs34rBF53++9Z8l+kK471aqLl0VpGkLsXCa+CaWwH4AJQ5dVBKzG3KqiDkI=
X-Google-Smtp-Source: AGHT+IGGIUcPNLaPDD97/JSUYoRXanewPna4Nbjsv7a0TEzYLDOhtOT2egjmszbqhcM+oGhhhvzNHQ==
X-Received: by 2002:a05:6902:136e:b0:dc5:f51e:6a60 with SMTP id
 bt14-20020a056902136e00b00dc5f51e6a60mr22948ybb.6.1709144878346; 
 Wed, 28 Feb 2024 10:27:58 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.90])
 by smtp.gmail.com with ESMTPSA id
 x4-20020ac87a84000000b0042e390c9804sm8355qtr.6.2024.02.28.10.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 10:27:57 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 28 Feb 2024 13:27:23 -0500
Message-ID: <20240228182723.12855-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [Linux-stm32] [PATCH] watchdog: stm32_iwdg: initialize default
	timeout
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

The driver never sets a default timeout value, therefore it is
initialized to zero. When CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is
enabled, the watchdog is started during probe. The kernel is supposed to
automatically ping the watchdog from this point until userspace takes
over, but this does not happen if the configured timeout is zero. A zero
timeout causes watchdog_need_worker() to return false, so the heartbeat
worker does not run and the system therefore resets soon after the
driver is probed.

This patch fixes this by setting an arbitrary non-zero default timeout.
The default could be read from the hardware instead, but I didn't see
any reason to add this complexity.

This has been tested on an STM32F746.

Fixes: 85fdc63fe256 ("drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at probe")
Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/watchdog/stm32_iwdg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index d9fd50df9802..5404e0387620 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -20,6 +20,8 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
+#define DEFAULT_TIMEOUT 10
+
 /* IWDG registers */
 #define IWDG_KR		0x00 /* Key register */
 #define IWDG_PR		0x04 /* Prescaler Register */
@@ -248,6 +250,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd->parent = dev;
 	wdd->info = &stm32_iwdg_info;
 	wdd->ops = &stm32_iwdg_ops;
+	wdd->timeout = DEFAULT_TIMEOUT;
 	wdd->min_timeout = DIV_ROUND_UP((RLR_MIN + 1) * PR_MIN, wdt->rate);
 	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
 				    1000) / wdt->rate;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
