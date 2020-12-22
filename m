Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4012E090B
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Dec 2020 11:58:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88D98C5718A;
	Tue, 22 Dec 2020 10:58:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E871C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Dec 2020 10:58:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BMAv6qd017298; Tue, 22 Dec 2020 11:58:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=14ixMlR3u345kc7IjufikRjZjTnNfAABnHJSVaxqAF8=;
 b=gL3JGK2phKWIhN8aEiqTBKP5nA+qfnkwhzrNNCtqNdzdC10HVT1HrEaP3ohxnwGwEPHH
 VfbXloCHO36ZInpAtcvRm0Yf2uWOt/h4QfUr+ahyJq1VfiT18qXiYkO3LNBVokvysdr6
 vokQ4tDiK3gDohIc8+X5omsZgj5SBCO+Abir+a0qJ4SEnXAh0h2j7aI2Xn7dNp4iFT/w
 5eGVa5lNTCVr09MasmN68UT/6pjiDBNeic57rI6VnLy3nTeRpEboNZ1qLu+DyS8hR74+
 R9kJ5Xhbllwm+5TrfVA68bOOe2xCwuD5zB10Dig8yFVepxjGFHNeykv7PNEeWeYtf/Jw 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35k7vva3gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Dec 2020 11:58:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0364910003A;
 Tue, 22 Dec 2020 11:58:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9E76231603;
 Tue, 22 Dec 2020 11:58:01 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:01
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Tue, 22 Dec 2020 11:57:14 +0100
Message-ID: <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-22_04:2020-12-21,
 2020-12-22 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 04/16] rpmsg: ctrl: implement the ioctl
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

Implement the ioctl function that parses the list of
rpmsg drivers registered to create an associated device.
To be ISO user API, in a first step, the driver_override
is only allowed for the RPMsg raw service, supported by the
rpmsg_char driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 065e2e304019..8381b5b2b794 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -56,12 +56,51 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
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
+	/*
+	 * In a frst step only the rpmsg_raw service is supported.
+	 * The override is foorced to RPMSG_RAW_SERVICE
+	 */
+	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
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
