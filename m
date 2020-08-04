Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22223BFE5
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Aug 2020 21:28:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 008F6C36B3A;
	Tue,  4 Aug 2020 19:28:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E025DC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 19:28:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4A7522B42;
 Tue,  4 Aug 2020 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596569300;
 bh=V/XnlICubaqSdGc/oVbL46LdDLz8pa5t8bkW3kyzvAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lp9rL0QjqRmYlIilySHlm+OoQDEI75KLDagAujimB4X5nPwr0UaaeJ6sjYLcWMK17
 3t4IEKW+3btM8obpbEi9ukBNEMuaAJUPGQMAu2HhgpAH5jg4iGRagtO/Xrcjexguxv
 WN1no2xHHDDPeAIK+u5eOw/tw5DT10EFnlds4Aw0=
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
Date: Tue,  4 Aug 2020 21:26:51 +0200
Message-Id: <20200804192654.12783-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH v2 10/13] ARM: s3c24xx: sdhci: include
	plat/sdhci.h header
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

Include plat/sdhci.h header in the sdhci code to bring the prototypes of
defined functions and fix W=1 compile warnings:

    arch/arm/mach-s3c24xx/setup-sdhci-gpio.c:21:6: warning: no previous prototype for 's3c2416_setup_sdhci0_cfg_gpio' [-Wmissing-prototypes]
       21 | void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)
    arch/arm/mach-s3c24xx/setup-sdhci-gpio.c:26:6: warning: no previous prototype for 's3c2416_setup_sdhci1_cfg_gpio' [-Wmissing-prototypes]
       26 | void s3c2416_setup_sdhci1_cfg_gpio(struct platform_device *dev, int width)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/setup-sdhci-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c b/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
index 218346a36d1e..ff5c0a51ded5 100644
--- a/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
@@ -17,6 +17,7 @@
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 #include <plat/gpio-cfg.h>
+#include <plat/sdhci.h>
 
 void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)
 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
