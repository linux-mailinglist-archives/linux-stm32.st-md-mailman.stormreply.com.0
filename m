Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804223F985
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 01:35:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1EF2C3FAD5;
	Sat,  8 Aug 2020 23:35:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5C36C32EB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Aug 2020 23:35:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DF4A206C3;
 Sat,  8 Aug 2020 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596929744;
 bh=CrbNmZ6FMVsPMZu0i7WiMTRVaTILOfMy4YBuKJ5xS6w=;
 h=From:To:Cc:Subject:Date:From;
 b=VEK8RwyWfbKk2PJHsJrOlYhvBkIsGxtAzNkuxbEqRocb9sGyp/jZ2rMBuglA9pxgY
 ahqs4w69x+r7YoicB+5JpCyz/4J8Bjr+Ri7ONf3hpADDlTWnO4UxsA/yhBpU2NZXZs
 lAUU4Ibp9k+MjmIKQzAe6sUH89jg4FuD3hu0yG1w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  8 Aug 2020 19:34:30 -0400
Message-Id: <20200808233542.3617339-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.8 01/72] ARM: dts: stm32: fix uart
	nodes ordering in stm32mp15-pinctrl
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

From: Erwan Le Ray <erwan.leray@st.com>

[ Upstream commit f6b43d89d3b5a31bf4251a26c61e92bf659e74c5 ]

Fix usart and uart nodes ordering. Several usart nodes didn't respect
expecting ordering.

Fixes: 077e0638fc83 ("ARM: dts: stm32: Add alternate pinmux for USART2 pins on stm32mp15")

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 102 +++++++++++------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 7eb858732d6d0..b31923a9498b5 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1574,143 +1574,143 @@ pins2 {
 		};
 	};
 
-	usart2_pins_a: usart2-0 {
+	uart4_pins_a: uart4-0 {
 		pins1 {
-			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
-				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
-				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
 			bias-disable;
 		};
 	};
 
-	usart2_sleep_pins_a: usart2-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
-				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
-				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
-		};
-	};
-
-	usart2_pins_b: usart2-1 {
+	uart4_pins_b: uart4-1 {
 		pins1 {
-			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
-				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
+			pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('F', 4, AF7)>, /* USART2_RX */
-				 <STM32_PINMUX('E', 15, AF7)>; /* USART2_CTS_NSS */
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
 			bias-disable;
 		};
 	};
 
-	usart2_sleep_pins_b: usart2-sleep-1 {
-		pins {
-			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
-				 <STM32_PINMUX('F', 4, ANALOG)>, /* USART2_RX */
-				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
-		};
-	};
-
-	usart3_pins_a: usart3-0 {
+	uart4_pins_c: uart4-2 {
 		pins1 {
-			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
 			bias-disable;
 		};
 	};
 
-	uart4_pins_a: uart4-0 {
+	uart7_pins_a: uart7-0 {
 		pins1 {
-			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
+				 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
+				 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
 			bias-disable;
 		};
 	};
 
-	uart4_pins_b: uart4-1 {
+	uart7_pins_b: uart7-1 {
 		pins1 {
-			pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
+			pinmux = <STM32_PINMUX('F', 7, AF7)>; /* UART7_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			pinmux = <STM32_PINMUX('F', 6, AF7)>; /* UART7_RX */
 			bias-disable;
 		};
 	};
 
-	uart4_pins_c: uart4-2 {
+	uart8_pins_a: uart8-0 {
 		pins1 {
-			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* UART8_RX */
 			bias-disable;
 		};
 	};
 
-	uart7_pins_a: uart7-0 {
+	usart2_pins_a: usart2-0 {
 		pins1 {
-			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
+			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
-				 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
-				 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
+			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
 			bias-disable;
 		};
 	};
 
-	uart7_pins_b: uart7-1 {
+	usart2_sleep_pins_a: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
+
+	usart2_pins_b: usart2-1 {
 		pins1 {
-			pinmux = <STM32_PINMUX('F', 7, AF7)>; /* UART7_TX */
+			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('F', 6, AF7)>; /* UART7_RX */
+			pinmux = <STM32_PINMUX('F', 4, AF7)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, AF7)>; /* USART2_CTS_NSS */
 			bias-disable;
 		};
 	};
 
-	uart8_pins_a: uart8-0 {
+	usart2_sleep_pins_b: usart2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('F', 4, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
+
+	usart3_pins_a: usart3-0 {
 		pins1 {
-			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
+			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* UART8_RX */
+			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
 			bias-disable;
 		};
 	};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
