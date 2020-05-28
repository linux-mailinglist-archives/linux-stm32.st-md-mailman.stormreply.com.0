Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D551E58F4
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 09:40:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1BA3C36B21;
	Thu, 28 May 2020 07:40:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5658C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 07:40:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04S7cFQF026434; Thu, 28 May 2020 09:40:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7wBCl4WI/PC8J0q2gdP42b4NMef/7EwZxJ8kd+yOVNQ=;
 b=xcvefQ30N58WAvBeWGF6NRuCxjbLg+qxe2QLbK0CZfhroMsAjlWWtuqaa5d42Ax0eiUa
 +CB8snlpsJEwQ1vU6WJdV67vhMcwwV+IKHwUOyIVnqK/nLjsbC0T/b+BuLKkg1jRm6ke
 e9+owBlGh4zK3ypiCPTD64OnMwVUayThUDmln9ey7RXjsHcRqWW01ujU0QQtVaoAKS8V
 4HgAFofH0IEwlksh+nPgd69NjDKdhoDQNGevrtEo1Tl+kGJAINPekblERCyPG6DUPfd6
 Cz6oC5fJnrlMrOyIQtzhr73mCANNaql46RcpnlY5McOYhOzaC8Vod6d5KN4Pj14KKlhj lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316skwj22f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 09:40:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 197BE10003B;
 Thu, 28 May 2020 09:40:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E551A2B1885;
 Thu, 28 May 2020 09:40:08 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 May 2020 09:40:08
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Thu, 28 May 2020 09:40:02 +0200
Message-ID: <20200528074003.24875-2-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528074003.24875-1-erwan.leray@st.com>
References: <20200528074003.24875-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_02:2020-05-28,
 2020-05-27 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: fix uart nodes ordering
	in stm32mp15-pinctrl
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

Fix usart and uart nodes ordering. Several usart nodes didn't respect
expecting ordering.

Fixes: 077e0638fc83 ("ARM: dts: stm32: Add alternate pinmux for USART2 pins on stm32mp15")

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 7cf535dc05f5..5ff1323236e1 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1574,67 +1574,6 @@
 		};
 	};
 
-	usart2_pins_a: usart2-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
-				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
-				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
-			bias-disable;
-		};
-	};
-
-	usart2_sleep_pins_a: usart2-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
-				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
-				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
-		};
-	};
-
-	usart2_pins_b: usart2-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
-				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('F', 4, AF7)>, /* USART2_RX */
-				 <STM32_PINMUX('E', 15, AF7)>; /* USART2_CTS_NSS */
-			bias-disable;
-		};
-	};
-
-	usart2_sleep_pins_b: usart2-sleep-1 {
-		pins {
-			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
-				 <STM32_PINMUX('F', 4, ANALOG)>, /* USART2_RX */
-				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
-		};
-	};
-
-	usart3_pins_a: usart3-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
-			bias-disable;
-		};
-	};
-
 	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
@@ -1732,6 +1671,67 @@
 		};
 	};
 
+	usart2_pins_a: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_a: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
+
+	usart2_pins_b: usart2-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF7)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, AF7)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_b: usart2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('F', 4, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
+
+	usart3_pins_a: usart3-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
+			bias-disable;
+		};
+	};
+
 	usbotg_hs_pins_a: usbotg-hs-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
