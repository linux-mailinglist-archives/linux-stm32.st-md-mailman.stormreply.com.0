Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6149C093B
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 15:49:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FE4BC6C855;
	Thu,  7 Nov 2024 14:49:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24944C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 14:49:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7BPOxb001277;
 Thu, 7 Nov 2024 15:49:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ienHGXKCWAz/ANukHZpdgkhnrKTvDCmbAMpuaZRiPmI=; b=GCsEjwdqoQWsIWta
 2m5eWnfgDeOV9wLIgabL+vUnYSe6hYGROVrGv3zcvyPY8khtzjGMErbUO9E84dRj
 AzcjJLlLSeP1w8G5aW36WtSoLmLm4admIo7aHBHomAw9XJ69HvNIpp50Z7mAkBlP
 mYIoBPrTb4IO2Z4/M3Awr5TZekUP9QTFhkTJYlQZS3wO7xHQ5QlmmBUMtQI6ZGEA
 8RxhxM1tmne2dTCua5NUrROqBWwgUww4TNE9Z3vB0UbMcN/VnGNW8SkpEMou3v4V
 1CuTODTNpq7av7riP8K+0cEOLV4YrhI9EUzzTk8HWLXmBfpZ4PZGZpg3TQmH6I+9
 QNu0rA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42r9765p3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Nov 2024 15:49:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74DCA40047;
 Thu,  7 Nov 2024 15:48:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D1D22BA0A8;
 Thu,  7 Nov 2024 15:47:37 +0100 (CET)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 15:47:37 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 7 Nov 2024 15:47:11 +0100
Message-ID: <20241107144712.1305638-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
References: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 1/2] ASoC: dt-bindings: add stm32mp25
	support for i2s
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

Add STM32MP25 support for STM32 I2S peripheral,
through "st,stm32mp25-i2s" compatible.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../bindings/sound/st,stm32-i2s.yaml          | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index 8978f6bd63e5..b4f44f9c7c7d 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -13,13 +13,11 @@ description:
   The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
   Only some SPI instances support I2S.
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
       - st,stm32h7-i2s
+      - st,stm32mp25-i2s
 
   "#sound-dai-cells":
     const: 0
@@ -33,6 +31,7 @@ properties:
       - description: clock feeding the internal clock generator.
       - description: I2S parent clock for sampling rates multiple of 8kHz.
       - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+    minItems: 2
 
   clock-names:
     items:
@@ -40,6 +39,7 @@ properties:
       - const: i2sclk
       - const: x8k
       - const: x11k
+    minItems: 2
 
   interrupts:
     maxItems: 1
@@ -79,6 +79,36 @@ required:
   - dmas
   - dma-names
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32h7-i2s
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+
+        clock-names:
+          minItems: 4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp25-i2s
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
