Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C31B4084
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 12:46:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C029AC36B0D;
	Wed, 22 Apr 2020 10:46:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EA1EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 10:46:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 496cYz1m9lz1qs3D;
 Wed, 22 Apr 2020 12:46:47 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 496cYz10Y2z1qr40;
 Wed, 22 Apr 2020 12:46:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 7HuhC5dNLutE; Wed, 22 Apr 2020 12:46:45 +0200 (CEST)
X-Auth-Info: l2cmaMoA5SeG+olMrbAhY/wQgGDQkyK30tvuVMoh6YY=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 22 Apr 2020 12:46:45 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 22 Apr 2020 12:46:08 +0200
Message-Id: <20200422104613.96944-16-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200422104613.96944-1-marex@denx.de>
References: <20200422104613.96944-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V5 15/20] ARM: dts: stm32: Add alternate
	pinmux for LTDC pins
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

Add new mux option for LTDC pins, this is used on AV96 board.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: No change
V3: No change
V4: - Rebase on stm32-next
    - Rename to ltdc.*pins_d
V5: No change
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 74 ++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index f4bf87bd9b7e..c3a7402860af 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -662,6 +662,80 @@ pins1 {
 		};
 	};
 
+	ltdc_pins_d: ltdc-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G',  7, AF14)>; /* LCD_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I',  9, AF14)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('E', 13, AF14)>, /* LCD_DE */
+				 <STM32_PINMUX('G', 13, AF14)>, /* LCD_R0 */
+				 <STM32_PINMUX('H',  3, AF14)>, /* LCD_R1 */
+				 <STM32_PINMUX('H',  8, AF14)>, /* LCD_R2 */
+				 <STM32_PINMUX('H',  9, AF14)>, /* LCD_R3 */
+				 <STM32_PINMUX('A',  5, AF14)>, /* LCD_R4 */
+				 <STM32_PINMUX('H', 11, AF14)>, /* LCD_R5 */
+				 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
+				 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
+				 <STM32_PINMUX('E',  5, AF14)>, /* LCD_G0 */
+				 <STM32_PINMUX('B',  0, AF14)>, /* LCD_G1 */
+				 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
+				 <STM32_PINMUX('E', 11, AF14)>, /* LCD_G3 */
+				 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
+				 <STM32_PINMUX('H',  4,  AF9)>, /* LCD_G5 */
+				 <STM32_PINMUX('I', 11,  AF9)>, /* LCD_G6 */
+				 <STM32_PINMUX('G',  8, AF14)>, /* LCD_G7 */
+				 <STM32_PINMUX('D',  9, AF14)>, /* LCD_B0 */
+				 <STM32_PINMUX('G', 12, AF14)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
+				 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B3 */
+				 <STM32_PINMUX('E', 12, AF14)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  3, AF14)>, /* LCD_B5 */
+				 <STM32_PINMUX('B',  8, AF14)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  7, AF14)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	ltdc_sleep_pins_d: ltdc-sleep-3 {
+		pins {
+			pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I',  9, ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('G', 13, ANALOG)>, /* LCD_R0 */
+				 <STM32_PINMUX('H',  3, ANALOG)>, /* LCD_R1 */
+				 <STM32_PINMUX('H',  8, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('A',  5, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('E',  5, ANALOG)>, /* LCD_G0 */
+				 <STM32_PINMUX('B',  0, ANALOG)>, /* LCD_G1 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('H',  4, ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('I', 11, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('G',  8, ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_B0 */
+				 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('B',  8, ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  7, ANALOG)>; /* LCD_B7 */
+		};
+	};
+
 	m_can1_pins_a: m-can1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
