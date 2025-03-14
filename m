Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15173A617D9
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Mar 2025 18:34:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C646DC7A827;
	Fri, 14 Mar 2025 17:34:36 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FDACC7A825
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Mar 2025 17:34:35 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECr8bo027811;
 Fri, 14 Mar 2025 18:34:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=HSfXO/oqKFCMaTCd
 lQ+IDE+n9QhHEbMvlnir+1JJEh5q/i6TUowJA4DgU5/R3yd/CjqIjkTVX9w4M9wj
 pxxIy5NufnYEaqlk98g/dvk2+wDLzulTV2x8dIidegM7oThDCdOqq6ilySiH7Pad
 4FpDJf+kDqb99UamXiztxcE44+Orm+jZTiSxBYrvBvo5qiqj/ju10ek0iGA2/OZz
 RQson4VRKyadvBLiYiemv3P/vfPALUiKv9Dwl2CMJfm33TE0Qi1j7Xvc33wL7O6l
 n0rKBAVbxoyu2e9OZAnLRextsPriMV9vCa5+uHMZARI2juUyDtAfX/axVu8+ulaV
 SbMYKA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45au3p6xcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Mar 2025 18:34:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45E9E40065;
 Fri, 14 Mar 2025 18:33:05 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD1746D8E92;
 Fri, 14 Mar 2025 18:15:09 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:09 +0100
Received: from localhost (10.252.1.141) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:09 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jic23@kernel.org>,
 <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
Date: Fri, 14 Mar 2025 18:14:50 +0100
Message-ID: <20250314171451.3497789-8-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.1.141]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 wbg@kernel.org
Subject: [Linux-stm32] [PATCH v4 7/8] arm64: dts: st: add low-power timer
	nodes on stm32mp251
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

Add low-power timer (LPTimer) support on STM32MP25 SoC.
The full feature set is implemented in LPTIM1/2/3/4. LPTIM5 supports a
smaller set of features (no capture/compare) channel. Still, LPTIM5 can
be used as single PWM, counter, trigger or timer.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V2:
- Adopt two compatibles: newly introduced "st,stm32mp25-..." compatible,
  and fallback "st,stm32-...".
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 177 +++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008..505176276e72 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -238,6 +238,78 @@ rifsc: bus@42080000 {
 			#access-controller-cells = <1>;
 			ranges;
 
+			lptimer1: timer@40090000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x40090000 0x400>;
+				interrupts-extended = <&exti1 47 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM1>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 17>;
+				power-domains = <&RET_PD>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@0 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <0>;
+					status = "disabled";
+				};
+			};
+
+			lptimer2: timer@400a0000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x400a0000 0x400>;
+				interrupts-extended = <&exti1 48 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM2>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 18>;
+				power-domains = <&RET_PD>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@1 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <1>;
+					status = "disabled";
+				};
+			};
+
 			i2s2: audio-controller@400b0000 {
 				compatible = "st,stm32mp25-i2s";
 				reg = <0x400b0000 0x400>;
@@ -799,6 +871,111 @@ i2c8: i2c@46040000 {
 				status = "disabled";
 			};
 
+			lptimer3: timer@46050000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x46050000 0x400>;
+				interrupts-extended = <&exti2 29 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM3>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 19>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@2 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <2>;
+					status = "disabled";
+				};
+			};
+
+			lptimer4: timer@46060000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x46060000 0x400>;
+				interrupts-extended = <&exti2 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM4>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 20>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@3 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <3>;
+					status = "disabled";
+				};
+			};
+
+			lptimer5: timer@46070000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x46070000 0x400>;
+				interrupts-extended = <&exti2 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM5>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 21>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@4 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <4>;
+					status = "disabled";
+				};
+			};
+
 			csi: csi@48020000 {
 				compatible = "st,stm32mp25-csi";
 				reg = <0x48020000 0x2000>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
