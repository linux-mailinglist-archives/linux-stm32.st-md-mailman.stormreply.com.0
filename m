Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578A1FF2A1
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2020 15:07:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA2A2C36B26;
	Thu, 18 Jun 2020 13:07:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E338C36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 13:07:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05ID4TDA002369; Thu, 18 Jun 2020 15:07:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5XU/0J3RAI8AZsj9EUAZG/2xnH7KRcguIz1gSCUQgL8=;
 b=Qk4+YYl8GlgAHbuzKtdbXHneDZTRQFNa5antsevYD8QYI4GF/oo1BuJkuqvm/AmvpFS4
 QoT9nIXQaIAK3iw1sw/PAqfaF4o440QgpTwIQzoUees9zH38ExEWZ6LOnHN6liQJFDMH
 X3QviWkhD77oYqlQaT0CRpHaNWx+yG5V+gxtHQy0RHfPS93jro+8LQ3xyHT/jAkMIFuM
 aEbkYfQYoQDNiA2T9ZDS5+LMBhIpFI5LvnPOVghRWSg2cZ/iSATzJcAxf0rZmDvlo6nF
 MuHhtoWJ0+Q+f7RU+z9O2r4x9e1c3vpp4GnWQHdc4lX7ZDfFyFcMkctnw63yT/2VdEhc pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q649k3gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 15:07:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF2EC100034;
 Thu, 18 Jun 2020 15:06:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9382AAA9A;
 Thu, 18 Jun 2020 15:06:59 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jun 2020 15:06:59
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Thu, 18 Jun 2020 15:06:47 +0200
Message-ID: <20200618130651.29836-2-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618130651.29836-1-erwan.leray@st.com>
References: <20200618130651.29836-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_12:2020-06-18,
 2020-06-18 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/5] ARM: dts: stm32: add usart2,
	usart3 and uart7 pins in stm32mp15-pinctrl
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

Adds usart2_pins_c, usart3_pins_b, usart3_pins_c and uart7_pins_c pins
configurations in stm32mp15-pinctrl.
- usart2_pins_c pins are connected to Bluetooth chip on dk2 board.
- usart3_pins_b pins are connected to GPIO expansion connector on evx board.
- usart3_pins_c pins are connected to GPIO expansion connector on dkx board.
- uart7_pins_c pins are connected to Arduino Uno connector on dkx board.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

Changes in v2:
 - Update UART7 pins comments. Comments indicated "USART" instead of "UART".

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index fb98a66977fe..21b0906accf3 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1658,6 +1658,36 @@
 		};
 	};
 
+	uart7_pins_c: uart7-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART7_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_idle_pins_c: uart7-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 8, ANALOG)>; /* UART7_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_sleep_pins_c: uart7-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 8, ANALOG)>, /* UART7_TX */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* UART7_RX */
+		};
+	};
+
 	uart8_pins_a: uart8-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
@@ -1719,6 +1749,42 @@
 		};
 	};
 
+	usart2_pins_c: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 5, AF7)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_c: usart2-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_c: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
+
 	usart3_pins_a: usart3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
@@ -1732,6 +1798,78 @@
 		};
 	};
 
+	usart3_pins_b: usart3-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
+				 <STM32_PINMUX('I', 10, AF8)>; /* USART3_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart3_idle_pins_b: usart3-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('I', 10, ANALOG)>; /* USART3_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
+			bias-disable;
+		};
+	};
+
+	usart3_sleep_pins_b: usart3-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('I', 10, ANALOG)>, /* USART3_CTS_NSS */
+				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
+		};
+	};
+
+	usart3_pins_c: usart3-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
+				 <STM32_PINMUX('B', 13, AF7)>; /* USART3_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart3_idle_pins_c: usart3-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('B', 13, ANALOG)>; /* USART3_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
+			bias-disable;
+		};
+	};
+
+	usart3_sleep_pins_c: usart3-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('B', 13, ANALOG)>, /* USART3_CTS_NSS */
+				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
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
