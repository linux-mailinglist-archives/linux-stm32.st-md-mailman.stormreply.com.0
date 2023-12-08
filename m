Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C9D80A9A9
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 17:48:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFD00C6907A;
	Fri,  8 Dec 2023 16:48:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C14F3C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 16:48:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8FsHCm017750; Fri, 8 Dec 2023 17:48:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=LWgjN+j7PnQ7YW9swGp/1XIDBLTWuTaWnDZT+t9ESfU=; b=hz
 2oungCjICBbsTcQnfHsr4xA2OyWstVJ39D/xmEvDx6cn8wf3kC7j8L4gBxFEc03a
 gfap2fIFF+4OHvKSjDdagI1ONfFLCCk4qCyh1sEA2Qd1voLoOAo0TpvPa0LJgHTj
 xGrVFu1WSEBgOIn4XQXZbj1lsHpr5NlBUCwG5antXpnfyOIlIcEDfHl6WdAoAcWX
 QReNrbqgNpIyvPwhIWIEeTdqxz7Ze5wjFFH0ABkr1WB53O1YjkXr+PbugMkWYHYh
 Z/MZrfxMbtM0nYtqeDa5qGkQtcnJTyQbmbuzEyihDn1c50IdJJEdphWGvhW2b53b
 6HGDl5fryEWLYIIphsRg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2jn915-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 17:48:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67EA4100059;
 Fri,  8 Dec 2023 17:48:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F9DF236936;
 Fri,  8 Dec 2023 17:48:06 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 17:48:06 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 8 Dec 2023 17:47:12 +0100
Message-ID: <20231208164719.3584028-4-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208164719.3584028-1-alain.volmat@foss.st.com>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/7] dt-bindings: i2c: document st,
	stm32mp25-i2c compatible
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

Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
has only one interrupt line for both events and errors and differs in
term of handling of FastModePlus.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 94b75d9f66cd..1b31b87c1800 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -19,6 +19,7 @@ allOf:
               - st,stm32f7-i2c
               - st,stm32mp13-i2c
               - st,stm32mp15-i2c
+              - st,stm32mp25-i2c
     then:
       properties:
         i2c-scl-rising-time-ns:
@@ -41,6 +42,30 @@ allOf:
         clock-frequency:
           enum: [100000, 400000]
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32f4-i2c
+              - st,stm32f7-i2c
+              - st,stm32mp13-i2c
+              - st,stm32mp15-i2c
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+
+        interrupt-names:
+          minItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
+        interrupt-names:
+          maxItems: 1
+
 properties:
   compatible:
     enum:
@@ -48,6 +73,7 @@ properties:
       - st,stm32f7-i2c
       - st,stm32mp13-i2c
       - st,stm32mp15-i2c
+      - st,stm32mp25-i2c
 
   reg:
     maxItems: 1
@@ -56,11 +82,13 @@ properties:
     items:
       - description: interrupt ID for I2C event
       - description: interrupt ID for I2C error
+    minItems: 1
 
   interrupt-names:
     items:
       - const: event
       - const: error
+    minItems: 1
 
   resets:
     maxItems: 1
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
