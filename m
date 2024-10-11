Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B926999A835
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2024 17:47:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FE63C71290;
	Fri, 11 Oct 2024 15:47:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA427C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 15:47:52 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCRMtM031378;
 Fri, 11 Oct 2024 17:47:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UmHwzMEjgGYMyzKc5Pjv1VczBa5oeGehyd30tiANaqM=; b=Hc2MNPNhnu7Qxf9u
 7nDrRYTVpVx0FdR1wYIUoyu3+7LXy0K4T8SpcjpObNX9d02j0lMzvQdoV+KmtcZ7
 7MIp/uyb6oUhwNifuhS23+Xy5KG4ZJ9p+48Qr/IlskCqXKXweqvI22Rtu7pk6xMe
 dn463ACaMnix/EloPXV7fEy1IERJ5A7NZQGa1DdgahhQsEu9uRnCxO7RTP5pJZqi
 4x+0Z9hot4eiTFZgJ1o17ftin6Kcwbzay4tO2WGTB/N5NTcMRsWY7VjOBHyM5qrp
 nAPKtr946ndc781m59Y16emtSKiemVfRNRADDeNGFKFjWAFnrXN7hOO3av9UGPUo
 Siaxyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 425q5wd33a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 17:47:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AB43C4005E;
 Fri, 11 Oct 2024 17:46:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3F0D29E024;
 Fri, 11 Oct 2024 17:43:15 +0200 (CEST)
Received: from localhost (10.252.28.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 17:43:15 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 11 Oct 2024 17:41:41 +0200
MIME-Version: 1.0
Message-ID: <20241011-rng-mp25-v2-v2-1-76fd6170280c@foss.st.com>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
In-Reply-To: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>, <marex@denx.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.28.117]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] dt-bindings: rng: add st,
	stm32mp25-rng support
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

Add RNG STM32MP25x platforms compatible. Update the clock
properties management to support all versions.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in V2
	-Fix missing min/maxItems
	-Removed MP25 RNG example
	-Renamed RNG clocks for mp25 to "core" and "bus"
---
 .../devicetree/bindings/rng/st,stm32-rng.yaml      | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
index 340d01d481d12ce8664a60db42182ddaf0d1385b..5d553f7f706f8d7c17aea07e4130a34af764a635 100644
--- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
@@ -18,12 +18,20 @@ properties:
     enum:
       - st,stm32-rng
       - st,stm32mp13-rng
+      - st,stm32mp25-rng
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: bus
 
   resets:
     maxItems: 1
@@ -57,6 +65,26 @@ allOf:
       properties:
         st,rng-lock-conf: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32-rng
+              - st,stm32mp13-rng
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
+    else:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+      required:
+        - clock-names
+
 additionalProperties: false
 
 examples:

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
