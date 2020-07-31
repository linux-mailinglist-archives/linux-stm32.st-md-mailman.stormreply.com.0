Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7277234563
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:11:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B944C3F92F;
	Fri, 31 Jul 2020 12:11:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DEAEC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 12:11:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VC6YNX009379; Fri, 31 Jul 2020 14:11:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7rSky8J/GLIf+EHvfA+pSMdQZv7hy7gixNL5RCvSGqs=;
 b=08LbaMDnfDx0Uc9V7+QkFjCyL6T6mxE6tTMRGik1yuiaMSpH4unF348V3+HN006hp1Yl
 p9eVM4ox4BpWQrpdXOWvzJvQTLi2qU4taHK4ddmZR/mTjcVQqNKy5CTWYXAAxOAc3KpX
 zvs3wzSZImh+b852IxJGh7s4ZXes0YZPnr54190n4a6BwsU1hvZMdrogvKg9KioTawtR
 EaActcYEwwTcZeAWag4pvZynacW55Npg7QFjG5IWppJlXTbEZkrDVFFNohzG5Tyf021f
 y9ly15vJq9uIFdeAQmnFZyeavarAK97vsoL26ClXwFSdmnMVszJDwdKMBq8EQhLGRgIJ jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgp98w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 14:11:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7389B10002A;
 Fri, 31 Jul 2020 14:11:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68FA32AE6DD;
 Fri, 31 Jul 2020 14:11:13 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:11:12
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 14:10:42 +0200
Message-ID: <20200731121043.24199-13-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121043.24199-1-arnaud.pouliquen@st.com>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 12/13] rpmsg: control: implement the ioctrl
	function to create device
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

Implement the ioctrl function that parses the list of
rpmsg drivers registered to create an associated device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 39 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 8773c8395401..d2a6dbb8798f 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -55,12 +55,47 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static const char *rpmsg_ctrl_get_drv_name(u32 service)
+{
+	struct rpmsg_ctl_info *drv_info;
+
+	list_for_each_entry(drv_info, &rpmsg_drv_list, node) {
+		if (drv_info->ctrl->service == service)
+			return drv_info->ctrl->drv_name;
+	}
+
+	return NULL;
+}
+
 static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
 				 unsigned long arg)
 {
 	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
-
-	dev_info(&ctrldev->dev, "Control not yet implemented\n");
+	void __user *argp = (void __user *)arg;
+	struct rpmsg_channel_info chinfo;
+	struct rpmsg_endpoint_info eptinfo;
+	struct rpmsg_device *newch;
+
+	if (cmd != RPMSG_CREATE_EPT_IOCTL)
+		return -EINVAL;
+
+	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
+		return -EFAULT;
+
+	chinfo.driver_override = rpmsg_ctrl_get_drv_name(eptinfo.service);
+	if (!chinfo.driver_override)
+		return -ENODEV;
+
+	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
+	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
+	chinfo.src = eptinfo.src;
+	chinfo.dst = eptinfo.dst;
+
+	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
+	if (!newch) {
+		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
+		return -ENXIO;
+	}
 
 	return 0;
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
