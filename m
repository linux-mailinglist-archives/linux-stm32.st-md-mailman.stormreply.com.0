Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD8A2F187
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 16:24:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18FECC78F95;
	Mon, 10 Feb 2025 15:24:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5445DC78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 15:24:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF0pQD016535;
 Mon, 10 Feb 2025 16:24:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DiM0ZzG7uNNFAbn/hDNlrq8MfNqbY2SLrREqoNaLbYo=; b=EvfaBqNs72dEZb0o
 xXjFnYm9ie3BK7Dst/qhkQIavuNCWA+5WmET5fyv0FHzd5hHYaLUxnJmE2CIU0uK
 P91PLy9XF9PLQuGXTxO7RFklU5nsQB+Teti3WZQrM1QEycDleHDZ+TP/i41M5Vvu
 i+34oZfxylTv8hE07sm6AaKkNUR25dS0r/rcmRsuv0d8OiXl81JLxLEF/OvS3sBl
 o+EYILerog3t9bpsxiLR/wuJs8HSSDZd04AElpvXYFc2F0CbabHb4MtYcTQpC675
 94Uj1uuMJ7n91YAaseXNetKhuNQ5wFH7Y9hfrbFPUgataACz/a5qtiAxzj9k/Ktu
 v+9BhA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0rhy5t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 16:24:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9632B40064;
 Mon, 10 Feb 2025 16:23:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 436E62957B7;
 Mon, 10 Feb 2025 16:21:43 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 16:21:43 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 10 Feb 2025 16:21:03 +0100
MIME-Version: 1.0
Message-ID: <20250210-b4-stm32mp2_new_dts-v1-9-e8ef1e666c5e@foss.st.com>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/10] dt-bindings: stm32: document
	stm32mp215f-dk board
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

Add new entry for stm32mp215-dk board.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 9ffcba51c9207b5a1386c025f850bc594c915c8c..9db52e5d09ac1d963e79bd937eef6cb33313f343 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -190,6 +190,12 @@ properties:
               - st,stm32mp235f-dk
           - const: st,stm32mp235
 
+      - description: ST STM32MP215 based Boards
+        items:
+          - enum:
+              - st,stm32mp215f-dk
+          - const: st,stm32mp215
+
 additionalProperties: true
 
 ...

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
