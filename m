Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16323031A
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jul 2020 08:38:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0C2BC36B2E;
	Tue, 28 Jul 2020 06:38:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1B9DC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 06:38:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S6R7RO020678; Tue, 28 Jul 2020 08:38:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ajyvh+tBMcwXmZAbVqtgESn3hRz8JO8E3SSTw659wtA=;
 b=ahwMcP16A7T1FkUcl+gWZ2TQzBnE/8jtvvtmI4A2iwzWfxlSafWmVXyZGPnRFGMoc/0e
 OAW1VrxEgzNQLZR0sXpI28ZsNFAzaMUOAYnCfytXr6ErBQLizhStBOoP6/xDD3SB9PAC
 fIh1LrPi0ygrqh0tELHiNq+1qdrK+B8tZJ/AY2E5kw18pI5qVCn9wli5ei8p9SdafRL6
 CxHVu5oYnJipMFKOoGY7F/ttcgaoL7RsbbkJ+Yx8SlQwRJGNyhioFPu/lqIjdmm9nDcj
 yhVdRPHj6ju4x8hCPAYojgTyG/mfoEzThVJmrFyO/T64pVmp8Us0J4zLBeOk6ujHxM/j Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9cu7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 08:38:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F7E9100034;
 Tue, 28 Jul 2020 08:38:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22BB3210F96;
 Tue, 28 Jul 2020 08:38:33 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jul 2020 08:38:32
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <hugues.fruchet@st.com>, <mchehab@kernel.org>
Date: Tue, 28 Jul 2020 08:37:57 +0200
Message-ID: <1595918278-9724-2-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: linux-kernel@vger.kernel.org, yannick.fertre@st.com, alain.volmat@st.com,
 hans.verkuil@cisco.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] media: stm32-dcmi: create video dev
	within notifier bound
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
bound handler in order to avoid having a video device created when
an error happen during the pipe (dcmi - sensor) initialization.

This also makes the video device creation symmetric with the
release which is already done within the notifier unbind handler.

Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b8931490b83b..5e60d4c6eeeb 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1747,6 +1747,15 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 
 	dev_dbg(dcmi->dev, "Subdev \"%s\" bound\n", subdev->name);
 
+	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(dcmi->dev, "Failed to register video device\n");
+		return ret;
+	}
+
+	dev_dbg(dcmi->dev, "Device registered as %s\n",
+		video_device_node_name(dcmi->vdev));
+
 	/*
 	 * Link this sub-device to DCMI, it could be
 	 * a parallel camera sensor or a bridge
@@ -1759,10 +1768,11 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				    &dcmi->vdev->entity, 0,
 				    MEDIA_LNK_FL_IMMUTABLE |
 				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
+	if (ret) {
 		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
 			subdev->name);
-	else
+		video_unregister_device(dcmi->vdev);
+	} else
 		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
 			subdev->name);
 
@@ -1974,15 +1984,6 @@ static int dcmi_probe(struct platform_device *pdev)
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
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
