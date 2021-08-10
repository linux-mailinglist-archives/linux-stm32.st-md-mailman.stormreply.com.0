Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DD3E7F2A
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Aug 2021 19:37:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99155C5A4D0;
	Tue, 10 Aug 2021 17:37:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9257DC5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 17:37:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFD7B611AE;
 Tue, 10 Aug 2021 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628617063;
 bh=IpsOi0DreMnqC6z3BxvfBehVk68QktRo+NLFvipSyRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pLQLegMBY6cVoc83byLrw5baDiZ5PlJon5wq5cXW44Zm2Z1AGtE+JAp/eeb8vzGDm
 G3G6yf/zuv96F7UikGUZaFBWZ9b9zuwsgoO80vjry0kpr/grgMjELOygmaWeoEiybD
 UcHW+X+Qf9mRmGLoN/v45DRLqNYz1oJYB3sgN+mc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Tue, 10 Aug 2021 19:29:22 +0200
Message-Id: <20210810172956.630090823@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810172955.660225700@linuxfoundation.org>
References: <20210810172955.660225700@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH 5.10 028/135] ARM: dts: stm32: Fix touchscreen
	IRQ line assignment on DHCOM
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

From: Marek Vasut <marex@denx.de>

[ Upstream commit 15f68f027ebd961b99a1c420f96ff3838c5e4450 ]

While 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM PDK2")
fixed the LED0 assignment on the PDK2 board, the same commit did not
update the touchscreen IRQ line assignment, which is the same GPIO line,
shared between the LED0 output and touchscreen IRQ input. To make this
more convoluted, the same EXTI input (not the same GPIO line) is shared
between Button B which is Active-Low IRQ, and touchscreen IRQ which is
Edge-Falling IRQ, which cannot be used at the same time. In case the LCD
board with touchscreen is in use, which is the case here, LED0 must be
disabled, Button B must be polled, so the touchscreen interrupt works as
it should.

Update the touchscreen IRQ line assignment, disable LED0 and use polled
GPIO button driver for Button B, since the DT here describes baseboard
with LCD board.

Fixes: 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM PDK2")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 59b3239bcd76..633079245601 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -37,7 +37,7 @@
 		poll-interval = <20>;
 
 		/*
-		 * The EXTi IRQ line 3 is shared with touchscreen and ethernet,
+		 * The EXTi IRQ line 3 is shared with ethernet,
 		 * so mark this as polled GPIO key.
 		 */
 		button-0 {
@@ -46,6 +46,16 @@
 			gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
 		};
 
+		/*
+		 * The EXTi IRQ line 6 is shared with touchscreen,
+		 * so mark this as polled GPIO key.
+		 */
+		button-1 {
+			label = "TA2-GPIO-B";
+			linux,code = <KEY_B>;
+			gpios = <&gpiod 6 GPIO_ACTIVE_LOW>;
+		};
+
 		/*
 		 * The EXTi IRQ line 0 is shared with PMIC,
 		 * so mark this as polled GPIO key.
@@ -60,13 +70,6 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		button-1 {
-			label = "TA2-GPIO-B";
-			linux,code = <KEY_B>;
-			gpios = <&gpiod 6 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-
 		button-3 {
 			label = "TA4-GPIO-D";
 			linux,code = <KEY_D>;
@@ -82,6 +85,7 @@
 			label = "green:led5";
 			gpios = <&gpioc 6 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
+			status = "disabled";
 		};
 
 		led-1 {
@@ -185,8 +189,8 @@
 	touchscreen@38 {
 		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
-		interrupt-parent = <&gpiog>;
-		interrupts = <2 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
+		interrupt-parent = <&gpioc>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
 	};
 };
 
-- 
2.30.2



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
