Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D0B16ACFB
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2020 18:20:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E134C36B0B;
	Mon, 24 Feb 2020 17:20:50 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77FD3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 17:20:48 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1j6HPQ-0002Zy-Ja; Mon, 24 Feb 2020 18:20:44 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1j6HPN-0007hE-Pi; Mon, 24 Feb 2020 18:20:41 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Mon, 24 Feb 2020 18:20:30 +0100
Message-Id: <20200224172031.27868-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add cpu clock-frequency
	property on stm32mp15x
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

All of the STM32MP151[1], STM32MP153[2] and STM32MP157[3] have their
Cortex-A7 cores running at 650 MHz.

Add the clock-frequency property to CPU nodes to avoid warnings about
them missing.

[1]: https://www.st.com/en/microcontrollers-microprocessors/stm32mp151.html
[2]: https://www.st.com/en/microcontrollers-microprocessors/stm32mp153.html
[3]: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 1 +
 arch/arm/boot/dts/stm32mp153.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index fb41d0778b00..fd46a8e11126 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -17,6 +17,7 @@ cpus {
 
 		cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
+			clock-frequency = <650000000>;
 			device_type = "cpu";
 			reg = <0>;
 		};
diff --git a/arch/arm/boot/dts/stm32mp153.dtsi b/arch/arm/boot/dts/stm32mp153.dtsi
index 2d759fc6015c..6d9ab08667fc 100644
--- a/arch/arm/boot/dts/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/stm32mp153.dtsi
@@ -10,6 +10,7 @@ / {
 	cpus {
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
+			clock-frequency = <650000000>;
 			device_type = "cpu";
 			reg = <1>;
 		};
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
