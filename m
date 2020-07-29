Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2BB232259
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 18:11:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 990CDC36B29;
	Wed, 29 Jul 2020 16:11:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47D4CC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 16:11:42 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41E2122B48;
 Wed, 29 Jul 2020 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596039101;
 bh=sgnxQDxNFJhXCnpuKyxV9bhtCuQWJwff+93nPoham8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cM4dVIXwR8DqzyQLOawNX1BOBHmqXQoHA6UO6xnb+fl+HSkQZRKq+0wevYNyuMDZ+
 Z3x3sGobVRCFxBs/1KHgpWBmeAGDp9fNHImoMNRcr8xD2XwZgK3VtM3fLR9Tuy2Wxj
 m91TTXpMH7UsVNy/mMdeuvUGo7i6UCtRbFIp8OZk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vincent Sanders <vince@simtec.co.uk>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
Date: Wed, 29 Jul 2020 18:09:42 +0200
Message-Id: <20200729160942.28867-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729160942.28867-1-krzk@kernel.org>
References: <20200729160942.28867-1-krzk@kernel.org>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 stable@vger.kernel.org, Lihua Yao <ylhuajnu@outlook.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH 7/7] ARM: s3c24xx: Fix missing system reset
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

Commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart code")
removed usage of the watchdog reset platform code in favor of the
Samsung SoC watchdog driver.  However the latter was not selected thus
S3C24xx platforms lost reset abilities.

Cc: <stable@vger.kernel.org>
Fixes: f6361c6b3880 ("ARM: S3C24XX: remove separate restart code")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fe95777af653..063018c387be 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -506,8 +506,10 @@ config ARCH_S3C24XX
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select NEED_MACH_IO_H
+	select S3C2410_WATCHDOG
 	select SAMSUNG_ATAGS
 	select USE_OF
+	select WATCHDOG
 	help
 	  Samsung S3C2410, S3C2412, S3C2413, S3C2416, S3C2440, S3C2442, S3C2443
 	  and S3C2450 SoCs based systems, such as the Simtec Electronics BAST
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
