Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA98D551
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2019 15:49:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F97C35E08;
	Wed, 14 Aug 2019 13:49:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2830C35E06
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2019 13:49:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EDkmsH020415; Wed, 14 Aug 2019 15:49:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NLCHhd75JSHx4e77HaCWpWqj90Jx61g+TCKyoiYVG5s=;
 b=EZQl9+NnCTTbyhj4Xi9XUab1qkxpKQntfgaOy93bW8RagqNoBMzAU7IAXe8d8hGQLw1t
 JjMzvV7kQAISTH0FmexBCep66k2iT/tJjWKEzGnSr71wV4bKSEsobwFTuK5LwGHwJj8x
 aw5mzaozisNjVCjT8exSrxerE+WnWl1aZhS0P5MJeBa8fuO0UpD7iYNbIt31JRr0QOUu
 an/qFuHsvUR4DJ1HedR0DCJHhF01L1hkxaoP/Z+M+I3PZ7YwX+5D30MCB2OsH4wMFErt
 ktoM4yysT2/nFng84ww5iiY0Zz6uekAXG1Wca0aCupg+DgM5KSC7xmTaobn21mKw1JtE Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u9mtm5qk9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 14 Aug 2019 15:49:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8100E31;
 Wed, 14 Aug 2019 13:49:00 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 760B22FFE88;
 Wed, 14 Aug 2019 15:49:00 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug
 2019 15:49:00 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug 2019 15:48:59
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Date: Wed, 14 Aug 2019 15:48:52 +0200
Message-ID: <1565790533-10043-4-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_05:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 3/4] media: stm32-dcmi: add media
	controller support
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

Add media controller support to dcmi in order
to walk within remote subdevices pipeline.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/Kconfig            |  2 +-
 drivers/media/platform/stm32/stm32-dcmi.c | 52 ++++++++++++++++++++++++-------
 2 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 8a19654..de7e21f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -121,7 +121,7 @@ config VIDEO_S3C_CAMIF
 
 config VIDEO_STM32_DCMI
 	tristate "STM32 Digital Camera Memory Interface (DCMI) support"
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_V4L2 && OF && MEDIA_CONTROLLER
 	depends on ARCH_STM32 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 18acecf..302c40e 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -169,6 +169,9 @@ struct stm32_dcmi {
 
 	/* Ensure DMA operations atomicity */
 	struct mutex			dma_lock;
+
+	struct media_device		mdev;
+	struct media_pad		vid_cap_pad;
 };
 
 static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
@@ -1559,14 +1562,6 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
-	ret = video_register_device(dcmi->vdev, VFL_TYPE_GRABBER, -1);
-	if (ret) {
-		dev_err(dcmi->dev, "Failed to register video device\n");
-		return ret;
-	}
-
-	dev_dbg(dcmi->dev, "Device registered as %s\n",
-		video_device_node_name(dcmi->vdev));
 	return 0;
 }
 
@@ -1759,10 +1754,19 @@ static int dcmi_probe(struct platform_device *pdev)
 
 	q = &dcmi->queue;
 
+	dcmi->v4l2_dev.mdev = &dcmi->mdev;
+
+	/* Initialize media device */
+	strscpy(dcmi->mdev.model, DRV_NAME, sizeof(dcmi->mdev.model));
+	snprintf(dcmi->mdev.bus_info, sizeof(dcmi->mdev.bus_info),
+		 "platform:%s", DRV_NAME);
+	dcmi->mdev.dev = &pdev->dev;
+	media_device_init(&dcmi->mdev);
+
 	/* Initialize the top-level structure */
 	ret = v4l2_device_register(&pdev->dev, &dcmi->v4l2_dev);
 	if (ret)
-		goto err_dma_release;
+		goto err_media_device_cleanup;
 
 	dcmi->vdev = video_device_alloc();
 	if (!dcmi->vdev) {
@@ -1782,6 +1786,25 @@ static int dcmi_probe(struct platform_device *pdev)
 				  V4L2_CAP_READWRITE;
 	video_set_drvdata(dcmi->vdev, dcmi);
 
+	/* Media entity pads */
+	dcmi->vid_cap_pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&dcmi->vdev->entity,
+				     1, &dcmi->vid_cap_pad);
+	if (ret) {
+		dev_err(dcmi->dev, "Failed to init media entity pad\n");
+		goto err_device_release;
+	}
+	dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
+
+	ret = video_register_device(dcmi->vdev, VFL_TYPE_GRABBER, -1);
+	if (ret) {
+		dev_err(dcmi->dev, "Failed to register video device\n");
+		goto err_media_entity_cleanup;
+	}
+
+	dev_dbg(dcmi->dev, "Device registered as %s\n",
+		video_device_node_name(dcmi->vdev));
+
 	/* Buffer queue */
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
@@ -1797,12 +1820,12 @@ static int dcmi_probe(struct platform_device *pdev)
 	ret = vb2_queue_init(q);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to initialize vb2 queue\n");
-		goto err_device_release;
+		goto err_media_entity_cleanup;
 	}
 
 	ret = dcmi_graph_init(dcmi);
 	if (ret < 0)
-		goto err_device_release;
+		goto err_media_entity_cleanup;
 
 	/* Reset device */
 	ret = reset_control_assert(dcmi->rstc);
@@ -1829,11 +1852,14 @@ static int dcmi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_notifier_cleanup(&dcmi->notifier);
+err_media_entity_cleanup:
+	media_entity_cleanup(&dcmi->vdev->entity);
 err_device_release:
 	video_device_release(dcmi->vdev);
 err_device_unregister:
 	v4l2_device_unregister(&dcmi->v4l2_dev);
-err_dma_release:
+err_media_device_cleanup:
+	media_device_cleanup(&dcmi->mdev);
 	dma_release_channel(dcmi->dma_chan);
 
 	return ret;
@@ -1847,7 +1873,9 @@ static int dcmi_remove(struct platform_device *pdev)
 
 	v4l2_async_notifier_unregister(&dcmi->notifier);
 	v4l2_async_notifier_cleanup(&dcmi->notifier);
+	media_entity_cleanup(&dcmi->vdev->entity);
 	v4l2_device_unregister(&dcmi->v4l2_dev);
+	media_device_cleanup(&dcmi->mdev);
 
 	dma_release_channel(dcmi->dma_chan);
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
