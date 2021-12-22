Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3547CE1A
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 09:24:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C704CC5F1FA;
	Wed, 22 Dec 2021 08:23:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8B6BC5F1F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 08:23:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BM3xrCw020047;
 Wed, 22 Dec 2021 09:23:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=uPvVscXf5Rae+P+BVLRVkyMBZcY5UkxoeETesuH6z00=;
 b=IPbZEvs+N+qpIlO16UstuomA6W855Ng9C+7N33CSU+rVtj5B6jkUPMuswU1KTt6rXO4G
 aWglx/QDYCk+atlj6ERmWOFlO5gyb9nXmHOJTSmp0n+22fuk3mDx/VBRTJbapjblmbAI
 X1ff+bx+1QLoSoOP4BzfVFJZWtSiM4S2RILn6wKO2MUs90ahIw9LZdU6Mpw4fOfAe7bA
 FL6PPqX1ABh7le4DkYKcKAzn7PAVbJyPi5oRD1rtDf+b7Rz6vrt+aO1r3hLI1DyNPuOW
 tSh0/wKqRZkjrLeGriJWSXIYkyqyzEgt6P6YUmqJ/Fk0JSCcqTZdy1I1xojBh9y/7vQW +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3d3j39b8nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 09:23:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9ECD100034;
 Wed, 22 Dec 2021 09:23:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B11A62221D6;
 Wed, 22 Dec 2021 09:23:56 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 22 Dec 2021 09:23:56
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 22 Dec 2021 09:23:47 +0100
Message-ID: <20211222082349.30378-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211222082349.30378-1-arnaud.pouliquen@foss.st.com>
References: <20211222082349.30378-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_04,2021-12-21_01,2021-12-02_01
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC PATCH v2 4/6] remoteproc: virtio: Create
	platform device for the remoteproc_virtio
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

Define a platform driver to prepare for the management of
remoteproc virtio devices as platform devices.

The platform device allows to pass rproc_vdev_data platform data to
specify properties that are stored in the rproc_vdev structure.

Such approach will allow to preserve legacy remoteproc virtio device
creation but also to probe the device using device tree mechanism.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update vs previous revision:
  - Fix commit and rename rproc_vdev_data to rproc_vdev_pdata
---
 drivers/remoteproc/remoteproc_internal.h |  6 +++
 drivers/remoteproc/remoteproc_virtio.c   | 65 ++++++++++++++++++++++++
 include/linux/remoteproc.h               |  2 +
 3 files changed, 73 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index e9e9a551a8c2..6f511c50a15d 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,12 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+struct rproc_vdev_pdata {
+	u32 rsc_offset;
+	unsigned int id;
+	unsigned int index;
+};
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 int rproc_of_parse_firmware(struct device *dev, int index,
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 51d415744fc6..5f8005caeb6e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2011 Texas Instruments, Inc.
  * Copyright (C) 2011 Google, Inc.
+ * Copyright (C) 2021 STMicroelectronics
  *
  * Ohad Ben-Cohen <ohad@wizery.com>
  * Brian Swetland <swetland@google.com>
@@ -13,6 +14,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/remoteproc.h>
 #include <linux/virtio.h>
@@ -575,3 +577,66 @@ void rproc_vdev_release(struct kref *ref)
 
 	rproc_rvdev_remove_device(rvdev);
 }
+
+static int rproc_virtio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rproc_vdev_pdata *vdev_data = dev->platform_data;
+	struct rproc_vdev *rvdev;
+	struct rproc *rproc;
+
+	if (!vdev_data)
+		return -EINVAL;
+
+	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
+	if (!rvdev)
+		return -ENOMEM;
+
+	rproc = container_of(dev->parent, struct rproc, dev);
+
+	rvdev->rsc_offset = vdev_data->rsc_offset;
+	rvdev->id = vdev_data->id;
+	rvdev->index = vdev_data->index;
+
+	rvdev->pdev = pdev;
+	rvdev->rproc = rproc;
+
+	platform_set_drvdata(pdev, rvdev);
+
+	return rproc_rvdev_add_device(rvdev);
+}
+
+static int rproc_virtio_remove(struct platform_device *pdev)
+{
+	struct rproc_vdev *rvdev = dev_get_drvdata(&pdev->dev);
+	struct rproc *rproc = rvdev->rproc;
+	struct rproc_vring *rvring;
+	int id;
+
+	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+		rvring = &rvdev->vring[id];
+		rproc_free_vring(rvring);
+	}
+
+	rproc_remove_subdev(rproc, &rvdev->subdev);
+	rproc_unregister_rvdev(rvdev);
+	dev_dbg(&pdev->dev, "virtio dev %d removed\n",  rvdev->index);
+
+	return 0;
+}
+
+/* Platform driver */
+static const struct of_device_id rproc_virtio_match[] = {
+	{ .compatible = "rproc-virtio", },
+	{},
+};
+
+static struct platform_driver rproc_virtio_driver = {
+	.probe		= rproc_virtio_probe,
+	.remove		= rproc_virtio_remove,
+	.driver		= {
+		.name	= "rproc-virtio",
+		.of_match_table	= rproc_virtio_match,
+	},
+};
+builtin_platform_driver(rproc_virtio_driver);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e0600e1e5c17..542a3d4664f2 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -616,6 +616,7 @@ struct rproc_vring {
  * struct rproc_vdev - remoteproc state for a supported virtio device
  * @refcount: reference counter for the vdev and vring allocations
  * @subdev: handle for registering the vdev as a rproc subdevice
+ * @pdev: remoteproc virtio platform device
  * @dev: device struct used for reference count semantics
  * @id: virtio device id (as in virtio_ids.h)
  * @node: list node
@@ -628,6 +629,7 @@ struct rproc_vdev {
 	struct kref refcount;
 
 	struct rproc_subdev subdev;
+	struct platform_device *pdev;
 	struct device dev;
 
 	unsigned int id;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
