Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4423BFBA
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Aug 2020 21:27:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E26BC36B3A;
	Tue,  4 Aug 2020 19:27:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E45E4C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 19:27:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45AA522B42;
 Tue,  4 Aug 2020 19:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596569241;
 bh=T7vK95m658FiqBZzoh7EYBskLGic2GgHyDK417xvIz8=;
 h=From:To:Cc:Subject:Date:From;
 b=Fk0ASglsqZU4iDkOd19jKtB/jO6vAgnJ1HNi0VGPnDRyiCwEMjKrbA8TnKNVlyF7H
 EgpSvGJqOSnYE7jdajxr5glShUT7YSWFapyRBFQK03WfoVAO0EYNAKvlJxLfw+SLQ3
 MsBwwqZNm/jlGjchCk1+wUHsY46lX8ggZsBMfk5Q=
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
Date: Tue,  4 Aug 2020 21:26:41 +0200
Message-Id: <20200804192654.12783-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH v2 00/13] clk/watchdog/ARM: Cleanup of various
	S3C bits
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

Hi,

I tried to cleanup few warnings in S3C machine code which lead to
finding some bigger issues.

The patchset touches clk and watchdog trees. I would appreciate acks so
I can take everything through Samsung SoC tree. I have later a bigger
set which would create conflicts with it [1].


Changes since v1:
1. Few new patches,
2. Addressed review around clk and watchdog changes (see change logs in
   individual patches).


[1] v2 of Arnd's work for making S3C24xx multiplatform:
https://github.com/krzk/linux/tree/for-next/s3c-multiplatform-cleanup-w1-warnings-v2

Best regards,
Krzysztof


Krzysztof Kozlowski (13):
  clk: samsung: s3c64xx: declare s3c64xx_clk_init() in shared header
  clk: samsung: s3c24xx: declare s3c24xx_common_clk_init() in shared
    header
  ARM: s3c64xx: include header to fix -Wmissing-prototypes
  ARM: s3c: remove plat-samsung/.../samsung-time.h
  ARM: samsung: fix language typo
  ARM: samsung: remove HAVE_S3C2410_WATCHDOG and use direct dependencies
  ARM: s3c64xx: switch to generic watchdog driver reset
  ARM: s3c24xx: fix missing system reset
  ARM: s3c24xx: include common.h header in s3c2443.c
  ARM: s3c24xx: sdhci: include plat/sdhci.h header
  ARM: s3c24xx: ts: include platform data header
  ARM: s3c24xx: ts: document function argument
  ARM: s3c24xx: camif: include header with prototypes and unify
    declaration

 MAINTAINERS                                   |  1 +
 arch/arm/Kconfig                              |  3 +-
 arch/arm/mach-exynos/Kconfig                  |  1 -
 arch/arm/mach-s3c24xx/common.c                |  1 +
 arch/arm/mach-s3c24xx/common.h                | 25 +++--
 arch/arm/mach-s3c24xx/mach-amlm5900.c         |  2 -
 arch/arm/mach-s3c24xx/mach-anubis.c           |  1 -
 arch/arm/mach-s3c24xx/mach-at2440evb.c        |  1 -
 arch/arm/mach-s3c24xx/mach-bast.c             |  1 -
 arch/arm/mach-s3c24xx/mach-gta02.c            |  1 -
 arch/arm/mach-s3c24xx/mach-h1940.c            |  1 -
 arch/arm/mach-s3c24xx/mach-jive.c             |  1 -
 arch/arm/mach-s3c24xx/mach-mini2440.c         |  1 -
 arch/arm/mach-s3c24xx/mach-n30.c              |  1 -
 arch/arm/mach-s3c24xx/mach-nexcoder.c         |  1 -
 arch/arm/mach-s3c24xx/mach-osiris.c           |  1 -
 arch/arm/mach-s3c24xx/mach-otom.c             |  1 -
 arch/arm/mach-s3c24xx/mach-qt2410.c           |  1 -
 arch/arm/mach-s3c24xx/mach-rx1950.c           |  1 -
 arch/arm/mach-s3c24xx/mach-rx3715.c           |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2410.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2413.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2416.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2440.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2443.c         |  1 -
 arch/arm/mach-s3c24xx/mach-tct_hammer.c       |  1 -
 arch/arm/mach-s3c24xx/mach-vr1000.c           |  1 -
 arch/arm/mach-s3c24xx/mach-vstms.c            |  1 -
 arch/arm/mach-s3c24xx/s3c2443.c               |  1 +
 arch/arm/mach-s3c24xx/setup-camif.c           |  5 +-
 arch/arm/mach-s3c24xx/setup-sdhci-gpio.c      |  1 +
 arch/arm/mach-s3c24xx/setup-ts.c              |  3 +
 arch/arm/mach-s3c64xx/Kconfig                 |  5 +-
 arch/arm/mach-s3c64xx/common.c                | 17 +---
 arch/arm/mach-s3c64xx/common.h                | 17 +++-
 arch/arm/mach-s3c64xx/mach-anw6410.c          |  2 -
 arch/arm/mach-s3c64xx/mach-crag6410.c         |  2 -
 arch/arm/mach-s3c64xx/mach-hmt.c              |  2 -
 arch/arm/mach-s3c64xx/mach-mini6410.c         |  2 -
 arch/arm/mach-s3c64xx/mach-ncp.c              |  2 -
 arch/arm/mach-s3c64xx/mach-real6410.c         |  2 -
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c       | 17 ----
 arch/arm/mach-s3c64xx/mach-smartq.c           |  1 -
 arch/arm/mach-s3c64xx/mach-smartq5.c          |  2 -
 arch/arm/mach-s3c64xx/mach-smartq7.c          |  2 -
 arch/arm/mach-s3c64xx/mach-smdk6400.c         |  2 -
 arch/arm/mach-s3c64xx/mach-smdk6410.c         |  2 -
 arch/arm/mach-s3c64xx/setup-spi.c             |  1 +
 arch/arm/mach-s3c64xx/watchdog-reset.h        | 16 ----
 arch/arm/mach-s5pv210/Kconfig                 |  1 -
 arch/arm/plat-samsung/Kconfig                 | 10 +-
 arch/arm/plat-samsung/Makefile                |  1 -
 .../plat-samsung/include/plat/samsung-time.h  | 26 ------
 arch/arm/plat-samsung/watchdog-reset.c        | 93 -------------------
 arch/arm64/Kconfig.platforms                  |  1 -
 drivers/clk/samsung/clk-s3c2410.c             |  1 +
 drivers/clk/samsung/clk-s3c2412.c             |  1 +
 drivers/clk/samsung/clk-s3c2443.c             |  1 +
 drivers/clk/samsung/clk-s3c64xx.c             |  1 +
 drivers/watchdog/Kconfig                      | 10 +-
 include/linux/clk/samsung.h                   | 56 +++++++++++
 61 files changed, 105 insertions(+), 256 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/watchdog-reset.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
 delete mode 100644 arch/arm/plat-samsung/watchdog-reset.c
 create mode 100644 include/linux/clk/samsung.h

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
