Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3C46B55B
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:10:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78406C60462;
	Tue,  7 Dec 2021 08:10:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E21AC60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:10:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B740hsw018633;
 Tue, 7 Dec 2021 09:10:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=wPRFwNUvvvZvnP1yFH2bxx5PGqqknf2TcOuv8jRoCDs=;
 b=KdO+t4AMsinj9Cg/7HNbZpTaT7ghp6H46ALZDpy4smEx+cLpRrLScr5wpPIChaQnUef4
 xq9ttt1qSH3Wlvf083Y3KPwsQt86uTY81GD5sk8w/DgRF0hcm38baNjByN7zZ0qTo3Na
 jIMTm5Ulq3K8V1PwgphljWVTYPCM7OJdMQsQqzafE7MvGvbFV1vkVtG+IzTqYbPr1LeD
 EdKmfucmg5Ju0oTO51tx8rNKNmtJ95Nwvu+LfYjod3aMK7DvYgekXcxXgfLYMpBbaWAh
 1XcvXyFaQj8wOqAe8eXr/eiMMIYwbFZ4Tb+Antcz8qfBrTjLOuLPqyKvHxG1VDIuDc8X zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csp32bcgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:10:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43EA2100039;
 Tue,  7 Dec 2021 09:10:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A1F021B526;
 Tue,  7 Dec 2021 09:10:03 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 7 Dec 2021 09:10:02
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Tue, 7 Dec 2021 09:08:43 +0100
Message-ID: <20211207080843.21222-14-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
Cc: julien.massot@iot.bzh, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v8 13/13] rpmsg: core: Send a ns announcement
	when a default endpoint is created
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

When a channel is created by user space application with the
RPMSG_CREATE_DEV_IOCTL controls, a ns announcement has to be sent
(depending on backend) to inform the remote side that a new service
is available.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 3f86512147e8..27aad6baf7c5 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -145,6 +145,9 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  *
  * This function returns a pointer to an endpoint created and assigned as the default
  * endpoint of the rpmsg device.
+ * If we need to, we also announce about this channel to the remote
+ * processor. This announcement is needed in case the driver is exposing an rpmsg service that has
+ * been created locally.
  *
  * Drivers should provide their @rpdev channel (so the new endpoint would belong
  * to the same remote processor their channel belongs to), an rx callback
@@ -161,6 +164,7 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
 						struct rpmsg_channel_info chinfo)
 {
 	struct rpmsg_endpoint *ept;
+	int err;
 
 	if (WARN_ON(!rpdev))
 		return NULL;
@@ -183,6 +187,17 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
 	rpdev->ept = ept;
 	rpdev->src = ept->addr;
 
+	if (rpdev->ops->announce_create) {
+		err = rpdev->ops->announce_create(rpdev);
+		if (err) {
+			rpmsg_destroy_ept(ept);
+			rpdev->ept = NULL;
+			rpdev->src = RPMSG_ADDR_ANY;
+
+			return NULL;
+		}
+	}
+
 	return ept;
 }
 EXPORT_SYMBOL(rpmsg_create_default_ept);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
