Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79E52E773
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 10:31:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA6AAC5F1ED;
	Fri, 20 May 2022 08:31:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDCB3C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 08:31:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8N4uh009064;
 Fri, 20 May 2022 10:31:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=jJqFYr/2kSFBBvwcNFQzdXYzRLTYOhwzMWQZ47+U0eM=;
 b=1XaD9oxWSDAZuwmh7yhFRShcHlu+fvFhvXpJz/oo8hD3a7v0J2mq6Rm/eV8txz8T+SwR
 rAj65pGe6ERCgwXiOHVIakgmCZ3qSPqQFCgVqVtyqUN/VQTZU78WNHue9ztxxVfBnKxH
 Ys1MphcL0EHDWTTZNTOVLL2ez7qTrE60UYYa/a8squWkyRDajojYWw4k11WkAz995zkp
 hLPdjQZaceAQlDUj9cSbPUMjDlK0UURBD5obFgLBXD3l6Deo8F8kNEEumF2TgGCxbfIt
 2JIEhWP+Fl10LB7/PptxBxoSuzSQOfDks4mTEBepYeqFOi0pjMu/aOOZFyWQbONYUyUl zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9f7h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 10:31:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52836100038;
 Fri, 20 May 2022 10:31:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49418215131;
 Fri, 20 May 2022 10:31:10 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 10:31:09 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 20 May 2022 10:29:36 +0200
Message-ID: <20220520082940.2984914-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
References: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Deepak Kumar Singh <quic_deesin@quicinc.com>,
 Chris Lew <quic_clew@quicinc.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC PATCH 06/10] rpmsg: virtio: Add support of the
	VIRTIO_RPMSG_F_FC feature
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

Introduce the VIRTIO_RPMSG_F_FC feature in charge of the end
point flow control management.
The virtio feature is negotiated. If the remote side supports it,
the rpmsg_fc device is probed.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/Kconfig            |  1 +
 drivers/rpmsg/virtio_rpmsg_bus.c | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index c6659f27c617..e39cf32483de 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -89,6 +89,7 @@ config RPMSG_VIRTIO
 	depends on HAS_DMA
 	select RPMSG
 	select RPMSG_NS
+	select RPMSG_FC
 	select VIRTIO
 
 endmenu
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 785fda77984e..40d2ab86b395 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -19,6 +19,7 @@
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
+#include <linux/rpmsg/fc.h>
 #include <linux/rpmsg/ns.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
@@ -70,6 +71,7 @@ struct virtproc_info {
 
 /* The feature bitmap for virtio rpmsg */
 #define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
+#define VIRTIO_RPMSG_F_FC	1 /* RP supports endpoint flow control notifications */
 
 /**
  * struct rpmsg_hdr - common header for all rpmsg messages
@@ -909,7 +911,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
 	struct virtio_rpmsg_channel *vch = NULL;
-	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
+	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl, *rpdev_fc;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -1013,6 +1015,30 @@ static int rpmsg_probe(struct virtio_device *vdev)
 			goto free_ctrldev;
 	}
 
+	/* If supported by the remote processor, enable the flow control service */
+	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_FC)) {
+		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
+		if (!vch) {
+			err = -ENOMEM;
+			goto free_ns;
+		}
+
+		/* Link the channel to our vrp */
+		vch->vrp = vrp;
+
+		/* Assign public information to the rpmsg_device */
+		rpdev_fc = &vch->rpdev;
+		rpdev_fc->ops = &virtio_rpmsg_ops;
+		rpdev_fc->little_endian = virtio_is_little_endian(vrp->vdev);
+
+		rpdev_fc->dev.parent = &vrp->vdev->dev;
+		rpdev_fc->dev.release = virtio_rpmsg_release_device;
+
+		err = rpmsg_fc_register_device(rpdev_fc);
+		if (err)
+			goto free_ns;
+	}
+
 	/*
 	 * Prepare to kick but don't notify yet - we can't do this before
 	 * device is ready.
@@ -1034,6 +1060,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	return 0;
 
+free_ns:
+	if (rpdev_ns)
+		device_unregister(&rpdev_ns->dev);
 free_ctrldev:
 	rpmsg_virtio_del_ctrl_dev(rpdev_ctrl);
 free_coherent:
@@ -1082,6 +1111,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_FC,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
