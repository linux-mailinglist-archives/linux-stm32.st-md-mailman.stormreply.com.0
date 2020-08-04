Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 299D423BFE3
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Aug 2020 21:28:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8D51C36B3A;
	Tue,  4 Aug 2020 19:28:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4976BC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 19:28:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FCAF22CA0;
 Tue,  4 Aug 2020 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596569295;
 bh=jL0qvrIWZbUG6iyW2+vlFy/rDnA34eVXXUTdLk1dH1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pi6SY3SUL0/7MiBZt2jitKAi1avA9Ai19KAHIvMhbgLFqULvT289Do353HeEsuRh6
 nsv65LJBKJWxFTWhwiuouhQPd+G+pGvQC7nFahhlxqCDGq1MHshl7MZy74rQCpKrGu
 As6mppldhxYGAaF8gcuispWPEDInceuejaQ2thpA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
Date: Tue,  4 Aug 2020 21:26:50 +0200
Message-Id: <20200804192654.12783-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH v2 09/13] ARM: s3c24xx: include common.h
	header in s3c2443.c
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Include common.h header in the s3c2443.c to bring the prototypes of
defined functions and fix W=1 compile warnings:

    arch/arm/mach-s3c24xx/s3c2443.c:60:12: warning: no previous prototype for 's3c2443_init' [-Wmissing-prototypes]
       60 | int __init s3c2443_init(void)
    arch/arm/mach-s3c24xx/s3c2443.c:77:13: warning: no previous prototype for 's3c2443_init_uarts' [-Wmissing-prototypes]
       77 | void __init s3c2443_init_uarts(struct s3c2410_uartcfg *cfg, int no)
    arch/arm/mach-s3c24xx/s3c2443.c:88:13: warning: no previous prototype for 's3c2443_map_io' [-Wmissing-prototypes]
       88 | void __init s3c2443_map_io(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/s3c2443.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 4cbeb74cf3d6..c278cfc10ba5 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -38,6 +38,7 @@
 #include <plat/cpu.h>
 #include <plat/adc-core.h>
 
+#include "common.h"
 #include "fb-core.h"
 #include "nand-core.h"
 #include "spi-core.h"
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
