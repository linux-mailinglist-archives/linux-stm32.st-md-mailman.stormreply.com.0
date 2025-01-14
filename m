Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A210A11A0C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 07:49:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20D37C78F7C;
	Wed, 15 Jan 2025 06:49:18 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9338AC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 09:11:37 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so968970066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736845897; x=1737450697;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
 b=rocJbqtbbp9Oj1LkgeJeI7Kwd0AOYsMOCcOuueQ3hLTFoc0Ccj7EIt3gRo0R9IYOoa
 ybVXMYY7hlsy2tqIwWcTmpdXYpBiLo8cyGIO8BCuSH3NsZ7oOvQ7/jHKQNu2rG7PLIVU
 5fWDv/Q5+Or/F4KgC300yQPTpUuYyNBaZoXvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736845897; x=1737450697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
 b=L7DwAvUVpTTazt6pCgvYLuvii8JqNHzwd7WD8/Nfs/FTFTQdRc5dhEEh65FpYcgVfB
 9CAEbt/aH8SjZ06SGPxw2ygOjLPe2h6QdAQNHd2o8lu0U2y94BpAc9uSO4qfGMiOC40b
 cD3aakaVpCLkOFaooWlN88S6KTOrqpNB7AW9p7Zf3viXCcof5TtAFAdDl174aHcxmJWk
 ZPxpAkqViXpBKNPvUrujJsm5y/MTh4V+35b5B7vL4t14yinRAUVmP7Di4XByZaJrK4nm
 AHS5I+aRP/YfqGyuV2fJFVc3BK2khTgmMfnK/PYiejyEjMjMRBwDXfAyGYRupP5IcsUH
 hzDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv1r3Mf33RXYDrhYlkQPK6GVjF4S0ZGijYXKc31owws7gWdVDZEp66Wx9bIsXwO4oB0z/rqVxOB0N2Ig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRNOwZmtpfElxFhf64YL+ZZ/WrdkQ/W1CUdmjiuSOnHsOXElll
 OvoftxDM7/+C87SEN0Cfx/5H7dep7mrcQyqIYnloYWW/3JUPdOY6CXi2RaMl2c8=
X-Gm-Gg: ASbGncs3e1v8ccmxUfwPgHX/xVNTsim84sW2NwabDA/OVba5wk+p9k/9rzm+zlwfQUH
 rJcb/4hfehmUknaVtDgZOvVHJS2UylWxqcmHY69APEZzCDhjMLjI4q4HmtgmkYoYfTDfSvRfaEo
 8zY1+d/Z+5gWoX6ezvn39JXE4YgapIsfVl5+TpIQ9txsj0CmkhQN9bl+NzLcEA6yP3ASA1B+00z
 7RoWorUGD34R0I7ow673np6jcvCtQGqmyn2C1fiDBvEePkNs2LtZdE1to3Yn7pfFeMMPlKuKL5M
 zHA+XL/VeRxdVs0YlBkz/Q==
X-Google-Smtp-Source: AGHT+IFg5688v9iu2Z6jN1GBfV5nDayopSS598535VN8IIxu6UQsTzwr6yLMykzma1EPL9vJgQo+tw==
X-Received: by 2002:a17:907:7e95:b0:aaf:c19a:cc1c with SMTP id
 a640c23a62f3a-ab2ab6c6625mr1898191166b.22.1736845897042; 
 Tue, 14 Jan 2025 01:11:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 01:11:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 10:11:15 +0100
Message-ID: <20250114091128.528757-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jan 2025 06:49:15 +0000
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/4] clk: stm32f4: use FIELD helpers to
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
