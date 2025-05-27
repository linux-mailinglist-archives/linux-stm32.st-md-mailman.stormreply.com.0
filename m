Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E12AC4F37
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 15:05:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E9DFC36B20;
	Tue, 27 May 2025 13:05:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C90F2C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:05:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCo3uR032150;
 Tue, 27 May 2025 15:05:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wV2IEr+c53RnMrpo1GAvLc81fVn3PrTQJK90uNKUmdI=; b=c7GHV5VH6BJ6MACX
 V3euZ3NP4ngKFr0+a7GB1BrVk5GVHwx3fwrSVa7I17uy8nSfWieYne7SWfjMHSuo
 a2c9MZ0iB6bLjLI+TqxAYPttOg2TNKEJksTVJc0ua/dDCmey7M5oQzrChVFYLJ44
 dbwVwCo0kcQDS77rnJTJQKzg5GRLQ8PrU/ooancQH/HbEr8mBARcgKt+jvWi4BMc
 I/eq9m4BVwwmNbdNwnBH0tsVLFoOSPq2r27zlQpkgaODQLRiVbLtXL5PUI7oKiyn
 0o0iMx8qyBGJQyjHU8Jv9YG2QncorYDLESRjL1Vs6yYHT1IMHRKGpitNPrJ0a9lo
 3Ftv3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f245s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 15:05:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3E75040050;
 Tue, 27 May 2025 15:04:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 055F4AE079F;
 Tue, 27 May 2025 15:03:49 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:48 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 27 May 2025 15:03:19 +0200
MIME-Version: 1.0
Message-ID: <20250527-stm32mp157f-dk2-v1-3-8aef885a4928@foss.st.com>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
In-Reply-To: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/5] dt-bindings: regulator: Add STM32MP15
 SCMI regulator identifiers
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

These bindings will be used for the SCMI voltage domain.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 .../dt-bindings/regulator/st,stm32mp15-regulator.h | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/dt-bindings/regulator/st,stm32mp15-regulator.h b/include/dt-bindings/regulator/st,stm32mp15-regulator.h
new file mode 100644
index 0000000000000000000000000000000000000000..8605b12b2aa7de6b14ec32bf8778ce94ecbe4bc2
--- /dev/null
+++ b/include/dt-bindings/regulator/st,stm32mp15-regulator.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP15_REGULATOR_H
+#define __DT_BINDINGS_REGULATOR_ST_STM32MP15_REGULATOR_H
+
+/* SCMI voltage domain identifiers */
+
+/* SOC Internal regulators */
+#define VOLTD_SCMI_REG11		0
+#define VOLTD_SCMI_REG18		1
+#define VOLTD_SCMI_USB33		2
+
+/* STPMIC1 regulators */
+#define VOLTD_SCMI_STPMIC1_BUCK1	3
+#define VOLTD_SCMI_STPMIC1_BUCK2	4
+#define VOLTD_SCMI_STPMIC1_BUCK3	5
+#define VOLTD_SCMI_STPMIC1_BUCK4	6
+#define VOLTD_SCMI_STPMIC1_LDO1		7
+#define VOLTD_SCMI_STPMIC1_LDO2		8
+#define VOLTD_SCMI_STPMIC1_LDO3		9
+#define VOLTD_SCMI_STPMIC1_LDO4		10
+#define VOLTD_SCMI_STPMIC1_LDO5		11
+#define VOLTD_SCMI_STPMIC1_LDO6		12
+#define VOLTD_SCMI_STPMIC1_VREFDDR	13
+#define VOLTD_SCMI_STPMIC1_BOOST	14
+#define VOLTD_SCMI_STPMIC1_PWR_SW1	15
+#define VOLTD_SCMI_STPMIC1_PWR_SW2	16
+
+#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP15_REGULATOR_H */

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
