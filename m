Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD49213BAFE
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 09:29:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A43C36B0F;
	Wed, 15 Jan 2020 08:29:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7541BC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 08:29:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00F8Rn5V008078; Wed, 15 Jan 2020 09:29:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=x+t2q3oFR0/g2C2BlDWSZ5LQ8cOF3XZQewhkJ5cwYOM=;
 b=XmTMhAP5BALer3IXtna0VSBMeosJlsVZHeDd4umTM1DaQgbw75ixQe/EJPR43iAVacNe
 ZTob3sj8auKOmZfRu2ChsRnMvIYJt6Sr3cj/kuJdJoJyLa2qI4d4Bw6r4Aq/sL3nywu+
 s6NQp8yIVOqIGM9fv4vkBj+4mnhdInbd+hqRH0iIeSHyGWgWk7sOgfuXL3CNZBHxurCZ
 z1FLNk5MjzAA/o4gQjl0T4fm8RtEIVawoREl/XH5NR0GbP8BF54vI8cnYUkEUdpEyjM0
 6XJkAk4eUkIWY/tBSsPT0z/Z+7KxrpNMhWRq4vRBivQgLx6JQu85QQekW719/X1PUXPI YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78sa27p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 09:29:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3FF4110002A;
 Wed, 15 Jan 2020 09:29:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D13A210777;
 Wed, 15 Jan 2020 09:29:00 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan 2020 09:28:59
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Date: Wed, 15 Jan 2020 09:27:22 +0100
Message-ID: <20200115082722.13102-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_06:2020-01-14,
 2020-01-14 signatures=0
Cc: Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH v3] rpmsg: core: add API to get MTU
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

Return the rpmsg buffer MTU for sending message, so rpmsg users
can split a long message in several sub rpmsg buffers.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
V2[1] to V3
  - fix parameter description in rpmsg_device_ops struct

[1]: https://lore.kernel.org/patchwork/patch/1124684/
---
 drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h   |  2 ++
 drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
 include/linux/rpmsg.h            | 10 ++++++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e330ec4dfc33..a6ef54c4779a 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 }
 EXPORT_SYMBOL(rpmsg_trysend_offchannel);
 
+/**
+ * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
+ * @ept: the rpmsg endpoint
+ *
+ * This function returns maximum buffer size available for a single message.
+ *
+ * Return: the maximum transmission size on success and an appropriate error
+ * value on failure.
+ */
+
+ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
+{
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->get_mtu)
+		return -ENOTSUPP;
+
+	return ept->ops->get_mtu(ept);
+}
+EXPORT_SYMBOL(rpmsg_get_mtu);
+
 /*
  * match an rpmsg channel with a channel info struct.
  * this is used to make sure we're not creating rpmsg devices for channels
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 3fc83cd50e98..e6f88ee90ff6 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -47,6 +47,7 @@ struct rpmsg_device_ops {
  * @trysendto:		see @rpmsg_trysendto(), optional
  * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
  * @poll:		see @rpmsg_poll(), optional
+ * @get_mtu:		see @rpmsg_get_mtu(), optional
  *
  * Indirection table for the operations that a rpmsg backend should implement.
  * In addition to @destroy_ept, the backend must at least implement @send and
@@ -66,6 +67,7 @@ struct rpmsg_endpoint_ops {
 			     void *data, int len);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
+	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
 };
 
 int rpmsg_register_device(struct rpmsg_device *rpdev);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 376ebbf880d6..6e48fdf24555 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -175,6 +175,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
 static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 					   u32 dst, void *data, int len);
+static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 
 static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.destroy_ept = virtio_rpmsg_destroy_ept,
@@ -184,6 +185,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.trysend = virtio_rpmsg_trysend,
 	.trysendto = virtio_rpmsg_trysendto,
 	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
+	.get_mtu = virtio_rpmsg_get_mtu,
 };
 
 /**
@@ -699,6 +701,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
 }
 
+static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
+{
+	struct rpmsg_device *rpdev = ept->rpdev;
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+
+	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
+}
+
 static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 			     struct rpmsg_hdr *msg, unsigned int len)
 {
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe156d1c018..88d7892ca93d 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -135,6 +135,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
 
+ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
+
 #else
 
 static inline int register_rpmsg_device(struct rpmsg_device *dev)
@@ -242,6 +244,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
 	return 0;
 }
 
+static inline ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
 #endif /* IS_ENABLED(CONFIG_RPMSG) */
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
