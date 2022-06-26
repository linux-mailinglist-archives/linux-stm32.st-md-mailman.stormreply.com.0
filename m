Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E018A55ADBC
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jun 2022 02:21:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84E11C5F1F1;
	Sun, 26 Jun 2022 00:21:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEE9AC0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jun 2022 00:21:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 768028446B;
 Sun, 26 Jun 2022 02:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656202880;
 bh=BsUhhwHIeOxa1qnGumybNzsDrnHunw1B70tySjEm3dI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FX18NDbbtUOCPNzhzs0RlwE7erN3yY4elerzUbdRiUdgdCkUvX4SvU7rY9ydvnISq
 /mR0SkkoZ6LDLTKBbZYTCV9ddVWECSmzS/1J0DU8dkpsm68tTMTEPcB4qjmhX/Zqw+
 Eeywpjx1GMCuVt5cugbqW94J429ggktNRJkPDfO072JhLzI1rb/q3xYKhFu1CKkXMD
 uypLAQcc2pYPtTrXG3TXljMQlxlbZmOLo1+oyakDKSRvunuOnXCXxV0EM7NySqM1BE
 5OZ+ZVqCOTC37exMZRKdDjg9XN7ditHtBrUvsEq6qLgUkBLk4jHPK2w5Ax+hw1UQC6
 zTnnD71LlowiA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 26 Jun 2022 02:21:02 +0200
Message-Id: <20220626002105.198854-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220626002105.198854-1-marex@denx.de>
References: <20220626002105.198854-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 4/7] ARM: dts: stm32: Add alternate pinmux
	for UART3 pins
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

Add another mux option for UART3 pins, this is used on DRC Compact board.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: No change
V3: No change
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 58f5924902b82..ebc3ddcf88867 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -2270,6 +2270,47 @@ pins {
 		};
 	};
 
+	usart3_pins_e: usart3-4 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>, /* USART3_RX */
+				 <STM32_PINMUX('D', 11, AF7)>; /* USART3_CTS_NSS */
+			bias-pull-up;
+		};
+	};
+
+	usart3_idle_pins_e: usart3-idle-4 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* USART3_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* USART3_RX */
+			bias-pull-up;
+		};
+	};
+
+	usart3_sleep_pins_e: usart3-sleep-4 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('D', 11, ANALOG)>, /* USART3_CTS_NSS */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* USART3_RX */
+		};
+	};
+
 	usbotg_hs_pins_a: usbotg-hs-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
