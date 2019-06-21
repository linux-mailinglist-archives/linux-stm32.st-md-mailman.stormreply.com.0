Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B834EB1C
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2019 16:51:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FF19C10CB5
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2019 14:51:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C746C10CB3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 14:51:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LEaSHX008663; Fri, 21 Jun 2019 16:50:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xJzSb0vLMvQQqcR+GwMSOIjeQUxGRSb+qqQ5nd442G0=;
 b=CK+1gUTMPz86IMV3Nb4kmBzUGcCz3eFXE1s5vL9etIIOaYl+NQKaAl7iLUbWpOKpsYEH
 rZE21C0UsUd1xYKaOcJJGb+lVptDChGU9ZXuZ6lwRefDpqiyBaarLbR9zRLocJc//ZCs
 g7FL6mmfd0sqQHFRSrR9w0RLPt3VYtb11jQlCAI7tRI6Pjzs5e3X19uL2LcO3ZN23jyz
 rxMw3TjCK7Hol5RGHvphC01dZHvjPRI10s5TEa1HHk2jIshU9cKOWp3ECcptJqJRObTN
 xtLfbz8Pk+Fjqh+AvkB0n0BBc9tGIsAVF1tJHqk8CN8himEY9y5mJwLjN9OakAtmnwXP 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781388p1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 16:50:53 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4DE434;
 Fri, 21 Jun 2019 14:50:52 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E79B2BDF;
 Fri, 21 Jun 2019 14:50:52 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 21 Jun 2019 16:50:52 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <alexandre.torgue@st.com>,
 <linux@armlinux.org.uk>, <olof@lixom.net>, <arnd@arndb.de>
Date: Fri, 21 Jun 2019 16:49:48 +0200
Message-ID: <1561128590-14621-3-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: devicetree@vger.kernel.org, Christophe Kerello <christophe.kerello@st.com>,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] ARM: dts: stm32: add FMC2 NAND controller
	pins muxing on stm32mp157c-ev1
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

This patch adds FMC2 NAND controller pins muxing used on stm32mp157c-ev1.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index df64701..c4f2b23 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -276,6 +276,50 @@
 				};
 			};
 
+			fmc_pins_a: fmc-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
+						 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
+						 <STM32_PINMUX('D', 11, AF12)>, /* FMC_A16_FMC_CLE */
+						 <STM32_PINMUX('D', 12, AF12)>, /* FMC_A17_FMC_ALE */
+						 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
+						 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
+						 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
+						 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
+						 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
+						 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
+						 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
+						 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
+						 <STM32_PINMUX('G', 9, AF12)>; /* FMC_NE2_FMC_NCE */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('D', 6, AF12)>; /* FMC_NWAIT */
+					bias-pull-up;
+				};
+			};
+
+			fmc_sleep_pins_a: fmc-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
+						 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
+						 <STM32_PINMUX('D', 11, ANALOG)>, /* FMC_A16_FMC_CLE */
+						 <STM32_PINMUX('D', 12, ANALOG)>, /* FMC_A17_FMC_ALE */
+						 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
+						 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
+						 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
+						 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
+						 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
+						 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
+						 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
+						 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
+						 <STM32_PINMUX('D', 6, ANALOG)>, /* FMC_NWAIT */
+						 <STM32_PINMUX('G', 9, ANALOG)>; /* FMC_NE2_FMC_NCE */
+				};
+			};
+
 			i2c1_pins_a: i2c1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
