Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7551BE29
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 13:37:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BED1C5F1FB;
	Thu,  5 May 2022 11:37:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46824C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 11:37:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458mitx001510;
 Thu, 5 May 2022 13:36:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Gbmbcgct1Jm9JW83im3dnwN0LJApetjGCItrRiQ0NAQ=;
 b=DrZPztefIEMJn64835cOx3zys4xlhvm1siVkaDy7frxYasu4meM1GrK11Lv3nUImHZyF
 ZwZuu2xr4fyrNLCJtM4hd2YvBWfyPLeqfsKte+QSfStJWZNt6IkZpJS7fvDWfnZ8d211
 M8Jv9KM0HzOUDHhT/oRMn3fnjqpstGy7nTJWshxqjzreKdbRO5iE1lB57XA/wAII7WbA
 4Nc7X0ycHne1q1WPwU0VGlxV7me6N+I4Xuhkz6tzFmELiAyAAKebdCjTyjOgW2wsGKU4
 Qr4JnMVBgXVgzPVvAaxEJMajhh8pcZ48lTlBE/sC/N4GLfzqnOr0YE/DAFb6bExz1HUC sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0gk8mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 13:36:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75F1010002A;
 Thu,  5 May 2022 13:36:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A7C721A23B;
 Thu,  5 May 2022 13:36:53 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 5 May 2022 13:36:52
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 5 May 2022 13:36:39 +0200
Message-ID: <20220505113639.1344281-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: remoteproc: st,
	stm32-rproc: Fix phandle-array parameters description
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
