Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7150CEA72B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Dec 2025 19:14:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 802E4C8F273;
	Tue, 30 Dec 2025 18:14:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C9CAC8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Dec 2025 18:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VwHoODTyidimK5eRZYLaY6HsTe516N3NHiznaE55uLI=; b=kpB6mBQmdfpYC1RRaIJbs5ZagK
 a6YQT/Gc+7xkF/1TZpgOrbFzuASRQpTe0EvmeFNU1AR75IqFAxtVRp2hJGv7JcZ2EBupyYTtExeyO
 i3mi19GBj9tHh/EbhzJ5ktmFQT/LKHGTiUKNDIcyrka1rR2mb73f501qhj6AXA75NMBobk0pBhXMe
 Lm0mFza4hwt0Fb6nmyQkrdqrMWmat8ESGYqCU4mBwo95fcTJq8H558RPZhEuSS6cP0nA4pL4o079P
 8UuROQ7qWfvQ5e5JNgYmRBUuj6V3kbXOopQ29PG0G2qipims+3sXZBstpq7r8hVPA7hASPDvVPSZX
 U2GJOU3A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vaeEo-00000005AjB-0gI8; Tue, 30 Dec 2025 18:14:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 30 Dec 2025 10:14:29 -0800
Message-ID: <20251230181429.3429404-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] arm64: STM32: drop an undefined Kconfig symbol
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

Drop ARM_SMC_MBOX since it is not defined or used anywhere else
in the kernel source tree.

Fixes: 9e4e24414cc6 ("arm64: introduce STM32 family on Armv8 architecture")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>

 arch/arm64/Kconfig.platforms |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/arch/arm64/Kconfig.platforms
+++ linux-next-20251219/arch/arm64/Kconfig.platforms
@@ -372,7 +372,6 @@ config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
 	select PINCTRL
-	select ARM_SMC_MBOX
 	select ARM_SCMI_PROTOCOL
 	select REGULATOR
 	select REGULATOR_ARM_SCMI
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
