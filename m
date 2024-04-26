Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DF8B3A95
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 17:06:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18DEDC71293;
	Fri, 26 Apr 2024 15:06:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 557D1C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 15:06:31 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QDIZP5016364;
 Fri, 26 Apr 2024 17:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6YrMkwdcMEba37Dr4YOcNaLg4oy1sj3dUWUmxDd/7wk=; b=sC
 2BzoKIkHpJdQTjnxheJTalipPcLhbYTN9/qNL8iPlXaFUpR8QYz8qLR15zn/8Qqb
 DDaEA/pkjM63L4D2Vxt4VVbo+0aOJSjz5CFL1ytQF1CNWyWidtaHO5s7e2TR06HL
 U0sTcHF5wdnwl4S5eqLQ4KwM8At/4/vVJtrrD3+ThGfxziejWNEI+vuKt1ORRl6M
 9Y+im2/WE8cgAITckTAuARg2Gs2KCvXFtLdwT041KJXBWq9zptgNxXfWmBfu2vmZ
 t3RA/VeJwagJ7rft976bpShCAwMK3X+FQ7DZC7OiREHGunMmaPyAgfcFh0gCJjan
 iARO/LT3Rgg4ADT5C6Ww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmq910mhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 17:06:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CE5904002D;
 Fri, 26 Apr 2024 17:06:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 625C4227F06;
 Fri, 26 Apr 2024 17:05:41 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 17:05:41 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 26 Apr 2024 17:05:24 +0200
Message-ID: <20240426150526.3094607-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426150526.3094607-1-alain.volmat@foss.st.com>
References: <20240426150526.3094607-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add DCMIPP pinctrl on
	STM32MP13x SoC family
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

Adds DCMIPP pinctrl support and assigns dedicated GPIO pins.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
index 32c5d8a1e06a..b423d182aefd 100644
--- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
@@ -13,6 +13,39 @@ pins {
 		};
 	};
 
+	dcmipp_pins_a: dcmi-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H',  8,  AF13)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('G',  9,  AF13)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('B',  7,  AF14)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('A',  9,  AF13)>,/* DCMI_D0 */
+				 <STM32_PINMUX('D',  0,  AF13)>,/* DCMI_D1 */
+				 <STM32_PINMUX('G', 10,  AF13)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E',  4,  AF13)>,/* DCMI_D3 */
+				 <STM32_PINMUX('D', 11,  AF14)>,/* DCMI_D4 */
+				 <STM32_PINMUX('D',  3,  AF13)>,/* DCMI_D5 */
+				 <STM32_PINMUX('B',  8,  AF13)>,/* DCMI_D6 */
+				 <STM32_PINMUX('E', 14,  AF13)>;/* DCMI_D7 */
+			bias-disable;
+		};
+	};
+
+	dcmipp_sleep_pins_a: dcmi-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H',  8,  ANALOG)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('G',  9,  ANALOG)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('B',  7,  ANALOG)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('A',  9,  ANALOG)>,/* DCMI_D0 */
+				 <STM32_PINMUX('D',  0,  ANALOG)>,/* DCMI_D1 */
+				 <STM32_PINMUX('G', 10,  ANALOG)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E',  4,  ANALOG)>,/* DCMI_D3 */
+				 <STM32_PINMUX('D', 11,  ANALOG)>,/* DCMI_D4 */
+				 <STM32_PINMUX('D',  3,  ANALOG)>,/* DCMI_D5 */
+				 <STM32_PINMUX('B',  8,  ANALOG)>,/* DCMI_D6 */
+				 <STM32_PINMUX('E', 14,  ANALOG)>;/* DCMI_D7 */
+		};
+	};
+
 	i2c1_pins_a: i2c1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
