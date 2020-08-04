Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2D23BFC7
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Aug 2020 21:27:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9342C36B3A;
	Tue,  4 Aug 2020 19:27:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BD3FC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 19:27:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9885E22B45;
 Tue,  4 Aug 2020 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596569258;
 bh=3iJScp/oOnw2TBm43T5Fy57mzej9dpxzGVeQy8mj7MM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zd5XlrjVRXC1S0X8J3rBX3Rsob30zLCO6mf6puMiT9wnFqnRB4Zvi71RTAuTeYQyg
 0gOV/wdZDBxMbCCofVkqcNqn9b4E0hIDFTB5o/jW4CiEGsMGnkwAvsN5VOPLjv+Oj1
 nbmUA0oq+L9nO0PRVjl5IeGmdJGQJSFHWw0/FuuY=
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
Date: Tue,  4 Aug 2020 21:26:44 +0200
Message-Id: <20200804192654.12783-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH v2 03/13] ARM: s3c64xx: include header to fix
	-Wmissing-prototypes
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

Include the spi-s3c64xx.h header to fix W=1 build warning:

    arch/arm/mach-s3c64xx/setup-spi.c:11:5: warning:
        no previous prototype for 's3c64xx_spi0_cfg_gpio' [-Wmissing-prototypes]
       11 | int s3c64xx_spi0_cfg_gpio(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

---

Changes since v1:
1. Add review tag.
---
 arch/arm/mach-s3c64xx/setup-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/setup-spi.c b/arch/arm/mach-s3c64xx/setup-spi.c
index 39dfae1f46e7..03c9d296bb0f 100644
--- a/arch/arm/mach-s3c64xx/setup-spi.c
+++ b/arch/arm/mach-s3c64xx/setup-spi.c
@@ -4,6 +4,7 @@
 //		http://www.samsung.com/
 
 #include <linux/gpio.h>
+#include <linux/platform_data/spi-s3c64xx.h>
 #include <plat/gpio-cfg.h>
 #include <mach/gpio-samsung.h>
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
