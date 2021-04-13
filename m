Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B835E06C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 15:45:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41201C58D5B;
	Tue, 13 Apr 2021 13:45:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42AFDC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 13:45:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DDhSmw031780; Tue, 13 Apr 2021 15:45:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=laDwFTmG7vxs31sYjPVO9eB9hW/Vwa1wSF+VStrGCJU=;
 b=l5RtvVbMnHaJv74y607kL88wCKcp1F9pgre7Xo5/YWESs8Dc1N0e+pdDeHWP9uV4vXpd
 kMeJwc3lTBP1JGatUolorpAGXtPzuv3DC5sMguXHywPv3Kff9wNlp8EWKQ0wSvKg8yM5
 jyNmoc4k/84PY88d1UZf23vYaPYAJ7ThJJ5Xvq4SF2EzFKJ9gXf1w3PQmnS3HWhNvtcY
 n3PA3Bt8SD3ERCvtnsCIJ1CdUoPH1v3En8TjyFlOKGJ9byI8Jjj3H+ZkXpaaVQJOVgwR
 zaC4Re1WSiPkyDJ+QeEmu2DfPprowQen/uDC2lRf5MYuqEv1mlJ0f+fMlmyfIPz7cMan 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vu4e52sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:45:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6C0E100034;
 Tue, 13 Apr 2021 15:45:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5A79226C5A;
 Tue, 13 Apr 2021 15:45:19 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 15:45:19
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Apr 2021 15:44:52 +0200
Message-ID: <20210413134458.17912-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/7] rpmsg: char: Export eptdev create an
	destroy functions
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

To prepare the split of the code related to the control (ctrldev)
and the endpoint (eptdev) devices in 2 separate files:

- Rename and export the functions in rpmsg_char.h.

- Suppress the dependency with the rpmsg_ctrldev struct in the
  rpmsg_chrdev_create_eptdev function.

- The rpmsg class is provided as parameter in rpmsg_chrdev_create_eptdev,
  because the class is associated to the control part.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 19 +++++++++------
 drivers/rpmsg/rpmsg_char.h | 50 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 8 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 2bebc9b2d163..b9df8dc4365f 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (C) 2021, STMicroelectronics
  * Copyright (c) 2016, Linaro Ltd.
  * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
  * Copyright (c) 2012, PetaLogix
@@ -22,6 +23,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/rpmsg.h>
 
+#include "rpmsg_char.h"
 #include "rpmsg_internal.h"
 
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
@@ -78,7 +80,7 @@ struct rpmsg_eptdev {
 	wait_queue_head_t readq;
 };
 
-static int rpmsg_eptdev_destroy(struct device *dev, void *data)
+int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
@@ -97,6 +99,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
 
 	return 0;
 }
+EXPORT_SYMBOL(rpmsg_chrdev_destroy_eptdev);
 
 static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 			void *priv, u32 addr)
@@ -280,7 +283,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
-	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+	return rpmsg_chrdev_destroy_eptdev(&eptdev->dev, NULL);
 }
 
 static const struct file_operations rpmsg_eptdev_fops = {
@@ -339,10 +342,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
-			       struct rpmsg_channel_info chinfo)
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
 {
-	struct rpmsg_device *rpdev = ctrldev->rpdev;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
 	int ret;
@@ -362,7 +364,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	device_initialize(dev);
 	dev->class = rpmsg_class;
-	dev->parent = &ctrldev->dev;
+	dev->parent = parent;
 	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
 
@@ -405,6 +407,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	return ret;
 }
+EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
 static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
 {
@@ -444,7 +447,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_eptdev_create(ctrldev, chinfo);
+	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
 };
 
 static const struct file_operations rpmsg_ctrldev_fops = {
@@ -530,7 +533,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
 	int ret;
 
 	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
+	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
 	if (ret)
 		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
 
diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
new file mode 100644
index 000000000000..379d2ae2bee8
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_char.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) STMicroelectronics 2021.
+ */
+
+#ifndef __RPMSG_CHRDEV_H__
+#define __RPMSG_CHRDEV_H__
+
+#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
+/**
+ * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
+ * @rpdev:  prepared rpdev to be used for creating endpoints
+ * @parent: parent device
+ * @chinfo: assiated endpoint channel information.
+ *
+ * This function create a new rpmsg char endpoint device to instantiate a new
+ * endpoint based on chinfo information.
+ */
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class);
+
+/**
+ * rpmsg_chrdev_destroy_eptdev() - destroy created char device endpoint.
+ * @data: private data associated to the endpoint device
+ *
+ * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
+ * control.
+ */
+int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data);
+
+#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
+
+static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+					     struct rpmsg_channel_info chinfo,
+					     struct class *rpmsg_class)
+{
+	return -EINVAL;
+}
+
+static inline int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
+
+#endif /*__RPMSG_CHRDEV_H__ */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
