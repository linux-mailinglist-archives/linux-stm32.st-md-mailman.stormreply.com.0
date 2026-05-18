Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJfwNuWOC2p1IwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 00:12:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7231C574581
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 00:12:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69BD5C58D7C;
	Mon, 18 May 2026 22:12:52 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFE3AC1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 22:12:50 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-82748257f5fso2410729b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779142369; x=1779747169;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
 b=iHwI+1cV6mJRO+HXXeUIZ971IrzZ3WW0uAGG4hKxoJCzXNfbaPlKlzve1t66rI5fmf
 f+XtSUfY7pk7FQzFrAhPoCtCReL5pDj/SvGDPLS9cB0CZuAhyE+sbExtrTa7xjYvxFkJ
 Yomo7uYKATgOBIt7T+kbtYsaeuyYdwC51++GTRnPQnpu0bsfc31rgrcq2/DvZKKu1PD4
 evReaAyKD4JGR3+rBuy/b5RtSMkVZXpugQz8XBWN+piDgkFAgbAqz9z3En4ypyvV4VoW
 WXze1Yd0cQY70EXVo5NF6xvYzDl4rjQJwHJX3ET5gMqup1wKes8scAB/l5QBRj0ir1yM
 Yyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779142369; x=1779747169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
 b=HQmFDpr0JBiGOr2kMb1wCncGSnyX0TRo1ycEhVdYTQ8jzvOmzjSJNsMneAL5b+axbp
 W21kvkCL+Ztwop77c2g5vsuLvgFpZig/xBoXVjBZSc6IcwwgdOiNP+bHwNWaao5BcSol
 94mTCb/zaRYUPUX0o3UVNWeAtK7FEKVzEz/VYRaBkwJAuqgGjq6XvTb3GQrzUGKLiBLK
 ktOk/bHss4OAvFbQr3UuJdaygG8jdc2+4B1RD+ukuYi1RkHVLHJKY0c80KtfE1Fz09W8
 LvGuiNhrta23kHiSevrhPaIHgrOz/NXrGgEqzjGumjcxGjzR9lUxQJxPYQ0UUbl0nchn
 tAgQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Wtg+ChSwabpYBzBZUnLaKPvCRwhZ/Wb79HmRX6AuKotEV1gSuEqmcNuJMBnp80S/za0pNxkksT2MTDw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwY7DiNYGZkQboK4FQ8WxrsNBEDzCjNZN2tGkvXzeUtrBbwL9wQ
 i8ybVhB2qkm7AmW0gIwv5GMIhohMvOgDZ/IZrom3WbyVBHqaHG3fa9UH
X-Gm-Gg: Acq92OEZZEuHV92mArQc28+m2o2d3fiv2VAa28kQC4XGNVOmg2jbrkfvENNX2viOelq
 z/joVvyJn7HjurSIACqUzkW4bqvjnL3sA9tr15Ljheu2X6u2k1JNUkxECyoy89AiFrCHUfdlPg+
 9AyMb5c9wHG1CYUtGePybvwhOE0Jbi2Ogwp963ia+fsoKXbcgQVJzO6k7Rtbfs/a35LBGOaJbMv
 zghv333OXr4VpWJIPPLn/j+7O0CpE8NAREzJ5BjF43a9psAON7t/vQ7aMZruD7OEw8Bhyk6CVdW
 zsqtn/n1PQl8ToCFihunxj/NOlcWdXB54Jhnnd35c0UKy+rhRsLCtO6mYkfTudKmu0awS0kzlg5
 KHNh7nGTosVV31333aP4RtSiujsr2iztcqcV0CMIFF2fAh/S2+NHKBdvbUhS89Kg1oFhZhfDHRD
 rU4OGCpY4aNL3G8VVl81YGhyTQ2HIRdcociOWlkA4Nn36ERM9Tm87wGBgJmkXEHZtyVuUJXB7x/
 fFLopfYuLPuj9LWEiOIjaVTcz+Kq4+Cuvw=
X-Received: by 2002:a05:6a00:12c2:b0:82f:9a88:9092 with SMTP id
 d2e1a72fcca58-83f18ee3862mr17241901b3a.33.1779142369233; 
 Mon, 18 May 2026 15:12:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19f7cca8sm15870899b3a.56.2026.05.18.15.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 15:12:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Date: Mon, 18 May 2026 15:12:30 -0700
Message-ID: <20260518221230.19879-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Cc: "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b?i:clang|llvmb"
 <llvm@lists.linux.dev>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Justin Stitt <justinstitt@google.com>, Brian Masney <bmasney@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH] clk: stm32: allow STM32MP COMPILE_TEST builds
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-clk@vger.kernel.org,m:llvm@lists.linux.dev,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:justinstitt@google.com,m:bmasney@redhat.com,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:morbo@google.com,m:mcoquelin.stm32@gmail.com,m:nick.desaulniers+lkml@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,baylibre.com,google.com,redhat.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7231C574581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
STM32MP clock symbol for that directory gate instead.

Building the STM32MP21 and STM32MP25 clock drivers then requires direct
linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
that compile-test coverage.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/stm32/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile              | 2 +-
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 9c3a9703ad92..0cd2223de3ca 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -150,7 +150,7 @@ obj-y					+= spacemit/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-obj-$(CONFIG_ARCH_STM32)		+= stm32/
+obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..3c143371c77e 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..cc95fac66449 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
