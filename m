Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26586119D
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 13:38:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B72ACC6C841;
	Fri, 23 Feb 2024 12:38:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 490AEC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 12:38:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N6TQdn027885; Fri, 23 Feb 2024 13:38:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=B/DdT1Hekue/y2cbdJTf13MdZkRgi2lmLP5jnu8Gv/8
 =; b=KqX52Xbx422s3kbIDBNVIVnin5onGlim3lEALQ0jXOmGxTV7NW2mTf8dMjs
 qoHfNORlZgV8mGHAEFea9S0xhycxfnqpHUut/UdMXJoWERTHYx0+gPS9PwDJz5EC
 cSVGaRuC9L3X2kOmWEBNvxnqDh+CtWUE0i2RR0cuE/YahB0KMciJteqeNRF5ut1s
 A9cgoClPl5jMnVruN/P+tfzMxxTMLSQ8TvEnSGLur3YfOsb72vIXtUukzgI/RekS
 jZjj3Uz/Uul63zBMMjxaCmL27oi7dDChNClUyE9KYI1RLnM/eRnvZV3RY/rqJNx0
 wzpioxPxCEmaMep4UYwmYk1ot7Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wd201vx12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 13:38:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E3C740045;
 Fri, 23 Feb 2024 13:38:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AD4B28DDC0;
 Fri, 23 Feb 2024 13:36:54 +0100 (CET)
Received: from localhost (10.129.178.151) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Feb
 2024 13:36:53 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 23 Feb 2024 13:36:49 +0100
MIME-Version: 1.0
Message-ID: <20240223-ltdc_mp13-v3-2-7f92a59ca11f@foss.st.com>
References: <20240223-ltdc_mp13-v3-0-7f92a59ca11f@foss.st.com>
In-Reply-To: <20240223-ltdc_mp13-v3-0-7f92a59ca11f@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.129.178.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/4] ARM: dts: stm32: add LTDC pinctrl on
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

Adds LTDC pinctrl support and assigns dedicated GPIO pins.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
index 27e0c3826789..32c5d8a1e06a 100644
--- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
@@ -47,6 +47,63 @@ pins {
 		};
 	};
 
+	ltdc_pins_a: ltdc-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D',  9, AF13)>, /* LCD_CLK */
+				 <STM32_PINMUX('C',  6, AF14)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  4, AF11)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('H',  9, AF11)>, /* LCD_DE */
+				 <STM32_PINMUX('G',  7, AF14)>, /* LCD_R2 */
+				 <STM32_PINMUX('B', 12, AF13)>, /* LCD_R3 */
+				 <STM32_PINMUX('D', 14, AF14)>, /* LCD_R4 */
+				 <STM32_PINMUX('E',  7, AF14)>, /* LCD_R5 */
+				 <STM32_PINMUX('E', 13, AF14)>, /* LCD_R6 */
+				 <STM32_PINMUX('E',  9, AF14)>, /* LCD_R7 */
+				 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
+				 <STM32_PINMUX('F',  3, AF14)>, /* LCD_G3 */
+				 <STM32_PINMUX('D',  5, AF14)>, /* LCD_G4 */
+				 <STM32_PINMUX('G',  0, AF14)>, /* LCD_G5 */
+				 <STM32_PINMUX('C',  7, AF14)>, /* LCD_G6 */
+				 <STM32_PINMUX('A', 15, AF11)>, /* LCD_G7 */
+				 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B2 */
+				 <STM32_PINMUX('F',  2, AF14)>, /* LCD_B3 */
+				 <STM32_PINMUX('H', 14, AF11)>, /* LCD_B4 */
+				 <STM32_PINMUX('E',  0, AF14)>, /* LCD_B5 */
+				 <STM32_PINMUX('B',  6, AF7)>,  /* LCD_B6 */
+				 <STM32_PINMUX('F',  1, AF13)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	ltdc_sleep_pins_a: ltdc-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('C',  6, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  4, ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('B', 12, ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('D', 14, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('E',  7, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('E',  9, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('F',  3, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('D',  5, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('G',  0, ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('C',  7, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('A', 15, ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('F',  2, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('H', 14, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('E',  0, ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('B',  6, ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('F',  1, ANALOG)>; /* LCD_B7 */
+		};
+	};
+
 	mcp23017_pins_a: mcp23017-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 12, GPIO)>;

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
