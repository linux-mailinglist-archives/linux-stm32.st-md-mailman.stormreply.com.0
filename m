Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05A426D8F
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 17:36:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 575FBC597B2;
	Fri,  8 Oct 2021 15:36:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92855C597B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 15:35:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1989bHiH016872; 
 Fri, 8 Oct 2021 17:35:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=q1AeGkk3o2B+uefbqquRe+ff076DSabNqTK5wNhQpgY=;
 b=M2lqz6BeVPpaQCoyqEnmg18d5ybLJo2/WvnRa48DcmRJGxKvNgLWJ0J6473ovhuhjz8+
 t2J2TPCCUq7Ic6kHHtWOfhF6TOt5Syv6zN9bJSwQNdXjAtx4UQJnBZcofQYO2DpYcXFp
 kNpYdn+eyut9khkFYiN1OelN6gwu7lnIqp68Mps4lODN2FabYd/y/5ucRW57ub8tKlnK
 5/d2IP/uphommin9OCrmYi+NtDD5XjAdmybu6ahzvVo4p4cdgAmUHOfsjBiBf0kPo4FC
 Vto6iBv5/4YLaPl2SFJQvB6PXxQwnoadFdusTNV3iZYWp4KsZH7q+Aip33yEJ+J3mTEX BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjdunby1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 17:35:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1C3B100034;
 Fri,  8 Oct 2021 17:35:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1D8F237D9B;
 Fri,  8 Oct 2021 17:35:44 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct 2021 17:35:44
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
Date: Fri, 8 Oct 2021 17:34:45 +0200
Message-ID: <20211008153446.23188-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211008153446.23188-1-arnaud.pouliquen@foss.st.com>
References: <20211008153446.23188-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_04,2021-10-07_02,2020-04-07_01
Cc: linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 arnaud.pouliquen@foss.st.com, Suman Anna <s-anna@ti.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v9 1/2] rpmsg: core: add API to get MTU
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

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Acked-by: Suman Anna <s-anna@ti.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

---
Update from V8:
- minor comment fix in rpmsg_get_mtu function header
- add Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h   |  2 ++
 drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
 include/linux/rpmsg.h            | 10 ++++++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 9151836190ce..d3eb60059ef1 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -327,6 +327,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 }
 EXPORT_SYMBOL(rpmsg_trysend_offchannel);
 
+/**
+ * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
+ * @ept: the rpmsg endpoint
+ *
+ * This function returns maximum buffer size available for a single outgoing message.
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
  * match a rpmsg channel with a channel info struct.
  * this is used to make sure we're not creating rpmsg devices for channels
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a76c344253bf..b1245d3ed7c6 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -53,6 +53,7 @@ struct rpmsg_device_ops {
  * @trysendto:		see @rpmsg_trysendto(), optional
  * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
  * @poll:		see @rpmsg_poll(), optional
+ * @get_mtu:		see @rpmsg_get_mtu(), optional
  *
  * Indirection table for the operations that a rpmsg backend should implement.
  * In addition to @destroy_ept, the backend must at least implement @send and
@@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
 			     void *data, int len);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
+	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
 };
 
 struct device *rpmsg_find_device(struct device *parent,
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 8e49a3bacfc7..05fd06fc67e9 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -149,6 +149,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
 static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 					   u32 dst, void *data, int len);
+static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
 						   struct rpmsg_channel_info *chinfo);
 
@@ -160,6 +161,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.trysend = virtio_rpmsg_trysend,
 	.trysendto = virtio_rpmsg_trysendto,
 	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
+	.get_mtu = virtio_rpmsg_get_mtu,
 };
 
 /**
@@ -696,6 +698,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
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
index d97dcd049f18..990b80fb49ad 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
 
+ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
+
 #else
 
 static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
@@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
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
