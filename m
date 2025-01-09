Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32153A08AB5
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 09:52:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7B43C78011;
	Fri, 10 Jan 2025 08:52:50 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 079DEC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 21:19:21 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d7e527becaso2095413a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 13:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736457560; x=1737062360;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
 b=C96SHxH8tj6ZfxMODfQmgBYxLSZ/d4TfT2DRw3hrXl+p+lbQKW2wRIDcCtT3bWrTI2
 wD43LwZp4EU0MkRX0Jt0UAe9yuBNJ55i0Y9DupVslTHs5biLH+Ce9xUEw1rKdhzjbqVm
 dN8ZG5CkX1eXYIM35N65VKLbNopLqAi4bFY1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457560; x=1737062360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
 b=TXFyUtsE+q7VaJ2o25lCpfa/92r4ei5yucMjzAsN3vWSzxtLfJjSRuPHkHoFf0Cn9z
 b4wxOjJb6oPvUKvJXTgYWrSjD7OWAhvnU6g94eH/ztLR7VO7yhofWTWRGtLIm5/7ildc
 ETMszQ1arZb57ARc9fKjac+8tak9rhvxFc1lqYTocRB5TgvxeSh2GzZklciEO9sd67nn
 hR2O1tWZkFtoD+A5aKXYYf68Ox8BWMv2pUuoid4vVsILtFbqfBOYnviU9DYHLTCoLHgT
 V8icryAywLww8rHQixxjpll1zLtRl0VvA+bgG0t+EPuKkdFCXhTH4Iy8DWYB6+C9RYC+
 at9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtQbFcjw13NnewlFM5WMcX0unxov90KYXE4tMM8CptGFerwyGIymKoik658/BaD8p+J6QEQjegrOXdxw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwWRjN4ubv03oOpXBeGYh8xm5BeMsZX9XYHRUkZuloPiiyddCjf
 a1/ZLCvIqmrDJXdzlr7gbG1+oTgSxM4MINPPBXpKP3ZJa94bZd7qX/T8IN+sSHo=
X-Gm-Gg: ASbGncsy2VToSCvFT+3HxxeJS0ZQX6Tcz/UNlb38JHnxqt5tDbvu/j99O4JcO2n9D+0
 KpMRQxsUBO9lFlxxMrWhhuwbSIr0MiBb2ljgImdn2JcIlQRHPWW9ng4b7/UcJFrimcrHDW80+Bq
 dvhztcWEnog2wxNrY0ptCXSswGjk5vuizScS1OMe6JM2NNwuXSxRH/l5MdrNhcXZt4xo+ggfvvy
 5W01uSty4XA0b6+DgMF8b8HhQxok9W/3GbqvwU+BMH8B4jfbiPdfP+AYqKRr93YMFwjq8mbQVlH
 LOVqnmD/yIFmYjtjC5x2IX/9pYYcoPZn4c2UHmVS44DB71i7cnh+DJM1bSRomgiSr6Ys+8YA3qx
 H8LrGV6xwHTDSobLYEw==
X-Google-Smtp-Source: AGHT+IEJwiab5POVdxFq+KPMtd+AMk6FXjRfRzUyO6955YIp4KLeb/nmZtME/YvLjxsDXy27od+mJQ==
X-Received: by 2002:a05:6402:400a:b0:5d2:7199:ac2 with SMTP id
 4fb4d7f45d1cf-5d972e00032mr18870795a12.2.1736457560441; 
 Thu, 09 Jan 2025 13:19:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:19:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  9 Jan 2025 22:18:30 +0100
Message-ID: <20250109211908.1553072-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jan 2025 08:52:50 +0000
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/4] clk: stm32f4: use FIELD helpers to
	access the PLLCFGR fields
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

(no changes since v1)

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
