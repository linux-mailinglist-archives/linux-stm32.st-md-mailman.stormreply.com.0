Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72430EEBB
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Feb 2021 09:46:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37835C57B55;
	Thu,  4 Feb 2021 08:46:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C0EAC57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Feb 2021 08:46:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1148gsTF032626; Thu, 4 Feb 2021 09:45:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=IPqrA+0wfHhQex79RSmm7LZLR2H7pk7oVoPGvP6Zwng=;
 b=Fw4EfeDx7lmvVGGxUfcTLRAFAAWzfcmWAefXa/G6zjBBSs6H90njXsKVcUt5aAX00Br2
 pFj/mNRWe4uUZlHIJhtaJY39r08FiGcKPKni43L3HxVCmzmXhw7YCQHSSeD/Zo19/za2
 +phYiLRHGZUtvhezpEeD2spXrfJhKNodtHtjwb3FAmNMAqPwsipRaWBQnlNPg4ltPgx6
 5iWXU3EYenpvTDqWPbH94iGHZ+XLp04l25xdQpeiiUAsH8wurUcvvMJ+UwQvutW2dGeJ
 JrgWZITBab4ekLxGN9X7jyDmPPmyD134A6yX87kxC9mibjFhWp6heXFExq2z2lO8ikhA OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0ns6pr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 09:45:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C768F100034;
 Thu,  4 Feb 2021 09:45:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA1A322AE46;
 Thu,  4 Feb 2021 09:45:58 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:45:58
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Thu, 4 Feb 2021 09:45:21 +0100
Message-ID: <20210204084534.10516-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 02/15] rpmsg: move RPMSG_ADDR_ANY in user
	API and document the API
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

Add a short description of the user IO controls. As the RPMSG_ADDR_ANY
is a valid src or dst address, migrate its definition to be
able to add it in description.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 include/linux/rpmsg.h      |  3 +--
 include/uapi/linux/rpmsg.h | 13 +++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index a5db828b2420..d97dcd049f18 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -18,8 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/poll.h>
 #include <linux/rpmsg/byteorder.h>
-
-#define RPMSG_ADDR_ANY		0xFFFFFFFF
+#include <uapi/linux/rpmsg.h>
 
 struct rpmsg_device;
 struct rpmsg_endpoint;
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index e14c6dab4223..f5ca8740f3fb 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -9,11 +9,13 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+#define RPMSG_ADDR_ANY		0xFFFFFFFF
+
 /**
  * struct rpmsg_endpoint_info - endpoint info representation
  * @name: name of service
- * @src: local address
- * @dst: destination address
+ * @src: local address. To set to RPMSG_ADDR_ANY if not used.
+ * @dst: destination address. To set to RPMSG_ADDR_ANY if not used.
  */
 struct rpmsg_endpoint_info {
 	char name[32];
@@ -21,7 +23,14 @@ struct rpmsg_endpoint_info {
 	__u32 dst;
 };
 
+/**
+ * Instantiate a new rmpsg char device endpoint.
+ */
 #define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
+
+/**
+ * Destroy a rpmsg char device endpoint created by the RPMSG_CREATE_EPT_IOCTL.
+ */
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
 #endif
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
