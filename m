Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D238C490D
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 23:58:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00461C6B476;
	Mon, 13 May 2024 21:58:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7CA6C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 21:58:51 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D6D8B87BC9;
 Mon, 13 May 2024 23:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715637531;
 bh=d7xRaYr7WQ/WAGh0b8NuH1jVV3rJLRs+i7/Qt6CSGrY=;
 h=From:To:Cc:Subject:Date:From;
 b=lbAMqkeTtxKlm89+vpzcZkXel+b1s2lBIIxTe8zU9BGms7PdeTCvcQRPFO3m8sAqy
 UQxxt9LBuKez5HVdTzezJBpr77a4uSXk6NJ5x91NvaArEu4dwIb+hIpo5qDWlReMTv
 GX0qh9gmH2hnOg8LdXg7bWb4zr0zg4vO0w58RDDEVNSKeYq1Lii7ApOoOyPxTGkzX6
 9jjbPGl1NB8Nu8JWxSVPo74zrCSeW9IiIWddSjPX+AB7Hnh5QM0zPQ4Rt0iA5lZtAc
 zNBVZL1m7f54yKG/r5+6f1BBAJUPTIMjAhzEN3roM2BL+ZKXAMssJHAW59bw6IHzTZ
 Ev6zkAAsSMVYA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 13 May 2024 23:58:15 +0200
Message-ID: <20240513215835.183402-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add arm,
	no-tick-in-suspend to STM32MP15xx STGEN timer
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

STM32MP15xx RM0436 Rev 6 section 46.3 System timer generator (STGEN) states
"
Arm recommends that the system counter is in an always-on power domain.
This is not supported in the current implementation, therefore STGEN should
be saved and restored before Standby mode entry, and restored at Standby
exit by secure software.
...
"
Instead of piling up workarounds in the firmware which is difficult to
update, add "arm,no-tick-in-suspend" DT property into the timer node to
indicate the timer is stopped in suspend, and let the kernel fix the
timer up.

Fixes: 8471a20253eb ("ARM: dts: stm32: add stm32mp157c initial support")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 3b705e7fe5c0d..68846699b26fd 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -50,6 +50,7 @@ timer {
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&intc>;
+		arm,no-tick-in-suspend;
 	};
 
 	clocks {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
