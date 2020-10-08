Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC738287C8B
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Oct 2020 21:38:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94CD2C32EA8;
	Thu,  8 Oct 2020 19:38:08 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32A4CC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 19:38:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C6hM16M3Pz1qs3K;
 Thu,  8 Oct 2020 21:38:05 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C6hM15h8Vz1qvJ3;
 Thu,  8 Oct 2020 21:38:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 7yq9RbP5T2vh; Thu,  8 Oct 2020 21:38:03 +0200 (CEST)
X-Auth-Info: 0u1Jxy4dVBl7ryVSGNPiijBTZlQiZMLnn1lyzmgrWBs=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  8 Oct 2020 21:38:03 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu,  8 Oct 2020 21:37:59 +0200
Message-Id: <20201008193800.129513-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Add alternate pinmux for
	FMC EBI bus
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

Add another mux option for FMC EBI bus, this is used on DHCOM SoM
for the second ethernet and on the PDK2 devkit for SRAM.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index d84686e00370..cdb3c4cf94cf 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -349,6 +349,61 @@
 		};
 	};
 
+	fmc_pins_b: fmc-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
+				 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
+				 <STM32_PINMUX('B', 7, AF12)>, /* FMC_NL */
+				 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
+				 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
+				 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
+				 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
+				 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
+				 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* FMC_D8 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* FMC_D9 */
+				 <STM32_PINMUX('E', 13, AF12)>, /* FMC_D10 */
+				 <STM32_PINMUX('E', 14, AF12)>, /* FMC_D11 */
+				 <STM32_PINMUX('E', 15, AF12)>, /* FMC_D12 */
+				 <STM32_PINMUX('D', 8, AF12)>, /* FMC_D13 */
+				 <STM32_PINMUX('D', 9, AF12)>, /* FMC_D14 */
+				 <STM32_PINMUX('D', 10, AF12)>, /* FMC_D15 */
+				 <STM32_PINMUX('G', 9, AF12)>, /* FMC_NE2_FMC_NCE */
+				 <STM32_PINMUX('G', 12, AF12)>; /* FMC_NE4 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+	};
+
+	fmc_sleep_pins_b: fmc-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
+				 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
+				 <STM32_PINMUX('B', 7, ANALOG)>, /* FMC_NL */
+				 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
+				 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
+				 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
+				 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
+				 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
+				 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* FMC_D8 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* FMC_D9 */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* FMC_D10 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* FMC_D11 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* FMC_D12 */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* FMC_D13 */
+				 <STM32_PINMUX('D', 9, ANALOG)>, /* FMC_D14 */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* FMC_D15 */
+				 <STM32_PINMUX('G', 9, ANALOG)>, /* FMC_NE2_FMC_NCE */
+				 <STM32_PINMUX('G', 12, ANALOG)>; /* FMC_NE4 */
+		};
+	};
+
 	i2c1_pins_a: i2c1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
