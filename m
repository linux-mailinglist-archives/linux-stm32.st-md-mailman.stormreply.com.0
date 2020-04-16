Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6F1ACD12
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900E6C36B0C;
	Thu, 16 Apr 2020 16:14:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 286ECC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGCFia010372; Thu, 16 Apr 2020 18:14:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BnLDwpVavIoWUlJvnJXxlP7jRIgDXwSpYFB3LVEa9rQ=;
 b=ae2jYbNByuYpMObCYUimmLeavvGxBYez7RROONuWOeoptsMV+WYpaitC94VTSA1y3zhC
 RwuXaysBQpUcXp7PhAbnmSQm7St8wlGXtpyP/ejn+VldOR7thWVEvwe4I1U9DluKoSxA
 NwGEzvYuvc1DoCVxwCIfbd6Nq8jz5exHcmISAMPAHEt2dPEu5WVAuVjvKuJW5f5BMHES
 tNxxZ/sWz37IlqVWa1B+IN/Z71zbW0UCDVaKMeH9yuL6hwjY1TdW6dmfsn74a+bo+N/f
 StEyjehyfpEmYMTEbTM2UU4db6cp9rOKaeb2tMrKDtyZ9YAAHIvRyNbBW5fbC325a0Aw mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn94kmvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06EEB10002A;
 Thu, 16 Apr 2020 18:14:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED8962B2D2A;
 Thu, 16 Apr 2020 18:14:19 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:19
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:22 +0200
Message-ID: <20200416161331.7606-10-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 09/18] remoteproc: Move vring management from
	core to virtio
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

The vrings are correlated to the virtio implementation.
Move following functions to rproc virtio:
- rproc_alloc_vring
- rproc_free_vring
- rproc_parse_vring

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 97 -----------------------
 drivers/remoteproc/remoteproc_internal.h |  4 -
 drivers/remoteproc/remoteproc_virtio.c   | 98 ++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 101 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ac57cd8016be..c9e07c53ed0c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -312,103 +312,6 @@ int rproc_check_carveout_da(struct rproc *rproc,
 }
 EXPORT_SYMBOL(rproc_check_carveout_da);
 
-int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
-{
-	struct rproc *rproc = rvdev->rproc;
-	struct device *dev = &rproc->dev;
-	struct rproc_vring *rvring = &rvdev->vring[i];
-	struct fw_rsc_vdev *rsc;
-	int ret, size, notifyid;
-	struct rproc_mem_entry *mem;
-
-	/* actual size of vring (in bytes) */
-	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
-
-	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
-
-	/* Search for pre-registered carveout */
-	mem = rproc_find_carveout_by_name(rproc, "vdev%dvring%d", rvdev->index,
-					  i);
-	if (mem) {
-		if (rproc_check_carveout_da(rproc, mem, rsc->vring[i].da, size))
-			return -ENOMEM;
-	} else {
-		/* Register carveout in in list */
-		mem = rproc_mem_entry_init(dev, NULL, 0,
-					   size, rsc->vring[i].da,
-					   rproc_alloc_carveout,
-					   rproc_release_carveout,
-					   "vdev%dvring%d",
-					   rvdev->index, i);
-		if (!mem) {
-			dev_err(dev, "Can't allocate memory entry structure\n");
-			return -ENOMEM;
-		}
-
-		rproc_add_carveout(rproc, mem);
-	}
-
-	/*
-	 * Assign an rproc-wide unique index for this vring
-	 * TODO: assign a notifyid for rvdev updates as well
-	 * TODO: support predefined notifyids (via resource table)
-	 */
-	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
-	if (ret < 0) {
-		dev_err(dev, "idr_alloc failed: %d\n", ret);
-		return ret;
-	}
-	notifyid = ret;
-
-	/* Potentially bump max_notifyid */
-	if (notifyid > rproc->max_notifyid)
-		rproc->max_notifyid = notifyid;
-
-	rvring->notifyid = notifyid;
-
-	/* Let the rproc know the notifyid of this vring.*/
-	rsc->vring[i].notifyid = notifyid;
-	return 0;
-}
-
-int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
-{
-	struct rproc *rproc = rvdev->rproc;
-	struct device *dev = &rproc->dev;
-	struct fw_rsc_vdev_vring *vring = &rsc->vring[i];
-	struct rproc_vring *rvring = &rvdev->vring[i];
-
-	dev_dbg(dev, "vdev rsc: vring%d: da 0x%x, qsz %d, align %d\n",
-		i, vring->da, vring->num, vring->align);
-
-	/* verify queue size and vring alignment are sane */
-	if (!vring->num || !vring->align) {
-		dev_err(dev, "invalid qsz (%d) or alignment (%d)\n",
-			vring->num, vring->align);
-		return -EINVAL;
-	}
-
-	rvring->len = vring->num;
-	rvring->align = vring->align;
-	rvring->rvdev = rvdev;
-
-	return 0;
-}
-
-void rproc_free_vring(struct rproc_vring *rvring)
-{
-	struct rproc *rproc = rvring->rvdev->rproc;
-	int idx = rvring - rvring->rvdev->vring;
-	struct fw_rsc_vdev *rsc;
-
-	idr_remove(&rproc->notifyids, rvring->notifyid);
-
-	/* reset resource entry info */
-	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-	rsc->vring[idx].da = 0;
-	rsc->vring[idx].notifyid = -1;
-}
-
 static int rproc_compare_of(struct device *dev, void *data)
 {
 	if (dev->of_node)
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index f230296908ac..5139cca646ca 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -55,10 +55,6 @@ extern struct class rproc_class;
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
-int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i);
-void rproc_free_vring(struct rproc_vring *rvring);
-int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
-
 void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index e1d7371d2d64..4634cd63d547 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -26,6 +26,104 @@
 
 #include "remoteproc_internal.h"
 
+static int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
+{
+	struct rproc *rproc = rvdev->rproc;
+	struct device *dev = &rproc->dev;
+	struct rproc_vring *rvring = &rvdev->vring[i];
+	struct fw_rsc_vdev *rsc;
+	int ret, size, notifyid;
+	struct rproc_mem_entry *mem;
+
+	/* actual size of vring (in bytes) */
+	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
+
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+
+	/* Search for pre-registered carveout */
+	mem = rproc_find_carveout_by_name(rproc, "vdev%dvring%d", rvdev->index,
+					  i);
+	if (mem) {
+		if (rproc_check_carveout_da(rproc, mem, rsc->vring[i].da, size))
+			return -ENOMEM;
+	} else {
+		/* Register carveout in in list */
+		mem = rproc_mem_entry_init(dev, NULL, 0,
+					   size, rsc->vring[i].da,
+					   rproc_alloc_carveout,
+					   rproc_release_carveout,
+					   "vdev%dvring%d",
+					   rvdev->index, i);
+		if (!mem) {
+			dev_err(dev, "Can't allocate memory entry structure\n");
+			return -ENOMEM;
+		}
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	/*
+	 * Assign an rproc-wide unique index for this vring
+	 * TODO: assign a notifyid for rvdev updates as well
+	 * TODO: support predefined notifyids (via resource table)
+	 */
+	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(dev, "idr_alloc failed: %d\n", ret);
+		return ret;
+	}
+	notifyid = ret;
+
+	/* Potentially bump max_notifyid */
+	if (notifyid > rproc->max_notifyid)
+		rproc->max_notifyid = notifyid;
+
+	rvring->notifyid = notifyid;
+
+	/* Let the rproc know the notifyid of this vring.*/
+	rsc->vring[i].notifyid = notifyid;
+	return 0;
+}
+
+static int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc,
+			     int i)
+{
+	struct rproc *rproc = rvdev->rproc;
+	struct device *dev = &rproc->dev;
+	struct fw_rsc_vdev_vring *vring = &rsc->vring[i];
+	struct rproc_vring *rvring = &rvdev->vring[i];
+
+	dev_dbg(dev, "vdev rsc: vring%d: da 0x%x, qsz %d, align %d\n",
+		i, vring->da, vring->num, vring->align);
+
+	/* verify queue size and vring alignment are sane */
+	if (!vring->num || !vring->align) {
+		dev_err(dev, "invalid qsz (%d) or alignment (%d)\n",
+			vring->num, vring->align);
+		return -EINVAL;
+	}
+
+	rvring->len = vring->num;
+	rvring->align = vring->align;
+	rvring->rvdev = rvdev;
+
+	return 0;
+}
+
+static void rproc_free_vring(struct rproc_vring *rvring)
+{
+	struct rproc *rproc = rvring->rvdev->rproc;
+	int idx = rvring - rvring->rvdev->vring;
+	struct fw_rsc_vdev *rsc;
+
+	idr_remove(&rproc->notifyids, rvring->notifyid);
+
+	/* reset resource entry info */
+	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
+	rsc->vring[idx].da = 0;
+	rsc->vring[idx].notifyid = -1;
+}
+
 /* kick the remote processor, and let it know which virtqueue to poke at */
 static bool rproc_virtio_notify(struct virtqueue *vq)
 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
