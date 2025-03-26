Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C56A712E9
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 09:43:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECCE2C78F74;
	Wed, 26 Mar 2025 08:43:13 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4078C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 08:43:10 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q7YPIE019497;
 Wed, 26 Mar 2025 09:42:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tjQ6jzp5petaGXfP90uNsQR+cc1MZ23TGQzGVRHgV0E=; b=kZtf6gQth6RK04zU
 1OQPPLmEdGqZICiwIrbCfRTqLX5vuWf7hLrbXnfQOG9FVTqovq87y3Pe0JuKvqNF
 kC7DmoL/H5DVauLclCJcplVXEWkNRh5XbsNd/yEkOzgTsQCYhnAej5nDsZ1v+rja
 kF4XkCSnV0k1q1Dcw3KpHnH1aSScCj6SiYmKt7sZd/qVQfFmwCJvZ9ZQfuUXtD7E
 6fIIWAkkn9EBjC3rBuGU1Dkrt1YuK/A2AAJi3kPHJ0DHsPZJCwmekp8G5ZfkRZOy
 KLdTDiEHCHXLGcGJ75oTwrnNIgugBj/TMEoXqflWLgJg405XOGkH6NMK9LixN9iQ
 +OcihQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j91se31e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Mar 2025 09:42:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A138340053;
 Wed, 26 Mar 2025 09:41:50 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 048BF87F424;
 Wed, 26 Mar 2025 09:40:02 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 26 Mar 2025 09:39:11 +0100
Message-ID: <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
References: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc: Add
	firmware-name property
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

Add the 'firmware-name' property to the remote processor binding
to allow specifying the default firmware name in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 370af61d8f28..a0a16bfe8ef7 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -139,6 +139,11 @@ properties:
       If defined, when remoteproc is probed, it loads the default firmware and
       starts the remote processor.
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    maxItems: 1
+    description: Default name of the remote processor firmware.
+
 required:
   - compatible
   - reg
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
