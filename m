Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E795EA11A0E
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 07:49:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C1FFC78F85;
	Wed, 15 Jan 2025 06:49:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E28BC7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 18:20:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso42082565e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 10:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736878830; x=1737483630;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
 b=PdZjP1X6dXBtHvs1+qhtswuuQJ5iSkMillW0ghOIIW1jWT8k6CfU+vqnbv5mNEGbqr
 LvpSoxldcPpHUcMbEiPhWEHt5mbVvDdcxAyeczMwVg2ZA4NmftwG5XO5ULLN2IRtoAxU
 eBgfOPYHyYWPSQCKlklAPXSCzD30Ox3/Eqc7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736878830; x=1737483630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
 b=VuRP/6fLwuY3TXSLaZfYR+bl2g0HC7gDOL+MsecUupvQVxDeluXjCtx0Ki8JK01dGR
 dzQlYwcGefop6HeQCm4je8cSgePH/3FDUC0nMVrrZxr1mOF2jdVdPbTEzeALEbjGjOSj
 cKPMgDgO4wiYrn94HyCeyW7pigbtHmF9qM9LqHdjCdG3LPlzp4iERCtlhjnKk2ebxCra
 p5zAaTIqIC+enUok81hdkbc7uFtQuokVNABgyZLi07HGW+vsF4cqKdfQ029JuN3oG2FX
 wpsPdApn3LzpjAbtfcbn80AfvSJZ3eM3DECTdNFF9+vM77QNS7NRPkd6UtK6pETmJ5+G
 Pv6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVVEm6bjVflFNOJ4HXzaQ/eoyLkeDTj0ldMVkBV7Y//UnAMEbw+hD5O5g94UK2Do9DgvSdYVp7ef1Lyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXGi30du2gm2DB3NRFxCSzhHYHluRd/wFiIoHuRc+bDD1Xbtvw
 lbmUVtRygEDcgQFiIPfcRc9Z97S6HF6zfKhyxoDci0GgFTRvFZxg2TIlqDCD/Fw=
X-Gm-Gg: ASbGncvy4nxjJWBu0Owikc0oyh6SRdqD/ILJsrxxt0rYJoojVgmk+yqw5onSHISyzfM
 RQ3tKUQ7Prr6ObfA/bndz3lqLS3Agrk77jhr5dg5rST5fb/itezknVqP4npP0KFQyIBCaasY/P/
 reqpXPQaAEnkZ0Uw/2nOlTQa70e+jIRPxS7Z+SOvA75pSkIfQzhkg+kZUUs/YTsfuQcBdluju4j
 yvbcXVcBBDymSwMWqZMO38/O8of9SyesfmrHRt0uv6DiCs1i8q4/7I/cgOVlEPGmWgykHRcXzKD
 a+IgUtdI7nUMq59hiKlOyg==
X-Google-Smtp-Source: AGHT+IGg8Flgcd5l6IUz8p8YGCesmVvDp+YPLJXbTETLgCS7syXTYsMMOkRNhniDeCoESET8hKOsHw==
X-Received: by 2002:a05:600c:4f0d:b0:434:ffe3:bc7d with SMTP id
 5b1f17b1804b1-436e26ba521mr286846075e9.16.1736878830386; 
 Tue, 14 Jan 2025 10:20:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 10:20:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 19:19:48 +0100
Message-ID: <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jan 2025 06:49:15 +0000
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/4] clk: stm32f4: use FIELD helpers to
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
