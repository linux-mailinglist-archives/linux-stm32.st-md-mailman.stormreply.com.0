Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07E126500
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2019 15:41:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5693C36B11;
	Thu, 19 Dec 2019 14:41:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2A11C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2019 14:41:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJEaXgG008246; Thu, 19 Dec 2019 15:41:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YrqEhoOFzVhBDyBqtPSRVN9rQAkZAEPrgnH0llmvGc4=;
 b=jGx2wuFt0ehrsIZU4KNvGMSVFCyRD5sJLndmOHP1dHi25/l3SIGYLds5TPsmHAHtVaQQ
 79zHJUCnTWc7BFu7bfHeOwcwIPxRF1XvL7LSCjYLE7vGcr8hLewfaQQXZxUv0KN+CJqG
 wQUsDEnqTpt5zcp9OoDJmb5GWqc11R9LnWEHr2SR31+hrqEehoUhfnWy92ZzYFOSX6Br
 e18BDEw56hARv0YVtg1kAycn+y+NQ8j2Gm8AHysvcM3aTUZ2MRaH1ZwdPD11SCh+dtFj
 bAUdGrIHYMGm1cidl4/NFqAnDVbHLtaveXYUpMq+hBqgZ8gR434Oeuz0BRnQd1DC7cpA VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvpd1t556-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 15:41:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE6C510003E;
 Thu, 19 Dec 2019 15:41:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA9942C6B63;
 Thu, 19 Dec 2019 15:41:19 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 19 Dec 2019 15:41:19
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <srinivas.kandagatla@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <fabrice.gasnier@st.com>
Date: Thu, 19 Dec 2019 15:41:15 +0100
Message-ID: <20191219144117.21527-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20191219144117.21527-1-benjamin.gaignard@st.com>
References: <20191219144117.21527-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-19_01:2019-12-17,2019-12-19 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: nvmem: Convert STM32 ROMEM
	to json-schema
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

Convert the STM32 ROMEM binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ---------------
 .../devicetree/bindings/nvmem/st,stm32-romem.yaml  | 46 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
 create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
deleted file mode 100644
index 142a51d5a9be..000000000000
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-STMicroelectronics STM32 Factory-programmed data device tree bindings
-
-This represents STM32 Factory-programmed read only non-volatile area: locked
-flash, OTP, read-only HW regs... This contains various information such as:
-analog calibration data for temperature sensor (e.g. TS_CAL1, TS_CAL2),
-internal vref (VREFIN_CAL), unique device ID...
-
-Required properties:
-- compatible:		Should be one of:
-			"st,stm32f4-otp"
-			"st,stm32mp15-bsec"
-- reg:			Offset and length of factory-programmed area.
-- #address-cells:	Should be '<1>'.
-- #size-cells:		Should be '<1>'.
-
-Optional Data cells:
-- Must be child nodes as described in nvmem.txt.
-
-Example on stm32f4:
-	romem: nvmem@1fff7800 {
-		compatible = "st,stm32f4-otp";
-		reg = <0x1fff7800 0x400>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		/* Data cells: ts_cal1 at 0x1fff7a2c */
-		ts_cal1: calib@22c {
-			reg = <0x22c 0x2>;
-		};
-		...
-	};
diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
new file mode 100644
index 000000000000..d84deb4774a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-romem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Factory-programmed data bindings
+
+description: |
+  This represents STM32 Factory-programmed read only non-volatile area: locked
+  flash, OTP, read-only HW regs... This contains various information such as:
+  analog calibration data for temperature sensor (e.g. TS_CAL1, TS_CAL2),
+  internal vref (VREFIN_CAL), unique device ID...
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@st.com>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - st,stm32f4-otp
+      - st,stm32mp15-bsec
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+
+examples:
+  - |
+    efuse@1fff7800 {
+      compatible = "st,stm32f4-otp";
+      reg = <0x1fff7800 0x400>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      calib@22c {
+        reg = <0x22c 0x2>;
+      };
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
