Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC4A7A2DB
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 14:30:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08CB4C7A824;
	Thu,  3 Apr 2025 12:30:32 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A53CC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 12:30:30 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BhN8I024322;
 Thu, 3 Apr 2025 14:30:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lRxQoHQhjdUnPqTUWaWYCnnyELWrrYam5NAxpHrT/bo=; b=ql/0Ll0nMHB9EhBx
 VS7h0VDdwjdZU2/vpW4ig7Nf4oUO9S6aNJ34ZCuMpePQwIGgs5jpw07RCwO/WqNi
 rSSZOsxZqvbCmkll24h1zz8phU+w7/+BViYyv1Jpq8Bvpb15bcVM5ERgPpxQavrF
 KFgpJy34jRA0QwpS1Wect7YaaqRSPPEPD9llPWMmyKRqPufGOWi+25wkPfcdxv1/
 i8IwmZXk3fw2JCkZAo96WmCD10mSqLe+w7qx3CT6nEjOjxLQ+WrpHTiC+yLiupj8
 jgUqC+3NKyKrR6VOFSspvBCcxDUZrMJafjXQca0/zGiqYWoosMG5VkD3ir1xgmsV
 ZjrMGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7eey9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Apr 2025 14:30:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51E5240044;
 Thu,  3 Apr 2025 14:29:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 768688EECA1;
 Thu,  3 Apr 2025 14:28:31 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:28:31 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Thu, 3 Apr 2025 14:28:03 +0200
Message-ID: <20250403122805.1574086-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403122805.1574086-1-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
Cc: devicetree@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: interrupt-controller: arm,
	gic: Add st, stm32mp2-cortex-a7-gic
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

Add st,stm32mp2-cortex-a7-gic compatible to support remapping of GICC_DIR

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 7173c4b5a228..7ea7224b2f36 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -37,6 +37,7 @@ properties:
               - arm,tc11mp-gic
               - qcom,msm-8660-qgic
               - qcom,msm-qgic2
+              - st,stm32mp2-cortex-a7-gic
 
       - items:
           - const: arm,gic-400
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
