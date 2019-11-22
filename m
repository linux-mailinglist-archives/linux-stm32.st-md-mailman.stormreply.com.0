Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A945107289
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 13:55:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADEEEC36B0B;
	Fri, 22 Nov 2019 12:55:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 500BFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 12:55:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMCkwcB028665; Fri, 22 Nov 2019 13:54:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bxiuTK+x3oPhnDKBKfKRJ01+VjbhWxaGagP881Oi19M=;
 b=HK7+USpsxZtqvR/TzymAPqh+iPDWPjX/+6rVTEImlPygNpUxuKwqo78AErKac93eyX1w
 T7zAUyTazpQG53YjdL4mN+aRCLv+tXu9G1vIFOPe18+VHI5CzOB1ssGH7bD2si4W1899
 A5eq/oFIL1QCW0mcouyDbja1yUfzAmj1SOjiHwFp2cbf07kYQO0PanywDdem6NQTh0e+
 CEV0tXdVRhU/dUk5jAyDDJ1naaORANUDwLAKCw/WAPS8Z480WkQV/z0w/N9F3vqp1Kno
 Jep5OJod/jXS5RaHF/QAIJfn61DwF5uCQqXoxKVmYUm9MxzEs8l4kr48kUVGpXoGDdqK ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usrue0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 13:54:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C67E110002A;
 Fri, 22 Nov 2019 13:54:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99C1E2BD314;
 Fri, 22 Nov 2019 13:54:34 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Nov 2019 13:54:34
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Date: Fri, 22 Nov 2019 13:54:02 +0100
Message-ID: <20191122125402.14730-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_02:2019-11-21,2019-11-22 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: remoteproc: stm32: add
	wakeup-source property
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

If the optional wdg interrupt is defined, then this property
may be defined.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
This commit is related to the merge conflict issue reported by
Stephen Rothwell: https://lkml.org/lkml/2019/11/21/1168
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index acf18d170352..c0d83865e933 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -50,6 +50,8 @@ properties:
     description: Should contain the WWDG1 watchdog reset interrupt
     maxItems: 1
 
+  wakeup-source: true
+
   mboxes:
     description:
       This property is required only if the rpmsg/virtio functionality is used.
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
