Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56745EFDB0
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 13:52:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17174C36B11;
	Tue,  5 Nov 2019 12:52:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AFD6C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 12:52:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA5CnPFZ027895; Tue, 5 Nov 2019 13:52:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7qTkJgeLvJG9yVLjxR53YS50TdExPF24lYbqfsmrqvk=;
 b=HsMOixEbY1ruOLkQkxxCJ1z3pter8jt/eEfoLcOYQqmjh7Fv3GAyTVc/l1Hn9ukj0tUS
 slRGdrwyy4uWHmWBxf3TvSk4HFbieyaZUV9cXJIsJQ60oVXEbMe2HYE1r3WVRX8QXecX
 WdW9shpbHGw1KVLyIbKRs0Joh3sIATuyIcqVis9gyCqeaA727HWJRe4/EJSjtja46Hct
 6r7fFv5lpPL4sdTv1Ovzmf2pSFad+MdOLPXyRSp7orBkO7EC6ibMGafkIq4Imfek8vqp
 JPTeQf93GdFRa09InEEkwP+TNrwNF8VqdNUx8wRpktlBt3v/k2W55DhXMbfp2hWeit76 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w11jn7kg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 13:52:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09340100039;
 Tue,  5 Nov 2019 13:52:36 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC5372BC5E7;
 Tue,  5 Nov 2019 13:52:35 +0100 (CET)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 13:52:35 +0100
Received: from localhost (10.48.0.192) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 5 Nov 2019 13:52:35 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <alexandre.torgue@st.com>
Date: Tue, 5 Nov 2019 13:52:19 +0100
Message-ID: <1572958341-12404-3-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572958341-12404-1-git-send-email-fabrice.gasnier@st.com>
References: <1572958341-12404-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_04:2019-11-05,2019-11-05 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] ARM: dts: stm32: add pwm pin muxing for
	stm32mp157a-dk1
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

Add all PWM pinctrl definitions that can be used on stm32mp157a-dk1 board.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 81 +++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index de5679f..0f42ab1 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -587,6 +587,25 @@
 				};
 			};
 
+			pwm1_pins_a: pwm1-0 {
+				pins {
+					pinmux = <STM32_PINMUX('E', 9, AF1)>, /* TIM1_CH1 */
+						 <STM32_PINMUX('E', 11, AF1)>, /* TIM1_CH2 */
+						 <STM32_PINMUX('E', 14, AF1)>; /* TIM1_CH4 */
+					bias-pull-down;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+			};
+
+			pwm1_sleep_pins_a: pwm1-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('E', 9, ANALOG)>, /* TIM1_CH1 */
+						 <STM32_PINMUX('E', 11, ANALOG)>, /* TIM1_CH2 */
+						 <STM32_PINMUX('E', 14, ANALOG)>; /* TIM1_CH4 */
+				};
+			};
+
 			pwm2_pins_a: pwm2-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 3, AF1)>; /* TIM2_CH4 */
@@ -602,6 +621,68 @@
 				};
 			};
 
+			pwm3_pins_a: pwm3-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 7, AF2)>; /* TIM3_CH2 */
+					bias-pull-down;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+			};
+
+			pwm3_sleep_pins_a: pwm3-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 7, ANALOG)>; /* TIM3_CH2 */
+				};
+			};
+
+			pwm4_pins_a: pwm4-0 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 14, AF2)>, /* TIM4_CH3 */
+						 <STM32_PINMUX('D', 15, AF2)>; /* TIM4_CH4 */
+					bias-pull-down;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+			};
+
+			pwm4_sleep_pins_a: pwm4-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 14, ANALOG)>, /* TIM4_CH3 */
+						 <STM32_PINMUX('D', 15, ANALOG)>; /* TIM4_CH4 */
+				};
+			};
+
+			pwm4_pins_b: pwm4-1 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 13, AF2)>; /* TIM4_CH2 */
+					bias-pull-down;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+			};
+
+			pwm4_sleep_pins_b: pwm4-sleep-1 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 13, ANALOG)>; /* TIM4_CH2 */
+				};
+			};
+
+			pwm5_pins_a: pwm5-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 11, AF2)>; /* TIM5_CH2 */
+					bias-pull-down;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+			};
+
+			pwm5_sleep_pins_a: pwm5-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 11, ANALOG)>; /* TIM5_CH2 */
+				};
+			};
+
 			pwm8_pins_a: pwm8-0 {
 				pins {
 					pinmux = <STM32_PINMUX('I', 2, AF3)>; /* TIM8_CH4 */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
