Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C909F60B9
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 10:04:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDDFEC7129D;
	Wed, 18 Dec 2024 09:04:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA1A9C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 09:04:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60Nv6011765;
 Wed, 18 Dec 2024 10:04:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vW1JFQEmVm4PV1qnVwiqaXl0lHHUfQAEzgxxFtOL2hg=; b=oQFQm2KOvwp/807E
 UJ5JV0Kd8Mg7dKDD4fN8Qun0r7lIK+hvshiRQhS0h8N3onKQ/alzpqs0mzLMo9su
 6PJZBK7CRIudqkTOIFYmRUZn7SdgthOUU51fL6tdmvjll94MYuIl5EYXOrAXm9/4
 2XnZm6Wwyhh/CDQp+XS8yED2Ph608UF30Zc3QUGAJLGjwBGzFc2f4nCnPBF4pr9g
 RR7kWm1eQe03/t0/zT5la1GkB4qL6jBcQVNcavSGH/U7H0uxUCzXNV3LuQ7Edq9Z
 ySfDjOoF38ZqkMjCWELcLg20L5aHMcg1y5BrzWDfhWAA6t40epg+kU1/ixnK2QF8
 u6tjcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcrnkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 10:04:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 377484006F;
 Wed, 18 Dec 2024 10:03:49 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB4E425F1F2;
 Wed, 18 Dec 2024 10:02:55 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:55 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:55 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
 <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
Date: Wed, 18 Dec 2024 10:01:45 +0100
Message-ID: <20241218090153.742869-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/9] dt-bindings: mfd: stm32-timers: add
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

Add a new stm32mp25 compatible to stm32-timer dt-bindings in order to
support the STM32MP25 SoC. Some features has been added or updated in
the stm32-timer timer such as:
- hardware configuration and identification registers to read the timer
  version and capabilities (counter width, number of channels...)
- dithering mode (can be used to extend PWM resolution)
- input triggers list
- new counter modes
- various bit-field updates
- power-domains property
Timer trigger identifier can be up to 19 (from timer 20)

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../bindings/mfd/st,stm32-timers.yaml          | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
index b0e438ff4950..66aa1550a4e5 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
@@ -21,7 +21,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-timers
+    enum:
+      - st,stm32-timers
+      - st,stm32mp25-timers
 
   reg:
     maxItems: 1
@@ -36,6 +38,9 @@ properties:
   resets:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   dmas:
     minItems: 1
     maxItems: 7
@@ -77,7 +82,9 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-pwm
+        enum:
+          - st,stm32-pwm
+          - st,stm32mp25-pwm
 
       "#pwm-cells":
         const: 3
@@ -113,7 +120,9 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-timer-counter
+        enum:
+          - st,stm32-timer-counter
+          - st,stm32mp25-timer-counter
 
     required:
       - compatible
@@ -128,12 +137,13 @@ patternProperties:
         enum:
           - st,stm32-timer-trigger
           - st,stm32h7-timer-trigger
+          - st,stm32mp25-timer-trigger
 
       reg:
         description: Identify trigger hardware block.
         items:
           minimum: 0
-          maximum: 16
+          maximum: 19
 
     required:
       - compatible
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
