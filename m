Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8526639E570
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 19:30:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B7B4C59789;
	Mon,  7 Jun 2021 17:30:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67181C58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 17:30:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157HLXdr026586; Mon, 7 Jun 2021 19:30:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=FpNn0xtfniShx67ksE/od2rMjnWYSm81fyLdm7GA7DM=;
 b=nXmcTv9F1LTrC8z0VWEd4XCpOKC5BmzJnsOk25rd9r9Ctja45yoNTqpyri29W9OVQ8v/
 HYPZe6PTfkxoNQaInJo7fVCH8Js1oWOBxMT/Py99usG4X7NEin6iZx0Kz5RstcKq0653
 5ecO0WkuOAjfAq5JcOhhMnZ5Kzgp6FnZdn1FMgddBf9iqadSsoI6bbXNpNoPMOu6fYJO
 VT/1dQuCiye6JGsRak7xo+g/zwkQ6JP3JU2y7OrVL8dEGL4Qo80PaNSDHKYwZLcdonhs
 N3O9KKkNBUQzyBd2QjQYSrKd/3JL/tb2QAqQOIG3fnrn8N/m/rW43mlSesPUUFhIE90P Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 391ph88chu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 19:30:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA31E100039;
 Mon,  7 Jun 2021 19:30:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD9D12142B6;
 Mon,  7 Jun 2021 19:30:39 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun 2021 19:30:39
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 7 Jun 2021 19:30:31 +0200
Message-ID: <20210607173032.30133-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_14:2021-06-04,
 2021-06-07 signatures=0
Cc: julien.massot@iot.bzh, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/4] rpmsg: char: Introduce the "rpmsg-raw"
	channel
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

Allows to probe the endpoint device on a remote name service announcement,
by registering a rpmsg_driverfor the "rpmsg-raw" channel.

With this patch the /dev/rpmsgX interface can be instantiated by the remote
firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 54 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4199ac1bee10..3b850b218eb0 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -25,6 +25,8 @@
 
 #include "rpmsg_char.h"
 
+#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
+
 static dev_t rpmsg_major;
 static struct class *rpmsg_class;
 
@@ -416,6 +418,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_channel_info chinfo;
+
+	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
+	chinfo.src = rpdev->src;
+	chinfo.dst = rpdev->dst;
+
+	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
+}
+
+static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
+{
+	int ret;
+
+	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
+}
+
+static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
+	{ .name	= RPMSG_CHAR_DEVNAME },
+	{ },
+};
+
+static struct rpmsg_driver rpmsg_chrdev_driver = {
+	.probe = rpmsg_chrdev_probe,
+	.remove = rpmsg_chrdev_remove,
+	.id_table = rpmsg_chrdev_id_table,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
@@ -429,16 +465,30 @@ static int rpmsg_chrdev_init(void)
 	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
 	if (IS_ERR(rpmsg_class)) {
 		pr_err("failed to create rpmsg class\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
+		ret = PTR_ERR(rpmsg_class);
+		goto free_region;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg: failed to register rpmsg raw driver\n");
+		goto free_class;
 	}
 
 	return 0;
+
+free_class:
+	class_destroy(rpmsg_class);
+free_region:
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+
+	return ret;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
+	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
