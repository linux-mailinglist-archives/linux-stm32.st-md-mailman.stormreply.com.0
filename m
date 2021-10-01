Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB841EACE
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Oct 2021 12:14:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD9AC5AB66;
	Fri,  1 Oct 2021 10:14:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73B10C5AB63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Oct 2021 10:14:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1916jbE5023327; 
 Fri, 1 Oct 2021 12:12:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=E1I/w2w0cB+PtZXQKX4NanqnPqz4eb/cNsElTQRr8GA=;
 b=UWtK9qrmNWR0rsbOjmooR6tvJpUyxf2OqiyvxwtVIj/kYwuIWnS+NFlUF08gCQBNR+79
 SK8uIc5vmNaUQRjiIRWwFMHjqRUEgSR4lIiEyTooY23FdNye+4FwOleiMJJu/U/JTwmY
 sW2UrpipGyizxkDXov7dbVdIxGpjJKsSQFvcK1tyTEut8hjSDhJRo/8hx08c4CI5n5Gb
 1suTVZllNCnw8lQ3OAatyM6rijVAoGrSmwujnCoyNwCoo7nCkeN2iLBjBrfU+HpHsU3P
 6bs7CCOk4YzINBh1xXqMqgdyLC9yWzr/PDxXNGlst8gRm1dxUCIvGEmt/h9zb78Q5InB xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bdwbjh779-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 12:12:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02E0E100034;
 Fri,  1 Oct 2021 12:12:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE751226FDD;
 Fri,  1 Oct 2021 12:12:47 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct 2021 12:12:47
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 1 Oct 2021 12:12:32 +0200
Message-ID: <20211001101234.4247-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-10-01_01,2020-04-07_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, Christoph Hellwig <hch@lst.de>
Subject: [Linux-stm32] [RFC PATCH 5/7] remoteproc: virtio: Create platform
	device for the remoteproc_virtio
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

Define a platform device for the remoteproc virtio to prepare the
management of the remoteproc virtio as a platform device.

The platform device allows to pass rproc_vdev_data platform data to
specify properties that are stored in the rproc_vdev structure.

Such approach will allow to preserve legacy remoteproc virtio device
creation but also to probe the device using device tree mechanism.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_internal.h |  6 +++
 drivers/remoteproc/remoteproc_virtio.c   | 65 ++++++++++++++++++++++++
 include/linux/remoteproc.h               |  2 +
 3 files changed, 73 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 4ce012c353c0..1b963a8912ed 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,12 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+struct rproc_vdev_data {
+	u32 rsc_offset;
+	unsigned int id;
+	unsigned int index;
+};
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 int rproc_of_parse_firmware(struct device *dev, int index,
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index c9eecd2f9fb2..9b2ab79e4c4c 100644
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
@@ -571,3 +573,66 @@ void rproc_vdev_release(struct kref *ref)
 
 	rproc_rvdev_remove_device(rvdev);
 }
+
+static int rproc_virtio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rproc_vdev_data *vdev_data = dev->platform_data;
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
