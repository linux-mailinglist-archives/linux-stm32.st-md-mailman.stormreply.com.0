Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E523455F
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:11:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D52DC36B36;
	Fri, 31 Jul 2020 12:11:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90852C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 12:11:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VC8fuX011305; Fri, 31 Jul 2020 14:11:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VkOlCxczALyBGyhK0x3jjVQY6384tdF2+bl3dLOk1VU=;
 b=yDugJ9hasKAJgsud6QlBjPHtuqquAH3tqYNNZZcW39WVwNPOxC4/V7Ow7G0MlS0qxQNA
 QbxINUKyjoCeVwpxz5+iVJs3KbqZEwr8XD2Cg/HmsxM18PG0DPZEBjBSYLskz7tnEIxM
 MmRl5eRIqKCbC91rXGxRrEQLe/zJvx93wlphJKQAAt0EteJlMRHOBF1lBF8KpHu5k2Jr
 wrw+6oWsF9cJaA/gNVY1HktpkhOR8z9S/xUAmrwBR1Sff3Kn60MPg0Q3VaNT+T6SurJA
 L9U3aC0PR3gPbvKc+FyjLtYmVjHiVCkkooY1fwqgomcrbpWHhaWdMzFTnxgaGwurZD11 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga72dcba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 14:11:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2919F10002A;
 Fri, 31 Jul 2020 14:11:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E01C2AE6DD;
 Fri, 31 Jul 2020 14:11:09 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:11:08
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 14:10:38 +0200
Message-ID: <20200731121043.24199-9-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121043.24199-1-arnaud.pouliquen@st.com>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 08/13] rpmsg: raw: register service to the
	rpmsg control
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

Register the RPMSG_RAW_SERVICE service to the RPMsg control

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_raw.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_raw.c b/drivers/rpmsg/rpmsg_raw.c
index 8684a78ab4d1..117da0c566ed 100644
--- a/drivers/rpmsg/rpmsg_raw.c
+++ b/drivers/rpmsg/rpmsg_raw.c
@@ -315,6 +315,11 @@ static struct rpmsg_driver rpmsg_raw_client = {
 	.remove		= rpmsg_raw_remove,
 };
 
+const struct rpmsg_drv_ctrl_info  rpmsg_raw_ctl_info = {
+	.drv_name = KBUILD_MODNAME,
+	.service = RPMSG_RAW_SERVICE,
+};
+
 static int rpmsg_raw_init(void)
 {
 	int ret;
@@ -328,7 +333,18 @@ static int rpmsg_raw_init(void)
 
 	ret = register_rpmsg_driver(&rpmsg_raw_client);
 	if (ret < 0)
-		unregister_chrdev_region(rpmsg_raw_major, RPMSG_DEV_MAX);
+		goto free_region;
+
+	ret = rpmsg_ctrl_register_ctl(&rpmsg_raw_ctl_info);
+	if (ret < 0)
+		goto free_rpmsg;
+
+	return 0;
+
+free_rpmsg:
+	unregister_rpmsg_driver(&rpmsg_raw_client);
+free_region:
+	unregister_chrdev_region(rpmsg_raw_major, RPMSG_DEV_MAX);
 
 	return ret;
 }
@@ -336,6 +352,7 @@ module_init(rpmsg_raw_init);
 
 static void rpmsg_raw_exit(void)
 {
+	rpmsg_ctrl_unregister_ctl(&rpmsg_raw_ctl_info);
 	unregister_rpmsg_driver(&rpmsg_raw_client);
 	unregister_chrdev_region(rpmsg_raw_major, RPMSG_DEV_MAX);
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
