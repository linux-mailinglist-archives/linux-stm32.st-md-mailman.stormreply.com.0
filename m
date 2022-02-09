Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3D4AEF83
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Feb 2022 11:49:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D456DC6046C;
	Wed,  9 Feb 2022 10:49:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CA02C5E2C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Feb 2022 10:49:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2199Dkbu017886;
 Wed, 9 Feb 2022 11:49:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=UGC+VEwgikjaZ7ZKIhZPlx6lbEE0SrNgxVh2SUobLaA=;
 b=YSBxDmNYSw4iT83zEgAaNdLqYIDc0xre2EtHPQBlFUplhescIYo4VdJfIL3gQjNrQ3Dq
 2DQmXu79s6U8UOKX/zH6hO4ruYRUMO3rjy6XUPKBGR1accYh75GsyT9HL3+JxPEvn5n3
 PJHmq9ZnOGiV/nAOmIwPoihgBuJwh2wNwS5irt5NBKCCEtgOpwLl2MQb5MOcHBXeUK7z
 xxVS33PRzQrGvKmI9mkv+B0ZL/I0dMCf1qs7yIpQAKGeg85QksywFdCQqaBsR3KFIghs
 mXaV6KeULmnSTyv3BVbTTcgaYvUyMhv39GXU+dfbRX3Sie2cE4PmKJISiGOOLR7f/5BB sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e4asygkyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 11:49:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 438AD10002A;
 Wed,  9 Feb 2022 11:49:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B4F2215126;
 Wed,  9 Feb 2022 11:49:01 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 9 Feb 2022 11:49:00
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>
Date: Wed, 9 Feb 2022 11:48:48 +0100
Message-ID: <1644403729-22665-2-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644403729-22665-1-git-send-email-fabrice.gasnier@foss.st.com>
References: <1644403729-22665-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_05,2022-02-09_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: remove some timer
	duplicate unit-address on stm32f7 series
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

Several unused "timer" are duplicate nodes of "timers" nodes.
There are two dt-schemas:
- timer/st,stm32-timer.yaml: A timer is needed on STM32F7 series, on all
  boards, to act as clockevent.
- mfd/st,stm32-timers.yaml: Timers can be used for other purpose.

By default, timer5 is left enabled to be used as clockevent. Remove all
other timer clockevent nodes that are currently unused and duplicated.

This removes several messages: Warning (unique_unit_address): /soc/timer@..
duplicate unit-address (also used in node /soc/timers@...)

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 014b416..a4f5c6a 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -75,14 +75,6 @@
 	};
 
 	soc {
-		timer2: timer@40000000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000000 0x400>;
-			interrupts = <28>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM2)>;
-			status = "disabled";
-		};
-
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -105,14 +97,6 @@
 			};
 		};
 
-		timer3: timer@40000400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000400 0x400>;
-			interrupts = <29>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM3)>;
-			status = "disabled";
-		};
-
 		timers3: timers@40000400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -135,14 +119,6 @@
 			};
 		};
 
-		timer4: timer@40000800 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000800 0x400>;
-			interrupts = <30>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM4)>;
-			status = "disabled";
-		};
-
 		timers4: timers@40000800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -194,14 +170,6 @@
 			};
 		};
 
-		timer6: timer@40001000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001000 0x400>;
-			interrupts = <54>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM6)>;
-			status = "disabled";
-		};
-
 		timers6: timers@40001000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -218,14 +186,6 @@
 			};
 		};
 
-		timer7: timer@40001400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001400 0x400>;
-			interrupts = <55>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM7)>;
-			status = "disabled";
-		};
-
 		timers7: timers@40001400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
