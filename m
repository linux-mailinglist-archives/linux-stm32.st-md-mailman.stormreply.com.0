Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96E3374EA
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 15:04:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAA2CC58D42;
	Thu, 11 Mar 2021 14:04:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0123C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 14:04:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BE2UO0014858; Thu, 11 Mar 2021 15:04:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lWFey/pCnmnlnw/O7EkLMa5PprZ+QGEb0DzlpJb2vBU=;
 b=gXKUyNZGFHOMlf++wGH9GjT2Z5oijEdUELngWYmuhMEe+0dbN1ZQlrhIb16qn6ldwdIJ
 ZvDmfbJB/ncaWeiIe/NehJ6LHeGeykSeVETE2asIlRXJJH61Bg8AwIDLnKfcSrRRy+Zl
 IuvjLW04wfeb9eXkktAAkN5nJOnLJpFIFT8nXLQDF+JSkuCRzNgKVcj8fnfCvjyA44Ii
 tYSlQXAneZpiy1cj0S8QDOHPqVHH0Tsd+0G4tdKn6l/ZYzuby883gGjaSy0fOJTPk7BH
 AlfyOp6TPxij8+aY2S0BvFjQV3cEqfXES7ajN00X7FMxOe9MZB2NsJs/FNBZ3ZUvrt28 Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y76hy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 15:04:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F9F4100034;
 Thu, 11 Mar 2021 15:04:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33BFB247BC8;
 Thu, 11 Mar 2021 15:04:28 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:27
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Thu, 11 Mar 2021 15:04:12 +0100
Message-ID: <20210311140413.31725-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_05:2021-03-10,
 2021-03-11 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5/6] rpmsg: virtio: Register the rpmsg_char
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

Instantiate the rpmsg_char device on virtio RPMsg bus creation.
This provides the capability, with the RPMSG_CREATE_EPT_IOCTL ioctl,
to create RPMsg char device endpoints relying on the
rpmsg_chrdev_create_eptdev API.

Notice that the created endpoints are attached to the rpmsg_ctldev
device, but not associated to a channel.
As consequence, the endpoint source and destination addresses have to
been specified and there is no channel creation and no name service
announcement to inform the remote side.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---

update vs [1]
- rework the changelog
- remove useless rpdev_ns pointer initialisation.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210219111501.14261-12-arnaud.pouliquen@foss.st.com/

---
 drivers/rpmsg/virtio_rpmsg_bus.c | 62 +++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e87d4cf926eb..8e49a3bacfc7 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -813,14 +813,57 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
 	wake_up_interruptible(&vrp->sendq);
 }
 
+/*
+ * Called to expose to user a /dev/rpmsg_ctrlX interface allowing to
+ * create endpoint-to-endpoint communication without associated RPMsg channel.
+ * The endpoints are rattached to the ctrldev RPMsg device.
+ */
+static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev)
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
+	err = rpmsg_chrdev_register_device(rpdev_ctrl);
+	if (err) {
+		kfree(vch);
+		return ERR_PTR(err);
+	}
+
+	return rpdev_ctrl;
+}
+
+static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
+{
+	if (!rpdev_ctrl)
+		return;
+	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
 	static const char * const names[] = { "input", "output" };
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
-	struct virtio_rpmsg_channel *vch;
-	struct rpmsg_device *rpdev_ns;
+	struct virtio_rpmsg_channel *vch = NULL;
+	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -894,12 +937,18 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	vdev->priv = vrp;
 
+	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
+	if (IS_ERR(rpdev_ctrl)) {
+		err = PTR_ERR(rpdev_ctrl);
+		goto free_coherent;
+	}
+
 	/* if supported by the remote processor, enable the name service */
 	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
 		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
 		if (!vch) {
 			err = -ENOMEM;
-			goto free_coherent;
+			goto free_ctrldev;
 		}
 
 		/* Link the channel to our vrp */
@@ -915,7 +964,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 		err = rpmsg_ns_register_device(rpdev_ns);
 		if (err)
-			goto free_coherent;
+			goto free_vch;
 	}
 
 	/*
@@ -939,8 +988,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	return 0;
 
-free_coherent:
+free_vch:
 	kfree(vch);
+free_ctrldev:
+	rpmsg_virtio_del_ctrl_dev(rpdev_ctrl);
+free_coherent:
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
