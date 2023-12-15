Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A8A814E10
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 18:12:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84941C6DD6D;
	Fri, 15 Dec 2023 17:12:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1F85C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 17:12:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BFDDY49017493; Fri, 15 Dec 2023 18:12:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=gmw5KgSBJw8JBiuHaxGZmQ8x/KuH7Q2WDFM7TzdfLro=; b=8a
 lvsaJk6XWAcnXLXKc0evZplfwHcFKiouJVl+qG4hfm2pwHtjwNl7ziEGuXs/31qJ
 6LlqfwtufJ1sKzi4aWgRQNQyyM0AS3x46qDXtl7xmHHw2R3FK45mn6MlisccnQEa
 nxinxuQ8kHQO6pzVS9BMnXeYLqJ34ktr7awijRWBee2yu7tmLimHhZQlwkwQcVCY
 I6Qz64ezUskODw/K4XBHZKUR7tOBP7ymvu3JoGGIBWWp4T4/yMBk8+d8UcqryxOK
 mhwMFDa+5sFAXreG2VEK8NH211K/wzKagL7z7bU1B8VStWhaY4nH+G3is18b6Hp2
 IzoF75vGZu2X9OUVofIA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v0cbtujbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 18:12:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E344B100052;
 Fri, 15 Dec 2023 18:12:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBD1223BE0A;
 Fri, 15 Dec 2023 18:12:02 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 18:12:02 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 15 Dec 2023 18:06:12 +0100
Message-ID: <20231215170617.95868-9-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215170617.95868-1-alain.volmat@foss.st.com>
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 8/9] arm64: dts: st: add i2c2/i2c8 pins for
	stm32mp25
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

Add the i2c2 and i2c8 pins used on STM32MP257F-EV1 board.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 66791a974f8f..4194807606ce 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -6,6 +6,23 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	i2c2_pins_a: i2c2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 5, AF9)>, /* I2C2_SCL */
+				 <STM32_PINMUX('B', 4, AF9)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_a: i2c2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 5, ANALOG)>, /* I2C2_SCL */
+				 <STM32_PINMUX('B', 4, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
@@ -90,3 +107,22 @@ pins {
 		};
 	};
 };
+
+&pinctrl_z {
+	i2c8_pins_a: i2c8-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, AF8)>, /* I2C8_SCL */
+				 <STM32_PINMUX('Z', 3, AF8)>; /* I2C8_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c8_sleep_pins_a: i2c8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C8_SCL */
+				 <STM32_PINMUX('Z', 3, ANALOG)>; /* I2C8_SDA */
+		};
+	};
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
