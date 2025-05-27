Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D657AC4F3E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 15:05:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62B11C36B1E;
	Tue, 27 May 2025 13:05:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61694C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:05:52 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9XLmJ031268;
 Tue, 27 May 2025 15:05:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Xt2bCMTIvh87COE2sGKEmCIvYsCqTkRKv6pvRr+MTSc=; b=oZonfTbcryO3BEhb
 yy9lD0nt4kTjfJ6wItrXG1td105+XN+feeYvad32VZXP6IKqN6ZOP2r56mB81nFO
 Q+HVZxrq+iXaDky5D6pzPuApi+M/cWS0lIYRE88Pf0u3Bqw5mx2LFJiS18odi/yu
 TFP6fvfiWEB2Q9Uj8rfuWF8/A8GfCBVJMBZHnsfjAW0tJPl/FD9JS9KDvGL3F6e2
 0ljDPZlsPGOwn8Voc4PApJ7DMTmnj2XdcOz/nnPm7qYWktwetftiQA1VF9m6ujWX
 m8wFnPP2UsVGjAiyW7qgqbunYro+QLPKMhar1NQqo+zp5hVGiC3Z9qm7SIcCWA3m
 +WH/rQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j1nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 15:05:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3EAE140055;
 Tue, 27 May 2025 15:04:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 970A6AE078E;
 Tue, 27 May 2025 15:03:47 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:47 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 27 May 2025 15:03:17 +0200
MIME-Version: 1.0
Message-ID: <20250527-stm32mp157f-dk2-v1-1-8aef885a4928@foss.st.com>
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
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: fullfill diversity with
 OPP for STM32M15x SOCs
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

From: Alexandre Torgue <alexandre.torgue@foss.st.com>

This commit creates new files to manage security features and supported OPP
on STM32MP15x SOCs. On STM32MP15xY, "Y" gives information:
 -Y = A means no cryp IP and no secure boot + A7-CPU@650MHz.
 -Y = C means cryp IP + optee + secure boot + A7-CPU@650MHz.
 -Y = D means no cryp IP and no secure boot + A7-CPU@800MHz.
 -Y = F means cryp IP + optee + secure boot + A7-CPU@800MHz.

It fullfills the initial STM32MP15x SoC diversity introduced by
commit 0eda69b6c5f9 ("ARM: dts: stm32: Manage security diversity
for STM32M15x SOCs").

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xa.dtsi |  5 +++++
 arch/arm/boot/dts/st/stm32mp15xc.dtsi |  4 +++-
 arch/arm/boot/dts/st/stm32mp15xd.dtsi |  5 +++++
 arch/arm/boot/dts/st/stm32mp15xf.dtsi | 20 ++++++++++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xa.dtsi b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
diff --git a/arch/arm/boot/dts/st/stm32mp15xc.dtsi b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
index 97465717f932fc223647af76e88a6182cf3c870f..4d30a2a537f15c1e145635b090de0f0222526579 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
@@ -1,9 +1,11 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 /*
  * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
  */
 
+#include "stm32mp15xa.dtsi"
+
 &etzpc {
 	cryp1: cryp@54001000 {
 		compatible = "st,stm32mp1-cryp";
diff --git a/arch/arm/boot/dts/st/stm32mp15xd.dtsi b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
diff --git a/arch/arm/boot/dts/st/stm32mp15xf.dtsi b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..5f6a2952125d00d468e2e4012024f02380cfaa49
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp15xd.dtsi"
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
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
