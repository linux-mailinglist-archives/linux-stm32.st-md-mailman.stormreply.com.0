Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3D31DA70
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Feb 2021 14:30:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64067C57B59;
	Wed, 17 Feb 2021 13:30:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47740C57B69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 13:30:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11HDQ5bt018515; Wed, 17 Feb 2021 14:30:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=PALxylp6AUpTS7OZFEYPQXmfH/X+QyXLM1mRwWdH39Y=;
 b=aYcPeB4iIdvrOQtkbVKiyauTzTlEMhWI/m3+XY+KDkqjA/OCy5l/KPwdfvrpBqxyPxXN
 4hkGmPVNaZWKN3GMpaVFTGCptAwcYzIvEuO61b0+msdFuQO6jGw2BFqdQB6gyghlVIIe
 t4V5k2fRfCTOH51QjFNQE4eGahB5qbzqXkHl0TsX7JCd2QzpdYfPty5bGTFIAh7+9tv0
 9MH4GEchmXEDk8v8iKPummb0r1VWLvT0Y64MgGv5sKZwBm18NxWz4DiQNxsWoMKEMwdy
 HSBjEWoMIELtCpsbx9Q1cGCM+R1TXDioH5FTLo+egyivZL51kBJxrEhIbsc2AARxi6ze Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p706nnbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 14:30:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB832100034;
 Wed, 17 Feb 2021 14:30:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CDF52370C9;
 Wed, 17 Feb 2021 14:30:51 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:30:51
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Wed, 17 Feb 2021 14:28:55 +0100
Message-ID: <20210217132905.1485-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_11:2021-02-16,
 2021-02-17 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 06/16] rpmsg: move the rpmsg control device
	from rpmsg_char to rpmsg_ctrl
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

Move the code related to the rpmsg_ctrl char device to the new
rpmsg_ctrl.c module.
Manage the dependency in the kconfig.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/Kconfig      |   9 ++
 drivers/rpmsg/Makefile     |   1 +
 drivers/rpmsg/rpmsg_char.c | 163 ----------------------------
 drivers/rpmsg/rpmsg_ctrl.c | 216 +++++++++++++++++++++++++++++++++++++
 4 files changed, 226 insertions(+), 163 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf13..2d0cd7fdd710 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -10,11 +10,20 @@ config RPMSG_CHAR
 	tristate "RPMSG device interface"
 	depends on RPMSG
 	depends on NET
+	select RPMSG_CTRL
 	help
 	  Say Y here to export rpmsg endpoints as device files, usually found
 	  in /dev. They make it possible for user-space programs to send and
 	  receive rpmsg packets.
 
+config RPMSG_CTRL
+	tristate "RPMSG control interface"
+	depends on RPMSG
+	help
+	  Say Y here to enable the support of the /dev/rpmsg_ctlX API. This API
+	  allows user-space programs to create endpoints with specific service name,
+	  source and destination addresses.
+
 config RPMSG_NS
 	tristate "RPMSG name service announcement"
 	depends on RPMSG
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee..58e3b382e316 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
+obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
 obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 23e369a00531..83c10b39b139 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -31,28 +31,12 @@
 static dev_t rpmsg_major;
 static struct class *rpmsg_class;
 
-static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_ept_ida);
 static DEFINE_IDA(rpmsg_minor_ida);
 
 #define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
 #define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
 
-#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
-#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
-
-/**
- * struct rpmsg_ctrldev - control device for instantiating endpoint devices
- * @rpdev:	underlaying rpmsg device
- * @cdev:	cdev for the ctrl device
- * @dev:	device for the ctrl device
- */
-struct rpmsg_ctrldev {
-	struct rpmsg_device *rpdev;
-	struct cdev cdev;
-	struct device dev;
-};
-
 /**
  * struct rpmsg_eptdev - endpoint device context
  * @dev:	endpoint device
@@ -411,145 +395,6 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
-static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
-{
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
-
-	get_device(&ctrldev->dev);
-	filp->private_data = ctrldev;
-
-	return 0;
-}
-
-static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
-{
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
-
-	put_device(&ctrldev->dev);
-
-	return 0;
-}
-
-static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
-				unsigned long arg)
-{
-	struct rpmsg_ctrldev *ctrldev = fp->private_data;
-	void __user *argp = (void __user *)arg;
-	struct rpmsg_endpoint_info eptinfo;
-	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
-
-	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
-		return -EFAULT;
-
-	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
-	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
-	chinfo.src = eptinfo.src;
-	chinfo.dst = eptinfo.dst;
-
-	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
-};
-
-static const struct file_operations rpmsg_ctrldev_fops = {
-	.owner = THIS_MODULE,
-	.open = rpmsg_ctrldev_open,
-	.release = rpmsg_ctrldev_release,
-	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
-	.compat_ioctl = compat_ptr_ioctl,
-};
-
-static void rpmsg_ctrldev_release_device(struct device *dev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
-
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-	cdev_del(&ctrldev->cdev);
-	kfree(ctrldev);
-}
-
-static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev;
-	struct device *dev;
-	int ret;
-
-	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
-	if (!ctrldev)
-		return -ENOMEM;
-
-	ctrldev->rpdev = rpdev;
-
-	dev = &ctrldev->dev;
-	device_initialize(dev);
-	dev->parent = &rpdev->dev;
-
-	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
-	ctrldev->cdev.owner = THIS_MODULE;
-
-	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
-	if (ret < 0)
-		goto free_ctrldev;
-	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
-
-	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
-	if (ret < 0)
-		goto free_minor_ida;
-	dev->id = ret;
-	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
-
-	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
-	if (ret)
-		goto free_ctrl_ida;
-
-	/* We can now rely on the release function for cleanup */
-	dev->release = rpmsg_ctrldev_release_device;
-
-	ret = device_add(dev);
-	if (ret) {
-		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
-		put_device(dev);
-	}
-
-	dev_set_drvdata(&rpdev->dev, ctrldev);
-
-	return ret;
-
-free_ctrl_ida:
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-free_minor_ida:
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-free_ctrldev:
-	put_device(dev);
-	kfree(ctrldev);
-
-	return ret;
-}
-
-static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
-	int ret;
-
-	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
-	if (ret)
-		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
-
-	device_del(&ctrldev->dev);
-	put_device(&ctrldev->dev);
-}
-
-static struct rpmsg_driver rpmsg_chrdev_driver = {
-	.probe = rpmsg_chrdev_probe,
-	.remove = rpmsg_chrdev_remove,
-	.drv = {
-		.name = "rpmsg_chrdev",
-	},
-};
-
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
@@ -567,20 +412,12 @@ static int rpmsg_chrdev_init(void)
 		return PTR_ERR(rpmsg_class);
 	}
 
-	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
-	if (ret < 0) {
-		pr_err("rpmsgchr: failed to register rpmsg driver\n");
-		class_destroy(rpmsg_class);
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-	}
-
 	return ret;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
-	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
new file mode 100644
index 000000000000..fa05b67d24da
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021, STMicroelectronics
+ * Copyright (c) 2016, Linaro Ltd.
+ * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
+ * Copyright (c) 2012, PetaLogix
+ * Copyright (c) 2011, Texas Instruments, Inc.
+ * Copyright (c) 2011, Google, Inc.
+ *
+ * Based on rpmsg performance statistics driver by Michal Simek, which in turn
+ * was based on TI & Google OMX rpmsg driver.
+ */
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+#include <uapi/linux/rpmsg.h>
+
+#include "rpmsg_char.h"
+#include "rpmsg_internal.h"
+
+#define RPMSG_DEV_MAX	(MINORMASK + 1)
+
+static dev_t rpmsg_major;
+
+static DEFINE_IDA(rpmsg_ctrl_ida);
+static DEFINE_IDA(rpmsg_minor_ida);
+
+#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrl, dev)
+#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrl, cdev)
+
+/**
+ * struct rpmsg_ctrl - control device for instantiating endpoint devices
+ * @rpdev:	underlaying rpmsg device
+ * @cdev:	cdev for the ctrl device
+ * @dev:	device for the ctrl device
+ */
+struct rpmsg_ctrl {
+	struct rpmsg_device *rpdev;
+	struct cdev cdev;
+	struct device dev;
+};
+
+static int rpmsg_ctrl_open(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrl *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	get_device(&ctrldev->dev);
+	filp->private_data = ctrldev;
+
+	return 0;
+}
+
+static int rpmsg_ctrl_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrl *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	put_device(&ctrldev->dev);
+
+	return 0;
+}
+
+static long rpmsg_ctrl_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct rpmsg_ctrl *ctrldev = fp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct rpmsg_endpoint_info eptinfo;
+	struct rpmsg_channel_info chinfo;
+
+	if (cmd != RPMSG_CREATE_EPT_IOCTL)
+		return -EINVAL;
+
+	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
+		return -EFAULT;
+
+	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
+	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
+	chinfo.src = eptinfo.src;
+	chinfo.dst = eptinfo.dst;
+
+	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
+};
+
+static const struct file_operations rpmsg_ctrl_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_ctrl_open,
+	.release = rpmsg_ctrl_release,
+	.unlocked_ioctl = rpmsg_ctrl_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+static void rpmsg_ctrl_release_device(struct device *dev)
+{
+	struct rpmsg_ctrl *ctrldev = dev_to_ctrldev(dev);
+
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	cdev_del(&ctrldev->cdev);
+	kfree(ctrldev);
+}
+
+static int rpmsg_ctrl_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrl *ctrldev;
+	struct device *dev;
+	int ret;
+
+	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
+	if (!ctrldev)
+		return -ENOMEM;
+
+	ctrldev->rpdev = rpdev;
+
+	dev = &ctrldev->dev;
+	device_initialize(dev);
+	dev->parent = &rpdev->dev;
+
+	cdev_init(&ctrldev->cdev, &rpmsg_ctrl_fops);
+	ctrldev->cdev.owner = THIS_MODULE;
+
+	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
+	if (ret < 0)
+		goto free_ctrldev;
+	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
+	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_minor_ida;
+	dev->id = ret;
+	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+
+	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
+	if (ret)
+		goto free_ctrl_ida;
+
+	/* We can now rely on the release function for cleanup */
+	dev->release = rpmsg_ctrl_release_device;
+
+	ret = device_add(dev);
+	if (ret) {
+		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
+		put_device(dev);
+	}
+
+	dev_set_drvdata(&rpdev->dev, ctrldev);
+
+	return ret;
+
+free_ctrl_ida:
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+free_minor_ida:
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+free_ctrldev:
+	put_device(dev);
+	kfree(ctrldev);
+
+	return ret;
+}
+
+static void rpmsg_ctrl_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrl *ctrldev = dev_get_drvdata(&rpdev->dev);
+	int ret;
+
+	/* Destroy all endpoints */
+	ret = device_for_each_child(&ctrldev->dev, NULL,
+				    rpmsg_chrdev_eptdev_destroy);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
+
+	device_del(&ctrldev->dev);
+	put_device(&ctrldev->dev);
+}
+
+static struct rpmsg_driver rpmsg_ctrl_driver = {
+	.probe = rpmsg_ctrl_probe,
+	.remove = rpmsg_ctrl_remove,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
+static int rpmsg_ctrl_init(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
+	if (ret < 0) {
+		pr_err("rpmsg: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_ctrl_driver);
+	if (ret < 0) {
+		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+	}
+
+	return ret;
+}
+postcore_initcall(rpmsg_ctrl_init);
+
+static void rpmsg_ctrl_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_ctrl_driver);
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+}
+module_exit(rpmsg_ctrl_exit);
+
+MODULE_DESCRIPTION("rpmsg control interface");
+MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
