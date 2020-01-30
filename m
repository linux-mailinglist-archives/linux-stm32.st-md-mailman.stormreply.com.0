Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759A14E372
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2020 20:55:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB680C36B0B;
	Thu, 30 Jan 2020 19:55:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D79CAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 19:55:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8280D20708;
 Thu, 30 Jan 2020 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580414142;
 bh=h28+OzWv84FMorXQcpuwm+CgBd4CxAA13jLAZ5nqeG4=;
 h=From:To:Cc:Subject:Date:From;
 b=etdT/+iMcutb7+ZqXyY9N7nNmLoyK+tYGnjhtJEfT1PGuvNPHJNUdk/GrCYWz6n6R
 LDOk2fkt7m8UqvCWVC35I1x2fRXINQXEIlFRuXy87RUBXbE6jwA6GgiJc7M+F6It96
 By1Qf5Pul1V2ML6bPiIECano85qKpLoFCLjnKMI8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Alexander Shiyan <shc_work@mail.ru>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 openbmc@lists.ozlabs.org, arm@kernel.org, soc@kernel.org
Date: Thu, 30 Jan 2020 20:55:24 +0100
Message-Id: <20200130195525.4525-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 1/2] ARM: npcm: Bring back GPIOLIB support
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

The CONFIG_ARCH_REQUIRE_GPIOLIB is gone since commit 65053e1a7743
("gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB") and all platforms
should explicitly select GPIOLIB to have it.

Cc: <stable@vger.kernel.org>
Fixes: 65053e1a7743 ("gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-npcm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 880bc2a5cada..7f7002dc2b21 100644
--- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -11,7 +11,7 @@ config ARCH_NPCM7XX
 	depends on ARCH_MULTI_V7
 	select PINCTRL_NPCM7XX
 	select NPCM7XX_TIMER
-	select ARCH_REQUIRE_GPIOLIB
+	select GPIOLIB
 	select CACHE_L2X0
 	select ARM_GIC
 	select HAVE_ARM_TWD if SMP
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
