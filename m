Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C40D35BFF2A
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Sep 2022 15:51:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE78DC640FB;
	Wed, 21 Sep 2022 13:51:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDD7EC640FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 13:51:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LAd6mL018770;
 Wed, 21 Sep 2022 15:50:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=auaUXIta+zFxaDnjNz1FE84SwhE+Df9KtGkTe+wtIEs=;
 b=giKLUqGw55qR1TJQnKtZJ439vd7yvUfhn3/PDH06OBMRQekk6jKh9y8WJkIjcajIp1vk
 pWXqV1RlwA10Xtx8oDQqYSwVxrZ6kvX3jfgCdqA4YsMQh4zsEqLmGrtPy5s1BqsSeDLa
 42UwGVHUSH7FW2CfRI4IU6KMMN4LKsxWfKxHsT905zZfNN+ZHCaQREA8dPNzVH5+gIsH
 TVFr49MJHM8OJQwPnxseYy6aEmIjVadymvFsb1PaPJfZlkO2VRaYomZOrifMo+EsfMTN
 VdNSxdOhTknqtXwebySI5Dlrggdtnw5eqStx+exzNUR/3NGhUpxnHuT1LLuberY1/YQE tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jr11x11u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Sep 2022 15:50:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7F83100038;
 Wed, 21 Sep 2022 15:50:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3EE72309E4;
 Wed, 21 Sep 2022 15:50:50 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 15:50:47 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 21 Sep 2022 15:50:41 +0200
Message-ID: <20220921135044.917140-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.24.3
In-Reply-To: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
References: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_07,2022-09-20_02,2022-06-22_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, Christoph Hellwig <hch@lst.de>
Subject: [Linux-stm32] [PATCH v9 1/4] remoteproc: core: Introduce
	rproc_rvdev_add_device function
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

In preparation of the migration of the management of rvdev in
remoteproc_virtio.c, this patch spins off a new function to manage the
remoteproc virtio device creation.

The rproc_rvdev_add_device will be moved to remoteproc_virtio.c.

The rproc_vdev_data structure is introduced to provide information for
the rvdev creation. This structure allows to manage the rvdev and vrings
allocation in the rproc_rvdev_add_device function.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
Update from previous version:
- rebase on top of commit:
  7d7f8fe4e399 ("remoteproc: Harden rproc_handle_vdev() against integer overflow")

 drivers/remoteproc/remoteproc_core.c     | 147 +++++++++++++----------
 drivers/remoteproc/remoteproc_internal.h |  15 +++
 2 files changed, 98 insertions(+), 64 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f5ba3b305aaf..f8dd8c526299 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -486,75 +486,23 @@ static int copy_dma_range_map(struct device *to, struct device *from)
 	return 0;
 }
 
-/**
- * rproc_handle_vdev() - handle a vdev fw resource
- * @rproc: the remote processor
- * @ptr: the vring resource descriptor
- * @offset: offset of the resource entry
- * @avail: size of available data (for sanity checking the image)
- *
- * This resource entry requests the host to statically register a virtio
- * device (vdev), and setup everything needed to support it. It contains
- * everything needed to make it possible: the virtio device id, virtio
- * device features, vrings information, virtio config space, etc...
- *
- * Before registering the vdev, the vrings are allocated from non-cacheable
- * physically contiguous memory. Currently we only support two vrings per
- * remote processor (temporary limitation). We might also want to consider
- * doing the vring allocation only later when ->find_vqs() is invoked, and
- * then release them upon ->del_vqs().
- *
- * Note: @da is currently not really handled correctly: we dynamically
- * allocate it using the DMA API, ignoring requested hard coded addresses,
- * and we don't take care of any required IOMMU programming. This is all
- * going to be taken care of when the generic iommu-based DMA API will be
- * merged. Meanwhile, statically-addressed iommu-based firmware images should
- * use RSC_DEVMEM resource entries to map their required @da to the physical
- * address of their base CMA region (ouch, hacky!).
- *
- * Return: 0 on success, or an appropriate error code otherwise
- */
-static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
-			     int offset, int avail)
+static struct rproc_vdev *
+rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
 {
-	struct fw_rsc_vdev *rsc = ptr;
-	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
-	size_t rsc_size;
-	int i, ret;
+	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
 	char name[16];
-
-	/* make sure resource isn't truncated */
-	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
-	if (size_add(rsc_size, rsc->config_len) > avail) {
-		dev_err(dev, "vdev rsc is truncated\n");
-		return -EINVAL;
-	}
-
-	/* make sure reserved bytes are zeroes */
-	if (rsc->reserved[0] || rsc->reserved[1]) {
-		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
-		return -EINVAL;
-	}
-
-	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
-		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
-
-	/* we currently support only two vrings per rvdev */
-	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
-		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
-		return -EINVAL;
-	}
+	int i, ret;
 
 	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
 	if (!rvdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	kref_init(&rvdev->refcount);
 
-	rvdev->id = rsc->id;
+	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
-	rvdev->index = rproc->nb_vdev++;
+	rvdev->index = rvdev_data->index;
 
 	/* Initialise vdev subdevice */
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
@@ -566,7 +514,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	ret = device_register(&rvdev->dev);
 	if (ret) {
 		put_device(&rvdev->dev);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
@@ -579,7 +527,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
 					   dma_get_mask(rproc->dev.parent));
 	if (ret) {
-		dev_warn(dev,
+		dev_warn(&rvdev->dev,
 			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
 			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
 	}
@@ -592,7 +540,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	}
 
 	/* remember the resource offset*/
-	rvdev->rsc_offset = offset;
+	rvdev->rsc_offset = rvdev_data->rsc_offset;
 
 	/* allocate the vring resources */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
@@ -608,14 +556,14 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 
 	rproc_add_subdev(rproc, &rvdev->subdev);
 
-	return 0;
+	return rvdev;
 
 unwind_vring_allocations:
 	for (i--; i >= 0; i--)
 		rproc_free_vring(&rvdev->vring[i]);
 free_rvdev:
 	device_unregister(&rvdev->dev);
-	return ret;
+	return ERR_PTR(ret);
 }
 
 void rproc_vdev_release(struct kref *ref)
@@ -635,6 +583,77 @@ void rproc_vdev_release(struct kref *ref)
 	device_unregister(&rvdev->dev);
 }
 
+/**
+ * rproc_handle_vdev() - handle a vdev fw resource
+ * @rproc: the remote processor
+ * @ptr: the vring resource descriptor
+ * @offset: offset of the resource entry
+ * @avail: size of available data (for sanity checking the image)
+ *
+ * This resource entry requests the host to statically register a virtio
+ * device (vdev), and setup everything needed to support it. It contains
+ * everything needed to make it possible: the virtio device id, virtio
+ * device features, vrings information, virtio config space, etc...
+ *
+ * Before registering the vdev, the vrings are allocated from non-cacheable
+ * physically contiguous memory. Currently we only support two vrings per
+ * remote processor (temporary limitation). We might also want to consider
+ * doing the vring allocation only later when ->find_vqs() is invoked, and
+ * then release them upon ->del_vqs().
+ *
+ * Note: @da is currently not really handled correctly: we dynamically
+ * allocate it using the DMA API, ignoring requested hard coded addresses,
+ * and we don't take care of any required IOMMU programming. This is all
+ * going to be taken care of when the generic iommu-based DMA API will be
+ * merged. Meanwhile, statically-addressed iommu-based firmware images should
+ * use RSC_DEVMEM resource entries to map their required @da to the physical
+ * address of their base CMA region (ouch, hacky!).
+ *
+ * Return: 0 on success, or an appropriate error code otherwise
+ */
+static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
+			     int offset, int avail)
+{
+	struct fw_rsc_vdev *rsc = ptr;
+	struct device *dev = &rproc->dev;
+	struct rproc_vdev *rvdev;
+	size_t rsc_size;
+	struct rproc_vdev_data rvdev_data;
+
+	/* make sure resource isn't truncated */
+	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
+	if (size_add(rsc_size, rsc->config_len) > avail) {
+		dev_err(dev, "vdev rsc is truncated\n");
+		return -EINVAL;
+	}
+
+	/* make sure reserved bytes are zeroes */
+	if (rsc->reserved[0] || rsc->reserved[1]) {
+		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
+		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
+
+	/* we currently support only two vrings per rvdev */
+	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
+		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
+		return -EINVAL;
+	}
+
+	rvdev_data.id = rsc->id;
+	rvdev_data.index = rproc->nb_vdev++;
+	rvdev_data.rsc_offset = offset;
+	rvdev_data.rsc = rsc;
+
+	rvdev = rproc_rvdev_add_device(rproc, &rvdev_data);
+	if (IS_ERR(rvdev))
+		return PTR_ERR(rvdev);
+
+	return 0;
+}
+
 /**
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 72d4d3d7d94d..07c503de0f95 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,21 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+/**
+ * struct rproc_vdev_data - remoteproc virtio device data
+ * @rsc_offset: offset of the vdev's resource entry
+ * @id: virtio device id (as in virtio_ids.h)
+ * @index: vdev position versus other vdev declared in resource table
+ * @rsc: pointer to the vdev resource entry. Valid only during vdev init as
+ *       the resource can be cached by rproc.
+ */
+struct rproc_vdev_data {
+	u32 rsc_offset;
+	unsigned int id;
+	u32 index;
+	struct fw_rsc_vdev *rsc;
+};
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
-- 
2.24.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
