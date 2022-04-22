Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F89150BB47
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 17:11:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E904EC628AC;
	Fri, 22 Apr 2022 15:11:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2522DC628A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 15:11:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23MEpQ1B028200;
 Fri, 22 Apr 2022 17:11:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=biv2CiCx22xakTMtFGlV8OZK5eeEjdPdtT+GUmPZKd0=;
 b=OBIuhDTXIGP9F5wbmZrPoVvQpwpR17h1o/ax0cSf+aHCJo9onD5qovyBooETKte+U7cF
 kkM+jyZ+NsBKlqGwnwBfOIHAMxuAe+QdE0KHJf7K1rHYlN9HdNgJ/S1wEXAwfuCup6Q9
 BXd5Y8pocf0jnerUv/NFMQm/+Nvvlss0zTWIDoYLqewmQro3/UXWS6GQJlE2Ko3LINpQ
 ahoySwqHzAL3+qWyPr9h8f0bG+mnSL5skfYfN5ebwW5p1J9U/YPjmuy75z4FDO5Pkmow
 2p7ydx6VHx9VZDevu5GtL80i27rzzJPC2zaUSFUdr9xXN6GlkmJgmaV07WzT25dm0oDl 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fkskgt1we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 17:11:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94FCF10002A;
 Fri, 22 Apr 2022 17:10:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E49A233C64;
 Fri, 22 Apr 2022 17:10:58 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 17:10:58 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 22 Apr 2022 17:09:51 +0200
Message-ID: <20220422150952.20587-8-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_04,2022-04-22_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, etienne.carriere@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/8] dt-bindings: arm: stm32: Add SCMI version
	of STM32 boards (DK1/DK2/ED1/EV1)
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

Add a "secure" version based on SCMI of STM32 boards. Only boards
provided by STMicroelectronics are concerned:

-STM32MP157A-DK1
-STM32MP157C-DK2
-STM32MP157C-ED1
-STM32MP157C-EV1

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index fa0a1b84122e..4a3d66da0f1c 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -75,6 +75,23 @@ properties:
 
           - const: st,stm32mp157
       - items:
+          - const: st,stm32mp157a-dk1-scmi
+          - const: st,stm32mp157a-dk1
+          - const: st,stm32mp157
+      - items:
+          - const: st,stm32mp157c-dk2-scmi
+          - const: st,stm32mp157c-dk2
+          - const: st,stm32mp157
+      - items:
+          - const: st,stm32mp157c-ed1-scmi
+          - const: st,stm32mp157c-ed1
+          - const: st,stm32mp157
+      - items:
+          - const: st,stm32mp157c-ev1
+          - const: st,stm32mp157c-ed1
+          - const: st,stm32mp157
+      - items:
+          - const: st,stm32mp157c-ev1-scmi
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
