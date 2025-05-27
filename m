Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7DAC4F42
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 15:06:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77318C36B1E;
	Tue, 27 May 2025 13:06:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0880EC36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:06:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCw4ft003897;
 Tue, 27 May 2025 15:06:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BqsmLtll0RdQ6R1NoZ+5laIhIOqbT81HDIchGbSKfvg=; b=OBI6jCmeomUSZJ0Q
 wvu+IpGj3aRys/aQO/hd2ELqET2er4NqEIOVl8KS2V2sq8BXguUP+IZPT/XjVtIR
 CSDC0gXKnrKo5KDwbdQP7nbV/xQI48AE7nbB7c5nQsquaVt1AvcUFN9E2TikWl+L
 B9o6PALNLM3Bj8TTPsC/zB0BB1waGkrZ+ODJrVeNCT3GCpJyGWITvUeqAYsQXN/Y
 h1P9XjulghssMfXRrWgoTzvf0O/vttdsVmvvjC8dfwKd1kds0wB30sJOUwK20GBs
 Hn1Q6HkT+XyqyUTGVVxyZMbq14m8czsDr91QsJJmJz2T5KxIgT8o8LDJvNY24AdX
 7hzcrQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk4ehf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 15:06:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5F97440049;
 Tue, 27 May 2025 15:04:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A806CAE07A5;
 Tue, 27 May 2025 15:03:49 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:49 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 27 May 2025 15:03:20 +0200
MIME-Version: 1.0
Message-ID: <20250527-stm32mp157f-dk2-v1-4-8aef885a4928@foss.st.com>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
In-Reply-To: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] dt-bindings: arm: stm32: add
 STM32MP157F-DK2 board compatible
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

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
bindings. The MP157F is functionally similar to the MP157C.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 408532504a24d5e570c738b16de30dcf8deead6a..ad144c02eb7edf4fc2191ab0af244342dcaa59d5 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -121,6 +121,7 @@ properties:
               - st,stm32mp157a-dk1-scmi
               - st,stm32mp157c-dk2
               - st,stm32mp157c-dk2-scmi
+              - st,stm32mp157f-dk2
           - const: st,stm32mp157
 
       - items:

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
