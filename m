Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8E5A2722
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 13:53:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1C58C64103;
	Fri, 26 Aug 2022 11:53:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 359C9C64103
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 11:53:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q7FCdZ022515;
 Fri, 26 Aug 2022 13:53:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=u0TnRDKj2byTDCqnIe6aj2gOD/6dozZ3PmLGMDW4nGQ=;
 b=znbEojWAxyv+R8aDruIXndo4YJu9Uy/YXWh/KnN7llpU1oLVjBng1QGcIfT0R/dCenXd
 sKFREie714mDDS/rodXFzTECy24fA+U92wIZEbJJbB2riGEbCPj72qjAhKr1cidfjmJs
 E5XNaWlnMJImo2ETlwwbDoOdOchtcX3Ci720dNir8AZdGq//eP8KjTxveJ07PV8Lq8U3
 pdN5lWa7rv0CC2QE8y2w0O7UK4BZxExAluG/+BADfjyour6ZwdET9ayeOGROIY86uyXk
 UYrm4/wv6TuxEebM6XtY6EfoGdTO75P4I1G5eiWdlhVr+u2mFJoF5od07RVJ4f0WKfnl 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j58m5rv0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 13:53:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFA22100039;
 Fri, 26 Aug 2022 13:53:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7C0F222CAA;
 Fri, 26 Aug 2022 13:53:25 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 26 Aug
 2022 13:53:25 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 26 Aug 2022 13:52:31 +0200
Message-ID: <20220826115232.2163130-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.24.3
In-Reply-To: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
References: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_06,2022-08-25_01,2022-06-22_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, Christoph Hellwig <hch@lst.de>
Subject: [Linux-stm32] [PATCH v8 3/4] remoteproc: Move rproc_vdev management
	to remoteproc_virtio.c
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

Move functions related to the management of the rproc_vdev
structure in the remoteproc_virtio.c.
The aim is to decorrelate as possible the virtio management from
the core part.

Due to the strong correlation between the vrings and the resource table
the rproc_alloc/parse/free_vring functions are kept in the remoteproc core.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
Update vs previous revision:
 - Take into account rproc_rvdev_release update according to
   1404acbb7f68 ("remoteproc: Fix dma_mem leak after rproc_shutdown")
   integration.
---
 drivers/remoteproc/remoteproc_core.c     | 156 +----------------------
 drivers/remoteproc/remoteproc_core.c     | 157 +----------------------
 drivers/remoteproc/remoteproc_internal.h |  10 +-
 drivers/remoteproc/remoteproc_virtio.c   | 154 +++++++++++++++++++++-
 3 files changed, 161 insertions(+), 160 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 756b84811022..a556504a4851 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -23,9 +23,7 @@
 #include <linux/panic_notifier.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
-#include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
-#include <linux/dma-direct.h> /* XXX: pokes into bus_dma_range */
 #include <linux/firmware.h>
 #include <linux/string.h>
 #include <linux/debugfs.h>
@@ -384,7 +382,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	return 0;
 }
 
-static int
+int
 rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
 {
 	struct rproc *rproc = rvdev->rproc;
@@ -435,166 +433,17 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	}
 }
 
-static int rproc_vdev_do_start(struct rproc_subdev *subdev)
-{
-	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
-
-	return rproc_add_virtio_dev(rvdev, rvdev->id);
-}
-
-static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
-{
-	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
-	int ret;
-
-	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
-	if (ret)
-		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
-}
-
-/**
- * rproc_rvdev_release() - release the existence of a rvdev
- *
- * @dev: the subdevice's dev
- */
-static void rproc_rvdev_release(struct device *dev)
-{
-	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
-
-	of_reserved_mem_device_release(dev);
-	dma_release_coherent_memory(dev);
-
-	kfree(rvdev);
-}
-
-static int copy_dma_range_map(struct device *to, struct device *from)
-{
-	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
-	int num_ranges = 0;
-
-	if (!map)
-		return 0;
-
-	for (r = map; r->size; r++)
-		num_ranges++;
-
-	new_map = kmemdup(map, array_size(num_ranges + 1, sizeof(*map)),
-			  GFP_KERNEL);
-	if (!new_map)
-		return -ENOMEM;
-	to->dma_range_map = new_map;
-	return 0;
-}
-
-static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
+void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
 {
 	if (rvdev && rproc)
 		list_add_tail(&rvdev->node, &rproc->rvdevs);
 }
 
-static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
+void rproc_remove_rvdev(struct rproc_vdev *rvdev)
 {
 	if (rvdev)
 		list_del(&rvdev->node);
 }
-
-static struct rproc_vdev *
-rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
-{
-	struct rproc_vdev *rvdev;
-	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
-	char name[16];
-	int i, ret;
-
-	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
-	if (!rvdev)
-		return ERR_PTR(-ENOMEM);
-
-	kref_init(&rvdev->refcount);
-
-	rvdev->id = rvdev_data->id;
-	rvdev->rproc = rproc;
-	rvdev->index = rvdev_data->index;
-
-	/* Initialise vdev subdevice */
-	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
-	rvdev->dev.parent = &rproc->dev;
-	rvdev->dev.release = rproc_rvdev_release;
-	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
-	dev_set_drvdata(&rvdev->dev, rvdev);
-
-	ret = device_register(&rvdev->dev);
-	if (ret) {
-		put_device(&rvdev->dev);
-		return ERR_PTR(ret);
-	}
-
-	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
-	if (ret)
-		goto free_rvdev;
-
-	/* Make device dma capable by inheriting from parent's capabilities */
-	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
-
-	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
-					   dma_get_mask(rproc->dev.parent));
-	if (ret) {
-		dev_warn(&rvdev->dev,
-			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
-			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
-	}
-
-	/* parse the vrings */
-	for (i = 0; i < rsc->num_of_vrings; i++) {
-		ret = rproc_parse_vring(rvdev, rsc, i);
-		if (ret)
-			goto free_rvdev;
-	}
-
-	/* remember the resource offset*/
-	rvdev->rsc_offset = rvdev_data->rsc_offset;
-
-	/* allocate the vring resources */
-	for (i = 0; i < rsc->num_of_vrings; i++) {
-		ret = rproc_alloc_vring(rvdev, i);
-		if (ret)
-			goto unwind_vring_allocations;
-	}
-
-	rproc_add_rvdev(rproc, rvdev);
-
-	rvdev->subdev.start = rproc_vdev_do_start;
-	rvdev->subdev.stop = rproc_vdev_do_stop;
-
-	rproc_add_subdev(rproc, &rvdev->subdev);
-
-	return rvdev;
-
-unwind_vring_allocations:
-	for (i--; i >= 0; i--)
-		rproc_free_vring(&rvdev->vring[i]);
-free_rvdev:
-	device_unregister(&rvdev->dev);
-	return ERR_PTR(ret);
-}
-
-void rproc_vdev_release(struct kref *ref)
-{
-	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
-	struct rproc_vring *rvring;
-	struct rproc *rproc = rvdev->rproc;
-	int id;
-
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
-		rvring = &rvdev->vring[id];
-		rproc_free_vring(rvring);
-	}
-
-	rproc_remove_subdev(rproc, &rvdev->subdev);
-	rproc_remove_rvdev(rvdev);
-	device_unregister(&rvdev->dev);
-}
-
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 07c503de0f95..711b0e1f2118 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -41,14 +41,13 @@ struct rproc_vdev_data {
 
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
-irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
-void rproc_vdev_release(struct kref *ref);
 int rproc_of_parse_firmware(struct device *dev, int index,
 			    const char **fw_name);
 
 /* from remoteproc_virtio.c */
-int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id);
-int rproc_remove_virtio_dev(struct device *dev, void *data);
+struct rproc_vdev *rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data);
+irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
+void rproc_vdev_release(struct kref *ref);
 
 /* from remoteproc_debugfs.c */
 void rproc_remove_trace_file(struct dentry *tfile);
@@ -98,6 +97,7 @@ static inline void  rproc_char_device_remove(struct rproc *rproc)
 
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
+int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i);
 
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
@@ -110,6 +110,8 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 						       const struct firmware *fw);
 struct rproc_mem_entry *
 rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
+void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
+void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0f7706e23eb9..0aaa70d91aa8 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -9,7 +9,9 @@
  * Brian Swetland <swetland@google.com>
  */
 
+#include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
 #include <linux/export.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/remoteproc.h>
@@ -23,6 +25,25 @@
 
 #include "remoteproc_internal.h"
 
+static int copy_dma_range_map(struct device *to, struct device *from)
+{
+	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
+	int num_ranges = 0;
+
+	if (!map)
+		return 0;
+
+	for (r = map; r->size; r++)
+		num_ranges++;
+
+	new_map = kmemdup(map, array_size(num_ranges + 1, sizeof(*map)),
+			  GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+	to->dma_range_map = new_map;
+	return 0;
+}
+
 static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 {
 	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
@@ -341,7 +362,7 @@ static void rproc_virtio_dev_release(struct device *dev)
  *
  * Return: 0 on success or an appropriate error value otherwise
  */
-int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
+static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 {
 	struct rproc *rproc = rvdev->rproc;
 	struct device *dev = &rvdev->dev;
@@ -449,10 +470,139 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
  *
  * Return: 0
  */
-int rproc_remove_virtio_dev(struct device *dev, void *data)
+static int rproc_remove_virtio_dev(struct device *dev, void *data)
 {
 	struct virtio_device *vdev = dev_to_virtio(dev);
 
 	unregister_virtio_device(vdev);
 	return 0;
 }
+
+static int rproc_vdev_do_start(struct rproc_subdev *subdev)
+{
+	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
+
+	return rproc_add_virtio_dev(rvdev, rvdev->id);
+}
+
+static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
+	int ret;
+
+	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
+	if (ret)
+		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
+}
+
+/**
+ * rproc_rvdev_release() - release the existence of a rvdev
+ *
+ * @dev: the subdevice's dev
+ */
+static void rproc_rvdev_release(struct device *dev)
+{
+	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
+
+	of_reserved_mem_device_release(dev);
+	dma_release_coherent_memory(dev);
+
+	kfree(rvdev);
+}
+
+struct rproc_vdev *
+rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
+{
+	struct rproc_vdev *rvdev;
+	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
+	char name[16];
+	int i, ret;
+
+	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
+	if (!rvdev)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&rvdev->refcount);
+
+	rvdev->id = rvdev_data->id;
+	rvdev->rproc = rproc;
+	rvdev->index = rvdev_data->index;
+
+	/* Initialise vdev subdevice */
+	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
+	rvdev->dev.parent = &rproc->dev;
+	rvdev->dev.release = rproc_rvdev_release;
+	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
+	dev_set_drvdata(&rvdev->dev, rvdev);
+
+	ret = device_register(&rvdev->dev);
+	if (ret) {
+		put_device(&rvdev->dev);
+		return ERR_PTR(ret);
+	}
+
+	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
+	if (ret)
+		goto free_rvdev;
+
+	/* Make device dma capable by inheriting from parent's capabilities */
+	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
+
+	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
+					   dma_get_mask(rproc->dev.parent));
+	if (ret) {
+		dev_warn(&rvdev->dev,
+			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
+			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
+	}
+
+	/* parse the vrings */
+	for (i = 0; i < rsc->num_of_vrings; i++) {
+		ret = rproc_parse_vring(rvdev, rsc, i);
+		if (ret)
+			goto free_rvdev;
+	}
+
+	/* remember the resource offset*/
+	rvdev->rsc_offset = rvdev_data->rsc_offset;
+
+	/* allocate the vring resources */
+	for (i = 0; i < rsc->num_of_vrings; i++) {
+		ret = rproc_alloc_vring(rvdev, i);
+		if (ret)
+			goto unwind_vring_allocations;
+	}
+
+	rproc_add_rvdev(rproc, rvdev);
+
+	rvdev->subdev.start = rproc_vdev_do_start;
+	rvdev->subdev.stop = rproc_vdev_do_stop;
+
+	rproc_add_subdev(rproc, &rvdev->subdev);
+
+	return rvdev;
+
+unwind_vring_allocations:
+	for (i--; i >= 0; i--)
+		rproc_free_vring(&rvdev->vring[i]);
+free_rvdev:
+	device_unregister(&rvdev->dev);
+	return ERR_PTR(ret);
+}
+
+void rproc_vdev_release(struct kref *ref)
+{
+	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
+	struct rproc_vring *rvring;
+	struct rproc *rproc = rvdev->rproc;
+	int id;
+
+	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+		rvring = &rvdev->vring[id];
+		rproc_free_vring(rvring);
+	}
+
+	rproc_remove_subdev(rproc, &rvdev->subdev);
+	rproc_remove_rvdev(rvdev);
+	device_unregister(&rvdev->dev);
+}
-- 
2.24.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
