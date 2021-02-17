Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9C31DA73
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Feb 2021 14:30:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 950A1C57B6A;
	Wed, 17 Feb 2021 13:30:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A608BC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 13:30:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11HDS1TZ026013; Wed, 17 Feb 2021 14:30:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=URjj4/CWQEc1LE55J3NoeR+Ycg2bTdbvye7fVRYzsh0=;
 b=8TDt4WC4xoRZQQJAvg+VF5w0ysiqeRnW5jE3sLClBUG/HKM60/lTZ3/64PG+KwIp6hTM
 fEqfpDzEcJRiWNfnYrijioPns5ntVI4uTn1mqFQPesDTc2IMrvENn0Wa/QxVSE/UUtVc
 e2h8Jhe95Wdcw0SO7RTUPOOlSmynGqxEAOvyujBQh1MzMgXqN5WwaGaaa/xPYJ5NVtCa
 zXmN4fvMAKBJ6tVTYRZgdKh/bjZpnSiu42obN7lx8DYkgswwiFYnmPWlTRDWXRpmNp0w
 /hnWRvlygraf0oxvMbrMAZTnVJLdRI5RNQV6QEnsyMPy7suA4QG7iyep2OCiccmlaQ8w jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p547p3qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 14:30:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65EA010002A;
 Wed, 17 Feb 2021 14:30:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5874E2370C9;
 Wed, 17 Feb 2021 14:30:52 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:30:52
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Wed, 17 Feb 2021 14:28:56 +0100
Message-ID: <20210217132905.1485-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_11:2021-02-16,
 2021-02-17 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 07/16] rpmsg: update
	rpmsg_chrdev_register_device function
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

As driver is now the rpmsg_ioctl, rename the function.
In addition, initialize the rpdev addresses to RPMSG_ADDR_ANY as not
defined.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_glink_native.c |  2 +-
 drivers/rpmsg/qcom_smd.c          |  2 +-
 drivers/rpmsg/rpmsg_ctrl.c        |  2 +-
 drivers/rpmsg/rpmsg_internal.h    | 10 ++++++----
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 27a05167c18c..d4e4dd482614 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1625,7 +1625,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
 	rpdev->dev.parent = glink->dev;
 	rpdev->dev.release = qcom_glink_device_release;
 
-	return rpmsg_chrdev_register_device(rpdev);
+	return rpmsg_ctrl_register_device(rpdev);
 }
 
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 19903de6268d..40a1c415c775 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1097,7 +1097,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
 	qsdev->rpdev.dev.parent = &edge->dev;
 	qsdev->rpdev.dev.release = qcom_smd_release_device;
 
-	return rpmsg_chrdev_register_device(&qsdev->rpdev);
+	return rpmsg_ctrl_register_device(&qsdev->rpdev);
 }
 
 /*
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index fa05b67d24da..2e43b4096aa8 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -180,7 +180,7 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
 	.probe = rpmsg_ctrl_probe,
 	.remove = rpmsg_ctrl_remove,
 	.drv = {
-		.name = "rpmsg_chrdev",
+		.name = KBUILD_MODNAME,
 	},
 };
 
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a76c344253bf..7428f4465d17 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -82,16 +82,18 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
 int rpmsg_release_channel(struct rpmsg_device *rpdev,
 			  struct rpmsg_channel_info *chinfo);
 /**
- * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
+ * rpmsg_ctrl_register_device() - register a char device for control based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
  *
  * This function wraps rpmsg_register_device() preparing the rpdev for use as
  * basis for the rpmsg chrdev.
  */
-static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
+static inline int rpmsg_ctrl_register_device(struct rpmsg_device *rpdev)
 {
-	strcpy(rpdev->id.name, "rpmsg_chrdev");
-	rpdev->driver_override = "rpmsg_chrdev";
+	strcpy(rpdev->id.name, "rpmsg_ctrl");
+	rpdev->driver_override = "rpmsg_ctrl";
+	rpdev->src = RPMSG_ADDR_ANY;
+	rpdev->dst = RPMSG_ADDR_ANY;
 
 	return rpmsg_register_device(rpdev);
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
