Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D28750AC5
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 16:25:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23CDBC6B44F;
	Wed, 12 Jul 2023 14:25:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF199C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 14:25:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CB1Lf3022857; Wed, 12 Jul 2023 16:24:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=iaIV6DISVk6XJocT5Ewl4nk8vCv15IAYv5z0b1bNF4o=;
 b=mbr1pzIkllDOkU9VcfuMXYCKai2Ql+cYkVyYp+G7Fe8n657E+hfAncHI9xPFVMOg9crx
 XgBsq3Ye1GKjuVccbkMGo/e7sp0KRVmeQIpKYaqoxTQD4UPYxXMd4vFRCyE0j04aUYPi
 V53nd3C9saGRGxpMLltkFAQyFjnWM6ugq1KBAnEOVFtYpUaO2ItLLeldiAzfZpF52h5P
 7fPYKBM+0RQLPsP+kJERjG6LLEKxfKWLuZ2gsBzd+Ihu2IeuRp4fCS8Pn7ADDXZXoDZv
 7+wJwCMTCIKBPR43RTwi2Y5/UQLkiuET6oJ1RIu3cx6VhCo6S1/Ph5cTpVk/2hRiuITm IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rsr19b146-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 16:24:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25F6510005E;
 Wed, 12 Jul 2023 16:24:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E73E21BF65;
 Wed, 12 Jul 2023 16:24:39 +0200 (CEST)
Received: from localhost (10.252.136.3) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 12 Jul
 2023 16:24:36 +0200
From: <p.paillet@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 12 Jul 2023 16:24:29 +0200
Message-ID: <20230712142432.1885162-2-p.paillet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712142432.1885162-1-p.paillet@foss.st.com>
References: <20230712142432.1885162-1-p.paillet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.136.3]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_09,2023-07-11_01,2023-05-22_02
Cc: p.paillet@foss.st.com
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: rcc: stm32: add STM32MP13
	SCMI regulators IDs
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

From: Etienne Carriere <etienne.carriere@foss.st.com>

Adds SCMI regulator identifiers for STM32MP13x family.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
---
 .../regulator/st,stm32mp13-regulator.h        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 include/dt-bindings/regulator/st,stm32mp13-regulator.h

diff --git a/include/dt-bindings/regulator/st,stm32mp13-regulator.h b/include/dt-bindings/regulator/st,stm32mp13-regulator.h
new file mode 100644
index 000000000000..b3a974dfc585
--- /dev/null
+++ b/include/dt-bindings/regulator/st,stm32mp13-regulator.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H
+#define __DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H
+
+/* SCMI voltage domains identifiers */
+
+/* SOC Internal regulators */
+#define VOLTD_SCMI_REG11		0
+#define VOLTD_SCMI_REG18		1
+#define VOLTD_SCMI_USB33		2
+#define VOLTD_SCMI_SDMMC1_IO		3
+#define VOLTD_SCMI_SDMMC2_IO		4
+#define VOLTD_SCMI_VREFBUF		5
+
+/* STPMIC1 regulators */
+#define VOLTD_SCMI_STPMIC1_BUCK1	6
+#define VOLTD_SCMI_STPMIC1_BUCK2	7
+#define VOLTD_SCMI_STPMIC1_BUCK3	8
+#define VOLTD_SCMI_STPMIC1_BUCK4	9
+#define VOLTD_SCMI_STPMIC1_LDO1	        10
+#define VOLTD_SCMI_STPMIC1_LDO2	        11
+#define VOLTD_SCMI_STPMIC1_LDO3	        12
+#define VOLTD_SCMI_STPMIC1_LDO4	        13
+#define VOLTD_SCMI_STPMIC1_LDO5	        14
+#define VOLTD_SCMI_STPMIC1_LDO6	        15
+#define VOLTD_SCMI_STPMIC1_VREFDDR	16
+#define VOLTD_SCMI_STPMIC1_BOOST	17
+#define VOLTD_SCMI_STPMIC1_PWR_SW1	18
+#define VOLTD_SCMI_STPMIC1_PWR_SW2	19
+
+/* External regulators */
+#define VOLTD_SCMI_REGU0		20
+#define VOLTD_SCMI_REGU1		21
+#define VOLTD_SCMI_REGU2		22
+#define VOLTD_SCMI_REGU3		23
+#define VOLTD_SCMI_REGU4		24
+
+#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
