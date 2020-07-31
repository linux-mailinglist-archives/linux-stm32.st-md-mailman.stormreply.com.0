Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E86EE234558
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:11:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D3D1C3F930;
	Fri, 31 Jul 2020 12:11:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37667C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 12:11:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VC8lRP011696; Fri, 31 Jul 2020 14:11:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MW+7nWJ04Sd41Z+BeSZdAvkoYyBFJeWchj90EDOmFnA=;
 b=o2m6ryJv56EgNxkohyRRVl3C2qf4K96z3XNsSjtYwKID3KQTctfZVA+fmkW9qxY5+beG
 j7OdPKW69+IwggbsZ8X3NhxayFadzUh7ZHbBXZnuD6yNGtbzsME1JnKhsPi49ltheEqs
 LGWKiJFr7rfx+0CApOMYvCmdM2qo8MvpLCqP33iA8zbS/n9DZ/2mGQR0lD30w7d7EA0f
 4B5LXTPPz+dhUVuWut2KtckFphFubk8R3jcj5F1v+r+A2XLA6phxYMfNdiJS7Npqoi7C
 GZMGAL669IsfDBZB4rNoeL1xlmpyoH0LOoECVJnM28ge7awVr9WLnVmAzjT0H1OAugh1 Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga72dcb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 14:11:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F8FE10002A;
 Fri, 31 Jul 2020 14:11:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0543F2AE6DD;
 Fri, 31 Jul 2020 14:11:08 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:11:07
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 14:10:37 +0200
Message-ID: <20200731121043.24199-8-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121043.24199-1-arnaud.pouliquen@st.com>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 07/13] rpmsg: control: add driver registration
	API
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

Add API for RPMsg driver to register the supported service.
This API has to be called during RPMsg driver init to declare the
service. Then the RPMsg control will be able to instantiate
associated device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c     | 57 ++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h |  3 ++
 2 files changed, 60 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index d31b1ba51fa7..8773c8395401 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -26,6 +26,20 @@ struct rpmsg_ctrl_dev {
 	struct device dev;
 };
 
+/**
+ * struct rpmsg_ctl_info - control info list node
+ * @ctrl:	control driver info
+ * @node:	list node
+ *
+ * This structure is used by rpmsg_ctl to list the registered drivers services
+ */
+struct rpmsg_ctl_info {
+	const struct rpmsg_drv_ctrl_info *ctrl;
+	struct list_head node;
+};
+
+static LIST_HEAD(rpmsg_drv_list);
+
 static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_minor_ida);
 
@@ -176,6 +190,49 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
 	},
 };
 
+/**
+ * rpmsg_ctrl_register_ctl() -register control for the associated service
+ * @ctrl: rpmsg driver information
+ *
+ * This function is called by the rpmsg driver to register a service that will
+ * be exposed to be instantiate by the application.
+ */
+int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
+{
+	struct rpmsg_ctl_info *drv_info;
+
+	drv_info =  kzalloc(sizeof(*drv_info), GFP_KERNEL);
+	if (!drv_info)
+		return -ENOMEM;
+
+	drv_info->ctrl = ctrl;
+
+	list_add_tail(&drv_info->node, &rpmsg_drv_list);
+
+	return 0;
+}
+EXPORT_SYMBOL(rpmsg_ctrl_register_ctl);
+
+/**
+ * rpmsg_ctrl_unregister_ctl() -unregister control for the associated service
+ * @ctrl: the rpmsg control information
+ *
+ * This function is called by the rpmsg driver to unregister the associated
+ * service.
+ */
+void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
+{
+	struct rpmsg_ctl_info *drv_info, *tmp;
+
+	list_for_each_entry_safe(drv_info, tmp, &rpmsg_drv_list, node) {
+		if (drv_info->ctrl == ctrl) {
+			list_del(&drv_info->node);
+			kfree(drv_info);
+		}
+	}
+}
+EXPORT_SYMBOL(rpmsg_ctrl_unregister_ctl);
+
 static int rpmsg_ctrl_init(void)
 {
 	int ret;
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 811d6e27a720..2f22ad45cb18 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -137,4 +137,7 @@ static inline int rpmsg_ctl_register_device(struct rpmsg_device *rpdev)
 int rpmsg_ns_announce_create(struct rpmsg_device *rpdev);
 int rpmsg_ns_announce_destroy(struct rpmsg_device *rpdev);
 
+int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
+void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
+
 #endif
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
