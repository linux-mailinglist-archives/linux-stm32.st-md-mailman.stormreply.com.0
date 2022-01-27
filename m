Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4160149E088
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jan 2022 12:18:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA087C5F1FC;
	Thu, 27 Jan 2022 11:18:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39BE6C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 11:18:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20R9KFG7032351;
 Thu, 27 Jan 2022 12:18:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Mhu35WwCME0IjYf3oxN7vJ4sN+99NzW1K4iP2kRp7m8=;
 b=o/IrUSr9QZssrAOVhm2r5XCi1N+a+lVLZrcBEMUl46J0tbYfXmCT69OKA3mBCpdEv070
 GqLaOItkZwG8DhEF7xVI02PFRAUVNgUqPenLJ2ywSzfb2yV1y7WG0B7GarwV/2EeCX8u
 7UkKgWtrymQWoZbU7D94fV7PYGmaCztH2odhROD6/EV5/Qkoy0xdxUx5S3/QwGtLikiK
 U0HG6UuhnZXdS0uKVFGFIHGQDSLKGCD42X9z4KH8imhTdsfeIFg0JYUIze5MAT2edkgt
 9W9gteNiLu2gmrUiLt+SlTZkPPWO0znEqJvfnXW0jxyiFVfYuH5xcr0MzhDUQPcboCX8 sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3durp30n2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 12:18:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 768D410002A;
 Thu, 27 Jan 2022 12:18:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E2ED2128B2;
 Thu, 27 Jan 2022 12:18:03 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 27 Jan 2022 12:18:03
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <hugues.fruchet@foss.st.com>, <mchehab@kernel.org>
Date: Thu, 27 Jan 2022 12:18:02 +0100
Message-ID: <20220127111802.976275-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: stm32-dcmi: create video dev once
	sensor is binded
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

In case of an error during the initialization of the sensor,
the video device is still available since created at the
probe of the dcmi driver. Moreover the device wouldn't
be released even when removing the module since the release
is performed as part of the notifier unbind callback
(not called if no sensor is properly initialized).

This patch move the video device creation with the v4l2 notifier
complete handler in order to avoid having a video device created when
an error happen during the pipe (dcmi - sensor) initialization.

This also makes the video device creation symmetric with the
release which is already done within the notifier unbind handler.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v1: this patch is the replacement patch of a previous attempt [1]
to move the register within the bound callback.

[1] https://lore.kernel.org/linux-media/31ca9ccc-77d4-4368-1024-db70e8e1e7f2@xs4all.nl/
 drivers/media/platform/stm32/stm32-dcmi.c | 69 ++++++++++++-----------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index e1b17c05229c..80d0fbeabb4f 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -134,6 +134,7 @@ struct stm32_dcmi {
 	struct video_device		*vdev;
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
+	struct v4l2_subdev		*remote;
 	struct v4l2_format		fmt;
 	struct v4l2_rect		crop;
 	bool				do_crop;
@@ -579,9 +580,9 @@ static void dcmi_buf_queue(struct vb2_buffer *vb)
 	spin_unlock_irq(&dcmi->irqlock);
 }
 
-static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
+static struct media_entity *dcmi_find_source(struct v4l2_subdev *subdev)
 {
-	struct media_entity *entity = &dcmi->vdev->entity;
+	struct media_entity *entity = &subdev->entity;
 	struct media_pad *pad;
 
 	/* Walk searching for entity having no sink */
@@ -1721,6 +1722,7 @@ static int dcmi_framesizes_init(struct stm32_dcmi *dcmi)
 static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
+	int src_pad;
 	int ret;
 
 	/*
@@ -1728,7 +1730,7 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	 * we search for the source subdevice
 	 * in order to expose it through V4L2 interface
 	 */
-	dcmi->source = media_entity_to_v4l2_subdev(dcmi_find_source(dcmi));
+	dcmi->source = media_entity_to_v4l2_subdev(dcmi_find_source(dcmi->remote));
 	if (!dcmi->source) {
 		dev_err(dcmi->dev, "Source subdevice not found\n");
 		return -ENODEV;
@@ -1768,6 +1770,34 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(dcmi->dev, "Failed to register video device\n");
+		return ret;
+	}
+
+	dev_dbg(dcmi->dev, "Device registered as %s\n",
+		video_device_node_name(dcmi->vdev));
+
+	/*
+	 * Link remote sub-device to DCMI, it could be
+	 * a parallel camera sensor or a bridge
+	 */
+	src_pad = media_entity_get_fwnode_pad(&dcmi->remote->entity,
+					      dcmi->remote->fwnode,
+					      MEDIA_PAD_FL_SOURCE);
+
+	ret = media_create_pad_link(&dcmi->remote->entity, src_pad,
+				    &dcmi->vdev->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
+			dcmi->remote->name);
+	else
+		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
+			dcmi->remote->name);
+
 	return 0;
 }
 
@@ -1788,31 +1818,11 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd)
 {
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
-	unsigned int ret;
-	int src_pad;
 
 	dev_dbg(dcmi->dev, "Subdev \"%s\" bound\n", subdev->name);
+	dcmi->remote = subdev;
 
-	/*
-	 * Link this sub-device to DCMI, it could be
-	 * a parallel camera sensor or a bridge
-	 */
-	src_pad = media_entity_get_fwnode_pad(&subdev->entity,
-					      subdev->fwnode,
-					      MEDIA_PAD_FL_SOURCE);
-
-	ret = media_create_pad_link(&subdev->entity, src_pad,
-				    &dcmi->vdev->entity, 0,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
-			subdev->name);
-	else
-		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
-			subdev->name);
-
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_async_notifier_operations dcmi_graph_notify_ops = {
@@ -2008,15 +2018,6 @@ static int dcmi_probe(struct platform_device *pdev)
 	}
 	dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
 
-	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
-	if (ret) {
-		dev_err(dcmi->dev, "Failed to register video device\n");
-		goto err_media_entity_cleanup;
-	}
-
-	dev_dbg(dcmi->dev, "Device registered as %s\n",
-		video_device_node_name(dcmi->vdev));
-
 	/* Buffer queue */
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
