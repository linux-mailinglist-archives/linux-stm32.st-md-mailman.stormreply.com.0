Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFAD31DA7D
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Feb 2021 14:32:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55D95C57B62;
	Wed, 17 Feb 2021 13:32:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 464A4C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 13:31:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11HDS2AR026029; Wed, 17 Feb 2021 14:31:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5/5ztwEi6vNBYmfGVztdGKdMNwulPVy/4Aq1/ukOfu0=;
 b=PAFaE01CCLIglFdIgKiP0C1jbK1Kg2Wr5bxsgfqqyaE/RroOU4littqGNlFK0yAtLMNl
 CJBsOrk1he2ZZpqqszx6Tnbc9s0mSs7NZ6xmDF08ztLzVEQ7fkbuNhLFEREK66vkb7g9
 ul4ID1S23zx4Bo1cRBQIh50rsUBrr1VGz2sQsCCeuPSohfJgV+A9c7feGOZODmA+OtX1
 z3332Blqd5dpZMXV8ZPQLyXR3t9b5ie5Z0L+TxOSFZka8XaEQxoDFnZQyiZW2xeGamjx
 qr6Q73pBkv0KOmv1jFSIJcakCLq7J9ZNK3KZ0lH69ePqqUsR0ZH/8//mJhqB9O/nKP6x Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p547p3w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 14:31:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14CA0100038;
 Wed, 17 Feb 2021 14:31:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0683F2370CE;
 Wed, 17 Feb 2021 14:31:56 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:31:55
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Wed, 17 Feb 2021 14:29:01 +0100
Message-ID: <20210217132905.1485-13-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_11:2021-02-16,
 2021-02-17 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 12/16] rpmsg: ctrl: introduce
	RPMSG_CREATE_DEV_IOCTL
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

Implement the RPMSG_CREATE_DEV_IOCTL to allow the user application to
initiate a communication through a new RPMsg channel.
This Ioctl can be used to instantiate a local RPMsg device.
Depending on the back-end implementation, a NS announcement can be sent
to the remote processor.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 21 +++++++++++++++++----
 include/uapi/linux/rpmsg.h |  5 +++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 2e43b4096aa8..78c13816bfc6 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -70,9 +70,7 @@ static long rpmsg_ctrl_ioctl(struct file *fp, unsigned int cmd, unsigned long ar
 	void __user *argp = (void __user *)arg;
 	struct rpmsg_endpoint_info eptinfo;
 	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
+	struct rpmsg_device *newch;
 
 	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
 		return -EFAULT;
@@ -82,7 +80,22 @@ static long rpmsg_ctrl_ioctl(struct file *fp, unsigned int cmd, unsigned long ar
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
+	switch (cmd) {
+	case RPMSG_CREATE_EPT_IOCTL:
+		return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
+
+	case RPMSG_CREATE_DEV_IOCTL:
+		newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
+		if (!newch) {
+			dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
+			return -ENXIO;
+		}
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+
 };
 
 static const struct file_operations rpmsg_ctrl_fops = {
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index f5ca8740f3fb..f9d5a74e7801 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -33,4 +33,9 @@ struct rpmsg_endpoint_info {
  */
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
+/**
+ * Instantiate a rpmsg service device.
+ */
+#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
+
 #endif
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
