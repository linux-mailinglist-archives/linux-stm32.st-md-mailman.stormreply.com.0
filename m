Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696615965D
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 18:42:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20D58C36B0B;
	Tue, 11 Feb 2020 17:42:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E77BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 17:42:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BHgTGa007804; Tue, 11 Feb 2020 18:42:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5FnBHOfltD6Qnn+JdMECbmym6xkAwyRT+poCX9qSXpk=;
 b=EfWDfiF2Z1twdIY3AZEm6D9aTwLRMg+NxwTPBNDzh9vWp/ZdDSc7LC1HbG21PVKhB/qQ
 ii6H9nSA+CxHHtE4GByDod87XtScWCoVevrJGMIg+RayuXku5CoB51L4ytAIScjPfAKW
 9xxxKsULZgXGJM52FG7tOP4o7r3ymCAHAWZTqDFO47pwCWwq4WTuH5O7aHUs27MKfnG/
 aZ1NMKL5A8pVI5p8vkuW/mHMigdYJybHP0jTWPrq/tJyqTicQiYE2TdQ2uOEPIl3N5O2
 X4mNyuxIzS273RmHF30imWpaVeI2kudBVug3Ge6SSgB0McdShgN00dLY80DLR2jGrvqe Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufh7pk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 18:42:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02B3F10002A;
 Tue, 11 Feb 2020 18:42:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8D322C8E8C;
 Tue, 11 Feb 2020 18:42:39 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb 2020 18:42:39
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>
Date: Tue, 11 Feb 2020 18:42:05 +0100
Message-ID: <20200211174205.22247-4-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211174205.22247-1-arnaud.pouliquen@st.com>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_05:2020-02-10,
 2020-02-11 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 3/3] dt-bindings: remoteproc: stm32: add
	syscon bindings preloaded fw support
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

Add the optional syscon property that points to the resource table
address and the state of the Cortex-M4 firmware loaded by the bootloader.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index c0d83865e933..3947ddaca891 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -46,6 +46,27 @@ properties:
       - The field mask of the RCC trust zone mode.
     maxItems: 1
 
+  st,syscfg-copro-state:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      Reference to the system configuration which returns the coprocessor state.
+      - Phandle of syscon block.
+      - The offset containing the coprocessor state.
+      - The field mask of bitmask for the coprocessor state.
+    maxItems: 1
+
+  st,syscfg-rsc-tbl:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      Reference to the system configuration controlling the
+      resource table address loaded by the bootloader
+      - Phandle to syscon block.
+      - The offset of the register containing the resource table address.
+      - The field mask for the resource table address.
+    maxItems: 1
+
   interrupts:
     description: Should contain the WWDG1 watchdog reset interrupt
     maxItems: 1
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
