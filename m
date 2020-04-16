Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C31ACD1A
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2431DC36B12;
	Thu, 16 Apr 2020 16:14:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9224C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGBred014920; Thu, 16 Apr 2020 18:14:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=pa2XKTGGGIC2Vn05mbBcixvwehzmq3xfK9D+yvR8aDA=;
 b=ctuniGyVBb/CSSktXIwtrf4cIzhh/SE4J02vC1c/q9ms5aJ6vP7UBwNolnOT8dq/bEMZ
 pSY2sXRCQPSANeKInNiuFO+kyKz5n/cMlNQPIMWW2l2pxmMeGpBkvBwzv2fCra9LtuUU
 WXWzJwMiWg1PgQFX9/l9o7SCBsZkHQkq1G7IME90wqf1xuCH2ZEBn64WcAea0XBa7IhK
 DPu1kd/TpeUkowvpdBz1sDwZZSIe0eKSCA5Y1XWB6nARkLxbXZsGVEGhK3ZXtKc5mTru
 QkyeiztmT1jTLfNGeQ7kzYQ7/FlL5ohT/DZ3D+RThuxhEr5lb33AOneELH59ROkcE2or bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn75umfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D23610002A;
 Thu, 16 Apr 2020 18:14:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40D832B2D2C;
 Thu, 16 Apr 2020 18:14:31 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:30
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:29 +0200
Message-ID: <20200416161331.7606-17-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 16/18] remoteproc: Parse virtio node for memory
	region
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

Add the possibility to declare memories associated to the virtio paltform
in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 77 +++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0fd938afd146..3302ee7d6c14 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -610,12 +610,71 @@ static const struct component_ops rproc_virtio_ops = {
 	.unbind = rproc_virtio_unbind,
 };
 
+static int rproc_virtio_of_parse(struct device *dev, struct rproc_vdev *rvdev)
+{
+	struct device_node *np = dev->of_node;
+	struct rproc *rproc = rvdev->rproc;
+	struct of_phandle_iterator it;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+	char name[32];
+	u64 da;
+	int index = 0;
+
+	/* the reg is used to specify the vdev index */
+	if (of_property_read_u32(np, "reg", &rvdev->index))
+		return -EINVAL;
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+
+	while (of_phandle_iterator_next(&it) == 0) {
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire memory-region\n");
+			return -EINVAL;
+		}
+
+		if (rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
+			dev_err(dev, "memory region not valid %pa\n",
+				&rmem->base);
+			return -EINVAL;
+		}
+
+		snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
+		if (strcmp(it.node->name, name)) {
+			/* Register memory region */
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, da,
+						   rproc_default_mem_alloc,
+						   rproc_default_mem_release,
+						   it.node->name);
+
+			if (mem)
+				rproc_coredump_add_segment(rproc, da,
+							   rmem->size);
+		} else {
+			/* Register reserved memory for vdev buffer alloc */
+			mem = rproc_of_resm_mem_entry_init(dev, index,
+							   rmem->size,
+							   rmem->base,
+							   it.node->name);
+		}
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+		index++;
+	}
+
+	return 0;
+}
+
 static int rproc_virtio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	struct rproc_vdev *rvdev;
-	struct rproc *rproc;
 	int ret;
 
 	rvdev = devm_kzalloc(&pdev->dev, sizeof(*rvdev), GFP_KERNEL);
@@ -627,18 +686,16 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 		 * The platform device is declared in the device tree
 		 * retrieve rproc struct through the remoteproc platform
 		 */
-		rproc = rproc_get_by_node(dev->parent->of_node);
+		rvdev->rproc = rproc_get_by_node(dev->parent->of_node);
 
-		/* the reg is used to specify the vdev index */
-		if (of_property_read_u32(np, "reg", &rvdev->index))
-			return -EINVAL;
+		ret = rproc_virtio_of_parse(dev, rvdev);
 	} else {
 		struct rproc_vdev_data *vdev_data = pdev->dev.platform_data;
 
 		if (!vdev_data)
 			return -EINVAL;
 
-		rproc = container_of(dev->parent, struct rproc, dev);
+		rvdev->rproc = container_of(dev->parent, struct rproc, dev);
 
 		rvdev->rsc_offset = vdev_data->rsc_offset;
 		rvdev->rsc = vdev_data->rsc;
@@ -649,8 +706,10 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
+	if (ret)
+		return ret;
+
 	rvdev->pdev = pdev;
-	rvdev->rproc = rproc;
 
 	platform_set_drvdata(pdev, rvdev);
 
@@ -658,7 +717,7 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rproc_register_rvdev(rproc, rvdev);
+	rproc_register_rvdev(rvdev->rproc, rvdev);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
