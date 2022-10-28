Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29134611534
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 16:53:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBAEAC6410F;
	Fri, 28 Oct 2022 14:53:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11834C6410D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 14:53:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SDCi79013355;
 Fri, 28 Oct 2022 16:53:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=8PdcPXxidlHp2o41TdlLM3Nxlywt9jkYMVUfoBAn7Mo=;
 b=lWRxtqXpXdEYHctrNKj3M7VarZ3obgW67Rawbe7QrDbcw8beGpCkYbKafSqRscO2PY6P
 pmRTi3qEC58+iykjlwk8x1sKpPjehj+K6yBiie9ADmq2DSOEZfEPoR6PhbUaXrZtFbO6
 MZdUL4I5ZdLdOnQuFWYTC0o5qjKhGxkjyYh6qW20a9tp1hVK+WdffgnSbQkkVtjrIJhI
 0HGCeoREhNzLsZm1u0nTC4yG467VZB8W1tPVGOsTlz6v8RRqawx9TizlI4TG8sUV4Ucf
 FBag98HUT++jgjsikkc1+QZoS3scbRnsYfRFezm5cJwhU0vwl8KgVz2JjiGhwhpta+3b Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfahu5hyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 16:53:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0A71100038;
 Fri, 28 Oct 2022 16:52:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB7FA228A4F;
 Fri, 28 Oct 2022 16:52:59 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 16:52:59 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 28 Oct 2022 16:52:49 +0200
Message-ID: <20221028165150.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028145252.2115933-1-patrick.delaunay@foss.st.com>
References: <20221028145252.2115933-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: nvmem: add new stm32mp13
	compatible for stm32-romem
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

Add a new compatible for stm32mp13 support.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This patch is already sent separately in:
https://lore.kernel.org/all/20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid/
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=685403

I create a serie for more efficient review.

Patrick.

 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index 448a2678dc62..16f4cad2fa55 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - st,stm32f4-otp
+      - st,stm32mp13-bsec
       - st,stm32mp15-bsec
 
   reg:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
