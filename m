Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD791C2D86
	for <lists+linux-stm32@lfdr.de>; Sun,  3 May 2020 17:42:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8A72C36B1F;
	Sun,  3 May 2020 15:42:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E42BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2020 15:42:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.51.190.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8614520757;
 Sun,  3 May 2020 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588520557;
 bh=cT0OetYZ/YUt8aV+lPE7R4oJyBHx66QFKj3UJB9PhuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JRr5HCXvisbwPBU9GxOBgPMtkgZNsgRSGp3f289RS2bWJu9madzFQgiEpQfGQ43vJ
 Xms/j9mxHcLO8iftdnOWJTcwPfXKJgj0FsDStPFlt3gncly7PDXIY9AtclNXerygx/
 ahNoXPrtK20zj855RKIvWcxgQtQOOHWSVgr3C5jM=
From: mani@kernel.org
To: robh+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com
Date: Sun,  3 May 2020 21:12:11 +0530
Message-Id: <20200503154215.23654-3-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200503154215.23654-1-mani@kernel.org>
References: <20200503154215.23654-1-mani@kernel.org>
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/6] ARM: dts: stm32: Add missing pinctrl
	entries for STM32MP15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Manivannan Sadhasivam <mani@kernel.org>

These pinctrl definitions will be used by Stinger96/IoTBox boards
from Shiratech.

Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index aeddcaadb829..858c83038e5a 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1519,6 +1519,30 @@
 		};
 	};
 
+	usart2_pins_b: usart2-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF7)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, AF7)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_b: usart2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('F', 4, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
+
 	usart3_pins_a: usart3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
@@ -1558,6 +1582,19 @@
 		};
 	};
 
+	uart4_pins_c: uart4-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
 	uart7_pins_a: uart7-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
@@ -1573,6 +1610,19 @@
 		};
 	};
 
+	uart7_pins_b: uart7-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 7, AF7)>; /* UART7_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 6, AF7)>; /* UART7_RX */
+			bias-disable;
+		};
+	};
+
 	uart8_pins_a: uart8-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
@@ -1647,4 +1697,18 @@
 			bias-disable;
 		};
 	};
+
+	spi4_pins_a: spi4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
+				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
+			bias-disable;
+		};
+	};
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
