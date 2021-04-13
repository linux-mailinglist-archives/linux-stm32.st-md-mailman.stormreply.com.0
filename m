Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111035E072
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 15:45:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7240C58D60;
	Tue, 13 Apr 2021 13:45:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8299FC58D5C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 13:45:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DDgPQE031271; Tue, 13 Apr 2021 15:45:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=BPFWpm0NhWZD/cHRfFBcGt1c192QBV7NM4xS+ARxnOY=;
 b=I5bhNKoZQOmq5iGDNNVED5pv3fJ+fB83xVH39KoqKb5FX8xiucTiRM5s4iAoG25MC01s
 AXK0l6x6nQsvz+v/yVhVn5ZuURGlJCm4UP2PN8d9/ck+OKbKV94Ar5hZC8+hoIVvZQBf
 UJ15kWyCe3RBGiFLRfdnH38F8gMqzWm3PFxl6zOOtCzqr3eI9xPYRT6ID/CvAIdH4SXl
 FfjohhGJHLdfryavjLxqmQWlFFxnLjpIakx/Zg9Gvx8XtMMFXlM4wjmIroGVA54Z3/98
 3tk0iSjbqb0k8cxjn9R73v8MKeETx7/u/1Ec9uQ9fchxM9NStHaq1jnZ20VQT4J7FdGQ 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37w3mbtwuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:45:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DEB2310002A;
 Tue, 13 Apr 2021 15:45:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D08A7226C5A;
 Tue, 13 Apr 2021 15:45:24 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 15:45:23
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Apr 2021 15:44:57 +0200
Message-ID: <20210413134458.17912-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 6/7] rpmsg: char: No dynamic endpoint
	management for the default one
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

Do not dynamically manage the default endpoint associated to the rpmsg
device. The ept address must not change.

This update is needed to manage the rpmsg-raw channel. In this
case a default endpoint is used and its address must not change or
been reused by another service.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4606787b7011..fa59abfa8878 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -112,17 +112,26 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	struct rpmsg_endpoint *ept;
 	struct rpmsg_device *rpdev = eptdev->rpdev;
 	struct device *dev = &eptdev->dev;
+	u32 addr = eptdev->chinfo.src;
 
 	if (eptdev->ept)
 		return -EBUSY;
 
 	get_device(dev);
 
-	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
-	if (!ept) {
-		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
-		put_device(dev);
-		return -EINVAL;
+	/*
+	 * The RPMsg device can has been created by a ns announcement. In this
+	 * case a default endpoint has been created. Reuse it to avoid to manage
+	 * a new address on each open/close.
+	 */
+	ept = rpdev->ept;
+	if (!ept || addr != ept->addr) {
+		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+		if (!ept) {
+			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
+			put_device(dev);
+			return -EINVAL;
+		}
 	}
 
 	eptdev->ept = ept;
@@ -134,12 +143,17 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 {
 	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
+	struct rpmsg_device *rpdev = eptdev->rpdev;
 	struct device *dev = &eptdev->dev;
 
-	/* Close the endpoint, if it's not already destroyed by the parent */
+	/*
+	 * Close the endpoint, if it's not already destroyed by the parent and it is not the
+	 * default one.
+	 */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		rpmsg_destroy_ept(eptdev->ept);
+		if (eptdev->ept != rpdev->ept)
+			rpmsg_destroy_ept(eptdev->ept);
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
