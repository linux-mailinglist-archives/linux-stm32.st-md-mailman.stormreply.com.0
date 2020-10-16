Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A851A290754
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Oct 2020 16:41:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 689E3C424BD;
	Fri, 16 Oct 2020 14:41:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71C89C3FADE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 14:41:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GEaXdi005795; Fri, 16 Oct 2020 16:40:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uWA1bx9jQvPuk7yy9+gJUevbMdehUxJMVfuVa4kreuk=;
 b=UYFokRQWIGyuNmK0Cb30A2WeeWENUjbFi5cuNymnZHFBVcZLSkU2JR1leQWqyTyf+QqY
 j5qUGIw+GzOxlN/ZNMCAum7vCRxAhBhM6OHJ7HMXqLJKWBUv3ImGIUstJ1Sbqsj1gLec
 JuNSLbHE7z9ppDuzqPResJ6gbTubFTZfvKVZz6P+4mNIlkhOcVn39Tbnq3f1bEkv3MO7
 2s+4CTA5dnW5l4eZfKgCH6wPkVYXHiePbJr4/gq2HQz3yuyBwEB4IQjQp17m78GCZmqB
 LfdKpqThGtzQ3RqUlkXRN0ah2wiZxyIvY8XQABzjjU31EQWKeT8p39WBhBF5cAPT2hkg tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wx43u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 16:40:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1A1F10002A;
 Fri, 16 Oct 2020 16:40:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E45652AF739;
 Fri, 16 Oct 2020 16:40:48 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct 2020 16:40:48
 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>,
 <alexandre.torgue@st.com>
Date: Fri, 16 Oct 2020 16:40:19 +0200
Message-ID: <1602859219-15684-4-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859219-15684-1-git-send-email-fabrice.gasnier@st.com>
References: <1602859219-15684-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_07:2020-10-16,
 2020-10-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Add LP timer
	wakeup-source on stm32mp151
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

LP timer can be used to wakeup from stop mode on stm32mp151.
Add wakeup-source properties to all LP timer instances.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 10d5e2b..0bf5fc2 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -358,6 +358,7 @@
 			interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM1_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1153,6 +1154,7 @@
 			interrupts-extended = <&exti 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM2_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1181,6 +1183,7 @@
 			interrupts-extended = <&exti 50 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM3_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1202,6 +1205,7 @@
 			interrupts-extended = <&exti 52 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM4_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1217,6 +1221,7 @@
 			interrupts-extended = <&exti 53 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM5_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
