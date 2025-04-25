Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A652A9C946
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Apr 2025 14:50:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D42AAC78F8B;
	Fri, 25 Apr 2025 12:50:25 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 850E0C78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 12:50:24 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7NVon019309;
 Fri, 25 Apr 2025 14:50:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NeK5d7dLB9+0vrbA7blChOQTxW3J9mnj7OUQ3K6i/f4=; b=WX0jyR2KUaY7pB3z
 3IeQxJcN3N1A8FtwdTfpgq4rfg8aRwSvRbFcg0lJGstwZ2IYadzeWAeESYTpMBR1
 /BufXm1oikD+MzBduAUiQSlxCHyr3n91WaN9i2k5ZA8uj3P2yXGwwu663KES5mcg
 t0HameL848ww0a06i3w9Ho67+CuaV0QXvFWYzCUVsueRjFovvJsohUGXOBrcfxEq
 WBjFGAAZX+x2qdsr4H0trcaRvN7Wd4SFtnvh40Ww9/TOlxoCVFCT0QerC8BCX5JJ
 jlmGPw1EJYWMQ18tl6D4NxzyFZRgvQSEUdTWw8rjGMr6e47YbEpwDVYb0r/NJPab
 a/C6MA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvm6tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 14:50:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1097040048;
 Fri, 25 Apr 2025 14:49:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4605A09553;
 Fri, 25 Apr 2025 14:48:05 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 14:48:05 +0200
Received: from localhost (10.252.15.6) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 14:48:05 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <alexandre.torgue@foss.st.com>,
 <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
Date: Fri, 25 Apr 2025 14:47:49 +0200
Message-ID: <20250425124755.166193-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425124755.166193-1-fabrice.gasnier@foss.st.com>
References: <20250425124755.166193-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.6]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: [Linux-stm32] [PATCH v5 1/7] dt-bindings: mfd: stm32-lptimer: add
	support for stm32mp25
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

Add a new stm32mp25 compatible to stm32-lptimer dt-bindings, to support
STM32MP25 SoC. Some features has been updated or added to the low-power
timer:
- new capture compare channels
- up to two PWM channels
- PWM input capture
- peripheral interconnect in stm32mp25 has been updated (new triggers).
- registers/bits has been added or revisited (IER access).
So introduce a new compatible to handle this diversity.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V4:
- Add Rob's Reviewed-by tag
Changes in V3:
- Fix yaml indentation issue found by Rob's bot
Changes in V2:
- Use fallback compatibles, along with stm32mp25 specific compatible
- trigger identifier can be up to 4 (e.g. from LPTIM1..5)
---
 .../bindings/mfd/st,stm32-lptimer.yaml        | 40 ++++++++++++++++---
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index d41308856408..4eabafb8079d 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -21,7 +21,12 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-lptimer
+    oneOf:
+      - items:
+          - const: st,stm32mp25-lptimer
+          - const: st,stm32-lptimer
+      - items:
+          - const: st,stm32-lptimer
 
   reg:
     maxItems: 1
@@ -48,13 +53,21 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
   pwm:
     type: object
     additionalProperties: false
 
     properties:
       compatible:
-        const: st,stm32-pwm-lp
+        oneOf:
+          - items:
+              - const: st,stm32mp25-pwm-lp
+              - const: st,stm32-pwm-lp
+          - items:
+              - const: st,stm32-pwm-lp
 
       "#pwm-cells":
         const: 3
@@ -69,7 +82,12 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-counter
+        oneOf:
+          - items:
+              - const: st,stm32mp25-lptimer-counter
+              - const: st,stm32-lptimer-counter
+          - items:
+              - const: st,stm32-lptimer-counter
 
     required:
       - compatible
@@ -80,7 +98,12 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-timer
+        oneOf:
+          - items:
+              - const: st,stm32mp25-lptimer-timer
+              - const: st,stm32-lptimer-timer
+          - items:
+              - const: st,stm32-lptimer-timer
 
     required:
       - compatible
@@ -92,13 +115,18 @@ patternProperties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-trigger
+        oneOf:
+          - items:
+              - const: st,stm32mp25-lptimer-trigger
+              - const: st,stm32-lptimer-trigger
+          - items:
+              - const: st,stm32-lptimer-trigger
 
       reg:
         description: Identify trigger hardware block.
         items:
           minimum: 0
-          maximum: 2
+          maximum: 4
 
     required:
       - compatible
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
