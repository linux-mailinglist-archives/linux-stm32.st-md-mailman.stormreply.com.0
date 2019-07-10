Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FA6407A
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2019 07:14:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28DE0CBC9CC
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2019 05:14:21 +0000 (UTC)
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA6D2CBC9CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2019 05:14:18 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x6A5DREA030499;
 Wed, 10 Jul 2019 14:13:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6A5DREA030499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1562735608;
 bh=1BDNIyvXOAp0AhR4Ns6txoUKEiiNIiaFMGdXhnp1IlA=;
 h=From:To:Cc:Subject:Date:From;
 b=xu/Tm5EfBojLuxqcXEj6YrZ+KlsaQOyl37TSrPSoWJSlWQGwyHhX0E4DWraNxAeT/
 /TmFjanhNNaJ9kcpkW6bNu7CAjvYfIdt8hKAJfYe2qpFlbquFqQCuPypciPd1X+YaY
 MwlOc/whgDiycb9L/0Dp5q1Stq7GGYr6W3ocDO4ID0hVkjhbJIu//IPqwpaxezSdkb
 6Z3O5AmttAuNKsoisx1H57RbPiyyvgFiq6yYvvSLMC8jZKwLUK+s7eE0zwjcWGmU/I
 dnbio/j9JL2ASOMq7aLzEB8o2sRHOQT5XAlKgaaPOS0s565C5uQY8c4DwqV1c22WTJ
 cjJTUmYAP/bBA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: arm@kernel.org, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Jul 2019 14:13:20 +0900
Message-Id: <20190710051320.8738-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, soc@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: stm32: use "depends on" instead of "if"
	after prompt
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

This appeared after the global fixups by commit e32465429490 ("ARM: use
"depends on" for SoC configs instead of "if" after prompt"). Fix it now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/mach-stm32/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 05d6b5aada80..57699bd8f107 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_STM32
-	bool "STMicroelectronics STM32 family" if ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
+	bool "STMicroelectronics STM32 family"
+	depends on ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
 	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
 	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
 	select ARM_GIC if ARCH_MULTI_V7
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
