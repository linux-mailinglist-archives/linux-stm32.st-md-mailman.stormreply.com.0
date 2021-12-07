Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33146B535
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:09:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 131ADC5F1FE;
	Tue,  7 Dec 2021 08:09:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A7F9C5F1E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:09:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B740pnJ018749;
 Tue, 7 Dec 2021 09:09:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=S23BQfuWjC3JI4sYe7w7IBbRYjP4Miyc0PMhSA/fiqU=;
 b=I95lSol6/Y7xEcEVTUW985hC0YxmhXvl0tDsD9ODrgw3dkoqojkntJ6qDpzli5L0mTsI
 ByoGJSp07OF+XMC2mOIk7UMSv2z6i96BjDoFGezrXI6HVvbzoGKa799LU+Mml3otlCc0
 Riv0GkvYPKsf32q6whYhKhyPAGl0ij9WL+YWNBa1gLMjhFnYyJUY6pQhLJk7fSDEyA3z
 3+3f2d8QMR/vMFIl02XkdiArmh7LnN1DewZhHkrD9kxsbd7L4cULUJ3Z8n8w1iD4/2Mc
 9TmgZ/5FOtW+jocLm4dZncxrfDVl6qBMm5W/9C2JHX3TAvyS1r2NVcm+dONRJQTIsQTu Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csp32bc9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:09:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FA37100034;
 Tue,  7 Dec 2021 09:09:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16F5F2220B0;
 Tue,  7 Dec 2021 09:09:00 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 7 Dec 2021 09:08:59
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Tue, 7 Dec 2021 09:08:39 +0100
Message-ID: <20211207080843.21222-10-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
Cc: julien.massot@iot.bzh, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v8 09/13] rpmsg: Introduce
	rpmsg_create_default_ept function
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

By providing a callback in the rpmsg_driver structure, the rpmsg devices
can be probed with a default endpoint created.

In this case, it is not possible to associated to this endpoint private data
that could allow the driver to retrieve the context.

This helper function allows rpmsg drivers to create a default endpoint
on runtime with an associated private context.

For example, a driver might create a context structure on the probe and
want to provide that context as private data for the default rpmsg
callback.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/rpmsg/rpmsg_core.c     | 54 ++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h |  4 +++
 2 files changed, 58 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index d2129d3e6225..3f86512147e8 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -133,6 +133,60 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 }
 EXPORT_SYMBOL(rpmsg_destroy_ept);
 
+/**
+ * rpmsg_create_default_ept() - create a default rpmsg_endpoint for a rpmsg device
+ * @rpdev: rpmsg channel device
+ * @cb: rx callback handler
+ * @priv: private data for the driver's use
+ * @chinfo: channel_info with the local rpmsg address to bind with @cb
+ *
+ * On register_rpmsg_driver if no callback is provided in the rpmsg_driver structure,
+ * no endpoint is created when the device is probed by the rpmsg bus.
+ *
+ * This function returns a pointer to an endpoint created and assigned as the default
+ * endpoint of the rpmsg device.
+ *
+ * Drivers should provide their @rpdev channel (so the new endpoint would belong
+ * to the same remote processor their channel belongs to), an rx callback
+ * function, an optional private data (which is provided back when the
+ * rx callback is invoked), and an address they want to bind with the
+ * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
+ * dynamically assign them an available rpmsg address (drivers should have
+ * a very good reason why not to always use RPMSG_ADDR_ANY here).
+ *
+ * Return: a pointer to the endpoint on success, or NULL on error.
+ */
+struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+						rpmsg_rx_cb_t cb, void *priv,
+						struct rpmsg_channel_info chinfo)
+{
+	struct rpmsg_endpoint *ept;
+
+	if (WARN_ON(!rpdev))
+		return NULL;
+
+	if (WARN_ON(rpdev->ept))
+		return NULL;
+
+	/* It does not make sense to create a default endpoint without a callback. */
+	if (!cb)
+		return NULL;
+
+	if (rpdev->ept)
+		return rpdev->ept;
+
+	ept = rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
+	if (!ept)
+		return NULL;
+
+	/* Assign the new endpoint as default endpoint */
+	rpdev->ept = ept;
+	rpdev->src = ept->addr;
+
+	return ept;
+}
+EXPORT_SYMBOL(rpmsg_create_default_ept);
+
 /**
  * rpmsg_send() - send a message across to the remote processor
  * @ept: the rpmsg endpoint
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index d4b23fd019a8..950d6aa4843f 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -100,4 +100,8 @@ static inline int rpmsg_ctrldev_register_device(struct rpmsg_device *rpdev)
 	return rpmsg_register_device(rpdev);
 }
 
+struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+						rpmsg_rx_cb_t cb, void *priv,
+						struct rpmsg_channel_info chinfo);
+
 #endif
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
