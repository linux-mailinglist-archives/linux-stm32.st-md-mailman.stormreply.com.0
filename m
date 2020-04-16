Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D3A1ACD07
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADEE4C36B0C;
	Thu, 16 Apr 2020 16:14:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64816C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGDXZ7026476; Thu, 16 Apr 2020 18:14:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Cwjql6eiDaqwrFTsuNZJ1xtw/Hxa6DOpsF+k+xk4lPI=;
 b=wymU8dLCKivMPa2f4wr9o+F3jfZOuZGwt3XBEB49bakagWRP6/DY5v4nmbD6IcE350xz
 2Y/oB+k4wulbye3TzvfHdtRsxtefARQhAeoRrW32rGq3d60318fF+tJ56LSSG8hM4s8t
 goIcUil5iIz2cwLccsCnUEsKghdWCJMjTdJBYni+IVk8ea7EiH0wuKbC8RUulpYmNf9l
 fwb97Wjz43656k/irklATGPOnjTdUivNiu6ePdDOA8Bj2OR4khR01oI4BkEnDMme3KQw
 Tl4Y4FZh9CWxj3i436F56fdqV6Bpebvx3wcmeS0nTBY2CV/aIdO1tl3CHwdUTIpZxk3M UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn8s3kky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1382B10002A;
 Thu, 16 Apr 2020 18:14:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 082A42B2D2A;
 Thu, 16 Apr 2020 18:14:09 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:08
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:15 +0200
Message-ID: <20200416161331.7606-3-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 02/18] remoteproc: Introduce virtio device
	add/remove functions in core.
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
rproc_virtio, this patch spins off new functions to manage the
virtio device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 149 +++++++++++++++------------
 1 file changed, 83 insertions(+), 66 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 2a0425ab82a7..5c90d569c0f7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -441,6 +441,86 @@ static void rproc_rvdev_release(struct device *dev)
 	kfree(rvdev);
 }
 
+static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
+{
+	struct rproc *rproc = rvdev->rproc;
+	struct fw_rsc_vdev *rsc = rvdev->rsc;
+	char name[16];
+	int ret, i;
+
+	/* Initialise vdev subdevice */
+	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
+	rvdev->dev.parent = &rproc->dev;
+	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
+	rvdev->dev.release = rproc_rvdev_release;
+	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
+	dev_set_drvdata(&rvdev->dev, rvdev);
+
+	ret = device_register(&rvdev->dev);
+	if (ret) {
+		put_device(&rvdev->dev);
+		return ret;
+	}
+	/* Make device dma capable by inheriting from parent's capabilities */
+	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
+
+	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
+					   dma_get_mask(rproc->dev.parent));
+	if (ret) {
+		dev_warn(&rvdev->dev,
+			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
+			 dma_get_mask(rproc->dev.parent), ret);
+	}
+
+	/* parse the vrings */
+	for (i = 0; i < rsc->num_of_vrings; i++) {
+		ret = rproc_parse_vring(rvdev, rsc, i);
+		if (ret)
+			goto free_rvdev;
+	}
+
+	/* allocate the vring resources */
+	for (i = 0; i < rsc->num_of_vrings; i++) {
+		ret = rproc_alloc_vring(rvdev, i);
+		if (ret)
+			goto free_vg;
+	}
+
+	rvdev->subdev.start = rproc_vdev_do_start;
+	rvdev->subdev.stop = rproc_vdev_do_stop;
+
+	rproc_add_subdev(rproc, &rvdev->subdev);
+
+	return 0;
+
+free_vg:
+	for (i--; i >= 0; i--) {
+		struct rproc_vring *rvring = &rvdev->vring[i];
+
+		rproc_free_vring(rvring);
+	}
+
+free_rvdev:
+	device_unregister(&rvdev->dev);
+
+	return ret;
+}
+
+static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
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
+	device_unregister(&rvdev->dev);
+}
+
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -473,8 +553,6 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
-	int i, ret;
-	char name[16];
 
 	/* make sure resource isn't truncated */
 	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
@@ -505,83 +583,22 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	kref_init(&rvdev->refcount);
 
 	rvdev->rsc = rsc;
+	rvdev->rsc_offset = offset;
 	rvdev->id = rsc->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rproc->nb_vdev++;
 
-	/* Initialise vdev subdevice */
-	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
-	rvdev->dev.parent = rproc->dev.parent;
-	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
-	rvdev->dev.release = rproc_rvdev_release;
-	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
-	dev_set_drvdata(&rvdev->dev, rvdev);
-
-	ret = device_register(&rvdev->dev);
-	if (ret) {
-		put_device(&rvdev->dev);
-		return ret;
-	}
-	/* Make device dma capable by inheriting from parent's capabilities */
-	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
-
-	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
-					   dma_get_mask(rproc->dev.parent));
-	if (ret) {
-		dev_warn(dev,
-			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
-			 dma_get_mask(rproc->dev.parent), ret);
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
-	rvdev->rsc_offset = offset;
-
-	/* allocate the vring resources */
-	for (i = 0; i < rsc->num_of_vrings; i++) {
-		ret = rproc_alloc_vring(rvdev, i);
-		if (ret)
-			goto unwind_vring_allocations;
-	}
-
 	list_add_tail(&rvdev->node, &rproc->rvdevs);
 
-	rvdev->subdev.start = rproc_vdev_do_start;
-	rvdev->subdev.stop = rproc_vdev_do_stop;
-
-	rproc_add_subdev(rproc, &rvdev->subdev);
-
-	return 0;
-
-unwind_vring_allocations:
-	for (i--; i >= 0; i--)
-		rproc_free_vring(&rvdev->vring[i]);
-free_rvdev:
-	device_unregister(&rvdev->dev);
-	return ret;
+	return rproc_rvdev_add_device(rvdev);
 }
 
 void rproc_vdev_release(struct kref *ref)
 {
 	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
-	struct rproc_vring *rvring;
-	struct rproc *rproc = rvdev->rproc;
-	int id;
-
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
-		rvring = &rvdev->vring[id];
-		rproc_free_vring(rvring);
-	}
 
-	rproc_remove_subdev(rproc, &rvdev->subdev);
+	rproc_rvdev_remove_device(rvdev);
 	list_del(&rvdev->node);
-	device_unregister(&rvdev->dev);
 }
 
 /**
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
