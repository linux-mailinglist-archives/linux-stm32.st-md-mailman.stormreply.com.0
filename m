Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB7EFDB2
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 13:52:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30F06C36B17;
	Tue,  5 Nov 2019 12:52:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7C96C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 12:52:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA5Cq28r024530; Tue, 5 Nov 2019 13:52:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jJI/DkkYdOFDwfHxMZJXjpmLkJFu22QOe9fKOFedHns=;
 b=x+V94dO16nBLaZVKESj9twoAzIqkX2dmbi0tkxahtdqGDOAsdgW8/fD7TVzDuINq7WwO
 kFC1IWJ5IjwXjx9BIlXxRLn8TpEo9TDJsi5nWc2YndNZ5QPYjUrOktRP/SEiCCEVzOl3
 VYiu5L7B9iw98OxmsMxXEIUnkE5X0AL4MrLDqIXBAbIyRHQbicEi415GmoMZIiBLq2wP
 pHgjGcCrAMihURKUeUsVAISGD6XcQY1tPesd1C4Cle9xujkJpSD39KT0juQJjpFRu1vh
 35028gplQEUuIjm0O4g+w65gK47GGf8lOjMQ49Cp7LajTArwQIoi5Kz0y88KhJATcSXU WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w0ytcr0bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 13:52:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0AF30100034;
 Tue,  5 Nov 2019 13:52:37 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F38932BC5E5;
 Tue,  5 Nov 2019 13:52:36 +0100 (CET)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 13:52:36 +0100
Received: from localhost (10.48.0.192) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 5 Nov 2019 13:52:36 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <alexandre.torgue@st.com>
Date: Tue, 5 Nov 2019 13:52:20 +0100
Message-ID: <1572958341-12404-4-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572958341-12404-1-git-send-email-fabrice.gasnier@st.com>
References: <1572958341-12404-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_04:2019-11-05,2019-11-05 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: add pwm sleep pins to
	stm32mp157c-ev1
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

Add pinctrl sleep state for PWM on stm32mp157c-ev1 board.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 2baae5f..7ab5dbd 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -305,7 +305,8 @@
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm2_pins_a>;
-		pinctrl-names = "default";
+		pinctrl-1 = <&pwm2_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
 	timer@1 {
@@ -319,7 +320,8 @@
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm8_pins_a>;
-		pinctrl-names = "default";
+		pinctrl-1 = <&pwm8_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
 	timer@7 {
@@ -333,7 +335,8 @@
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm12_pins_a>;
-		pinctrl-names = "default";
+		pinctrl-1 = <&pwm12_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
 	timer@11 {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
