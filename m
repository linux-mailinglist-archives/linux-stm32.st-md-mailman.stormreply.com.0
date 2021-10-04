Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD54207C7
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Oct 2021 11:03:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91260C5AB65;
	Mon,  4 Oct 2021 09:03:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02C0CC5AB62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 09:03:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19493Sph008959; 
 Mon, 4 Oct 2021 11:03:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=nJpxX9PGQq7OHBwCh6Km3sL4rv9XksaSXEVrd4QAuFc=;
 b=tbkpxkKvj+VO404KHISL2TMnk3AZxb9hxVqanjJmg9RYtbQtdg8f+mxmouc34wx3Yet7
 rr8Xj2xjL9LzMVWJl4Ule6Ha7TLsGnSjOABmrwdurCjSu9ZMUX9CkO3X9dpoWYHGwtvz
 QOWqnpWik14IEOPXpGI+nZtomNTk9vf4CVGTNJwEA5klfEc08erfdGWnCrChGNFil4lv
 0Cv7dse3+QDbu97rlKPdrU2UVssG72jgPXQsp/8ujvpoXyhZK8v5uerAPPORFm6fyAHW
 FVQn1xS6gLW9xEwj20ceAbMn87q7ZO3rnjLOnpLaO6BPn49frOqMpyOPNAxo398SRDRD 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bfxn7800u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 11:03:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3592100040;
 Mon,  4 Oct 2021 11:03:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D09B822FA2E;
 Mon,  4 Oct 2021 11:03:32 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 11:03:32
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@denx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Date: Mon, 4 Oct 2021 11:03:04 +0200
Message-ID: <20211004090304.8984-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: fix AV96 board SAI2 pin
	muxing on stm32mp15
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

Fix SAI2A and SAI2B pin muxings for AV96 board on STM32MP15.
Change sai2a-4 & sai2a-5 to sai2a-2 & sai2a-2.
Change sai2a-4 & sai2a-sleep-5 to sai2b-2 & sai2b-sleep-2

Fixes: dcf185ca8175 ("ARM: dts: stm32: Add alternate pinmux for SAI2 pins on stm32mp15")

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 5b60ecbd718f..2ebafe27a865 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1179,7 +1179,7 @@
 		};
 	};
 
-	sai2a_pins_c: sai2a-4 {
+	sai2a_pins_c: sai2a-2 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 13, AF10)>, /* SAI2_SCK_A */
 				 <STM32_PINMUX('D', 11, AF10)>, /* SAI2_SD_A */
@@ -1190,7 +1190,7 @@
 		};
 	};
 
-	sai2a_sleep_pins_c: sai2a-5 {
+	sai2a_sleep_pins_c: sai2a-2 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 13, ANALOG)>, /* SAI2_SCK_A */
 				 <STM32_PINMUX('D', 11, ANALOG)>, /* SAI2_SD_A */
@@ -1235,14 +1235,14 @@
 		};
 	};
 
-	sai2b_pins_c: sai2a-4 {
+	sai2b_pins_c: sai2b-2 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
 			bias-disable;
 		};
 	};
 
-	sai2b_sleep_pins_c: sai2a-sleep-5 {
+	sai2b_sleep_pins_c: sai2b-sleep-2 {
 		pins {
 			pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
 		};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
