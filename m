Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E95C28E0C5
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 14:55:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17D44C424BA;
	Wed, 14 Oct 2020 12:55:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29211C32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 12:55:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09ECr9no003174; Wed, 14 Oct 2020 14:55:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jPr7oz6V/C/0BCEXLC3ve38DWAGIvboOAC9KbnxfjRg=;
 b=FADOcfjh94aoXJOAUwU11FS9n2wTKyglNEX1KyRCI6gxkZOAUInXdcIxhR+xUoYOnH/k
 dCKuZwwTkBbRsbPGlzWb0bgMkMsrBn5PcX4VWtbLYHilekkHdOkewdSGBw7gDyYobXdD
 ctgOgS0SqyOrkUazbpjbM7ThiZzvF43Ys3wp1x9XKNo7axj8iY90N7taDJWh9NeqBvP/
 GmSS2VNxrB/GwVGDqkSehm/ZxoAApFqcNoIuRInAqAc4ZC9tfUS7UrPQM19f2wrvRmj6
 C1IrfwwxxirRfV/K2Y9mqPCPXjYwoRgISZJLatfv5cbe+zBTfzI+LUU0q1q/whWN2tPp 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356edsr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 14:55:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E092810002A;
 Wed, 14 Oct 2020 14:55:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1AC82DA52A;
 Wed, 14 Oct 2020 14:55:11 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 14:55:11
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed, 14 Oct 2020 14:54:39 +0200
Message-ID: <20201014125441.2457-3-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_07:2020-10-14,
 2020-10-14 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] dt-bindings: remoteproc: stm32_rproc:
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
 .../bindings/remoteproc/st,stm32-rproc.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 4ffa25268fcc..3207942d51bf 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -96,6 +96,19 @@ properties:
         3rd cell: register bitmask for the deep sleep bit
     maxItems: 1
 
+  st,syscfg-m4-state:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Reference to the tamp register which exposes the Cortex-M4 state.
+    maxItems: 1
+
+  st,syscfg-rsc-tbl:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Reference to the tamp register which references the Cortex-M4
+      resource table address.
+    maxItems: 1
+
   st,auto-boot:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -122,6 +135,8 @@ examples:
       resets = <&rcc MCU_R>;
       st,syscfg-holdboot = <&rcc 0x10C 0x1>;
       st,syscfg-tz = <&rcc 0x000 0x1>;
+      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
 
 ...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
