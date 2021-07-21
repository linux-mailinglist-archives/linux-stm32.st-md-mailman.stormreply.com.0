Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C33D15EF
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 20:10:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C9E7C5A4C0;
	Wed, 21 Jul 2021 18:10:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DD7EC597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 18:10:47 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 580A781E14;
 Wed, 21 Jul 2021 20:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626891046;
 bh=XEOAj1wDuklkeXLe+tR98VxpanVSrtRE88j4Ki7RD8g=;
 h=From:To:Cc:Subject:Date:From;
 b=HFL2hEXHT/Ln0Ad0s7lKyQfuOdsvZz4aEbdD4kP++B4h6sZ3ryJAIVReBvOUVaOw0
 0hrhIQJyEVifJ+YBEJt4YgUDJ3ZMZY2uEtpKvgOzxkWPC4JFggcyyB4K0gX0CdUQug
 tpYOqUgrXguMS6W9eFvWP8U4wNXb19zbexuBSYNXtZU9C6pYXJ/EfbUcMeq2brF+Ux
 xSF+BY1h6GLCYOq/0bDZA0NQG3jFZ7HUZaz+ofDRwQbMAB10Q63IImN+3gapzI3/um
 m0qU7GirG4m7RdzQ7hscMkXik6RCyoer+AnI/BGDIM1dXB9J5KMeHcn3dDgJaWN1lr
 5t7zR9GVUtilg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 21 Jul 2021 20:10:40 +0200
Message-Id: <20210721181040.126714-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: cniedermaier@dh-electronics.com, Marek Vasut <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix touchscreen IRQ line
	assignment on DHCOM
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
Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 4f6b94f10f4a9..fbf3826933e4d 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -38,7 +38,7 @@ gpio-keys-polled {
 		poll-interval = <20>;
 
 		/*
-		 * The EXTi IRQ line 3 is shared with touchscreen and ethernet,
+		 * The EXTi IRQ line 3 is shared with ethernet,
 		 * so mark this as polled GPIO key.
 		 */
 		button-0 {
@@ -47,6 +47,16 @@ button-0 {
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
@@ -61,13 +71,6 @@ button-2 {
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
@@ -83,6 +86,7 @@ led-0 {
 			label = "green:led5";
 			gpios = <&gpioc 6 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
+			status = "disabled";
 		};
 
 		led-1 {
@@ -202,8 +206,8 @@ sgtl5000_rx_endpoint: endpoint@1 {
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
