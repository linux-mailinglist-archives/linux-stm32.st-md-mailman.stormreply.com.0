Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 799252344BA
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 13:47:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8264C36B3C;
	Fri, 31 Jul 2020 11:47:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A88BC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 11:47:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VBc333015223; Fri, 31 Jul 2020 13:47:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0GCBgslDZw0GYxmu1/0QyIojItqk9H/Ui6PIwaiTKBw=;
 b=LbYYfJkuthsTZUqclPZmdITvrbh//greT4ll2Blj6+EPjWOXDf+s8vCbN9nqgyV0373z
 A0KeFwP8ErMwbUbFU463x+rBF/IhdFPu2xuRwg4RXf8RMzkGDdXYoXytWgRXwTz5Fi6m
 TBjIKQEDJEXxdct/DBh4zNt6wCJl8yj9hdU6CEuafB0GNImk1fdo4VsuxvKZ4limLlkb
 EilyMZmhJiToiZmaJi8WaHw6rXBmEJqs9NUT+lj2y1xkiMCXqd/BHjkgD0mIv2dD1p92
 covJKWlOfCLow468Y7vSNKlu5OKIc2jUuvVUTjMTQyqdmJVL+k5JIXcd13KzG2hKrJvp qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagvna7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 13:47:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E704710002A;
 Fri, 31 Jul 2020 13:47:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9842221061;
 Fri, 31 Jul 2020 13:47:44 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 13:47:44
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 13:47:27 +0200
Message-ID: <20200731114732.12815-5-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731114732.12815-1-arnaud.pouliquen@st.com>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 4/9] rpmsg: define the name service
	announcement as reserved address
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

The address 53 is reserved for the dynamic RPMsg device management
on name service announcement.
Define this address in a reserved enum list.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 3 ---
 include/linux/rpmsg.h            | 9 +++++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 910d30818901..b2927661868c 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -162,9 +162,6 @@ struct virtio_rpmsg_channel {
  */
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
-/* Address 53 is reserved for advertising remote services */
-#define RPMSG_NS_ADDR			(53)
-
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
 static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe156d1c018..5496d27c6f8c 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -20,6 +20,15 @@
 
 #define RPMSG_ADDR_ANY		0xFFFFFFFF
 
+/**
+ * enum rpmsg_ns_flags - List of reserved RPMsg addresses
+ *
+ * @RPMSG_NS_ADDR: remote services advertising for dynamic allocation
+ */
+enum rpmsg_reserved_addr {
+	RPMSG_NS_ADDR		= 53,
+};
+
 struct rpmsg_device;
 struct rpmsg_endpoint;
 struct rpmsg_device_ops;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
