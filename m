Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 389BF35E070
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 15:45:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5911BC58D66;
	Tue, 13 Apr 2021 13:45:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97F91C58D60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 13:45:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DDgBmX020003; Tue, 13 Apr 2021 15:45:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=+oTL4g90zRRYBKheVDMDByO+/9wE2RBSRnj0O6Up2sM=;
 b=SoxqWzhwL5qqv91kAmVhK1J+nv+79/tvsPc4Zo84ZufKO7EaOBfjiQ2qvabuyMGxfRI0
 ttv6FfA2KU9EXWJin4LLiomSnNZLAlRSyCO1oGR+rjl7Yk5gxb0jKZvUyfzuLCeQdrpN
 G+/kglDr0n9v2PGzNeDvohKOoSRlvD6FYPUwPBg1k4OhsrS3b3wFpxy+P9CTSIjzTW0M
 5gKfkK2y2w3NGWDvpxaCaGTS6oQ2qMs1Ds+HtJRNtzzIqx1hPUSGDVlQg/N/0MwOW9Sl
 GJ/8Y8kO8NLvA9CV8dloMrQsQtxnmCdZhzbY+XVbM5AFBiNoJPQASfRLp7b/rvJsxo3W Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vwg94ngh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:45:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 438E110002A;
 Tue, 13 Apr 2021 15:45:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3643C226C5A;
 Tue, 13 Apr 2021 15:45:23 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 15:45:22
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Apr 2021 15:44:56 +0200
Message-ID: <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 5/7] rpmsg: char: Introduce a rpmsg driver
	for the rpmsg char device
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

A rpmsg char device allows to probe the endpoint device on a remote name
service announcement.

With this patch the /dev/rpmsgX interface is created either by a user
application or by the remote firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
update from V1:
 - add missing unregister_rpmsg_driver call on module exit.

---
 drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index a64249d83172..4606787b7011 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -26,6 +26,8 @@
 #include "rpmsg_char.h"
 #include "rpmsg_internal.h"
 
+#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
+
 static dev_t rpmsg_major;
 
 static DEFINE_IDA(rpmsg_ept_ida);
@@ -403,13 +405,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_channel_info chinfo;
+	struct rpmsg_eptdev *eptdev;
+
+	if (!rpdev->ept)
+		return -EINVAL;
+
+	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
+	chinfo.src = rpdev->src;
+	chinfo.dst = rpdev->dst;
+
+	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	/* Set the private field of the default endpoint to retrieve context on callback. */
+	rpdev->ept->priv = eptdev;
+
+	return 0;
+}
+
+static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
+{
+	int ret;
+
+	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
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
+	.callback = rpmsg_ept_cb,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
 
 	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
-	if (ret < 0)
+	if (ret < 0) {
 		pr_err("rpmsg: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg: failed to register rpmsg raw driver\n");
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+	}
 
 	return ret;
 }
@@ -417,6 +473,7 @@ postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
+	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
 module_exit(rpmsg_chrdev_exit);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
