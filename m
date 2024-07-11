Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE492EA54
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2024 16:10:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29785C78015;
	Thu, 11 Jul 2024 14:10:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11EFBC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2024 14:10:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BCJiJS009460;
 Thu, 11 Jul 2024 16:09:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lYUe4BXqaxcflvV9pGN2Kkg+72W7m8eAJ71XqyZC7W4=; b=UDtVcWrmux+Wnv7C
 t8xVRd3nfAMVoXmta1OA1PMu4bBNIicUd3Z8dEuNuBk3i8fr2sLoweY128tdAigh
 i89zV/ETdUaJweDLsi73u/M1E6WslqR1iCkj0vzVeFGi6jPjKPaWREeAzXwjJ8He
 Fz/48J0dhi2NKKX7zzswwyfTxq60APeMuIR07/5VawNcs/zummUgkhskgAsUaYlb
 vwx3orNJPHm3aERVZjAV5cry9a+cGVFXUqDswm0utMpiWp3vSZbJWtVgYRMT52xJ
 9sXuKkKKBFRz080aQASZ8PLi7T2R0C0PG4AfcDIRVsTNS7GkFmf0fMhf5ny2/NiP
 QUZyjQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406wqtnjur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2024 16:09:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9732F40044;
 Thu, 11 Jul 2024 16:09:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 964A323D408;
 Thu, 11 Jul 2024 16:08:58 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jul
 2024 16:08:58 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 11 Jul 2024 16:08:40 +0200
Message-ID: <20240711140843.3201530-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711140843.3201530-1-valentin.caron@foss.st.com>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_10,2024-07-11_01,2024-05-17_01
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: rtc: stm32: describe pinmux
	nodes
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

STM32 RTC is capable to handle 3 specific pins of the soc (out1, out2,
out2_rmp) and to outputs 2 signals (LSCO, alarm-a).

This feature is configured thanks to pinmux nodes and pinctrl framework.
This feature is available with compatible st,stm32mp1-rtc and
st,stm32mp25-rtc only.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
index 7a0fab721cf1..09221c2f8a0c 100644
--- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
@@ -53,6 +53,28 @@ properties:
       override default rtc_ck parent clock phandle of the new parent clock of rtc_ck
     maxItems: 1
 
+patternProperties:
+  "^rtc-[a-z]*-[0-9]+$":
+    type: object
+    $ref: /schemas/pinctrl/pinmux-node.yaml
+    description: |
+      Configuration of STM32 RTC pins description. STM32 RTC is able to output
+      some signals on specific pins:
+      - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
+      - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
+        expires.
+    additionalProperties: false
+    properties:
+      function:
+        enum:
+          - lsco
+          - alarm-a
+      pins:
+        enum:
+          - out1
+          - out2
+          - out2_rmp
+
 allOf:
   - if:
       properties:
@@ -68,6 +90,9 @@ allOf:
 
         clock-names: false
 
+      patternProperties:
+        "^rtc-[a-z]*-[0-9]+$": false
+
       required:
         - st,syscfg
 
@@ -83,6 +108,9 @@ allOf:
           minItems: 2
           maxItems: 2
 
+      patternProperties:
+        "^rtc-[a-z]*-[0-9]+$": false
+
       required:
         - clock-names
         - st,syscfg
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
