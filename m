Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 579DB51817C
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 11:42:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0221C60462;
	Tue,  3 May 2022 09:42:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 297A4C5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 09:42:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2439Y1Ei023012;
 Tue, 3 May 2022 11:42:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=7Nkxzy9ejVE88iqdIEQy4ubNXjRNBVGQlHfPM8YGZwM=;
 b=p+rFu3bN9opwlMHzQ0C8eiqY7+BYdN17BkLJKDjUcnwZj1/xS7J8mW74oWZRKoyrKCqn
 nsqbNNlpUV68sjicyUOUPrzVMR4jJOT2n/SeL0vjIkea8IW0JQ22OH9t5q5QQYhgvfKs
 x9g546oDJt9rVUSEBnBFN1TKmgtjrJ7plKDBPPzU/XAaMmBJiYm1xa8jgHFUaicgL5dP
 CMQmCJ1s6B89M/UGMSrCpR5BFBQWUlM1QDn4sQHtwjO9sHC1O5i0tw8w+GTrVWNEdRd+
 4yal0s4tLpxfnyzxoyqhiQdfB/+VR1fgmSRjcNJZfDNa0c+5Frvjz91dFzVQiDPFxy4U BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthjnfhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 11:42:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C45110002A;
 Tue,  3 May 2022 11:42:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45AEA215153;
 Tue,  3 May 2022 11:42:38 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 3 May 2022 11:41:35
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 3 May 2022 11:41:33 +0200
Message-ID: <20220503094133.502487-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_03,2022-05-02_03,2022-02-23_01
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add UserPA13 button on
	stm32mp135f-dk
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

The PA13 user button is connected to the PA13 pin of the stm32mp135f-dk
board. It requires an internal pull-up configuration.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 arch/arm/boot/dts/stm32mp135f-dk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index 65acee0f68b7..09d6226d598f 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include "stm32mp135.dtsi"
 #include "stm32mp13xf.dtsi"
@@ -25,6 +26,16 @@ memory@c0000000 {
 		reg = <0xc0000000 0x20000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		user-pa13 {
+			label = "User-PA13";
+			linux,code = <BTN_1>;
+			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
