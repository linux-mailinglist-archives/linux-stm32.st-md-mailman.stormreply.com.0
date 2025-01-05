Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565FA02116
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 09:49:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2378C78013;
	Mon,  6 Jan 2025 08:49:47 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 037B9C78026
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jan 2025 18:15:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so20305080a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jan 2025 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736100941; x=1736705741;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCWum8u2aSE0H9NGugk1g+nl+FSObYpFAdsp0A4AhFk=;
 b=r6r9ZEafNGeSPP1M/SZ1pygolsXy5SUeCeisy+lK6gvfmQto9pjWP+xBiRXiv4YOR7
 fWf70z6UjI34J6Kt4BDua4caU3rMrXT+rhotULiofRb39noIAOH7oo1AObNPeCX8+hIx
 PKU5s+nM0UJ0EGDn2FroZgEGY67CBll8OFftI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736100941; x=1736705741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCWum8u2aSE0H9NGugk1g+nl+FSObYpFAdsp0A4AhFk=;
 b=uEU492w+widMBiwtvoa3EFrzRAV1JoZS8sWJmjzEmDIk6fxqTIR4Y2oDSBSpyxXdCQ
 eMqiuccwnp7nERJVpMaYAtHHeMk5HfQ2xm8pCNQHbKuBqheIc3tUQo2cgviGJB+Se24+
 yRZr+WDHifgAUjRJWClJyWKDj8uaDqUTSdmsC1IBXsn3mydUNvkrrDCs/iZz1mX7BL1O
 KOasrfIPmNlQ24FkPC1H705Cd1b1WanyQOZbXAXwAdCkWazXOBnCM50AaXbkkKEWuDQQ
 kRJ+ikoMw/opXQpzJaWqp+ZOaUyOk5VNuSeeqTubFPdvkJ1Fjse1eWFTbMSR46pDGr8w
 ljWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlr6vOJNECdunpAmyDeL7TDcn3JopT6jwb86QW/QP27wFW4MRZpN/0SMADWjMXJZKvuxrhiNgDWuUU6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7R2+i2hEWUDMsxW3oaSseRHm6dnNC5TucEeliB/ndwuriYydV
 lEpITibzYnAE2peDna1X/0nldRGt1VldsH3jgvAWCQYYN7LSjVzEdQ2lvKfthp8=
X-Gm-Gg: ASbGncvnw97VnGmc9CPtsL4UuXFHKMwad8MgAjD9CD7S/aCUFCpdQWzZPJqBJWTT19/
 pKUwmyHPX9eBht65q4qJQYx2yMAQmykGLdxlF/fRS7Gk5iYbNDq9qOTLw9nfwqxCHg/g752GVVf
 gcs4YYrNgN1A8YjiPsUE+TZ0zVE89wO2ObkoBk5gg7FfPvgQqGsIMOiv6VXjHw5wNG2t4SuqnBJ
 DM/ju2dt7s8Ox0dbPr908nAlk+hJxkQ0PMh0Nn97UGKlDqdPCTjw5xMwJsVf46zK4k1+42FldGo
 f+KdVODG+qjGRlO2lAEc1cqfvQ4rnt0tvIeaDaU/MlYtKXwMy5aOc6eYy1edVOoBqvrhw01ro3n
 2L/inwXLCwReBi8nF4A==
X-Google-Smtp-Source: AGHT+IFeu46e7LHQ6MyNCXFCxnHyuX7vCIGWrO/EtiZn47VacrN5DdmgWvSrKWY5flVSdhQ2UzUVwg==
X-Received: by 2002:a05:6402:540b:b0:5d6:48ef:c19f with SMTP id
 4fb4d7f45d1cf-5d81de1c28fmr134000185a12.29.1736100941394; 
 Sun, 05 Jan 2025 10:15:41 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 10:15:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  5 Jan 2025 19:14:17 +0100
Message-ID: <20250105181525.1370822-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jan 2025 08:49:47 +0000
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/6] clk: stm32f4: use FIELD helpers to access
	the PLLCFGR fields
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

Use GENMASK() along with FIELD_GET() and FIELD_PREP() helpers to access
the PLLCFGR fields instead of manually masking and shifting.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/clk-stm32f4.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 07c13ebe327d..db1c56c8d54f 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -5,6 +5,7 @@
  * Inspired by clk-asm9260.c .
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -39,6 +40,8 @@
 #define STM32F4_RCC_DCKCFGR		0x8c
 #define STM32F7_RCC_DCKCFGR2		0x90
 
+#define STM32F4_RCC_PLLCFGR_N_MASK	GENMASK(14, 6)
+
 #define NONE -1
 #define NO_IDX  NONE
 #define NO_MUX  NONE
@@ -632,9 +635,11 @@ static unsigned long stm32f4_pll_recalc(struct clk_hw *hw,
 {
 	struct clk_gate *gate = to_clk_gate(hw);
 	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	unsigned long val;
 	unsigned long n;
 
-	n = (readl(base + pll->offset) >> 6) & 0x1ff;
+	val = readl(base + pll->offset);
+	n = FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
 
 	return parent_rate * n;
 }
@@ -673,9 +678,10 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	n = rate  / parent_rate;
 
-	val = readl(base + pll->offset) & ~(0x1ff << 6);
+	val = readl(base + pll->offset) & ~STM32F4_RCC_PLLCFGR_N_MASK;
+	val |= FIELD_PREP(STM32F4_RCC_PLLCFGR_N_MASK, n);
 
-	writel(val | ((n & 0x1ff) <<  6), base + pll->offset);
+	writel(val, base + pll->offset);
 
 	if (pll_state)
 		stm32f4_pll_enable(hw);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
