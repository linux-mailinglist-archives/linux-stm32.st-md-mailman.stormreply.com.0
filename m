Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A2E2938C0
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 12:02:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06088C424BC;
	Tue, 20 Oct 2020 10:02:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC5A5C424B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 10:02:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09K9ltBt010505; Tue, 20 Oct 2020 12:02:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2owaOvNvhateHf+UNIaUTPpoUGANl3taLAS8bX1HmYA=;
 b=y5/K+sqDf2jvCUc0JDFJK1D3QpFkwEDizFsKRSsmjHAcSvjVKZL1RoF4hRHSh1RZqBBp
 iqaMJrmTfiTpdbQ7N7N2/AE2KrdyNRV13Mype0VF7sYLNoqagj6rjj5N7aNR1Ya9EiNK
 Otk9IwpEC+NeVD0KySgTmQqaAW/1oCGCf5RLCK8TuSklR+GAz44m6cQZqSuI1Net9Oji
 NNxy1T7NIbCxC7xw/Il5MHmYL3NkNSi71jYMjtSYmCqA7PTLt9msElxUw+rWKYk5g1yW
 yTF9ViEe2t4zzd3TH0dMASWJJf53J3/19LmOMFt00Uzxf6VqR6Q3ncivYzqZWhJgxcOC Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcwsuyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 12:02:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35EE410002A;
 Tue, 20 Oct 2020 12:02:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E2692C41F8;
 Tue, 20 Oct 2020 12:02:37 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 12:02:36
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Oct 2020 12:02:32 +0200
Message-ID: <1603188152-22783-3-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603188152-22783-1-git-send-email-hugues.fruchet@st.com>
References: <1603188152-22783-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-20_04:2020-10-20,
 2020-10-20 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>, Alain Volmat <alain.volmat@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 2/2] media: dt-bindings: media: st,
	stm32-dcmi: Add support of BT656
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

Add support of BT656 parallel bus mode in DCMI.
This mode is enabled when hsync-active & vsync-active
fields are not specified.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 3fe778c..1ee521a 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -44,6 +44,36 @@ properties:
       bindings defined in
       Documentation/devicetree/bindings/media/video-interfaces.txt.
 
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          bus-width: true
+
+          hsync-active:
+            description:
+              If both HSYNC and VSYNC polarities are not specified, BT656
+              embedded synchronization is selected.
+            default: 0
+
+          vsync-active:
+            description:
+              If both HSYNC and VSYNC polarities are not specified, BT656
+              embedded synchronization is selected.
+            default: 0
+
+          pclk-sample: true
+
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+
+        additionalProperties: false
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
