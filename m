Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E37658C442
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 09:41:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D19E6C0D2C0;
	Mon,  8 Aug 2022 07:41:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FBC4C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 07:41:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2787YniH021020;
 Mon, 8 Aug 2022 09:41:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qovgCI/rHlWBP9Q7xRWBKX4sBON8udJGHElHZMj6Q8E=;
 b=QhJwmSKEbPYVYuF5UbQlIHvTAFNX6FVdNgIFSaMKyxDRqIovev/N18j98wo1tbI79k5f
 pPEiL1/v5DMFsRsJv0AmSbsGdxJNo4G9HdtJpPhj6d2uO9YmnhmxADB6xQThUPTLUcjX
 IP/fW37UWLaAf8TrpfEJRavz9Aai6BjhvziuKzygqDYTUBmRHam8dq3UF95KsM3vrA4w
 pYcWq1AqJVYYFxT1HFp0Ak5JvFCMXztKBWdDAmu1Hjdg+jctJg98ANEgpwF3LxNggl0Z
 ZgWj2Nm7R3xLNi8bpM8+WTbhyhzvbwKlk31XAjulUvb3g46Mk4GFecGzJEP6sbGUZcxI Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hsdea156s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 09:41:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 10528100034;
 Mon,  8 Aug 2022 09:41:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA8252171E0;
 Mon,  8 Aug 2022 09:41:00 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 8 Aug
 2022 09:41:00 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 8 Aug 2022 09:40:51 +0200
Message-ID: <20220808074051.44736-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220808074051.44736-1-patrice.chotard@foss.st.com>
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_05,2022-08-05_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Create separate pinmux
	for qspi cs pin in stm32mp15-pinctrl.dtsi
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Create a separate pinmux for qspi chip select in stm32mp15-pinctrl.dtsi.
In the case we want to use transfer_one() API to communicate with a SPI
device, chip select signal must be driven individually.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 50 ++++++++++++++++--------
 arch/arm/boot/dts/stm32mp157c-ev1.dts    | 12 +++++-
 2 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 6052243ad81c..ade4fab45f14 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1189,7 +1189,7 @@ pins {
 	};
 
 	qspi_bk1_pins_a: qspi-bk1-0 {
-		pins1 {
+		pins {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
 				 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
 				 <STM32_PINMUX('F', 7, AF9)>, /* QSPI_BK1_IO2 */
@@ -1198,12 +1198,6 @@ pins1 {
 			drive-push-pull;
 			slew-rate = <1>;
 		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
-			bias-pull-up;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
 	};
 
 	qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
@@ -1211,13 +1205,12 @@ pins {
 			pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
 				 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
 				 <STM32_PINMUX('F', 7, ANALOG)>, /* QSPI_BK1_IO2 */
-				 <STM32_PINMUX('F', 6, ANALOG)>, /* QSPI_BK1_IO3 */
-				 <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
+				 <STM32_PINMUX('F', 6, ANALOG)>; /* QSPI_BK1_IO3 */
 		};
 	};
 
 	qspi_bk2_pins_a: qspi-bk2-0 {
-		pins1 {
+		pins {
 			pinmux = <STM32_PINMUX('H', 2, AF9)>, /* QSPI_BK2_IO0 */
 				 <STM32_PINMUX('H', 3, AF9)>, /* QSPI_BK2_IO1 */
 				 <STM32_PINMUX('G', 10, AF11)>, /* QSPI_BK2_IO2 */
@@ -1226,7 +1219,34 @@ pins1 {
 			drive-push-pull;
 			slew-rate = <1>;
 		};
-		pins2 {
+	};
+
+	qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
+				 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
+				 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
+				 <STM32_PINMUX('G', 7, ANALOG)>; /* QSPI_BK2_IO3 */
+		};
+	};
+
+	qspi_cs1_pins_a: qspi-cs1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	qspi_cs1_sleep_pins_a: qspi-cs1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
+		};
+	};
+
+	qspi_cs2_pins_a: qspi-cs2-0 {
+		pins {
 			pinmux = <STM32_PINMUX('C', 0, AF10)>; /* QSPI_BK2_NCS */
 			bias-pull-up;
 			drive-push-pull;
@@ -1234,13 +1254,9 @@ pins2 {
 		};
 	};
 
-	qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
+	qspi_cs2_sleep_pins_a: qspi-cs2-sleep-0 {
 		pins {
-			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
-				 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
-				 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
-				 <STM32_PINMUX('G', 7, ANALOG)>, /* QSPI_BK2_IO3 */
-				 <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
+			pinmux = <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
 		};
 	};
 
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index d142dd30e16b..050c3c27a420 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -255,8 +255,16 @@ &m_can1 {
 
 &qspi {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
+	pinctrl-0 = <&qspi_clk_pins_a
+		     &qspi_bk1_pins_a
+		     &qspi_cs1_pins_a
+		     &qspi_bk2_pins_a
+		     &qspi_cs2_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a
+		     &qspi_bk1_sleep_pins_a
+		     &qspi_cs1_sleep_pins_a
+		     &qspi_bk2_sleep_pins_a
+		     &qspi_cs2_sleep_pins_a>;
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
