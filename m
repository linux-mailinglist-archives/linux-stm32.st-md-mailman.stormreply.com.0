Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D9DAC81
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2019 14:42:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCA43C36B0B;
	Thu, 17 Oct 2019 12:42:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D22BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2019 12:42:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9HCfBaw021784; Thu, 17 Oct 2019 14:42:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=L26QXalVQR9HzDI3UJ1eXufxROWoddqJ9iUBDb8vL5I=;
 b=V1qAI/AZc8ULJzhq8rHQoCKUBO4QKrCmM+Tds8x0tAjcOGhCYNT6xlel6P3uOLpsS44M
 pj79D+qYzGG4je4AZbY9LPDKuDuUP2SwVsNA0L6MVKgAFbCvVvSf2XQAQ6U2mQPOOwo0
 L+MKHi3atsGEWE71HnO/s8Zquh8eGx6b/c4C0v83kl5n7VNZ4Cimu+/eK7I0BYkgvtiH
 w++len1Su7YNIAxZNCmCz649vwJGEP3Emlyg2EFkU3jxMUZx9wXYqJxnOJ0eDOEcbKmx
 xOWIuL9U5/l79s3uf/kjye0pNHKfMUHWyYLNwAUYkeK3qT/g67/Icj/f/3dAmL6fua7O uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4kxbu5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2019 14:42:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C6D510002A;
 Thu, 17 Oct 2019 14:42:06 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEED32B5663;
 Thu, 17 Oct 2019 14:42:05 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 17 Oct
 2019 14:42:05 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 17 Oct 2019 14:42:04
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>
Date: Thu, 17 Oct 2019 14:41:59 +0200
Message-ID: <20191017124159.13869-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_04:2019-10-17,2019-10-17 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: watchdog: Convert stm32 watchdog
	bindings to json-schema
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

Convert the STM32 watchdog binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 -----------
 .../bindings/watchdog/st,stm32-iwdg.yaml           | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
deleted file mode 100644
index d8f4430b0a13..000000000000
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-STM32 Independent WatchDoG (IWDG)
----------------------------------
-
-Required properties:
-- compatible: Should be either:
-  - "st,stm32-iwdg"
-  - "st,stm32mp1-iwdg"
-- reg: Physical base address and length of the registers set for the device
-- clocks: Reference to the clock entry lsi. Additional pclk clock entry
-  is required only for st,stm32mp1-iwdg.
-- clock-names: Name of the clocks used.
-  "lsi" for st,stm32-iwdg
-  "lsi", "pclk" for st,stm32mp1-iwdg
-
-Optional Properties:
-- timeout-sec: Watchdog timeout value in seconds.
-
-Example:
-
-iwdg: watchdog@40003000 {
-	compatible = "st,stm32-iwdg";
-	reg = <0x40003000 0x400>;
-	clocks = <&clk_lsi>;
-	clock-names = "lsi";
-	timeout-sec = <32>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
new file mode 100644
index 000000000000..edec96d53e6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/st,stm32-iwdg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Independent WatchDoG (IWDG) bindings
+
+maintainers:
+  - Yannick Fertre <yannick.fertre@st.com>
+
+allOf: 
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - st,stm32-iwdg
+      - st,stm32mp1-iwdg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Low speed clock
+      - description: Optional peripheral clock
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      enums: [ lsi, pclk ]
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    watchdog@5a002000 {
+      compatible = "st,stm32mp1-iwdg";
+      reg = <0x5a002000 0x400>;
+      clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
+      clock-names = "pclk", "lsi";
+      timeout-sec = <32>;
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
