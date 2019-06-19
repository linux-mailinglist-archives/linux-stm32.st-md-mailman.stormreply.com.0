Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E58634B584
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 11:52:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1410C593DD
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 09:52:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8A2BC593DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 09:52:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J9kvaK028234; Wed, 19 Jun 2019 11:52:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SBX7EOZHARQMA91Mwbur4GCYmgaMpoB1r9LkOKLXh7o=;
 b=ePl719ZzfKGleqkiaYn1UjT32ftLeO5K+7Q6URnBnCxB+sc1fQ6mA9/Zmpfc+QtgwBRu
 A8f2S5acC1cCPvYO3sHBCvRpSXHPY4tBIwH64cBWlPIYz7lHdmP5J0B4m+om35kiTL+4
 rgaB6LKwK35AzUqenyPbMo2j+033eE4uCtBlpKJ+lncE5c1AK2FmElymNgyP1ZLsdX2z
 fr4eXWz27HUoh1ReW0xIbLqNnuBAI6thE3yjgiaRZrOSNYx5ldEyZ2krf6TtQggVa50f
 u4+r/JUbTDdgnkDghvhTd4f3ZJNqIz04zWGDtEz4sfWSRRAnoAepWQytuXwUSh5UM3i4 ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781uu6dj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 11:52:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A087331;
 Wed, 19 Jun 2019 09:52:16 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7019124CD;
 Wed, 19 Jun 2019 09:52:16 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 19 Jun 2019 11:52:15 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <thierry.reding@gmail.com>, <robh+dt@kernel.org>, <alexandre.torgue@st.com>
Date: Wed, 19 Jun 2019 11:52:04 +0200
Message-ID: <1560937925-8990-5-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
References: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_05:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@st.com,
 linux-pwm@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: add pwm cells to
	stm32f429
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

STM32 Timers support generic 3 cells PWM to encode PWM number, period and
polarity.

Fixes: c0e14fc712d9 ("ARM: dts: stm32: add Timers driver for stm32f429
MCU")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 4a49544..5c8a826 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -112,6 +112,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -141,6 +142,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -170,6 +172,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -198,6 +201,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -267,6 +271,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -288,6 +293,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 		};
@@ -303,6 +309,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 		};
@@ -448,6 +455,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -469,6 +477,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -602,6 +611,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
@@ -623,6 +633,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 		};
@@ -638,6 +649,7 @@
 
 			pwm {
 				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
 				status = "disabled";
 			};
 		};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
