Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368D1737A4
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2020 13:52:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCA7BC36B09;
	Fri, 28 Feb 2020 12:52:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC992C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 12:52:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SChAOm021775; Fri, 28 Feb 2020 13:52:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yrQgPlGNcsd3SNy+rWiVt1Cll54CgcO3EV2Kn8KU8q0=;
 b=JWlbeBkvOvlSWTdVqbrG+BguMFrQ8qPYDcbU0P4dRMxrE6PjBTOK2eAv2+qZv1fQvlBC
 akmq8WkiOAVHzmoOnwe3Gbz9DmDCaCVPiXho1SrbTGSeV6KpVZqgcWwVISPEqr27zDtc
 dKMSDvKUNiOFeguSgFwD9qQkfLi1U/c2L7PShRwVVNH8D7KO69PXbhi2ZNROQO+KPByd
 xtvmf5XHD8PIoZZU5BYt6Y0DkAwwXD5xOukX4eGClDAL83qBLBU18KR1vjhoWHv6rYp5
 aveyWH0Z7tVKHGFZTAzIMHVr0EiLJe66nyTcCpNOjMY65rqZLQa617hB0Mv/XnaKv9Yg JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvtbyg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 13:52:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB88C10003A;
 Fri, 28 Feb 2020 13:52:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDDD72BAEDD;
 Fri, 28 Feb 2020 13:52:10 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 28 Feb 2020 13:52:10
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <robh+dt@kernel.org>
Date: Fri, 28 Feb 2020 13:52:05 +0100
Message-ID: <20200228125205.8126-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200228125205.8126-1-benjamin.gaignard@st.com>
References: <20200228125205.8126-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-26,
 2020-02-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Rename stmfx node names
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

Rename stmfx node names according to yaml description.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32746g-eval.dts  | 2 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index fcc804e3c158..4ea3f98dd275 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -165,7 +165,7 @@
 		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
 		interrupt-parent = <&gpioi>;
 
-		stmfx_pinctrl: stmfx-pin-controller {
+		stmfx_pinctrl: pinctrl {
 			compatible = "st,stmfx-0300-pinctrl";
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 228e35e16884..3f4668a43afe 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -210,7 +210,7 @@
 		interrupt-parent = <&gpioi>;
 		vdd-supply = <&v3v3>;
 
-		stmfx_pinctrl: stmfx-pin-controller {
+		stmfx_pinctrl: pinctrl {
 			compatible = "st,stmfx-0300-pinctrl";
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -218,7 +218,7 @@
 			#interrupt-cells = <2>;
 			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
 
-			joystick_pins: joystick {
+			joystick_pins: joystick-pins {
 				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
 				bias-pull-down;
 			};
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
