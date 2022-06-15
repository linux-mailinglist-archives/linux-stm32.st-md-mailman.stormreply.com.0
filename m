Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274254D55F
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 01:33:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BB41C5E2C6;
	Wed, 15 Jun 2022 23:33:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C378C03FDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 23:33:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 540BB81E79;
 Thu, 16 Jun 2022 01:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655335999;
 bh=oTWUfjxvN7yETqRsyRKIBXSdHMg47QKxsnbCd72l+NY=;
 h=From:To:Cc:Subject:Date:From;
 b=cDDpiQDCzd/ggksEX2KlLQG9DN/MVoe40h3W5ZVyewYnrDgYO7Hl8UUYqIM3FeYEq
 nUjFz3myyJA9CEDh5YETDz0bMf3Jb3OAvo+4pETYXQb+uZkL1XdlR1wAZBndfVCaby
 XT//ZZ3HVVMUSZDc2tj32vN/WcHm9jZIeaIIFP+rIWQ5DTNYrblF0FR5C9TZphx6pr
 YPp60wbJTe6ejrfyIUkxxGXb0EGHp476JCmY6YOAomT/wtgcWbPTce1QLHYltIg1c6
 HeO3UVhoDY4sr0PLBUDQdiSTgQM1hFtUvCwKr+qBUSH3ZcDyeX5uh4xRGZ5kV7wvAI
 iiRrN1YW0amXA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 16 Jun 2022 01:33:10 +0200
Message-Id: <20220615233310.90593-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix SPI2 pinmux pin comments
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

Those pin comments refer to SPI2 pins, not SPI1 pins, update the comments.
No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 4f671045a0818..2cc9341d43d29 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1866,30 +1866,30 @@ pins {
 
 	spi2_pins_a: spi2-0 {
 		pins1 {
-			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI1_SCK */
-				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
+			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <1>;
 		};
 
 		pins2 {
-			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
 			bias-disable;
 		};
 	};
 
 	spi2_pins_b: spi2-1 {
 		pins1 {
-			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI1_SCK */
-				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
+			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <1>;
 		};
 
 		pins2 {
-			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
 			bias-disable;
 		};
 	};
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
