Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D443B8F6E
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jul 2021 11:04:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B207C597B2;
	Thu,  1 Jul 2021 09:04:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 442E3C597AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 09:04:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16192qFR005255; Thu, 1 Jul 2021 11:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1Yj6EtZ1g7tfYQMs8m+xbY0fitcrvF3Yqp2y2fJy8xo=;
 b=lN8fgJcmwhTeLxTzqs8tdafQlI0nobJSnNREp4EHha8kGzmZRdTju703VQVggIJ/tFa6
 6XFHw81DMkapNshpRECT9mxeXecBtCf6hnZLK0CyfL1eokqnG9eU2eEwR+r9Wjq66vvS
 eaw7msZlFvh1ad0pQc/PHUMPdzKCROwAlcQJd0Z1OnQCIsDXTX7IIPFwV4kQnWvQdPmi
 uTt3f8mj+sOZwjSlH/EjiGfOxSbBqXiJCiOgzvSpKsM7P9gpBx2jfr4ooJwEruTDyt0B
 cenp5BkOyBQxJD2/HHZyEfaUeSsFgNQitiOXN0wVdE9cAyNtjrCpk9grEcxZn4m9tYld Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h7yj2bk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 11:04:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFA25100034;
 Thu,  1 Jul 2021 11:04:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B213A2138C8;
 Thu,  1 Jul 2021 11:04:24 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul 2021 11:04:24
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 1 Jul 2021 11:04:12 +0200
Message-ID: <20210701090413.3104-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210701090413.3104-1-arnaud.pouliquen@foss.st.com>
References: <20210701090413.3104-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_06:2021-06-30,
 2021-07-01 signatures=0
Cc: julien.massot@iot.bzh, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 3/4] rpmsg: char: Add possibility to use
	default endpoint of the rpmsg device.
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

Current implementation create/destroy a new endpoint on each
rpmsg_eptdev_open/rpmsg_eptdev_release calls.

For a rpmsg device created by the NS announcement mechanism we need to
use a unique static endpoint that is the default rpmsg device endpoint
associated to the channel.

This patch prepares the introduction of a rpmsg channel device for the
char device. The rpmsg channel device will require a default endpoint to
communicate to the remote processor.

Add the static_ept field in rpmsg_eptdev structure. This boolean
determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.

- If static_ept == false:
  Use the legacy behavior by creating a new endpoint each time
  rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
  is called on /dev/rpmsgX device open/close.

- If static_ept == true:
  use the rpmsg device default endpoint for the communication.
- Address the update of _rpmsg_chrdev_eptdev_create in e separate patch for readability.

Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---

update vs V2:
- remove null pointer check for eptdev->rpdev in rpmsg_eptdev_ioctl. The pointer is set in
  __rpmsg_chrdev_eptdev_create and cannot be null.
---
 drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 50b7d4b00175..bd728d90ba4c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -45,6 +45,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @queue_lock:	synchronization of @queue operations
  * @queue:	incoming message queue
  * @readq:	wait object for incoming queue
+ * @static_ept: specify if the endpoint has to be created at each device opening or
+ *              if the default endpoint should be used.
  */
 struct rpmsg_eptdev {
 	struct device dev;
@@ -59,6 +61,8 @@ struct rpmsg_eptdev {
 	spinlock_t queue_lock;
 	struct sk_buff_head queue;
 	wait_queue_head_t readq;
+
+	bool static_ept;
 };
 
 int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
@@ -116,7 +120,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 
 	get_device(dev);
 
-	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+	/*
+	 * If the static_ept is set to true, the rpmsg device default endpoint is used.
+	 * Else a new endpoint is created on open that will be destroyed on release.
+	 */
+	if (eptdev->static_ept)
+		ept = rpdev->ept;
+	else
+		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+
 	if (!ept) {
 		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
 		put_device(dev);
@@ -137,7 +149,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		rpmsg_destroy_ept(eptdev->ept);
+		if (!eptdev->static_ept)
+			rpmsg_destroy_ept(eptdev->ept);
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
@@ -264,6 +277,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
+	/* Don't allow to destroy a default endpoint. */
+	if (eptdev->ept == eptdev->rpdev->ept)
+		return -EPERM;
+
 	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
