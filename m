Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3429D6F7CA8
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 08:02:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEBDFC6B441;
	Fri,  5 May 2023 06:02:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 479C6C69069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 06:02:43 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1puoWg-0005sG-P2; Fri, 05 May 2023 08:02:42 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: linux-stm32@st-md-mailman.stormreply.com
Date: Fri,  5 May 2023 08:01:50 +0200
Message-Id: <20230505060158.16516-3-s.trumtrar@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230505060158.16516-1-s.trumtrar@pengutronix.de>
References: <20230505060158.16516-1-s.trumtrar@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 02/10] ARM: dts: stm32: Add alternate
	pinmux for sai2b
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

Add another option for the SAI2B pins.

This is used on the Phycore STM32MP1.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 9421ac170168..659bc589be52 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1491,6 +1491,30 @@ pins {
 		};
 	};
 
+	sai2b_pins_d: sai2b-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, AF10)>, /* SAI2_SCK_B */
+				 <STM32_PINMUX('C', 0, AF8)>, /* SAI2_FS_B */
+				 <STM32_PINMUX('H', 3, AF10)>; /* SAI2_MCLK_B */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+			bias-disable;
+		};
+	};
+
+	sai2b_sleep_pins_d: sai2b-sleep-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* SAI2_SCK_B */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* SAI2_FS_B */
+				 <STM32_PINMUX('H', 3, ANALOG)>, /* SAI2_MCLK_B */
+				 <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
+		};
+	};
+
 	sai4a_pins_a: sai4a-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
