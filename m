Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6217D290751
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Oct 2020 16:41:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0DE0C424B7;
	Fri, 16 Oct 2020 14:41:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AA32C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 14:41:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GEbWbQ012050; Fri, 16 Oct 2020 16:40:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ImP7+UTYy6pZjGxT5bCNRaWix0o5BndEM2c1JDT+HnQ=;
 b=u+gtdombMHq2pYnICKL1cW1Fb3ZZv1CFyJmxqcALVzgiI5S0kHhjAtvtpxzceJjYgICx
 HwNfEaQAHkuOIK9nBaQbgICV26SKu5pOMDx+RDUU1wl8cpTLdiFH0HCJxWQFYvgbTSdE
 gcHOazIIXiSK25rVypOJIKW5Pqrgbih8LULVLwDtFTiGgrYoj1nZsGNy/rF8XbTBBFue
 tSm80bOOoZcK6CoMKGrX4xpMXwq3MgMN9yhPRrxTSykMRuXjNm8aT9MQ2rjFMfbOOQrI
 Js/MfXhxEc/T95bCnvTh4/GL+B43OPVsV2T+umd9xExNBOGMcQP+c4YbvUIVCPJiIsVb Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356eut23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 16:40:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C90B910002A;
 Fri, 16 Oct 2020 16:40:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB7362AF739;
 Fri, 16 Oct 2020 16:40:46 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct 2020 16:40:45
 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>,
 <alexandre.torgue@st.com>
Date: Fri, 16 Oct 2020 16:40:18 +0200
Message-ID: <1602859219-15684-3-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859219-15684-1-git-send-email-fabrice.gasnier@st.com>
References: <1602859219-15684-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_07:2020-10-16,
 2020-10-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: Add LP timer irqs on
	stm32mp151
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

Add all LP timer irqs on stm32mp151.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bfe2902..10d5e2b 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -355,6 +355,7 @@
 			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x40009000 0x400>;
+			interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM1_K>;
 			clock-names = "mux";
 			status = "disabled";
@@ -1149,6 +1150,7 @@
 			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x50021000 0x400>;
+			interrupts-extended = <&exti 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM2_K>;
 			clock-names = "mux";
 			status = "disabled";
@@ -1176,6 +1178,7 @@
 			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x50022000 0x400>;
+			interrupts-extended = <&exti 50 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM3_K>;
 			clock-names = "mux";
 			status = "disabled";
@@ -1196,6 +1199,7 @@
 		lptimer4: timer@50023000 {
 			compatible = "st,stm32-lptimer";
 			reg = <0x50023000 0x400>;
+			interrupts-extended = <&exti 52 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM4_K>;
 			clock-names = "mux";
 			status = "disabled";
@@ -1210,6 +1214,7 @@
 		lptimer5: timer@50024000 {
 			compatible = "st,stm32-lptimer";
 			reg = <0x50024000 0x400>;
+			interrupts-extended = <&exti 53 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM5_K>;
 			clock-names = "mux";
 			status = "disabled";
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
