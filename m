Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B36903DD
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ADABC6A5F7;
	Thu,  9 Feb 2023 09:33:55 +0000 (UTC)
Received: from mr85p00im-ztdg06021801.me.com (mr85p00im-ztdg06021801.me.com
 [17.58.23.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DACDAC6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934334; bh=zCmgb/TUYcxcPFcGKNVmXau6gFCFFzIlp/y6/FM/zpY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=xbzWqQ7GvziqX8vIL2uDuVkWcwR8M6YrqDAZ1Sjieug1L7slxTRRnZbK1J9F17XaM
 rI/slyIhzlpdv8/MfcVKWf7Vlcqsc9lAxlmuH5InQAA/7a6w16+Lx7AmMT5YEJDeXJ
 9xeD+3p4Q/dMz4jx4Cjm1ArvaxRFSW67EWyZZOy3W+gZPJmrCdkLBlvuPyL1rQtVRq
 SW2GkmsHVhoacxVRFxYryAnU419aZXyd3WMOXGejZq8bFj9mJ+r3JxmHOicYvsscTK
 Ee62e4Mi7tajU0DS7D2GEgtUTMwc6QE/v+gwP9sVjXp0RE1v8dBeDDwRoPYCG+7kAj
 LBxvMXXzfzX9A==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-ztdg06021801.me.com (Postfix) with ESMTPSA id
 30740D02993; Thu,  9 Feb 2023 09:18:54 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu,  9 Feb 2023 10:16:52 +0100
Message-Id: <20230209091659.1409-5-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:53 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 04/11] dt-bindings: irqchip: sti: remove
	stih415/stih416 and stid127
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

Remove bindings for the stih415/stih416/stid127 since they are
not supported within the kernel anymore.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 .../bindings/interrupt-controller/st,sti-irq-syscfg.txt  | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt b/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt
index ced6014061a3..977d7ed3670e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt
@@ -6,11 +6,7 @@ and PL310 L2 Cache IRQs are controlled using System Configuration registers.
 This driver is used to unmask them prior to use.
 
 Required properties:
-- compatible	: Should be set to one of:
-			"st,stih415-irq-syscfg"
-			"st,stih416-irq-syscfg"
-			"st,stih407-irq-syscfg"
-			"st,stid127-irq-syscfg"
+- compatible	: Should be "st,stih407-irq-syscfg"
 - st,syscfg	: Phandle to Cortex-A9 IRQ system config registers
 - st,irq-device	: Array of IRQs to enable - should be 2 in length
 - st,fiq-device	: Array of FIQs to enable - should be 2 in length
@@ -25,11 +21,10 @@ Optional properties:
 Example:
 
 irq-syscfg {
-	compatible    = "st,stih416-irq-syscfg";
+	compatible    = "st,stih407-irq-syscfg";
 	st,syscfg     = <&syscfg_cpu>;
 	st,irq-device = <ST_IRQ_SYSCFG_PMU_0>,
 			<ST_IRQ_SYSCFG_PMU_1>;
 	st,fiq-device = <ST_IRQ_SYSCFG_DISABLED>,
 			<ST_IRQ_SYSCFG_DISABLED>;
-	st,invert-ext = <(ST_IRQ_SYSCFG_EXT_1_INV | ST_IRQ_SYSCFG_EXT_3_INV)>;
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
