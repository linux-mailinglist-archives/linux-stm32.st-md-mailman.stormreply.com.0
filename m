Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802641EACA
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Oct 2021 12:14:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6099C5AB68;
	Fri,  1 Oct 2021 10:14:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93F32C5AB63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Oct 2021 10:14:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1918I0b7030519; 
 Fri, 1 Oct 2021 12:12:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=m+VP0hcuRq/Ykjd7M5pZ16VJNgKkpYObCuedev0S0vE=;
 b=qWl2iJ8vSTb0Z+8PHE+REEm9cvgbBe3/p/WWgJGy8moxCNOzwlUkGyIhQ1fKi4GE2/Vp
 vv2irS4sFqBbuPgcs3IuMphxZI350fhrX+MTSTg92TzbXSRSbSYyJtYhgAFjAD0HTcZE
 k9aUN41vRPJ6AVp84auZA5YLPOa/aSnpoMIisHo0G5GQGHzEEeAKJh1PvjBrxP+DK9s4
 /uv25qTyS4wbKqeaFzuSra4xIqqNJFt0211HN0BPa4nS+VT80EaF4ug2lu+Gui5T8KFb
 9AvBUAn76xHEQBY99i6oKGarW2I85cca97iuqrE8xxzZU9yJytJibyenxU34Mq3ukr46 KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bds9njb56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 12:12:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC727100039;
 Fri,  1 Oct 2021 12:12:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2932226FDD;
 Fri,  1 Oct 2021 12:12:48 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct 2021 12:12:48
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 1 Oct 2021 12:12:33 +0200
Message-ID: <20211001101234.4247-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-09-30_01,2020-04-07_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, Christoph Hellwig <hch@lst.de>
Subject: [Linux-stm32] [RFC PATCH 6/7] remoteproc: virtio: Add helper to
	create platform device
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

Add capability to create platform device for the rproc virtio.
This is a step to move forward the management of the rproc virtio
as an independent device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_internal.h | 15 ++++++++++
 drivers/remoteproc/remoteproc_virtio.c   | 36 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 1b963a8912ed..0bb1b14e5136 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -39,11 +39,26 @@ int rproc_of_parse_firmware(struct device *dev, int index,
 #if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
 
 int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
+struct platform_device *
+rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data);
+void rproc_virtio_unregister_device(struct rproc_vdev *rvdev);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
 void rproc_vdev_release(struct kref *ref);
 
 #else
 
+static inline struct platform_device *
+rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data)
+{
+	return ERR_PTR(-ENXIO);
+}
+
+static inline void rproc_virtio_unregister_device(struct rproc_vdev *rvdev)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+}
+
 int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
 {
 	/* This shouldn't be possible */
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 9b2ab79e4c4c..7188fb8ce40f 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -574,6 +574,42 @@ void rproc_vdev_release(struct kref *ref)
 	rproc_rvdev_remove_device(rvdev);
 }
 
+/**
+ * rproc_virtio_register_device() - register a remoteproc virtio device
+ * @rproc: rproc handle to add the remoteproc virtio device to
+ * @vdev_data: platform device data
+ *
+ * Return: 0 on success, and an appropriate error value otherwise
+ */
+struct platform_device *
+rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data)
+{
+	struct device *dev = &rproc->dev;
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, "rproc-virtio", vdev_data->index, vdev_data,
+					     sizeof(*vdev_data));
+	if (PTR_ERR_OR_ZERO(pdev)) {
+		dev_err(rproc->dev.parent,
+			"failed to create rproc-virtio device\n");
+	}
+
+	return  pdev;
+}
+EXPORT_SYMBOL(rproc_virtio_register_device);
+
+/**
+ * rproc_virtio_unregister_device() - unregister a remoteproc virtio device
+ * @rvdev: remote proc virtio handle to unregister
+ *
+ */
+void rproc_virtio_unregister_device(struct rproc_vdev *rvdev)
+{
+	if (rvdev->pdev)
+		platform_device_unregister(rvdev->pdev);
+}
+EXPORT_SYMBOL(rproc_virtio_unregister_device);
+
 static int rproc_virtio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
