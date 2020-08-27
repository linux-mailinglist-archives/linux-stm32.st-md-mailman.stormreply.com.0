Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91073253EDC
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 09:21:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E016C3FADF;
	Thu, 27 Aug 2020 07:21:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8EE6C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 07:21:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R7Ivpf016719; Thu, 27 Aug 2020 09:21:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XwGmwMIIYdrDy6Y3ICeaN4bEoGRK+NWOLS2IGOw0OWc=;
 b=PikdmGCXuf7CNVzwK0fV6c7F5+1Q9N2ZnOstbnPwNTR8T8R8TzGvjIC+VM7lrwKzc0ub
 e4SsQKuuQU2xdl1/n5mJqWZbCeFIrKFi/C3Uz1di1/M8CMcaRivbR2yfHiCAmvcp4bn7
 MiiJuFe6QCYflwT91ST5BcvaMANTbeUuHtKZTUfwkeISd5bqnYTnkBqPWxO7g+O8lTXe
 OmxEP9zsIigBHrziMjTl8vpBCX0R6yxGfJG6vhJKTp6N2BlSwpUqJKdftweX2BgGaJzJ
 uaGEcDmcizvDXkQgAgSpW4OK8/zos2XL/9Qrv6QZ0WGfjYS8dF14wAQbgtPptK54yPg6 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b6xcfeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 09:21:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 681B010002A;
 Thu, 27 Aug 2020 09:21:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57838212648;
 Thu, 27 Aug 2020 09:21:20 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Aug 2020 09:21:19
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Thu, 27 Aug 2020 09:21:00 +0200
Message-ID: <20200827072101.26588-3-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827072101.26588-1-arnaud.pouliquen@st.com>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: remoteproc: stm32_rproc:
	update for firmware synchronization
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

Add new properties description used to attach to a pre-loaded
firmware according to the commit 9276536f455b3
("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
which updates the driver part.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 4ffa25268fcc..e50957d86b1c 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -96,6 +96,25 @@ properties:
         3rd cell: register bitmask for the deep sleep bit
     maxItems: 1
 
+  st,syscfg-m4-state:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Reference to the tamp register which exposes the Cortex-M4 state.
+        1st cell: phandle to syscon block
+        2nd cell: register offset containing the Cortex-M4 state
+        3rd cell: register bitmask for the Cortex-M4 state
+    maxItems: 1
+
+  st,syscfg-rsc-tbl:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Reference to the tamp register which references the Cortex-M4
+      resource table address.
+        1st cell: phandle to syscon block
+        2nd cell: register offset containing the resource table address
+        3rd cell: register bitmask for the resource table address
+    maxItems: 1
+
   st,auto-boot:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
