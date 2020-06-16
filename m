Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FED1FB636
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 17:33:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC7DDC36B11;
	Tue, 16 Jun 2020 15:33:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 963EDC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 15:33:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GFD1Et005397; Tue, 16 Jun 2020 17:33:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ywECLfS8RJnUvCXHRDqenH4W2P5mGI7YRrQh1zdXSqs=;
 b=SKbzkvZ8Sh8AH5bW88BqONOypCrZFZCdlCxIv5kAzNuKFlU+HOUcNMI/OqCgpZraSC6Y
 6/jibWFEnMfpx+LCOJD2IEtbKiNRFSDWq13MmFX0TdF1aPS/lPX2/gAzvc6JXjTXkYjF
 cLbYGA/zbJI7uw3SrKaYGTMycWh9OObAYos44B+jqFs1RZW9pJJoqRPyrfV+M+5jGujZ
 sxeKePJ8Mi/VK5O2MY+oHQ//6Ey9NhhBC2sKNYUQhQjJ0GdrAe78wvcYNUbVkIZyXbjm
 Vg8fQbwcA/ypu5Hl9oW+qtwrMlOHRpcZZ+EyuA2kkFQJdJZwxXbH5sZBZTeG+RrryVo2 pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjw05cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 17:33:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 075B010002A;
 Tue, 16 Jun 2020 17:33:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E90032C890A;
 Tue, 16 Jun 2020 17:33:40 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 17:33:40 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <linux-kernel@vger.kernel.org>
Date: Tue, 16 Jun 2020 17:33:29 +0200
Message-ID: <20200616153329.15148-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-16,
 2020-06-16 signatures=0
Cc: devicetree@vger.kernel.org, Patrick Delaunay <patrick.delaunay@st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: cosmetic update in
	stm32mp15-pinctrl.dtsi
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

Use tabs where possible and remove multiple blanks lines.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 7eb858732d6d..7d351757f2f8 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -210,8 +210,8 @@
 				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
 				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
 				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
-			         <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
-			         <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
 				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
 				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
 				 <STM32_PINMUX('H', 7, ANALOG)>, /* ETH_RGMII_RXD3 */
@@ -453,7 +453,7 @@
 	i2c5_pins_b: i2c5-1 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, AF4)>, /* I2C5_SCL */
-			         <STM32_PINMUX('D', 1, AF4)>; /* I2C5_SDA */
+				 <STM32_PINMUX('D', 1, AF4)>; /* I2C5_SDA */
 			bias-disable;
 			drive-open-drain;
 			slew-rate = <0>;
@@ -463,7 +463,7 @@
 	i2c5_sleep_pins_b: i2c5-sleep-1 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, ANALOG)>, /* I2C5_SCL */
-			         <STM32_PINMUX('D', 1, ANALOG)>; /* I2C5_SDA */
+				 <STM32_PINMUX('D', 1, ANALOG)>; /* I2C5_SDA */
 		};
 	};
 
@@ -1072,7 +1072,6 @@
 		};
 	};
 
-
 	sai2a_pins_b: sai2a-1 {
 		pins1 {
 			pinmux = <STM32_PINMUX('I', 6, AF10)>,	/* SAI2_SD_A */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
