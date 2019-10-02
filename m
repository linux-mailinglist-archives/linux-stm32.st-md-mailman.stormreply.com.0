Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C68C8CC2
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2019 17:23:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA207C36B0B;
	Wed,  2 Oct 2019 15:23:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B16B8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2019 15:23:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x92F10kl012939; Wed, 2 Oct 2019 17:23:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rh33K3LM0pXmPNo2rwzlOrR6sHjN7N9fVAOOZpl14Dk=;
 b=Em0ZDgTYONNevVm/0Rox0Fmyi9N+EYdd6ZGbYY/M7ISSwT4mw2sGX6tauYimRyhSxBHP
 bDYqlqocbMcMqcRRg5fnyo35c9WugHKEOuco9/mlGII7ifFKuMnyBI/BYznxNImzwd05
 QV7QXJRu0a7ad/t0ZdJ/m2Svr5p0DKMhcF04PPNm74WA+qmqD6AUoBwrJNncNG3mhdt3
 2hixPnfq2MnQqNS5SV53cQuU8jp5vA55hyFUQhQg+TDGiPua+5ULMoFLl9ZOiZSTZYpE
 aT/JNo8vpSCQnNejkazNwbSTvCEIPefkDkIrqJ70sdod9KhDW9v0zDejOMgjDkOyliXa KA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9vnafq1u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 02 Oct 2019 17:23:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A59E724;
 Wed,  2 Oct 2019 15:22:56 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5D3F2D377A;
 Wed,  2 Oct 2019 17:22:55 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 2 Oct 2019
 17:22:55 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 2 Oct 2019 17:22:55
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>
Date: Wed, 2 Oct 2019 17:22:53 +0200
Message-ID: <20191002152253.16393-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-02_07:2019-10-01,2019-10-02 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: timer: Convert stm32 timer
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
 .../devicetree/bindings/timer/st,stm32-timer.txt   | 22 -----------
 .../devicetree/bindings/timer/st,stm32-timer.yaml  | 46 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 22 deletions(-)
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
index 000000000000..e128ac9a5391
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/st,stm32-timer.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    items:
+      - description: Module Clock
+
+  resets:
+        maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
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
