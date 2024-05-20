Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9208CA017
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2024 17:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6770FC6C855;
	Mon, 20 May 2024 15:50:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABB97C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2024 15:50:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KE0tw6020680;
 Mon, 20 May 2024 17:50:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=VNobvMn6oLwWbtmyiUKPCjbx1HSAH//23odYE9Vnlr8=; b=Hj
 cifgsea9d00orPj0cekWRfS8Hv9ORJ6qOKShHQdJf48eQfQ78MscE0SybJqyA5wR
 1pSgAYU773eutXYHva3qVHd98o6P2P+jzWR6A0hHELCKcUzKEU9Ot3X0ojhF0zdc
 HjRKoCULvvVHxKItGQhUwzoatAtu3qPzS/AcZDqmMPtXA1BockU71J9f+gdzISTn
 7G7wd8OWX6LcqEiWothlBcBY7aDyPdk1ohEqJAbt5S8C/hQ2/oY2kDkuIQVmQ5Sb
 Y6Gx0i+S+KNYYFnI/OE/CfqT8dvsxwTvlu4JmgCNjJfYkxrYXtVS0EPYQsDGBH7Q
 npf6txjMbyRcqjGTMRYQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n4280we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2024 17:50:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3AD6240048;
 Mon, 20 May 2024 17:50:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61D32226FBB;
 Mon, 20 May 2024 17:49:53 +0200 (CEST)
Received: from localhost (10.252.8.132) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 17:49:53 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 20 May 2024 17:49:37 +0200
Message-ID: <20240520154948.690697-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520154948.690697-1-amelie.delaunay@foss.st.com>
References: <20240520154948.690697-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.8.132]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_09,2024-05-17_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 01/12] dt-bindings: dma: New directory for
	STM32 DMA controllers bindings
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

Gather the STM32 DMA controllers bindings under ./dma/stm32/.
Then fix reference to old path in spi/st,stm32-spi.yaml: update the dmas
property description by referring to all STM32 DMA controllers bindings.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
v3:
- add Rob's Acked-by
v2:
- fix reference in spi/st,stm32-spi.yaml with an updated description of the
  dmas property to reflect the new path of STM32 DMA controllers bindings.
---
 .../devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml     | 4 ++--
 .../devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml  | 4 ++--
 .../devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml    | 4 ++--
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml (97%)
 rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml (89%)
 rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml (96%)

diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
rename to Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
index 329847ef096a..071363d18443 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/dma/st,stm32-dma.yaml#
+$id: http://devicetree.org/schemas/dma/stm32/st,stm32-dma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 DMA Controller
@@ -53,7 +53,7 @@ maintainers:
   - Amelie Delaunay <amelie.delaunay@foss.st.com>
 
 allOf:
-  - $ref: dma-controller.yaml#
+  - $ref: /schemas/dma/dma-controller.yaml#
 
 properties:
   "#dma-cells":
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
rename to Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
index e722fbcd8a5f..88c9e88cf3d5 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/dma/st,stm32-dmamux.yaml#
+$id: http://devicetree.org/schemas/dma/stm32/st,stm32-dmamux.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 DMA MUX (DMA request router)
@@ -10,7 +10,7 @@ maintainers:
   - Amelie Delaunay <amelie.delaunay@foss.st.com>
 
 allOf:
-  - $ref: dma-router.yaml#
+  - $ref: /schemas/dma/dma-router.yaml#
 
 properties:
   "#dma-cells":
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-mdma.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
rename to Documentation/devicetree/bindings/dma/stm32/st,stm32-mdma.yaml
index 3874544dfa74..45fe91db11db 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-mdma.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/dma/st,stm32-mdma.yaml#
+$id: http://devicetree.org/schemas/dma/stm32/st,stm32-mdma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 MDMA Controller
@@ -53,7 +53,7 @@ maintainers:
   - Amelie Delaunay <amelie.delaunay@foss.st.com>
 
 allOf:
-  - $ref: dma-controller.yaml#
+  - $ref: /schemas/dma/dma-controller.yaml#
 
 properties:
   "#dma-cells":
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index 4bd9aeb81208..de431e8306cd 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -42,7 +42,7 @@ properties:
   dmas:
     description: |
       DMA specifiers for tx and rx dma. DMA fifo mode must be used. See
-      the STM32 DMA bindings Documentation/devicetree/bindings/dma/st,stm32-dma.yaml.
+      the STM32 DMA controllers bindings Documentation/devicetree/bindings/dma/stm32/*.yaml.
     items:
       - description: rx DMA channel
       - description: tx DMA channel
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
