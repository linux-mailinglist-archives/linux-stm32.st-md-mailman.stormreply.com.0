Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6AF7D697
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2019 09:47:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B86CC35E03;
	Thu,  1 Aug 2019 07:47:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1781C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2019 07:47:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x717kCJb019571; Thu, 1 Aug 2019 09:46:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=zzC3uAed5A7dYU4IrlXdMoYN39GbIOLsffQotC5fMd8=;
 b=M8BdWzYZnMQYkSfcoFZtJrebjGiRAYOh2MHKEsmXkyVFsjVuq9lBSG2yzBklvajlkV2a
 ZFLLZqIHDVjrXApEi2gMZMWtB9/zBV7qjghyg+hvp38JGV++V62oy2pDUEmduJY+Uqo0
 4bkxk/JofI2kv2tnnvdHF2QCEZSADSuJuQlIkkldN4YzhY5rrh1Uctkek3gxVNOn4xko
 BHTMEdIwXU7fGJ0i64ogZEc4eogpmFqF3530IyGYbEVIdXKgIrZdRpLeqa4Isx3NjF9P
 iR0pClbF0o6DcZLtg0w8qK5yzcIsvNYN7J1RMKDjlT+fcbu4tmi30D2QE1FWPgLE7ArT Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2yn1m2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 01 Aug 2019 09:46:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCE1238;
 Thu,  1 Aug 2019 07:46:38 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 939C5CEA35;
 Thu,  1 Aug 2019 09:46:38 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019
 09:46:38 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019 09:46:38
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <linux-stm32@st-md-mailman.stormreply.com>, <alexandre.torgue@st.com>,
 <robh@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Thu, 1 Aug 2019 09:46:07 +0200
Message-ID: <1564645567-13156-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_04:, , signatures=0
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add DFSDM pins to stm32mp157c
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

Add DFSDM pins to stm32mp157c.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 9eaec9bf8cb8..f96a928cbc49 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -230,6 +230,45 @@
 				};
 			};
 
+			dfsdm_clkout_pins_a: dfsdm-clkout-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 13, AF3)>; /* DFSDM_CKOUT */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+			};
+
+			dfsdm_clkout_sleep_pins_a: dfsdm-clkout-sleep-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* DFSDM_CKOUT */
+				};
+			};
+
+			dfsdm_data1_pins_a: dfsdm-data1-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 3, AF3)>; /* DFSDM_DATA1 */
+				};
+			};
+
+			dfsdm_data1_sleep_pins_a: dfsdm-data1-sleep-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 3, ANALOG)>; /* DFSDM_DATA1 */
+				};
+			};
+
+			dfsdm_data3_pins_a: dfsdm-data3-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 13, AF6)>; /* DFSDM_DATA3 */
+				};
+			};
+
+			dfsdm_data3_sleep_pins_a: dfsdm-data3-sleep-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 13, ANALOG)>; /* DFSDM_DATA3 */
+				};
+			};
+
 			ethernet0_rgmii_pins_a: rgmii-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
