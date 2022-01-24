Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3034D497D22
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 11:28:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6463C60468;
	Mon, 24 Jan 2022 10:28:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87A62C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 10:28:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20O6jNgh004848;
 Mon, 24 Jan 2022 11:27:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=BMEd9rbFZe/L5t9dVkX24nilGNsAVv7tpeWV7JNZjrA=;
 b=Ej24pEQmJI6rtNtRKMDgEQbsLjA6NU7ED3w/50RJCtGUGbf8xJ759bTZNl1brJhPLSIo
 W1IiwCb+6WoCT0JnTB1rgcYOVwVkq34YHUAslknTZ8LOVkxbjoHVd5YyGbDEb4BPoVqg
 aHL2Rc5Q7jFzreqwSw8zgyTCAaeHbzYMnxBmzaex+3uJGyUQhtzSGc7cSKw1q17fwutV
 lwP6vaSZYsiS6CSE8wZGBdV2Ndd8xY4VzNPOHdvn67k14JtSQN/yda8BLlEsqRtofjUC
 GhTQG0FJBzD3cJ8fCZ0WqagFpCmjJ868stMpeYZkuV1VTuJ/zHOLM6WX3ZADDgj08YLO gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ds9v1kcy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 11:27:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41454100034;
 Mon, 24 Jan 2022 11:27:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38A4A2128C2;
 Mon, 24 Jan 2022 11:27:59 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 24 Jan 2022 11:27:58
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Mon, 24 Jan 2022 11:25:24 +0100
Message-ID: <20220124102524.295783-12-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
References: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-24_01,2021-12-02_01
Cc: julien.massot@iot.bzh, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v9 11/11] rpmsg: ctrl: Introduce new
	RPMSG_CREATE/RELEASE_DEV_IOCTL controls
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

Allow the user space application to create and release an rpmsg device
by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
the /dev/rpmsg_ctrl interface

The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
device.
Depending on the back-end implementation, the associated rpmsg driver is
probed and a NS announcement can be sent to the remote processor.

The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
rpmsg device created either by the remote processor or with the
RPMSG_CREATE_DEV_IOCTL call.
Depending on the back-end implementation, the associated rpmsg driver is
removed and a NS destroy rpmsg can be sent to the remote processor.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/rpmsg_ctrl.c | 36 ++++++++++++++++++++++++++++++++----
 include/uapi/linux/rpmsg.h | 10 ++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index f43b5e4dbb4c..107da70fdbaa 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -43,11 +43,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @rpdev:	underlaying rpmsg device
  * @cdev:	cdev for the ctrl device
  * @dev:	device for the ctrl device
+ * @ctrl_lock:	serialize the ioctrls.
  */
 struct rpmsg_ctrldev {
 	struct rpmsg_device *rpdev;
 	struct cdev cdev;
 	struct device dev;
+	struct mutex ctrl_lock;
 };
 
 static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
@@ -76,9 +78,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	void __user *argp = (void __user *)arg;
 	struct rpmsg_endpoint_info eptinfo;
 	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
+	struct rpmsg_device *rpdev;
+	int ret = 0;
 
 	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
 		return -EFAULT;
@@ -88,7 +89,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
+	mutex_lock(&ctrldev->ctrl_lock);
+	switch (cmd) {
+	case RPMSG_CREATE_EPT_IOCTL:
+		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
+		break;
+
+	case RPMSG_CREATE_DEV_IOCTL:
+		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
+		if (!rpdev) {
+			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
+			ret = -ENXIO;
+		}
+		break;
+
+	case RPMSG_RELEASE_DEV_IOCTL:
+		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
+		if (ret)
+			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
+				chinfo.name, ret);
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+	mutex_unlock(&ctrldev->ctrl_lock);
+
+	return ret;
 };
 
 static const struct file_operations rpmsg_ctrldev_fops = {
@@ -125,6 +152,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
 	dev->parent = &rpdev->dev;
 	dev->class = rpmsg_class;
 
+	mutex_init(&ctrldev->ctrl_lock);
 	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
 	ctrldev->cdev.owner = THIS_MODULE;
 
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index f5ca8740f3fb..1637e68177d9 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -33,4 +33,14 @@ struct rpmsg_endpoint_info {
  */
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
+/**
+ * Instantiate a new local rpmsg service device.
+ */
+#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
+
+/**
+ * Release a local rpmsg device.
+ */
+#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
+
 #endif
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
