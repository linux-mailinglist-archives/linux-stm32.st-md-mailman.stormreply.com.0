Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3346D118
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 11:33:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D15CC5F1F5;
	Wed,  8 Dec 2021 10:33:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEEB3C5F1EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 10:33:42 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B89pLPd009148;
 Wed, 8 Dec 2021 11:33:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=GYxfSXf9w2NFMXCcNiHGT9pdbGEG14Y73aVi9O0OxeE=;
 b=hY8fbsDBOl4Iw05EG5pauOT8JyP923N05oSoyYtjPo4/IFQsYh9i4QfchGwRdkReP2wb
 eI55cXor4qc+hUVraf98ieLpok0jXcOvuVxYQnTI1WR68l95m6XQcIKGQs09GWqrX/Se
 JGCBYx+C3DvLjUESL6HEqTle5LrgUXteFdNBcBxnzI61q6wBpGa2XOsaH8W6VPPz1aD7
 dzb157XIqJgPzue8D2vR2SxtZRbum0iHFS7bnae1L68n2KfxXETzfSErusZzVoNd1YLr
 YvfbTkZokTP7Wa6P/PBFfWJGTT1s0qsj+cAzq79WU6epetXeprgkmSTwNQd8VcHl1Vjm cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ct9xm4emc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 11:33:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B64D510002A;
 Wed,  8 Dec 2021 11:33:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADAFA23153B;
 Wed,  8 Dec 2021 11:33:25 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec 2021 11:33:25
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>
Date: Wed, 8 Dec 2021 11:33:16 +0100
Message-ID: <1638959596-6656-3-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638959596-6656-1-git-send-email-fabrice.gasnier@foss.st.com>
References: <1638959596-6656-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_03,2021-12-08_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: remove timer5 duplicate
	unit-address on stm32f4 series
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

Remove the following warnings seen when building with W=1.
Warning (unique_unit_address): /soc/timer@40000c00: duplicate unit-address
(also used in node /soc/timers@40000c00)
This approach is based on some discussions[1], to restructure the dtsi
and dts files.

Timer5 is enabled by default on stm32f4 series, to act as clockevent. In
order to get rid of the W=1 warning, and be compliant with dt-schemas
(e.g. dtbs_check):
- In stm32f429.dtsi:
  . Keep the more complete timers5 description
  . Remove the most simple timer5 node that is duplicate
- In each board:
  . adopt "st,stm32-timer" compatible for timers5, also add the interrupt
  . use /delete-property/ and /delete-node/ so the it matches the
    clockevent bindings

Note: all this is done in one shot (e.g. not split) to keep clockevent
functionality.

[1] https://lore.kernel.org/linux-arm-kernel/Yaf4jiZIp8+ndaXs@robh.at.kernel.org/

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts  | 12 ++++++++++++
 arch/arm/boot/dts/stm32f429-disco.dts | 12 ++++++++++++
 arch/arm/boot/dts/stm32f429.dtsi      |  7 -------
 arch/arm/boot/dts/stm32f469-disco.dts | 12 ++++++++++++
 4 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index cb46326..0d98aca 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -308,6 +308,18 @@
 	};
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 075ac57..06a7091 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -205,6 +205,18 @@
 	};
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index f21b322..1723346 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -159,13 +159,6 @@
 			};
 		};
 
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM5)>;
-		};
-
 		timers5: timers@40000c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce6..cac3a67 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -224,6 +224,18 @@
 	bus-width = <4>;
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart3 {
 	pinctrl-0 = <&usart3_pins_a>;
 	pinctrl-names = "default";
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
