Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 017887B6C71
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8192C6C837;
	Tue,  3 Oct 2023 14:54:44 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D723C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 18:09:31 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7741c2fae49so7038985a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 11:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696270170; x=1696874970;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/9udtHJxdUnIEfNuTeE6b1Yaqw4dJt+yBS5HPABR3I=;
 b=AcTMZJUGBaHIS2Qx3MBCWr6nDdQhzWDQDIDPo+8Z1zcFq2lMD9GrTkoaJT1C3yi/sC
 YzL5PGaAbCuxYWwa+/otg9wUXjqpXKPCoATVBs6y8kkSsBaMH8dD7Z2hD6+abL1dXWky
 /wf9H9UTR6LkM2W8Wu1zA73au6M5G1ImhD5lCRiIC3uPyTWKFN9FJWXUl74SkhZ3KHm+
 8gTH6B61mxFczY1rvWWlRv/cEXWVubFip76LEk3m4TypaRJy6jFY/KWnhooJna67twiF
 C2K1y+Z/htRCi6eOT5cLlt20mNO0l1gFb03gY+A9AOYK6DkY8fV7vf/WaaCYnA4Yl5Zf
 W7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696270170; x=1696874970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/9udtHJxdUnIEfNuTeE6b1Yaqw4dJt+yBS5HPABR3I=;
 b=mwfurVkT2NPN0EVJn7XQAfvAYnqPrQnpYh6idY1+KjGKCyjjNqFvE73Q/LlVLcdUAs
 C1tphASLlk0hv8fFiNm02uh5MO+SuonWmfR3MZE5KXpEUCr97U6lVyn3dbWvcg+CMFQM
 hiUzq4eU8YpLtkq+kzUwTLExG/kioRwSmhh+tfRWYJvBxRzwpc9puGTiYlSPAtGXxZpP
 hrMBYdDmuU4JXftKvSx4azM/2GCfMazNv0TqZZUWSywQEdBZkzPW/7IjYI4LoU9U7Mhr
 S9XpfG2jEyYjE682M9hUYjDYFJsJprKsWICTJFJhYXRVItGqYHYTsHgR7dva/jf7XruQ
 PyQQ==
X-Gm-Message-State: AOJu0Ywfk2rk/GjyDKWwPgbItCKzmU2sYa9tY1serID+Ens3YDOjjsFd
 rEpUm9EO7dWF7zSKiLL1MUkA0q6lU69j/Fa9tpE7sw==
X-Google-Smtp-Source: AGHT+IGwixskDpdw9/a1WqqdPBN+k/f7EbXZs8t1/jSWdyRBC7cYwnhvEjFKQCihuGojDRTAfr1XbA==
X-Received: by 2002:a05:620a:b5a:b0:770:9bd2:b3be with SMTP id
 x26-20020a05620a0b5a00b007709bd2b3bemr11139670qkg.5.1696270170028; 
 Mon, 02 Oct 2023 11:09:30 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ae9e50f000000b0077423f849c3sm7390255qkf.24.2023.10.02.11.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 11:09:29 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Mon,  2 Oct 2023 14:08:53 -0400
Message-ID: <20231002180854.1603452-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
References: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:42 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 1/2] clk: stm32: initialize syscon after
	clocks are registered
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

The stm32-power-config syscon (PWR peripheral) is used in this driver
and the STM32 RTC driver to enable write access to backup domain
registers. The syscon's clock has a gate controlled by this clock
driver, but this clock is currently not registered in the device tree.
This only happens to work currently because all relevant clock setup and
RTC initialization happens before clk_disabled_unused(). After this
point, all syscon register writes are ignored.

If we simply add the syscon clock in the device tree, we end up with a
circular dependency because the clock has not been registered at the
point this driver requests the syscon.

This patch avoids this circular dependency by moving the syscon lookup
after the clocks are registered. This does appear to create a possible
race condition where someone could attempt to perform an operation on a
backup domain clock before the syscon has been initialized. This would
result in the operation having no effect because backup domain writes
could not be enabled. I'm not sure if this is a problem or if there is
a way to avoid it.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/clk/clk-stm32f4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 07c13ebe327d..a88e762d2b5e 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1697,12 +1697,6 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 		return;
 	}
 
-	pdrm = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
-	if (IS_ERR(pdrm)) {
-		pdrm = NULL;
-		pr_warn("%s: Unable to get syscfg\n", __func__);
-	}
-
 	match = of_match_node(stm32f4_of_match, np);
 	if (WARN_ON(!match))
 		return;
@@ -1894,6 +1888,12 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 
 	of_clk_add_hw_provider(np, stm32f4_rcc_lookup_clk, NULL);
 
+	pdrm = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
+	if (IS_ERR(pdrm)) {
+		pdrm = NULL;
+		pr_warn("%s: Unable to get syscfg\n", __func__);
+	}
+
 	return;
 fail:
 	kfree(clks);
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
