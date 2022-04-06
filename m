Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BE4F5A58
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Apr 2022 11:57:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8669EC628A2;
	Wed,  6 Apr 2022 09:57:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E1F6C628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Apr 2022 09:57:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23664JV7025461;
 Wed, 6 Apr 2022 11:55:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qgMbLXnQGitI8fYv/RT4WWwZZQQU2JxeZAtYaqPueHg=;
 b=fyZvBn5oArmTfoCjzUTGQ6raD0gDES8E9RkU1u73vn+I3tgHAHnjgCgP3JLepzq0Z6k1
 ukYkfi6okmHSHzDhDTracjM7/WOuNm1Hdge7KbRzDWSxTSvGF938weeZvDOry0byVCuG
 0PLZjNcCPH29Ryj7wEiu8o3pTVfffcT6C3XMK6WBiMjKH5cuH15K2pbfk220ZNg0exiI
 Xd/XHbmctw4JbZqZgiuJuGcmEAcDKnq82wanEddWOfDudg6IsaLpGpZfi4b8UFvZap/C
 deneIui6WxJXC+ICPwdMv9lSW+wUDq2A/TMXvh71y4l9p9ctgxb0mEN1T6xYOdJa5W6A xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6du0vqtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 11:55:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA4D610002A;
 Wed,  6 Apr 2022 11:55:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1B2020F2A4;
 Wed,  6 Apr 2022 11:55:25 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 6 Apr 2022 11:55:25
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 6 Apr 2022 11:54:45 +0200
Message-ID: <20220406095446.1187968-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_03,2022-04-05_01,2022-02-23_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, Christoph Hellwig <hch@lst.de>
Subject: [Linux-stm32] [RFC PATCH v5 3/4] remoteproc: Move rproc_vdev
	management to remoteproc_virtio.c
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

---
Update vs previous revision:
 - clean up bad rproc_free_vring call in rproc_vdev_release
---
 drivers/remoteproc/remoteproc_core.c     | 162 +----------------------
 drivers/remoteproc/remoteproc_internal.h |  11 +-
 drivers/remoteproc/remoteproc_virtio.c   | 159 +++++++++++++++++++++-
 3 files changed, 167 insertions(+), 165 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 081bea39daf4..bd6d3f2decc6 100644
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
@@ -383,7 +381,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	return 0;
 }
 
-static int
+int
 rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
 {
 	struct rproc *rproc = rvdev->rproc;
@@ -434,164 +432,17 @@ void rproc_free_vring(struct rproc_vring *rvring)
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
-static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
-{
-	struct rproc *rproc = rvdev->rproc;
-	struct rproc_vring *rvring;
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
@@ -662,13 +513,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	return 0;
 }
 
-void rproc_vdev_release(struct kref *ref)
-{
-	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
-
-	rproc_rvdev_remove_device(rvdev);
-}
-
 /**
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 99f2ff88079f..f82f9a5378ae 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -41,14 +41,14 @@ struct rproc_vdev_data {
 
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
+void rproc_rvdev_remove_device(struct rproc_vdev *rvdev);
+irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
+void rproc_vdev_release(struct kref *ref);
 
 /* from remoteproc_debugfs.c */
 void rproc_remove_trace_file(struct dentry *tfile);
@@ -98,6 +98,7 @@ static inline void  rproc_char_device_remove(struct rproc *rproc)
 
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
+int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i);
 
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
@@ -110,6 +111,8 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 						       const struct firmware *fw);
 struct rproc_mem_entry *
 rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
+void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
+void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 70ab496d0431..e2e796ab2fd8 100644
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
@@ -339,7 +360,7 @@ static void rproc_virtio_dev_release(struct device *dev)
  *
  * Return: 0 on success or an appropriate error value otherwise
  */
-int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
+static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 {
 	struct rproc *rproc = rvdev->rproc;
 	struct device *dev = &rvdev->dev;
@@ -447,10 +468,144 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
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
+void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
+{
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
+	rproc_remove_rvdev(rvdev);
+	device_unregister(&rvdev->dev);
+}
+
+void rproc_vdev_release(struct kref *ref)
+{
+	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
+
+	rproc_rvdev_remove_device(rvdev);
+}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
