Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB3F1410
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 11:36:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87F50C36B13;
	Wed,  6 Nov 2019 10:36:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 774DFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 10:10:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6A7AGH003297; Wed, 6 Nov 2019 11:09:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1npB15BkmfpmC8uST3T7d6AtcAiZs2SOxTaIZjMSkes=;
 b=kJZtcreKZPgNJzoK+KSUO2WMy68uSuCCWSZwqE+Juhuuc62HIC7nawPiEAcaf48CFzMj
 Cu8v2nmJdL8zybrh2/GZ7VjnVM7+6dbuQCAgOp0hLtV3yZkAIGk8vla2ForVug07qkvx
 Rme91YYRYs0TY0WmTqoJ/tI8h93DpmE6PC8zQZizAOEeNpfUJrNir3Nrv09LIZZOBQGt
 t9XK4r18jU4y08YChLbFpxxU7sOaJK1Lj0kASsiK78JDyDNro9HEfO31M2Hgi79SN/gC
 lYBCjqOWyjYWWl49wNDqtZwSZS9C7pHoA4C2kvpLc67cUW7tR6gkJzuxquwGDIBKyaAr UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w10f1mpv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 11:09:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86F1910002A;
 Wed,  6 Nov 2019 11:09:45 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 789EB2AD337;
 Wed,  6 Nov 2019 11:09:45 +0100 (CET)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019
 11:09:45 +0100
Received: from localhost (10.48.1.131) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 6 Nov 2019 11:09:44 +0100
From: Yann Gautier <yann.gautier@st.com>
To: <alexandre.torgue@st.com>
Date: Wed, 6 Nov 2019 11:09:38 +0100
Message-ID: <20191106100938.11368-5-yann.gautier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106100938.11368-1-yann.gautier@st.com>
References: <20191106100938.11368-1-yann.gautier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_02:2019-11-06,2019-11-06 signatures=0
X-Mailman-Approved-At: Wed, 06 Nov 2019 10:36:51 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/4] ARM: dts: stm32: add sdmmc3 node for
	STM32MP1 boards
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

On STM32MP1 EVAL and DISCOVERY boards, the SDMMC3 internal peripheral
can be used through the GPIO extension connector. The sdmmc3 node is then
added in the boards DT files, and the required pins are also added.
The node status is disabled as there is no device connected by default.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Yann Gautier <yann.gautier@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 54 +++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts     | 12 +++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 12 +++++
 3 files changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index a907d93f8916..d31a4661f7b5 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -926,6 +926,60 @@
 				};
 			};
 
+			sdmmc3_b4_pins_a: sdmmc3-b4-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
+						 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
+						 <STM32_PINMUX('F', 5, AF9)>, /* SDMMC3_D2 */
+						 <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
+						 <STM32_PINMUX('F', 1, AF9)>; /* SDMMC3_CMD */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+			};
+
+			sdmmc3_b4_od_pins_a: sdmmc3-b4-od-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
+						 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
+						 <STM32_PINMUX('F', 5, AF9)>, /* SDMMC3_D2 */
+						 <STM32_PINMUX('D', 7, AF10)>; /* SDMMC3_D3 */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins3 {
+					pinmux = <STM32_PINMUX('F', 1, AF9)>; /* SDMMC2_CMD */
+					slew-rate = <1>;
+					drive-open-drain;
+					bias-pull-up;
+				};
+			};
+
+			sdmmc3_b4_sleep_pins_a: sdmmc3-b4-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC3_D0 */
+						 <STM32_PINMUX('F', 4, ANALOG)>, /* SDMMC3_D1 */
+						 <STM32_PINMUX('F', 5, ANALOG)>, /* SDMMC3_D2 */
+						 <STM32_PINMUX('D', 7, ANALOG)>, /* SDMMC3_D3 */
+						 <STM32_PINMUX('G', 15, ANALOG)>, /* SDMMC3_CK */
+						 <STM32_PINMUX('F', 1, ANALOG)>; /* SDMMC3_CMD */
+				};
+			};
+
 			spdifrx_pins_a: spdifrx-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 0615d1c8a6fc..b86c32e6a829 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -444,6 +444,18 @@
 	status = "okay";
 };
 
+&sdmmc3 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_b4_pins_a>;
+	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "disabled";
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 89d29b50c3f4..d047901c51ea 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -293,6 +293,18 @@
 	};
 };
 
+&sdmmc3 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_b4_pins_a>;
+	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "disabled";
+};
+
 &spi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins_a>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
