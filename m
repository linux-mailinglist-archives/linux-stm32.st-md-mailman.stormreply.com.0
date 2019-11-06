Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3272F140E
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 11:36:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABC3FC36B11;
	Wed,  6 Nov 2019 10:36:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82854C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 10:09:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6A7Bc5003302; Wed, 6 Nov 2019 11:09:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Eu/qqzaS1pp8TvmfaYHxuA1TJTYBQ4y6Pgq5d0GE35Y=;
 b=ruFqG6l380JE4X24zCDqGhmxLBLWJN6jvQycNwE4r/5QY8g8YNhx2IwNeaYefI3CQ8oq
 vQzBA6FsyQxNRWLg3gA1Lv6p4p1mIGXDUIw09U+1TxphjOO9gbIYbZRhytjhghTaXgFP
 TzjJmhPxf+f9ZzbyERi1y9l6wq6QrsjeWia9j1aZa/18Vd+z/TfKqrhfRm621H0h4r8L
 UbKCpKuZPLndASO92vNV3WJxhgNeEM/O+jH5YPjXfdWeITJPxIXNtUN/8qwo6E0qJGBK
 FqCnReeJN4ZHTRPiDzX1iv4eLXrdSigF2WwFwnSOj3VenZ1yJGayo7l99em3HxnFugh3 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w10f1mpur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 11:09:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D45C10002A;
 Wed,  6 Nov 2019 11:09:42 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60F392AD337;
 Wed,  6 Nov 2019 11:09:42 +0100 (CET)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019
 11:09:42 +0100
Received: from localhost (10.48.1.131) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 6 Nov 2019 11:09:41 +0100
From: Yann Gautier <yann.gautier@st.com>
To: <alexandre.torgue@st.com>
Date: Wed, 6 Nov 2019 11:09:35 +0100
Message-ID: <20191106100938.11368-2-yann.gautier@st.com>
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
Subject: [Linux-stm32] [PATCH 1/4] ARM: dts: stm32: update slew-rate
	properties for sdmmc1 on stm32mp157
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

Relax sdmmc1 pins slew-rate to minimize peak currents.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Yann Gautier <yann.gautier@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 28 +++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 0a3a7d66737b..2904bc8c6a41 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -731,14 +731,19 @@
 			};
 
 			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
-				pins {
+				pins1 {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
 						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
 						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
 						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
 						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-					slew-rate = <3>;
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+					slew-rate = <2>;
 					drive-push-pull;
 					bias-disable;
 				};
@@ -749,15 +754,20 @@
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
 						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
 						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-					slew-rate = <3>;
+						 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
+					slew-rate = <1>;
 					drive-push-pull;
 					bias-disable;
 				};
-				pins2{
+				pins2 {
+					pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins3 {
 					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-					slew-rate = <3>;
+					slew-rate = <1>;
 					drive-open-drain;
 					bias-disable;
 				};
@@ -779,7 +789,7 @@
 					pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
 						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
 						 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
-					slew-rate = <3>;
+					slew-rate = <1>;
 					drive-push-pull;
 					bias-pull-up;
 				};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
