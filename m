Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 784BF6CC6B6
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 17:38:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37E39C6A5FD;
	Tue, 28 Mar 2023 15:38:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 268BDC6A5FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 15:38:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SE96Ek005933; Tue, 28 Mar 2023 17:38:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Z8sv+Rag3/oEhkaOzrRfMKQspA/vczhoJ6FwxnVe9qk=;
 b=ZWy2EYNzZACZcuNIXftc9K7FqR7+xxzyopAbLS/mUN0OsQv1BJdXEKbKsc70iX1mLciU
 eGnG7iTT3yHwOy7xeVBjXe0aHVLIAGf7VjNhSziXEUIXk4uG+YDhKo/fANa0SlpVkXuV
 ZflZ+cRhhzlvunvsnrYWgnxzvo/Yx9lnBhaYZF/Eby5vXnMFADK74hyMi9zd5vX0SKBH
 um9TgNPGHx8RbtuZdSBOXnyNYv+qB573QztYZOwuBbYWvPkqpFupRXV5bRwp78tQ2e1t
 hG3qExtnNyKWy+tC63IYssVNCvfqMB0D34zZeh1klqlcUgqYfuBsUDg+Lp/sSU0TCsZz NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pk5xkjts3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:38:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83F5B10002A;
 Tue, 28 Mar 2023 17:38:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D33A2194F6;
 Tue, 28 Mar 2023 17:38:41 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 17:38:41 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 28 Mar 2023 17:37:23 +0200
Message-ID: <20230328153723.498672-7-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328153723.498672-1-valentin.caron@foss.st.com>
References: <20230328153723.498672-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/6] ARM: dts: stm32: add uart nodes and
	uart aliases on stm32mp135f-dk
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

Update device-tree stm32mp135f-dk.dts to add usart1, uart8, usart2
and uart aliases.

- Usart2 is used to interface a BT device, enable it by default.
- Usart1 and uart8 are available on expansion connector.
  They are kept disabled. So, the pins are kept in analog state to
  lower power consumption by default or can be used as GPIO.
- Uart4 is used for console.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp135f-dk.dts | 42 +++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index c40686cb2b9a..f0900ca672b5 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -19,6 +19,13 @@ / {
 
 	aliases {
 		serial0 = &uart4;
+		serial1 = &usart1;
+		serial2 = &uart8;
+		serial3 = &usart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@c0000000 {
@@ -267,8 +274,41 @@ timer@13 {
 };
 
 &uart4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart8_pins_a>;
+	pinctrl-1 = <&uart8_sleep_pins_a>;
+	pinctrl-2 = <&uart8_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+};
+
+&usart1 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart1_pins_a>;
+	pinctrl-1 = <&usart1_sleep_pins_a>;
+	pinctrl-2 = <&usart1_idle_pins_a>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
+/* Bluetooth */
+&usart2 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_a>;
+	pinctrl-1 = <&usart2_sleep_pins_a>;
+	pinctrl-2 = <&usart2_idle_pins_a>;
+	uart-has-rtscts;
 	status = "okay";
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
