Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C528BD0BA
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 16:50:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC8BC5E2D0;
	Mon,  6 May 2024 14:50:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 932C8C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2024 14:50:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446Bbcmp010927;
 Mon, 6 May 2024 16:50:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=lFFdRBl
 /abKwjIsFck+7iM64lIxYS3/Znv6CkxEJjqA=; b=IsOaV9WQBb4PNmAamgQO6Pm
 UsI6cuhN67SNpPbgtJ4Wq+PeizHv3jG5aBChR2vvDjinzQr8Lj4ydQMlrk0hjqO3
 gr0mmxIvCNJrZdQOIBjjnqbZfCVghd6dbBGXYYVvxJAnSjiW7QOASZauCCe0oOWG
 IC9gyJCDKsAmiL9NqDXCICrP75gQ1T7yP+lHzspiJKIJGTpU2C0IVMziTU3WsD6x
 cFgC2cAyxFrKrPhQnGRBJ1wPz6kRxTiIoFir1EelJLG+InMfUgaLWsVE33UkcWrT
 G6KUt6u+EmO/1ZUfl18EOpBqjRS+0Wh3EukYygOxDB/n95QUK3++tLdrQXCLiNQ=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xwcbx7j8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 May 2024 16:50:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A641D4002D;
 Mon,  6 May 2024 16:50:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D753D2248BB;
 Mon,  6 May 2024 16:49:47 +0200 (CEST)
Received: from localhost (10.48.87.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 16:49:47 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 6 May 2024 16:49:45 +0200
Message-ID: <20240506144945.293966-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_09,2024-05-06_02,2023-05-22_02
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add goodix touchscreen on
	stm32mp135f-dk
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

Touchscreen reset needs to be configured
via the pinctrl not the driver (a pull-down resistor
has been soldered onto the reset line which forces
the touchscreen to reset state).
Interrupt line must have a pull-down resistor
in order to freeze the i2c address at 0x5D.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 22 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 14 +++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
index 32c5d8a1e06a..21861cae21d9 100644
--- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
@@ -13,6 +13,28 @@ pins {
 		};
 	};
 
+	goodix_pins_a: goodix-0 {
+		/*
+		 * touchscreen reset needs to be configured
+		 * via the pinctrl not the driver (a pull-down resistor
+		 * has been soldered onto the reset line which forces
+		 * the touchscreen to reset state).
+		 */
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, GPIO)>;
+			output-high;
+			bias-pull-up;
+		};
+		/*
+		 * Interrupt line must have a pull-down resistor
+		 * in order to freeze the i2c address at 0x5D
+		 */
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 5, GPIO)>;
+			bias-pull-down;
+		};
+	};
+
 	i2c1_pins_a: i2c1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 567e53ad285f..5e8ee2d4648a 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -201,6 +201,20 @@ &i2c5 {
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
+
+	goodix: goodix-ts@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&goodix_pins_a>;
+		interrupt-parent = <&gpiof>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+		AVDD28-supply = <&scmi_v3v3_sw>;
+		VDDIO-supply = <&scmi_v3v3_sw>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <272>;
+		status = "okay" ;
+	};
 };
 
 &iwdg2 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
