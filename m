Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCF10D950
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Nov 2019 19:06:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 094C0C36B11;
	Fri, 29 Nov 2019 18:06:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 093D5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2019 18:06:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xATI273l023387; Fri, 29 Nov 2019 19:06:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CqTqqQisL0mVfRLeJ/Q6yUnUr6jBevycXIRNZu4CnYo=;
 b=Ku0Tjv6NuowssSIMuEa0R+OxoNmOPdAKQ/DAD0cEWcja4ORZ6myw+tFS1n0oPtVZhCZx
 Sda+Pfx6FcxYPWVQOKhshJlu9dhPG6u097Bm7B5GKMmc7+AuOcSCddB3N7t6JTj8mgpt
 jEmgiFTTqQfb1PKAYNbtaPIkodzVmMcr60qwbg2Dg7CxLZsCfI0qNaLZc18q0V5pUDYB
 q/cFqtGHRPntGyNh2NWLvtG2tAAWFTi78QswRhNUsgrkR6dikwqI8xe6/py2KYGpNT21
 nV7bq4SkqynTQ0Y31nZzzgCtzXtHuO5Z4H7L5Os7SUTEbnfGbGOkzpcn4sw7xVTY6EJ3 mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxjgr6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2019 19:06:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AFD910002A;
 Fri, 29 Nov 2019 19:06:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F5EE222D1F;
 Fri, 29 Nov 2019 19:06:07 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 29 Nov 2019 19:06:06
 +0100
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Fri, 29 Nov 2019 19:06:00 +0100
Message-ID: <20191129180602.28470-5-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129180602.28470-1-alexandre.torgue@st.com>
References: <20191129180602.28470-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-29_06:2019-11-29,2019-11-29 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/6] ARM: dts: stm32: Manage security
	diversity for STM32M15x SOCs
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

This commit creates a new file to manage security diversity on STM32MP15x
SOCs. On STM32MP15xY, "Y" gives information:
 -Y = A means no cryp IP and no secure boot.
 -Y = C means cryp IP + secure boot.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 9a0b55be134d..072fc7025987 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1255,15 +1255,6 @@
 			status = "disabled";
 		};
 
-		cryp1: cryp@54001000 {
-			compatible = "st,stm32mp1-cryp";
-			reg = <0x54001000 0x400>;
-			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc CRYP1>;
-			resets = <&rcc CRYP1_R>;
-			status = "disabled";
-		};
-
 		hash1: hash@54002000 {
 			compatible = "st,stm32f756-hash";
 			reg = <0x54002000 0x400>;
diff --git a/arch/arm/boot/dts/stm32mp15xc.dtsi b/arch/arm/boot/dts/stm32mp15xc.dtsi
new file mode 100644
index 000000000000..b06a55a2fa18
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15xc.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+/ {
+	soc {
+		cryp1: cryp@54001000 {
+			compatible = "st,stm32mp1-cryp";
+			reg = <0x54001000 0x400>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc CRYP1>;
+			resets = <&rcc CRYP1_R>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
