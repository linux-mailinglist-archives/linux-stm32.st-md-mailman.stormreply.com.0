Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA5A9C0A79
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 16:54:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73FEFC6DD94;
	Thu,  7 Nov 2024 15:54:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB2DAC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 15:54:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Ap0oi001233;
 Thu, 7 Nov 2024 16:54:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DdQ63519VTwDDYOb2ko9io8ZGiOolYAXq3k/7DS5g7Q=; b=dqTLO5o5EoF+cjp9
 WQj/kqPQSsBdtHKkEjAJ2ge82+b0WHRCd26G5Oaao5bHaTmeVUnfa76STxJXqwtC
 mnZzHEFhfsVOM6Q/2FjGZlN6lL8QtkmzBd1Mf4o55TTiKnYKX3J5tR8sTwUuInMf
 ajeGPPzxNSjCLtWluzu6s1HCUBmfi2ne61uYhNzocSqmmhQIPdzrCbZ46/gqhX3b
 ZHMQhBM/j3gTetLawEjT7zuELoP4NOhjFitIDFAnY8jLRBKx/+kVLqA5NR4H6dfz
 Yj7tfN00ZzoG0ovrRo0v49mYKTQJ+ovPF92qFY2XmBIZi4tVUOyU38rQUs968DZw
 gQ7MlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42r9765y3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Nov 2024 16:54:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 07AA140048;
 Thu,  7 Nov 2024 16:53:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A95982B7342;
 Thu,  7 Nov 2024 16:52:01 +0100 (CET)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 16:52:01 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 7 Nov 2024 16:51:41 +0100
Message-ID: <20241107155143.1340523-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
References: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ASoC: dt-bindings: add stm32mp25 support
	for sai
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

Add STM32MP25 support for STM32 SAI peripheral,
through "st,stm32mp25-sai" compatible.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../bindings/sound/st,stm32-sai.yaml          | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 68f97b462598..4a7129d0b157 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - st,stm32f4-sai
       - st,stm32h7-sai
+      - st,stm32mp25-sai
 
   reg:
     items:
@@ -43,9 +44,11 @@ properties:
     const: 1
 
   clocks:
+    minItems: 1
     maxItems: 3
 
   clock-names:
+    minItems: 1
     maxItems: 3
 
   access-controllers:
@@ -156,7 +159,13 @@ allOf:
           items:
             - const: x8k
             - const: x11k
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mph7-sai
+    then:
       properties:
         clocks:
           items:
@@ -170,6 +179,21 @@ allOf:
             - const: x8k
             - const: x11k
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp25-sai
+    then:
+      properties:
+        clocks:
+          items:
+            - description: pclk feeds the peripheral bus interface.
+
+        clock-names:
+          items:
+            - const: pclk
+
 additionalProperties: false
 
 examples:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
