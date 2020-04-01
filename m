Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61E19A779
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 10:39:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 292A5C36B0B;
	Wed,  1 Apr 2020 08:39:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 453E4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:39:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0318cr5K028133; Wed, 1 Apr 2020 10:39:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qWbSrOJCI90YANyiMWSeBsBNnDP7Y5LT4/yIPcQXcb4=;
 b=vJPkEeJ1tq13Gf3gmUvInOrPmt92KtOS4VIptuWs8OsdY3Tp8MM+RY0gKkaLN4qqx/IZ
 Zm4jGHI0TEmvX2kloUlQIpyDYJA4veKdvEcuSpo+hn5Ub84LdZ00GNllm7xX4OLEjPU+
 45OdGZHk5muRW8gpayvGXPkbGQOQlnpDuGZbNb883amyX2Fqc4w+PGE+nko3LkT0otEe
 5oH/cMlkNCR17N+KL393LjWu52fHK2rUvWFzYC1A4i246b3beI6LqMI3e0fpQZoo5LEv
 7qNaTrDRTHLe7YQ2o+mN1+DPbw6YHn+ugngiCKLILHzdA7Gdg/u8KftjulsZz6kdX5vr 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53x221-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:39:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A77B100034;
 Wed,  1 Apr 2020 10:39:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F197C21CA8F;
 Wed,  1 Apr 2020 10:39:34 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr 2020 10:39:34
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <fabrice.gasnier@st.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <daniel.lezcano@linaro.org>,
 <tglx@linutronix.de>
Date: Wed, 1 Apr 2020 10:39:04 +0200
Message-ID: <20200401083909.18886-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200401083909.18886-1-benjamin.gaignard@st.com>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 1/6] dt-bindings: mfd: Document STM32 low
	power timer bindings
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

Add a subnode to STM low power timer bindings to support timer driver

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
version 6:
- only use one interrupt

version 5:
- the previous has been acked-by Rob but since I have docummented
  interrupts and interrupt-names properties I haven't applied it here.

version 4:
- change compatible and subnode names
- document wakeup-source property

 .../devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 1a4cc5f3fb33..2a99b2296d2b 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -33,12 +33,17 @@ properties:
     items:
       - const: mux
 
+  interrupts:
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
   "#size-cells":
     const: 0
 
+  wakeup-source: true
+
   pwm:
     type: object
 
@@ -81,6 +86,16 @@ patternProperties:
     required:
       - compatible
 
+  timer:
+    type: object
+
+    properties:
+      compatible:
+        const: st,stm32-lptimer-timer
+
+    required:
+      - compatible
+
 required:
   - "#address-cells"
   - "#size-cells"
@@ -94,11 +109,13 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
     timer@40002400 {
       compatible = "st,stm32-lptimer";
       reg = <0x40002400 0x400>;
       clocks = <&timer_clk>;
       clock-names = "mux";
+      interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
       #address-cells = <1>;
       #size-cells = <0>;
 
@@ -115,6 +132,10 @@ examples:
       counter {
         compatible = "st,stm32-lptimer-counter";
       };
+
+      timer {
+        compatible = "st,stm32-lptimer-timer";
+      };
     };
 
 ...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
