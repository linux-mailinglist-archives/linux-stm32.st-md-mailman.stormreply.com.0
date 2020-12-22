Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E761F2E090E
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Dec 2020 11:58:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0897C57186;
	Tue, 22 Dec 2020 10:58:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6814C57191
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Dec 2020 10:58:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BMAvYll004475; Tue, 22 Dec 2020 11:58:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=7xL1+xV/M7LvsjtW9KV2yCRgG/ihHMpqTb/fq0HOeZo=;
 b=KSpeNhkwYIBUgu/AThq0j7BjHh7v59Q0zcWxja7oE4/WfqbsVOqC9KnCesZV3mFuUahC
 Zad+wclsps3yXRrp1piSxMrcaPKRnfxQowtCzKFP+C0cZZRoMUORItDlp9E0Utugq41t
 KhwKaKE9jd/g0Rs/1ZqKYIkNbx7HSP97p647vyRfdpdCwaXJ3Vz/b2wqXHKXOCNMCGdX
 HxlzwP6/8eM5BqEd2P4frURkGRQU4XdeHkxXklUwEZIsRRPZ9WpabJupYArNwUR+JDjV
 xQgZJ80RRzt3z+eP1IzphhH7yZxGw7pa6YxzAcRojvPDtbHHTBhxek9t1b0gzcIeiZ2V jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35k0d1bjtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Dec 2020 11:58:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B00D100038;
 Tue, 22 Dec 2020 11:58:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 743A920B86C;
 Tue, 22 Dec 2020 11:58:04 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:03
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Tue, 22 Dec 2020 11:57:17 +0100
Message-ID: <20201222105726.16906-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-22_04:2020-12-21,
 2020-12-22 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 07/16] rpmsg: char: clean up rpmsg class
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

Suppress the management of the rpmsg class as attribute. It is already
handled in /sys/bus rpmsg as specified in
documentation/ABI/testing/sysfs-bus-rpmsg.
This patch prepares the migration of the control device in rpmsg_ctrl.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 48 --------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4bbbacdbf3bb..732f5caf068a 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -27,7 +27,6 @@
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
 static dev_t rpmsg_major;
-static struct class *rpmsg_class;
 
 static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_ept_ida);
@@ -291,41 +290,6 @@ static const struct file_operations rpmsg_eptdev_fops = {
 	.compat_ioctl = compat_ptr_ioctl,
 };
 
-static ssize_t name_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%s\n", eptdev->chinfo.name);
-}
-static DEVICE_ATTR_RO(name);
-
-static ssize_t src_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", eptdev->chinfo.src);
-}
-static DEVICE_ATTR_RO(src);
-
-static ssize_t dst_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", eptdev->chinfo.dst);
-}
-static DEVICE_ATTR_RO(dst);
-
-static struct attribute *rpmsg_eptdev_attrs[] = {
-	&dev_attr_name.attr,
-	&dev_attr_src.attr,
-	&dev_attr_dst.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(rpmsg_eptdev);
-
 static void rpmsg_eptdev_release_device(struct device *dev)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
@@ -358,9 +322,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 	init_waitqueue_head(&eptdev->readq);
 
 	device_initialize(dev);
-	dev->class = rpmsg_class;
 	dev->parent = &ctrldev->dev;
-	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
 
 	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
@@ -477,7 +439,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	dev = &ctrldev->dev;
 	device_initialize(dev);
 	dev->parent = &rpdev->dev;
-	dev->class = rpmsg_class;
 
 	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
 	ctrldev->cdev.owner = THIS_MODULE;
@@ -553,17 +514,9 @@ static int rpmsg_char_init(void)
 		return ret;
 	}
 
-	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
-	if (IS_ERR(rpmsg_class)) {
-		pr_err("failed to create rpmsg class\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
-	}
-
 	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
 	if (ret < 0) {
 		pr_err("rpmsgchr: failed to register rpmsg driver\n");
-		class_destroy(rpmsg_class);
 		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 	}
 
@@ -574,7 +527,6 @@ postcore_initcall(rpmsg_char_init);
 static void rpmsg_chrdev_exit(void)
 {
 	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
-	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
 module_exit(rpmsg_chrdev_exit);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
