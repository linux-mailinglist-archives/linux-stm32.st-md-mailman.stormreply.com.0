Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0547A4B298
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Mar 2025 16:26:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B423C78018;
	Sun,  2 Mar 2025 15:26:30 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 372ACC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Mar 2025 15:26:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E020610382D03; Sun,  2 Mar 2025 16:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740929186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8Bh6bLjv98EA8P8H9SQlLoMe1/qkXz4wmKjkYzXqTxY=;
 b=RDKwCd0anT/sAu/zkYm8sX7eP1ka+sonUhm6e1+GdVn6NGjZOqCZ7LeUhWAQUGAjxgye8v
 sacKqGGvueFEptvu+Iu3l45yJIeMMEy1JdCSRCBllNpl3X3hPudOMZiHWk204hQqZq65pq
 oQsDY3u57Kj1bStUlns2DQOVNAPF+/UV+KQP44lSbkwuOUawUqIK00Wyl8ewQxkCBEZWA3
 o/a4iiToy/JZtABdK8qD5Mg9CrfwF37IMaNOqozClg76H49ADFbtLxtWQbzj5l46KYmKbo
 nH25XteLnY5OaxnPbKebp0ac6x3jMqqTETmEds9gLGLAQVWH2hemAU/njZhNfw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun,  2 Mar 2025 16:25:14 +0100
Message-ID: <20250302152605.54792-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add support for STM32MP13xx
	DHCOR SoM and DHSBC rev.200 board
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

LDO2 is expansion connector supply on STM32MP13xx DHCOR DHSBC rev.200.
LDO5 is carrier board supply on STM32MP13xx DHCOR DHSBC rev.200. Keep
both regulators always enabled to make sure both the carrier board and
the expansion connector is always powered on and supplied with correct
voltage.

Describe ST33TPHF2XSPI TPM 2.0 chip interrupt and reset lines.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 853dc21449d99..9902849ed0406 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -176,7 +176,7 @@ &gpioa {
 	gpio-line-names = "", "", "", "",
 			  "", "DHSBC_USB_PWR_CC1", "", "",
 			  "", "", "", "DHSBC_nETH1_RST",
-			  "", "DHCOR_HW-CODING_0", "", "";
+			  "", "DHCOR_HW-CODING_0", "", "DHSBC_HW-CODE_2";
 };
 
 &gpiob {
@@ -197,7 +197,7 @@ &gpiod {
 	gpio-line-names = "", "", "", "",
 			  "", "DHCOR_RAM-CODING_0", "", "",
 			  "", "DHCOR_RAM-CODING_1", "", "",
-			  "", "", "", "";
+			  "", "DHSBC_HW-CODE_1", "", "";
 };
 
 &gpioe {
@@ -221,6 +221,13 @@ &gpiog {
 			  "DHSBC_ETH1_INTB", "", "", "DHSBC_ETH2_INTB";
 };
 
+&gpioh {
+	gpio-line-names = "", "", "", "DHSBC_HW-CODE_0",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
 &gpioi {
 	gpio-line-names = "DHCOR_RTC_nINT", "DHCOR_HW-CODING_1",
 			  "DHCOR_BT_REG_ON", "DHCOR_PMIC_nINT",
@@ -296,6 +303,9 @@ &spi2 {
 	st33htph: tpm@0 {
 		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
 		reg = <0>;
+		interrupt-parent = <&gpioe>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpioe 12 GPIO_ACTIVE_LOW>;
 		spi-max-frequency = <24000000>;
 	};
 };
@@ -419,3 +429,19 @@ connector {
 		type = "micro";
 	};
 };
+
+/* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
+&vdd_ldo2 {
+	regulator-always-on;
+	regulator-boot-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+/* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
+&vdd_sd {
+	regulator-always-on;
+	regulator-boot-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
