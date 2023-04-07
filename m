Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C37F86DB2A7
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 20:15:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83A28C6B44B;
	Fri,  7 Apr 2023 18:15:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B1E8C6B447
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 18:15:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 337CYiXC012385; Fri, 7 Apr 2023 20:15:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=jMXGQTJig0Tnfo5wXxWSxNs8s4SjycIUQ78y3LxaRYQ=;
 b=6oOHOxSHwQKwvJpyJFbrUQOYKfQYoXjGSIGfOAYyow9Y0aR2KfbMbDaOrRc0nQ8ezA+r
 OfLyANP8eC1ZGydbXbiIENi0mAG1kQCE68GY98sjv+eeN9ubW3zoa46rX3gUvzt9DiXw
 rjlzziiMKB7giMOC2FlmDf02niKMqKIv0DhJaizrUZ/ovafN6mXNkx/Gdy/Ea+8xJQD6
 XoM3ZCFfExWnHfZmh+Dr44Tm1W5tocKxOryqK3+xpBUL6eIlDtO2vDuN27p1JoeLmrww
 WHm4FTS+FhmfwlI+L08CFqIR9DY654uReW2fxBA8GJlFvTzITMrbtMuR/TDUww9HH6MM sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pteygu3k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 20:15:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BEB210002A;
 Fri,  7 Apr 2023 20:15:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64BC324C45E;
 Fri,  7 Apr 2023 20:15:44 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 7 Apr
 2023 20:15:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 7 Apr 2023 20:15:33 +0200
Message-ID: <20230407201526.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_12,2023-04-06_03,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, gabriel.fernandez@foss.st.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: Fix STM32MP13
	include file
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

Minor cosmetic change, aligned with files in U-Boot:
- change obsolete SPDX id : GPL-2.0+
- use correct address gabriel.fernandez@foss.st.com
- remove extra space

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/dt-bindings/clock/stm32mp13-clks.h   | 6 +++---
 include/dt-bindings/reset/stm32mp13-resets.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
index 02befd25edce..da4cb7567430 100644
--- a/include/dt-bindings/clock/stm32mp13-clks.h
+++ b/include/dt-bindings/clock/stm32mp13-clks.h
@@ -1,7 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0+ or BSD-3-Clause */
+/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
 /*
  * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
- * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef _DT_BINDINGS_STM32MP13_CLKS_H_
@@ -64,7 +64,7 @@
 #define CK_MCO1		38
 #define CK_MCO2		39
 
-/*  IP clocks */
+/* IP clocks */
 #define SYSCFG		40
 #define VREF		41
 #define DTS		42
diff --git a/include/dt-bindings/reset/stm32mp13-resets.h b/include/dt-bindings/reset/stm32mp13-resets.h
index 934864e90da6..1b83a01de8f0 100644
--- a/include/dt-bindings/reset/stm32mp13-resets.h
+++ b/include/dt-bindings/reset/stm32mp13-resets.h
@@ -1,7 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0 or BSD-3-Clause */
+/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
 /*
  * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
- * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef _DT_BINDINGS_STM32MP13_RESET_H_
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
