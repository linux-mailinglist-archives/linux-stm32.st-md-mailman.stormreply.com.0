Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF2234557
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:11:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83DC9C36B3F;
	Fri, 31 Jul 2020 12:11:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 317B6C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 12:11:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VC8jY3011686; Fri, 31 Jul 2020 14:11:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=OZnA7Vh3xkosB30guDpBIGnTonRyj7uk9V403xtYngQ=;
 b=oM8FtIIasffy9rSAsUIXHpVy6J08DS5qMNveO8tOlpdle2xahIwhc76JTE7Nv/pXp8vL
 2h8LHQczCfF7FEqJAfmo80TNI43X3HnwkPnLKV6VWud445nsgSTQcUnNXhNORy48rB8s
 6jCgU3DqANV60yBKCc4yCyiM6NQ8wPiBXX0PW4pYyppn46T2Ncik6dYU3wYVuBVkuFka
 sRLiZ/vHkPzeAtkkmL5BjXroNSibOQX+TjM9erxNWImyGH68JJUhzkGsEsRs8vPS7o22
 TrfjZA0qM1DfFir69QPvQcu7C8f7KsM6e05Bo0mWzYLD4IXmtFQhJ3S7heJajHkjH5KO 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga72dcb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 14:11:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7EE310002A;
 Fri, 31 Jul 2020 14:11:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD2F32AE6DD;
 Fri, 31 Jul 2020 14:11:05 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:11:05
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 14:10:35 +0200
Message-ID: <20200731121043.24199-6-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121043.24199-1-arnaud.pouliquen@st.com>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 05/13] rpmsg: uapi: add service param for
	create destroy ioctls
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

To allow to associate an endpoint creation to a service, add
a new parameter in rpmsg_endpoint_info struct.
For each RPMsg service driver that want to support the ioctl interface
a new service will have to be added.
The  RPMSG_START_PRIVATE_SERVICES is used to allow developer to add is
own services with ID higher or equal to 1024.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 include/uapi/linux/rpmsg.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index e14c6dab4223..2ccc10ffacd4 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -9,16 +9,32 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/**
+ * enum rpmsg_services - list of supported RPMsg services
+ *
+ * @RPMSG_RAW_SERVICE: char device RPMSG service
+ * @RPMSG_START_PRIVATE_SERVICES: private services have to be declared after.
+ */
+enum rpmsg_services {
+	/* Reserved services */
+	RPMSG_RAW_SERVICE =  0,
+
+	/* Private services */
+	RPMSG_START_PRIVATE_SERVICES =  1024,
+};
+
 /**
  * struct rpmsg_endpoint_info - endpoint info representation
  * @name: name of service
  * @src: local address
  * @dst: destination address
+ * @service: associated RPMsg service
  */
 struct rpmsg_endpoint_info {
 	char name[32];
 	__u32 src;
 	__u32 dst;
+	__u32 service;
 };
 
 #define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
