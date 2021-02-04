Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E48530EEC0
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Feb 2021 09:46:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26549C57B56;
	Thu,  4 Feb 2021 08:46:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53515C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Feb 2021 08:46:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1148ftTc005300; Thu, 4 Feb 2021 09:46:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hs5ntI48NvW7gaVrpRXbUA/P/bQnTWX7GlNcZaiJfvw=;
 b=ElXJ7OnzSNT0VEt17IApfGb/8FZbgZIu/ZfTV9xGkcRRIEx1YWZqewXaVqzD3Twl6112
 lEbfqkDxNbFLvvx026ZN1GOsZ5LBE1giBEg1CTUHyIFtSPRpiFN/rX5RRmDm6BRQKFFc
 yvPEkQDUQr9fnW+b4WWufB8sbTDHcwu4fcPxPhxFOAsOJNRsXePq5nWqKza4omgvTOCi
 dLOduMwofemcFMIOtIPQ0CIXXmde7yiz79Ary8vucj/rUaeeKaCCHkJn9Ag7SB/7xhEe
 wiUzg8uccT9AKB5DIXPvWtvUuz49jhR/TzSbWHh7C7uoSLUQBqKqYJRmsT19T/b5Qg8M aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0fs5xst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 09:46:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57EF510002A;
 Thu,  4 Feb 2021 09:46:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4905722AE4D;
 Thu,  4 Feb 2021 09:46:19 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:18
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Thu, 4 Feb 2021 09:45:26 +0100
Message-ID: <20210204084534.10516-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 07/15] rpmsg: virtio: probe the rpmsg_ctrl
	device
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

Instantiate the rpmsg_ioctl device on virtio RPMsg bus creation.
This provides the possibility to expose the RPMSG_CREATE_EPT_IOCTL
to create RPMsg chdev endpoint.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
V3:
Fix compilation issue
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

warnings:
drivers/rpmsg/virtio_rpmsg_bus.c:978 rpmsg_probe() error: uninitialized symbol 'vch'.
drivers/rpmsg/virtio_rpmsg_bus.c:979 rpmsg_probe() error: uninitialized symbol 'rpdev_ctrl'.
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 37 +++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e87d4cf926eb..5143fdeca306 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -813,6 +813,35 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
 	wake_up_interruptible(&vrp->sendq);
 }
 
+static struct rpmsg_device *rpmsg_virtio_add_char_dev(struct virtio_device *vdev)
+{
+	struct virtproc_info *vrp = vdev->priv;
+	struct virtio_rpmsg_channel *vch;
+	struct rpmsg_device *rpdev_ctrl;
+	int err = 0;
+
+	vch = kzalloc(sizeof(*vch), GFP_KERNEL);
+	if (!vch)
+		return ERR_PTR(-ENOMEM);
+
+	/* Link the channel to the vrp */
+	vch->vrp = vrp;
+
+	/* Assign public information to the rpmsg_device */
+	rpdev_ctrl = &vch->rpdev;
+	rpdev_ctrl->ops = &virtio_rpmsg_ops;
+
+	rpdev_ctrl->dev.parent = &vrp->vdev->dev;
+	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
+	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
+
+	err = rpmsg_ctrl_register_device(rpdev_ctrl);
+	if (err)
+		return ERR_PTR(err);
+
+	return rpdev_ctrl;
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
@@ -820,7 +849,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
 	struct virtio_rpmsg_channel *vch;
-	struct rpmsg_device *rpdev_ns;
+	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl = NULL;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -918,6 +947,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
 			goto free_coherent;
 	}
 
+	rpdev_ctrl = rpmsg_virtio_add_char_dev(vdev);
+	if (IS_ERR(rpdev_ctrl)) {
+		err = PTR_ERR(rpdev_ctrl);
+		goto free_coherent;
+	}
 	/*
 	 * Prepare to kick but don't notify yet - we can't do this before
 	 * device is ready.
@@ -941,6 +975,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 free_coherent:
 	kfree(vch);
+	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
