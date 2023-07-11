Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EE74EEFA
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 14:33:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A86A3C6B457;
	Tue, 11 Jul 2023 12:33:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3D36C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 12:33:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36BCDhnj007024; Tue, 11 Jul 2023 14:33:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=QJv4FgeoZI13kyNGmPPMTf96OOf5S9wcDXXdOT9sXaA=;
 b=ux39JguAlYY+jh7XS7y8SJTpRyHyL+aEJMOQV9brHU5R/r5EZs9t+vCos6Viru9E/Sse
 mF9b/GF4Z7n4+nZRSrMwqYfdetW2rr9al4JJiBHQHhkOlkcOZizh781ngO4ukUsg3S9Y
 LfW0AZBpUv9FGT00iONGPBo8z2NIEaryH2ExMkj/IOlsfq+Oe3WzZHWVexQq2G6hOe3T
 Ol/wE57wuU3psJfIywqD3VGHAF0jO0MRc5r5RWcouHz67Q9orlmjl+UJREpAbwC12np3
 hg7iYPPjWwlMuQKh0BlbrMErwnc+KdBC4slDAcdhj67SZrOPLw5FVy4h2WIZPyADaCVC vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rs6wb8407-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 14:33:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56BFE100058;
 Tue, 11 Jul 2023 14:33:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF3702248AE;
 Tue, 11 Jul 2023 14:33:10 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 11 Jul
 2023 14:33:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 11 Jul 2023 14:32:10 +0200
Message-ID: <20230711123211.794838-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230711123211.794838-1-alain.volmat@foss.st.com>
References: <20230711123211.794838-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_06,2023-07-11_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] media: stm32: dcmi: only call s_stream on
	the source subdev
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

Avoid calling s_stream on each subdev until reaching the sensor and
instead call s_stream on the source subdev only (which will in turn
do whatever needed to start the stream).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 63 +++++---------------
 1 file changed, 14 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index dad6e22e4ce4..ac8a5031dce6 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -134,6 +134,7 @@ struct stm32_dcmi {
 	struct video_device		*vdev;
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
+	struct v4l2_subdev		*s_subdev;
 	struct v4l2_format		fmt;
 	struct v4l2_rect		crop;
 	bool				do_crop;
@@ -692,51 +693,6 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
 	return 0;
 }
 
-static int dcmi_pipeline_s_stream(struct stm32_dcmi *dcmi, int state)
-{
-	struct media_entity *entity = &dcmi->vdev->entity;
-	struct v4l2_subdev *subdev;
-	struct media_pad *pad;
-	int ret;
-
-	/* Start/stop all entities within pipeline */
-	while (1) {
-		pad = &entity->pads[0];
-		if (!(pad->flags & MEDIA_PAD_FL_SINK))
-			break;
-
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-
-		entity = pad->entity;
-		subdev = media_entity_to_v4l2_subdev(entity);
-
-		ret = v4l2_subdev_call(subdev, video, s_stream, state);
-		if (ret < 0 && ret != -ENOIOCTLCMD) {
-			dev_err(dcmi->dev, "%s: \"%s\" failed to %s streaming (%d)\n",
-				__func__, subdev->name,
-				state ? "start" : "stop", ret);
-			return ret;
-		}
-
-		dev_dbg(dcmi->dev, "\"%s\" is %s\n",
-			subdev->name, state ? "started" : "stopped");
-	}
-
-	return 0;
-}
-
-static int dcmi_pipeline_start(struct stm32_dcmi *dcmi)
-{
-	return dcmi_pipeline_s_stream(dcmi, 1);
-}
-
-static void dcmi_pipeline_stop(struct stm32_dcmi *dcmi)
-{
-	dcmi_pipeline_s_stream(dcmi, 0);
-}
-
 static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
@@ -758,9 +714,12 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_pm_put;
 	}
 
-	ret = dcmi_pipeline_start(dcmi);
-	if (ret)
+	ret = v4l2_subdev_call(dcmi->s_subdev, video, s_stream, 1);
+	if (ret < 0) {
+		dev_err(dcmi->dev, "%s: Failed to start source subdev, error (%d)\n",
+			__func__, ret);
 		goto err_media_pipeline_stop;
+	}
 
 	spin_lock_irq(&dcmi->irqlock);
 
@@ -862,7 +821,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err_pipeline_stop:
-	dcmi_pipeline_stop(dcmi);
+	v4l2_subdev_call(dcmi->s_subdev, video, s_stream, 0);
 
 err_media_pipeline_stop:
 	video_device_pipeline_stop(dcmi->vdev);
@@ -889,8 +848,12 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 {
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
 	struct dcmi_buf *buf, *node;
+	int ret;
 
-	dcmi_pipeline_stop(dcmi);
+	ret = v4l2_subdev_call(dcmi->s_subdev, video, s_stream, 0);
+	if (ret < 0)
+		dev_err(dcmi->dev, "%s: Failed to stop source subdev, error (%d)\n",
+			__func__, ret);
 
 	video_device_pipeline_stop(dcmi->vdev);
 
@@ -1876,6 +1839,8 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
 			subdev->name);
 
+	dcmi->s_subdev = subdev;
+
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
