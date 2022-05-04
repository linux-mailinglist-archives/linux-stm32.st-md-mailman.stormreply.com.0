Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1420519C13
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 11:42:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8542AC6047D;
	Wed,  4 May 2022 09:42:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18E88C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 09:42:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446C7E6018201;
 Wed, 4 May 2022 11:42:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RSjmW4IjUGZ/bQ/two1rZ1aHlJIVLGx+97yQ1s1zd4A=;
 b=JkwE7esC89R64iqYz9q+1Wyv3tHA6csHuhH/W/gaRAX4Y4FkcHsPpLsJVGsDP/PlPKM/
 x9vw1JMYyrXVDV9S09ff5LYhUicrDOW6+K3cQBxgnbSDZpclUUCtS6E95K2nqCMsB8kd
 oNhtKpfAN/o5Pz+bvMomqiEq914ff0Xua2ygEjgPbfRo+1CyZG3pZ4at1lwo4bkwQriP
 BuDMchsW0nD6qgsqFBdJtBTjBQJ+Lv1NohNy40Mqirl3ETJko6qrt3ga/eYgSSQO3OaU
 GdZVkGDZQSk+PB7VCzWl7HFBGv759H0xXjPQF+KSRf3wmloGoyd1RP0xLJXbXUy5q15a rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthjubws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 11:42:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28C9610002A;
 Wed,  4 May 2022 11:41:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 114BE216EE0;
 Wed,  4 May 2022 11:41:58 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May 2022 11:41:57
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 4 May 2022 11:41:43 +0200
Message-ID: <20220504094143.1272200-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_03,2022-05-02_03,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: remoteproc: Fix phandle-array
	parameters description
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

Replace the FIXME by appropriate description.

Fixes: 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index be3d9b0e876b..da50f0e99fe2 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -43,8 +43,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the trust zone setting register
+          - description: The field mask of the trust zone state
 
   interrupts:
     description: Should contain the WWDG1 watchdog reset interrupt
@@ -101,8 +101,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the power setting register
+          - description: The field mask of the PDDS selection
 
   st,syscfg-m4-state:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
@@ -111,8 +111,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block with the tamp register
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the tamp register
+          - description: The field mask of the Cortex-M4 state
 
   st,syscfg-rsc-tbl:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
@@ -122,8 +122,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block with the tamp register
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the tamp register
+          - description: The field mask of the Cortex-M4 resource table address
 
   st,auto-boot:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.24.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
