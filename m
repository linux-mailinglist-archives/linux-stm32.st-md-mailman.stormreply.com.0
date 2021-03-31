Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1534FA55
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 09:35:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3FE9C57B5E;
	Wed, 31 Mar 2021 07:35:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D26AC57B60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 07:35:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12V7W6Kq000671; Wed, 31 Mar 2021 09:35:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=IeHxfLmsaKojnEfoxgRyw8CnxhiIhINNKvdtNDXRh1k=;
 b=o9ldYfFQSf1wRLYJyaoZyoxFmrHKexf8eDFgsp+vK4/rlqzg0ex+9G3uwQpVF1LBYpZA
 zIFWjo0eEFYvx3FU2614I9IqFnN9E9zQOYor5uVNuiYq5JvK3roJBb2dyvar5hxTrPLp
 amhLto3FWhLdnXVjrx+krd3H0qTR1DhZzvumXwyO2neDcogOc3KGOdTYyfrZvZoKJ1RI
 km+pYSqNOA8fr9a7+02CWhxudnx0a7ZOXpwpgDOgr6tHenytkPeNRFYWaIzCvJFQxQCp
 O7TVpnlhaJeRjAQxiKJWazlcG4ZpFIhWHPx3LOUHusq5CW4gU6guG3V1oeb516IcpZYC 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37maa2jvga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 09:35:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6010100034;
 Wed, 31 Mar 2021 09:35:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5B9F224823;
 Wed, 31 Mar 2021 09:35:28 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 09:35:28
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 31 Mar 2021 09:33:46 +0200
Message-ID: <20210331073347.8293-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
References: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_01:2021-03-30,
 2021-03-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/2] dt-bindings: remoteproc: stm32-rproc:
	add new mailbox channel for detach
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

Add the "detach" mailbox item, that allows to define a mailbox to
send a IPCC signal to the remote processor on remoteproc detach action.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index a1171dfba024..64afdcfb613d 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -65,16 +65,23 @@ properties:
           Unidirectional channel:
             - from local to remote, where ACK from the remote means that it is
               ready for shutdown
+      - description: |
+          A channel (d) used by the local proc to notify the remote proc that it
+          has to stop interprocessor communnication.
+          Unidirectional channel:
+            - from local to remote, where ACK from the remote means that communnication
+              as been stopped on the remote side.
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   mbox-names:
     items:
       - const: vq0
       - const: vq1
       - const: shutdown
+      - const: detach
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   memory-region:
     description:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
