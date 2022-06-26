Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90555ADB6
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jun 2022 02:16:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE4CDC5E2CC;
	Sun, 26 Jun 2022 00:16:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD68DC0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jun 2022 00:16:15 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1E7D681A02;
 Sun, 26 Jun 2022 02:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656202575;
 bh=hIkmeYwksHacdNk9/wPkR7YYipNuKrkLnDLqpJc/msA=;
 h=From:To:Cc:Subject:Date:From;
 b=DZVJblGwH0As0IxC85haN450BHq1kbD2vC5aQljqCNPwTwG7jLCXTZbwnnL5mwkJA
 jMVGJ9lRSJBq36ybQjk1g5Y06k/jmANi7zs6fnPNH3N/9ybYBre6equyJkmkrfSCXv
 05o/b0uz29KmlHCfkQxtrlW4PdwsHz2iOkfI3o/78JnIXrVUhe0OZhpMwdAIArqUFx
 RxSWmGbCBuZGyDViADxmzdZD/jfpWplvEj/H1cJuAZS8IWiKQd0cRUBjNWouEoAgj8
 bkYEGCBKKpOhMRzIOsO3IpM54k4Ee32yqnCcSfyt9XFVzxiCEfS5Re6IPXPmGhRJIC
 xuvGmYv8njDBg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 26 Jun 2022 02:15:59 +0200
Message-Id: <20220626001559.198689-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Fix SPI2 pinmux pin
	comments
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
V2: Drop the spi2_pins_b, this came from soon to be V3
    https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220618232915.542616-4-marex@denx.de/
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 9816331e4bb7d..3c77234b51ac3 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1846,15 +1846,15 @@ pins {
 
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
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
