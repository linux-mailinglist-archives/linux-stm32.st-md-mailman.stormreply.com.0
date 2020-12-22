Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B72E0911
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Dec 2020 11:58:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD63EC5718F;
	Tue, 22 Dec 2020 10:58:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE729C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Dec 2020 10:58:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BMAw6QE012870; Tue, 22 Dec 2020 11:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=a5kQ5Np6UsVy5bkTQ0gOe+8K4aMl8RM3spGtSWwiTos=;
 b=7fL6zE5oFRT2KXN95V1A9Ypt0f+6TUAY4TuR9H0lwFJq5CtohzWa3n/46Eg2UUX+R2c/
 WC35wmhsmNciMvZgF6/vnRLKYiJ2uFXsHVSpCMh03Le7pOSmRDWXXTJkcOyokqM1Tx26
 AVs/kuMvl6wzfmaN3OEqivlSt5ppuKU+SNoC0UX+VeDCfMTd8+3w3yvgUIAtzlQ0Q3o+
 b7BVbykRnaM1I4VxpUlU6/5mQAaRcAIhqDHVxAYZS+BduOcw+rFv1098GktYHAj5WfjN
 /HetKXbUUYxp95NhrGp5NxaxixpeYTvZ1LdxAGDeeTKdJsMHSxuhOr55fPZ+61cHp06F zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35k0eb3xbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Dec 2020 11:58:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C8B5100034;
 Tue, 22 Dec 2020 11:58:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D39E231603;
 Tue, 22 Dec 2020 11:58:00 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:57:59
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Tue, 22 Dec 2020 11:57:12 +0100
Message-ID: <20201222105726.16906-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-22_04:2020-12-21,
 2020-12-22 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 02/16] rpmsg: add RPMsg control API to
	register service
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

Add API to register a RPMsg service to the control device.
The rpmsg_drv_ctrl_info structure links a service to its driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 57 ++++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h      | 31 +++++++++++++++++++++
 include/uapi/linux/rpmsg.h | 14 ++++++++++
 3 files changed, 102 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 425c3e32ada4..065e2e304019 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -27,6 +27,20 @@ struct rpmsg_ctrl_dev {
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
 
@@ -175,6 +189,49 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
 	.remove = rpmsg_ctrl_remove,
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
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index a5db828b2420..5d64704c2346 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -26,6 +26,19 @@ struct rpmsg_endpoint;
 struct rpmsg_device_ops;
 struct rpmsg_endpoint_ops;
 
+/**
+ * struct rpmsg_drv_ctrl_info - rpmsg ctrl structure
+ * @drv_name:	name of the associated driver
+ * @service:	the associated rpmsg service listed in @rpmsg_services
+ *
+ * This structure is used by rpmsg_ctl to link the endpoint creation to the
+ * service rpmsg driver.
+ */
+struct rpmsg_drv_ctrl_info {
+	const char *drv_name;
+	u32  service;
+};
+
 /**
  * struct rpmsg_channel_info - channel info representation
  * @name: name of service
@@ -315,4 +328,22 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
 	module_driver(__rpmsg_driver, register_rpmsg_driver, \
 			unregister_rpmsg_driver)
 
+#if IS_ENABLED(CONFIG_RPMSG_CTRL)
+
+int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
+void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
+
+#else
+
+static inline int rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
+{
+	return 0;
+}
+
+static inline void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_RPMSG_CTRL) */
+
 #endif /* _LINUX_RPMSG_H */
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index e14c6dab4223..0b0cb028e0b3 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -9,6 +9,20 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/**
+ * enum rpmsg_services - list of supported RPMsg services
+ *
+ * @RPMSG_RAW_SERVICE: char device RPMSG service
+ * @RPMSG_START_PRIVATE_SERVICES: private services have to be declared after.
+ */
+enum rpmsg_services {
+	/* Reserved services */
+	RPMSG_RAW_SERVICE =  0,
+
+	/* Private services */
+	RPMSG_START_PRIVATE_SERVICES =  1024,
+};
+
 /**
  * struct rpmsg_endpoint_info - endpoint info representation
  * @name: name of service
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
