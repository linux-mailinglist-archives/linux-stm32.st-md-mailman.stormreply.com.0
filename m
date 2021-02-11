Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E03188F0
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Feb 2021 12:07:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A7FDC57B56;
	Thu, 11 Feb 2021 11:07:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC7E8C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 11:07:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11BB74Bv028238; Thu, 11 Feb 2021 12:07:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=OeVb/YX9vc0dVFhSp2zIejtpz3jrgkcK0rTNlrGiJj4=;
 b=CpzT8oAZ5Hu7FV8crOCSrZWHKjASxYMNY2/yKUdKbAkkEVGu/tK0jxTht0f0ZCDACCRL
 fbAZbOpHpDtiJokRokQs5Dg9HBSFBtNCKxESk6huJuU6eIFrTJNQnUqDLzqYU7pHfszN
 0u3ERONsLSyjFBjwB2AvgwG7b6GarPd8k1x6a1w5UzA0iKUOwcFCA8gXvhdALKX6pQ9k
 cazu+tV4p5v4+DluT+UzALR+6l73A20X2mDUvowP9OA24/cp4kbgk3Fo5kIp6SMlCU7+
 el6Ra4I6NQGcVV2p7WRpAtlPoRWIvOkanP61QAjtqqrhMfYjNcFLUaW3RGSY5S19Ph0J dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr2cp4mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 12:07:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CBDD10002A;
 Thu, 11 Feb 2021 12:07:04 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BDDC225892;
 Thu, 11 Feb 2021 12:07:04 +0100 (CET)
Received: from GPXDAG2NODE6.st.com (10.75.127.70) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Feb
 2021 12:07:03 +0100
Received: from GPXDAG2NODE6.st.com ([fe80::bc43:6900:9b0:6519]) by
 GPXDAG2NODE6.st.com ([fe80::bc43:6900:9b0:6519%19]) with mapi id
 15.00.1473.003; Thu, 11 Feb 2021 12:07:03 +0100
From: Valentin CARON - foss <valentin.caron@foss.st.com>
To: Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH] ARM: dts: stm32: fix usart 2 & 3 pinconf to wake up with
 flow control
Thread-Index: AQHXAGYHV6g+MvDZYkWHZvdvB4+Udw==
Date: Thu, 11 Feb 2021 11:07:03 +0000
Message-ID: <20210211110620.31594-1-valentin.caron@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.119]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_05:2021-02-10,
 2021-02-11 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix usart 2 & 3 pinconf to
 wake up with flow control
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

Modify usart 2 & 3 pins to allow wake up from low power mode while the
hardware flow control is activated. UART RTS pin need to stay configure
in idle mode to receive characters in order to wake up.

Fixes: 842ed898a757 ("ARM: dts: stm32: add usart2, usart3 and uart7 pins in stm32mp15-pinctrl")

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 7b4249ed1983..060baa8b7e9d 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1891,10 +1891,15 @@
 	usart2_idle_pins_c: usart2-idle-2 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
 				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
 		};
 		pins2 {
+			pinmux = <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
 			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
 			bias-disable;
 		};
@@ -1940,10 +1945,15 @@
 	usart3_idle_pins_b: usart3-idle-1 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
-				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
 				 <STM32_PINMUX('I', 10, ANALOG)>; /* USART3_CTS_NSS */
 		};
 		pins2 {
+			pinmux = <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
 			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
 			bias-disable;
 		};
@@ -1976,10 +1986,15 @@
 	usart3_idle_pins_c: usart3-idle-2 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
-				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
 				 <STM32_PINMUX('B', 13, ANALOG)>; /* USART3_CTS_NSS */
 		};
 		pins2 {
+			pinmux = <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
 			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
 			bias-disable;
 		};
-- 
2.17.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
