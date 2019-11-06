Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DCF140F
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 11:36:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A2DEC36B09;
	Wed,  6 Nov 2019 10:36:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6A76C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 10:09:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6A7GcI003655; Wed, 6 Nov 2019 11:09:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FIClY/e3QBNSiXrpeU79siTfTUG1jsOVOKrMfL3AkC4=;
 b=IpWAjo40QpMibeGzZ54Bj1H3AIG115RFdC7woJSdPzo/uNlUdJ9eLeodBedT8O4/opPK
 bK7QIvR3bGFmkl93ezFWnG5RxW/eI9UWpUXmCL9loOt2KHJ+fW63qRB5iVM+EeJMKx1/
 GzekkeVgaHihxUI6S6TFQ0q/HFqJ1MtV4qsBb/p1Sz/kwmrRUkNQuInuq0a6mv/a2uAB
 bX3qUbXHFpo5iWYVb7BJFVT+CBs5Uu9WZ9MEbiRMcKGZ6W98IMSzxNMGXYF6P73/BXkN
 MU434r8BvyQhs/pLAGbqbiP5nswZ4/NAdingYzK8u1u3Qf88Hbo1oO/mv42z+GXmEbsh xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w1054vs44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 11:09:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 905B0100038;
 Wed,  6 Nov 2019 11:09:44 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EB812AD337;
 Wed,  6 Nov 2019 11:09:44 +0100 (CET)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019
 11:09:44 +0100
Received: from localhost (10.48.1.131) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 6 Nov 2019 11:09:44 +0100
From: Yann Gautier <yann.gautier@st.com>
To: <alexandre.torgue@st.com>
Date: Wed, 6 Nov 2019 11:09:37 +0100
Message-ID: <20191106100938.11368-4-yann.gautier@st.com>
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
Subject: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: enable sdmmc2 node for
	stm32mp157c-ed1 board
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

On STM32MP157C-ED1, the eMMC is connected on instance 2 of SDMMC
peripheral. The sdmmc2 node is then added in the board DT file, as well as
the pins nodes in the pinctrl file.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Yann Gautier <yann.gautier@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 118 ++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     |  16 +++
 2 files changed, 134 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 2904bc8c6a41..a907d93f8916 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -808,6 +808,124 @@
 				};
 			};
 
+			sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+						 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
+						 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+			};
+
+			sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+						 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins3 {
+					pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+					slew-rate = <1>;
+					drive-open-drain;
+					bias-pull-up;
+				};
+			};
+
+			sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
+						 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
+						 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
+						 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
+						 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
+						 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
+				};
+			};
+
+			sdmmc2_b4_pins_b: sdmmc2-b4-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+						 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
+						 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			sdmmc2_b4_od_pins_b: sdmmc2-b4-od-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+						 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins3 {
+					pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+					slew-rate = <1>;
+					drive-open-drain;
+					bias-disable;
+				};
+			};
+
+			sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
+						 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
+						 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
+						 <STM32_PINMUX('D', 3, AF9)>; /* SDMMC2_D7 */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+			};
+
+			sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+						 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
+						 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
+						 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
+				};
+			};
+
 			spdifrx_pins_a: spdifrx-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 1d426ea8bdaf..b40a6b9a7aa6 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -302,6 +302,22 @@
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&v3v3>;
+	mmc-ddr-3_3v;
+	status = "okay";
+};
+
 &timers6 {
 	status = "okay";
 	/* spare dmas for other usage */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
