Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8582C198E77
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 10:32:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FEDEC36B0B;
	Tue, 31 Mar 2020 08:32:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06CA8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 08:32:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02V8RAVq026922; Tue, 31 Mar 2020 10:32:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UvUiuQXXX/lmwa34ZnG6SSANaGi47hg/fFk3TsJH6HU=;
 b=h3Vg+Wm4fycqUNzJ9Qant4f7R4hHkwNV0rG2XlarDQ5sjPuhEgtO7tWDl6AxX/rkgZv4
 n/KLFjQmaEU2Yaop5QCZosTMfm987uQ+C/Adhf0pVUl6Zpk7ae9RknvhN8ayK1wBlKih
 mte9Ys/D4VZpUmD/a6BnZE/3C63uJOeT78GqHsRkOjy0pZ84JYBZOhRXePjwTxxG5qmW
 PAimFJnUMDrQ02IfIcW/iawhq9dD+f11S6b8uib/KLLTWvwbcXWiaRmRHYrzoZJwtCT2
 t1363+OVeVk6eZo2mjWnxoMN0GMgKYwl/tQo3iIZ6P0nwTpSqaDfRFTh6H65+K/u5KJS Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkdp6r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 10:32:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8375F100034;
 Tue, 31 Mar 2020 10:32:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73F0621E677;
 Tue, 31 Mar 2020 10:32:01 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 31 Mar 2020 10:32:00
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <fabrice.gasnier@st.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <daniel.lezcano@linaro.org>,
 <tglx@linutronix.de>
Date: Tue, 31 Mar 2020 10:31:41 +0200
Message-ID: <20200331083146.10462-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200331083146.10462-1-benjamin.gaignard@st.com>
References: <20200331083146.10462-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_03:2020-03-30,
 2020-03-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 1/6] dt-bindings: mfd: Document STM32 low
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
---
version 5:
- the previous has been acked-by Rob but since I have docummented
  interrupts and interrupt-names properties I haven't applied it here.

version 4:
- change compatible and subnode names
- document wakeup-source property

 .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 1a4cc5f3fb33..2809c4a186c4 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -33,12 +33,28 @@ properties:
     items:
       - const: mux
 
+  interrupts:
+    items:
+      - description: timer event interrupt
+      - description: wake up interrupt
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: event
+      - const: wakeup
+    minItems: 1
+    maxItems: 2
+
   "#address-cells":
     const: 1
 
   "#size-cells":
     const: 0
 
+  wakeup-source: true
+
   pwm:
     type: object
 
@@ -81,6 +97,16 @@ patternProperties:
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
@@ -94,11 +120,15 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
     timer@40002400 {
       compatible = "st,stm32-lptimer";
       reg = <0x40002400 0x400>;
       clocks = <&timer_clk>;
       clock-names = "mux";
+      interrupt-names = "event", "wakeup";
+      interrupts-extended = <&intc GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+                            <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
       #address-cells = <1>;
       #size-cells = <0>;
 
@@ -115,6 +145,10 @@ examples:
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
