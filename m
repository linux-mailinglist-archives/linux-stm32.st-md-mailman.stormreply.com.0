Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A123D5868CF
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 13:53:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63BF1C6410F;
	Mon,  1 Aug 2022 11:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2204CC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 07:53:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P7FAwf006147;
 Mon, 25 Jul 2022 09:53:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6razgSe0W2c3Jx+HKO5kPTMtBrHCoPC0SPCdLXo7BWw=;
 b=sdYSfLRwuIhHV0AMaExjlCQ7MlJ3z8UNHpzTzQnSLc/S0wbW9dtRBdfKCjWTnJvDSh5E
 yV1DbhZQl7ZuS1fIelRpkQSM0QAtj4w0/GanZTCTB/RX2ATxNvsQzzllNNj3kVOACS9y
 l3/tQVV+6kzeRx5IVQ+zkJLVBnCUJp1w70OYGXqaixNF2yBrDfnneCDzrDdw2XwjFvgK
 diDe2pE8Gkk5cv46bpQ3q21OPeGl5LwV9SHFkK62F/EATneh/yci62Bovj+u1WIe67tP
 evLZnQ5+LpKNSD92W3e2HXGS3qpwYpzhdJel8KyEf8Lr32TKmKMcQYO82Il1h7M6oA7L WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hg8b0qu3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 09:53:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E993100039;
 Mon, 25 Jul 2022 09:53:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 691602122FA;
 Mon, 25 Jul 2022 09:53:19 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 25 Jul
 2022 09:53:19 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <alexandre.torgue@foss.st.com>
Date: Mon, 25 Jul 2022 09:52:55 +0200
Message-ID: <20220725075255.429869-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725075255.429869-1-alain.volmat@foss.st.com>
References: <20220725075255.429869-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Mailman-Approved-At: Mon, 01 Aug 2022 11:53:41 +0000
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] ARM: dts: stm32: add pinctrl and
	disabled spi5 node in stm32mp135f-dk
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

Add pinctrl information and a disabled spi5 node within
stm32mp135f-dk.dts in order to use the spi5 bus which is
available via the GPIO expansion pins of the STM32MP135 Discovery board.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp135f-dk.dts     |  7 +++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
index 749078ba9d42..efdd163eba30 100644
--- a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
@@ -142,6 +142,29 @@ pins {
 		};
 	};
 
+	spi5_pins_a: spi5-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 7, AF6)>, /* SPI5_SCK */
+				 <STM32_PINMUX('H', 3, AF5)>; /* SPI5_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 8, AF5)>; /* SPI5_MISO */
+			bias-disable;
+		};
+	};
+
+	spi5_sleep_pins_a: spi5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 7, ANALOG)>, /* SPI5_SCK */
+				 <STM32_PINMUX('A', 8, ANALOG)>, /* SPI5_MISO */
+				 <STM32_PINMUX('H', 3, ANALOG)>; /* SPI5_MOSI */
+		};
+	};
+
 	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 6, AF8)>; /* UART4_TX */
diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index 3e2823332d51..de341d17e87d 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -116,6 +116,13 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&spi5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi5_pins_a>;
+	pinctrl-1 = <&spi5_sleep_pins_a>;
+	status = "disabled";
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
