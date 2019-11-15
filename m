Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 359CCFDACE
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 11:09:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6784C36B0B;
	Fri, 15 Nov 2019 10:09:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C1C1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 10:09:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFA71fq002107; Fri, 15 Nov 2019 11:09:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=lAUGW0y2CHBDpVTA3h5ClqMlUAZUqXjeRxzgtQy+rpU=;
 b=eExy1s42e1KDNtXfaE58U+ydiOXEL0+L9ooNaeQ5q1pmb8eWTclk/YHwAbi7HNB3Wlhw
 gJZToY++Da9GOsq6Sfv66K6GYlNhyDtZFrDmtYqx4yZra330admzcM6xSAONAfSugBN0
 SBTaiRQDJNJeZHliLORIbL0p04KliNeqk6Ep7cGguXyNXngvFgwP3k16WzixLOWYTTKg
 +doo/WdM0EAay0pCGaUQvWKbeSy1z7+bcMzKXnJWhMw7dumRWuKOnm6UxpT3tLOUwu1H
 av3EUzSBxXjvZl+ByeDbvk4qaroputh+rfBtp4oM6O3KOTHuOiXznw9R4b9iw+Y8zMqg Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psfkfqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 11:09:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D27AC10003A;
 Fri, 15 Nov 2019 11:09:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC76B2B2520;
 Fri, 15 Nov 2019 11:09:03 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 15 Nov 2019 11:09:03
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <mpm@selenic.com>, <herbert@gondor.apana.org.au>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>, <lionel.debieve@st.com>
Date: Fri, 15 Nov 2019 11:08:54 +0100
Message-ID: <20191115100854.17938-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_02:2019-11-15,2019-11-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: rng: Convert stm32 RNG bindings
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

Convert the STM32 RNG binding to DT schema format using json-schema
Remove interrupt from the json-schema because it is not used by the driver.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/rng/st,stm32-rng.txt       | 25 -----------
 .../devicetree/bindings/rng/st,stm32-rng.yaml      | 48 ++++++++++++++++++++++
 2 files changed, 48 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rng/st,stm32-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/st,stm32-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.txt b/Documentation/devicetree/bindings/rng/st,stm32-rng.txt
deleted file mode 100644
index 1dfa7d51e006..000000000000
--- a/Documentation/devicetree/bindings/rng/st,stm32-rng.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-STMicroelectronics STM32 HW RNG
-===============================
-
-The STM32 hardware random number generator is a simple fixed purpose IP and
-is fully separated from other crypto functions.
-
-Required properties:
-
-- compatible : Should be "st,stm32-rng"
-- reg : Should be register base and length as documented in the datasheet
-- interrupts : The designated IRQ line for the RNG
-- clocks : The clock needed to enable the RNG
-
-Optional properties:
-- resets : The reset to properly start RNG
-- clock-error-detect : Enable the clock detection management
-
-Example:
-
-	rng: rng@50060800 {
-		compatible = "st,stm32-rng";
-		reg = <0x50060800 0x400>;
-		interrupts = <80>;
-		clocks = <&rcc 0 38>;
-	};
diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
new file mode 100644
index 000000000000..82bb2e97e889
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rng/st,stm32-rng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 RNG bindings
+
+description: |
+  The STM32 hardware random number generator is a simple fixed purpose
+  IP and is fully separated from other crypto functions.
+
+maintainers:
+  - Lionel Debieve <lionel.debieve@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clock-error-detect:
+    description: If set enable the clock detection management
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    rng@54003000 {
+      compatible = "st,stm32-rng";
+      reg = <0x54003000 0x400>;
+      clocks = <&rcc RNG1_K>;
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
