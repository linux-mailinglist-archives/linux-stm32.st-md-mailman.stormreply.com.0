Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F6CA4E965
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 18:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CEE1C78F83;
	Tue,  4 Mar 2025 17:40:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38031C78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 17:40:29 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524Hbr1x027811;
 Tue, 4 Mar 2025 18:40:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SYDQ2e7rPLq6jnzS+WCda4pi4joDoEM4IJKfErHVT40=; b=Pl2XyXfYPuIDqyM9
 K9VLHLbjIi0Y+toylx1CnELzpUmMMaLICLWC24dOJoJHJhXJhOcP5HIxVzGXC76u
 swyQ0W61IKsc1betxIFQXEdTyp0XbTn92r/fKe6NYIznjjUFaVxVSxSA6otD7hNO
 FsWyrF6TvtMgRVumYPtpOeFX0iV81vEVbLo2PL+nMKWSIIaieJwL7o5hjI6Hzy8O
 8AOyaH/gbgu4abhFcBALekNdCKOA6Ppuz3yschh6shFRmZqge2r2V4CIV1ovKRx7
 qO2OAyYP6u0OMiojL845ZJK9lA9BlVKQ5eKLuHlqCKlbpEz4npaA/vL6xBaRNH2b
 5Wz3Qg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454cp8fgdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Mar 2025 18:40:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 90B20400B0;
 Tue,  4 Mar 2025 18:39:00 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6B1B5944D6;
 Tue,  4 Mar 2025 18:32:46 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:46 +0100
Received: from localhost (10.252.16.143) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:46 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
Date: Tue, 4 Mar 2025 18:32:22 +0100
Message-ID: <20250304173229.3215445-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.16.143]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 wbg@kernel.org
Subject: [Linux-stm32] [PATCH v2 1/8] dt-bindings: mfd: stm32-lptimer: add
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

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V2:
- Use fallback compatibles, along with stm32mp25 specific compatible
- trigger identifier can be up to 4 (e.g. from LPTIM1..5)
---
 .../bindings/mfd/st,stm32-lptimer.yaml        | 40 ++++++++++++++++---
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index d41308856408..ca251994cda2 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -21,7 +21,12 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-lptimer
+    oneOf:
+      - items:
+        - const: st,stm32mp25-lptimer
+        - const: st,stm32-lptimer
+      - items:
+        - const: st,stm32-lptimer
 
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
+            - const: st,stm32mp25-pwm-lp
+            - const: st,stm32-pwm-lp
+          - items:
+            - const: st,stm32-pwm-lp
 
       "#pwm-cells":
         const: 3
@@ -69,7 +82,12 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-counter
+        oneOf:
+          - items:
+            - const: st,stm32mp25-lptimer-counter
+            - const: st,stm32-lptimer-counter
+          - items:
+            - const: st,stm32-lptimer-counter
 
     required:
       - compatible
@@ -80,7 +98,12 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-timer
+        oneOf:
+          - items:
+            - const: st,stm32mp25-lptimer-timer
+            - const: st,stm32-lptimer-timer
+          - items:
+            - const: st,stm32-lptimer-timer
 
     required:
       - compatible
@@ -92,13 +115,18 @@ patternProperties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-trigger
+        oneOf:
+          - items:
+            - const: st,stm32mp25-lptimer-trigger
+            - const: st,stm32-lptimer-trigger
+          - items:
+            - const: st,stm32-lptimer-trigger
 
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
