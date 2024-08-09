Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8D494D310
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 17:13:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99CC2C78021;
	Fri,  9 Aug 2024 15:13:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B59D0C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 15:13:42 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4799oVn4020207;
 Fri, 9 Aug 2024 17:13:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=DFo1fYl9nCcaq9Zjb9msp/
 A8hQ7oocxj4j73HSkUytY=; b=xhUXh7QgMtiq51FQ2PBRFBr2JxHE7/pXl9qbL7
 tnH2StFkY0LSOnB8gF7gQHH9VSNIpTa+f/F8rUS9GK8/O4omf0y2yHcTl/EPINAj
 3/bLMF/JmoeSuLP62Gt7o4tPL11RHQ/df5NnxEekZGZV4jyhHIu/NqNMd3Hsa6cC
 /aPK1wxjGac1SH/0/OzkZ9R5/6KQ/oE8tA6/1wzAcJO5i/Mpy7JbeqKGx3L8xTmu
 dWADCQqmXgX/Y2sEEr46fbSoZlPest5CLVnZLNKPGYlMYqGkSVBbSakq27p4FhBE
 oQIPaFVCoFSkg7CV0UsCETtuDrHQLNKm04M61ucNw3IhGZAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40tu6nwcx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 17:13:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 49C7140046;
 Fri,  9 Aug 2024 17:13:17 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACEC12612A9;
 Fri,  9 Aug 2024 17:13:17 +0200 (CEST)
Received: from localhost (10.252.26.60) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 9 Aug
 2024 17:13:17 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 9 Aug 2024 17:13:14 +0200
Message-ID: <20240809151314.221746-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.26.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
Subject: [Linux-stm32] [PATCH v2] dt-bindings: display: st,
	stm32-ltdc: Document stm32mp25 compatible
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

Add "st,stm32mp25-ltdc" compatible for SOC MP25. This new SOC introduce
new clocks (bus, ref & lvds). Bus clock was separated from lcd clock.
New sources are possible for lcd clock (lvds / ref).

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
Changes in v2: Rework clock property.
 .../bindings/display/st,stm32-ltdc.yaml       | 51 +++++++++++++++----
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cf..cc578ad9f040 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -12,7 +12,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-ltdc
+    enum:
+      - st,stm32-ltdc
+      - st,stm32mp25-ltdc
 
   reg:
     maxItems: 1
@@ -23,13 +25,6 @@ properties:
       - description: errors interrupt line.
     minItems: 1
 
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    items:
-      - const: lcd
-
   resets:
     maxItems: 1
 
@@ -46,11 +41,47 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - clock-names
   - resets
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp25-ltdc
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+          items:
+            - description: Lcd Clock
+            - description: Bus Clock
+            - description: Reference Clock
+            - description: Lvds Clock
+        clock-names:
+          items:
+            - const: lcd
+            - const: bus
+            - const: ref
+            - const: lvds
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+          items:
+            - description: Lcd Clock
+        clock-names:
+          items:
+            - const: lcd
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
