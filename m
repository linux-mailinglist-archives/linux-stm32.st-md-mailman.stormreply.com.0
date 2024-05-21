Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 086738CAE34
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 14:29:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FA9DC7128D;
	Tue, 21 May 2024 12:29:01 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63C36C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 12:28:54 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBRnpJ009370;
 Tue, 21 May 2024 14:28:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=h/BYe+IPvwEdayQFcr9F2QpoCjyH9+vL5tKaqvoGH2Q=; b=oW
 1QKXXA5SAzH+Np5FqnBi7VjfTgHeS4QuRxGg/fG5M9FF5JItX35VcZu5eER7xX6j
 5qNLfm+Y+YhQwlNDyN+Mrvszwjc1B5/XFmyBRz+qTzGKYT4FzZFjBZztEO9o4T1Q
 RW1szXk7y+6Imz475/2A76lB6PQBpbtv8OcANbTQyVImIOqk8MiXtaV3lrWUs3YS
 LIc5bQqFpBL3Vgkq9fPmt9asEHb39dRfiMgpQc0k6OK+YVHk2Asx7fXnHTrL5trE
 bzwnuX/K/GrbpSPqHUSo4xpG3uLyr4Pnqs+C2XedqGuvc5V+YIqfxRn2znCLPg7Z
 w6CTRuSxBpVSOGr7sQrQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y779hsnyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 14:28:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6A5664004A;
 Tue, 21 May 2024 14:28:38 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4964C2138D8;
 Tue, 21 May 2024 14:27:48 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:48 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:47 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 21 May 2024 14:24:54 +0200
Message-ID: <20240521122458.3517054-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
References: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v5 3/7] dt-bindings: remoteproc: Add
	processor identifier property
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

Add the "st,proc-id" property allowing to identify the remote processor.
This ID is used to define an unique ID, common between Linux, U-boot and
OP-TEE to identify a coprocessor.
This ID will be used in request to OP-TEE remoteproc Trusted Application
to specify the remote processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 36ea54016b76..409123cd4667 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -48,6 +48,10 @@ properties:
           - description: The offset of the hold boot setting register
           - description: The field mask of the hold boot
 
+  st,proc-id:
+    description: remote processor identifier
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   st,syscfg-tz:
     deprecated: true
     description:
@@ -182,6 +186,8 @@ allOf:
         st,syscfg-holdboot: false
         reset-names: false
         resets: false
+      required:
+        - st,proc-id
 
 additionalProperties: false
 
@@ -220,6 +226,7 @@ examples:
       reg = <0x10000000 0x40000>,
             <0x30000000 0x40000>,
             <0x38000000 0x10000>;
+      st,proc-id = <0>;
       st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
       st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
