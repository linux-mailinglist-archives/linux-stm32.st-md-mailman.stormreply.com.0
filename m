Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47616D5EBA
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 11:23:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C73FC36B0B;
	Mon, 14 Oct 2019 09:23:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ECD8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 09:23:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E9Biq9022257; Mon, 14 Oct 2019 11:23:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=gEmBsIEorhGPSpDkFEP6FJmifXJuypR7WyitQNE9F3U=;
 b=IFqMGZb+TTWAv7lhNQiinPV3XsSxyxdw6e/u3hIocGh75+SUDJ52xgajrfxq2PIxOZ9T
 O/U6R+Jk1PL8X2a1Kxh476tABtb5XWgeTuzzMLOjTWKqWFgF13XVn6vSP01kvLgxkbav
 2el7XkOb22YokGc/v7MlbkVdH6c8JdVperl5hlEvgPqbGv/zUAY1P1cxdzoKUmIiwOp4
 nm+m8Z0ld5DRzlauPqP7gJ13kRXhUzZBfOcy/e8JTmNn4MvsHcm5cEDH2dFyazqlBDSn
 gquyoiW7aRZhBEmlakpzjvIYpxaF/tgEROKMNBbwAsjDy3bPYnW2iyZMZ3Kkfs/k+/Lr BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9hshw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 11:23:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2A6510002A;
 Mon, 14 Oct 2019 11:23:18 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2F032B189A;
 Mon, 14 Oct 2019 11:23:18 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 11:23:18 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 11:23:18
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
 <alexandre.torgue@st.com>
Date: Mon, 14 Oct 2019 11:23:16 +0200
Message-ID: <20191014092316.24337-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3] dt-bindings: timer: Convert stm32 timer
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

Convert the STM32 timer binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in v3:
- use (GPL-2.0-only OR BSD-2-Clause) license
- fix identation
- add additionalProperties: false

 .../devicetree/bindings/timer/st,stm32-timer.txt   | 22 ----------
 .../devicetree/bindings/timer/st,stm32-timer.yaml  | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/st,stm32-timer.txt b/Documentation/devicetree/bindings/timer/st,stm32-timer.txt
deleted file mode 100644
index 8ef28e70d6e8..000000000000
--- a/Documentation/devicetree/bindings/timer/st,stm32-timer.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-. STMicroelectronics STM32 timer
-
-The STM32 MCUs family has several general-purpose 16 and 32 bits timers.
-
-Required properties:
-- compatible : Should be "st,stm32-timer"
-- reg : Address and length of the register set
-- clocks : Reference on the timer input clock
-- interrupts : Reference to the timer interrupt
-
-Optional properties:
-- resets: Reference to a reset controller asserting the timer
-
-Example:
-
-timer5: timer@40000c00 {
-	compatible = "st,stm32-timer";
-	reg = <0x40000c00 0x400>;
-	interrupts = <50>;
-	resets = <&rrc 259>;
-	clocks = <&clk_pmtr1>;
-};
diff --git a/Documentation/devicetree/bindings/timer/st,stm32-timer.yaml b/Documentation/devicetree/bindings/timer/st,stm32-timer.yaml
new file mode 100644
index 000000000000..176aa3c9baf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/st,stm32-timer.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/st,stm32-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 general-purpose 16 and 32 bits timers bindings
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    timer: timer@40000c00 {
+        compatible = "st,stm32-timer";
+        reg = <0x40000c00 0x400>;
+        interrupts = <50>;
+        clocks = <&clk_pmtr1>;
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
