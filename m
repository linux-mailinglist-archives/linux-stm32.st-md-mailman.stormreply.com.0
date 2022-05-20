Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A052E76B
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 10:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90181C57183;
	Fri, 20 May 2022 08:30:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2185C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 08:30:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K7BpO1004845;
 Fri, 20 May 2022 10:29:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=2oUCJKuYX/NY/iBtWA66txdrB/9BfeAv1MvQ2qwk1ys=;
 b=c2+WEpseMSKCE9cXbU455BUQcyQfLs4tVxR8ZCuMZ0BRq5uMGqhBKCV3n6M5Ol6CFe7l
 JmZaYN7m4aB5xuz5RI4ol4j9SuXOcI52pDrCD/2a4EeesFrrWJzKZ9SPKl8hSoKZYo7P
 BPTi9Tfbx6RZfGUIY3h32P1lhcKN23Xf3YPpTsLBCUaqQiAD+NnzOqBAskKV/dRVUzdb
 vPtqSVWJ9EXSBqBv6sx08B1pnr0qax9wEzPcg5QIH/WwqrvzTGi/P5S+SgX6Wf805HJ3
 f1zQmZ52iC98mSRM8A2s61+s2fISuWSDbkX+8q58vPKRR4JJqKSFdxTVlFwJoeoJnhRC 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umb988-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 10:29:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 789CA100034;
 Fri, 20 May 2022 10:29:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C049214D28;
 Fri, 20 May 2022 10:29:56 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 10:29:55 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 20 May 2022 10:29:31 +0200
Message-ID: <20220520082940.2984914-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
References: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Deepak Kumar Singh <quic_deesin@quicinc.com>,
 Chris Lew <quic_clew@quicinc.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC PATCH 01/10] rpmsg: core: Add signal API support
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

From: Deepak Kumar Singh <quic_deesin@quicinc.com>

Some transports like Glink support the state notifications between
clients using signals similar to serial protocol signals.
Local glink client drivers can send and receive signals to glink
clients running on remote processors.

Add APIs to support sending and receiving of signals by rpmsg clients.

Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
---
 drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h |  2 ++
 include/linux/rpmsg.h          | 15 +++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 79368a957d89..8de8aadd9b27 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -330,6 +330,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 }
 EXPORT_SYMBOL(rpmsg_trysend_offchannel);
 
+/**
+ * rpmsg_set_flow_control() - sets/clears serial flow control signals
+ * @ept:	the rpmsg endpoint
+ * @enable:	enable or disable serial flow control
+ *
+ * Return: 0 on success and an appropriate error value on failure.
+ */
+int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
+{
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->set_flow_control)
+		return -ENXIO;
+
+	return ept->ops->set_flow_control(ept, enable);
+}
+EXPORT_SYMBOL(rpmsg_set_flow_control);
+
 /**
  * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
  * @ept: the rpmsg endpoint
@@ -538,6 +556,9 @@ static int rpmsg_dev_probe(struct device *dev)
 
 		rpdev->ept = ept;
 		rpdev->src = ept->addr;
+
+		if (rpdrv->signals)
+			ept->sig_cb = rpdrv->signals;
 	}
 
 	err = rpdrv->probe(rpdev);
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index d4b23fd019a8..4ce58e68af30 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -55,6 +55,7 @@ struct rpmsg_device_ops {
  * @trysendto:		see @rpmsg_trysendto(), optional
  * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
  * @poll:		see @rpmsg_poll(), optional
+ * @set_flow_control:	see @rpmsg_set_flow_control(), optional
  * @get_mtu:		see @rpmsg_get_mtu(), optional
  *
  * Indirection table for the operations that a rpmsg backend should implement.
@@ -75,6 +76,7 @@ struct rpmsg_endpoint_ops {
 			     void *data, int len);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
+	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable);
 	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
 };
 
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 02fa9116cd60..dbd0c591bb85 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -62,12 +62,14 @@ struct rpmsg_device {
 };
 
 typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
+typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32);
 
 /**
  * struct rpmsg_endpoint - binds a local rpmsg address to its user
  * @rpdev: rpmsg channel device
  * @refcount: when this drops to zero, the ept is deallocated
  * @cb: rx callback handler
+ * @sig_cb: rx serial signal handler
  * @cb_lock: must be taken before accessing/changing @cb
  * @addr: local rpmsg address
  * @priv: private data for the driver's use
@@ -90,6 +92,7 @@ struct rpmsg_endpoint {
 	struct rpmsg_device *rpdev;
 	struct kref refcount;
 	rpmsg_rx_cb_t cb;
+	rpmsg_rx_sig_t sig_cb;
 	struct mutex cb_lock;
 	u32 addr;
 	void *priv;
@@ -104,6 +107,7 @@ struct rpmsg_endpoint {
  * @probe: invoked when a matching rpmsg channel (i.e. device) is found
  * @remove: invoked when the rpmsg channel is removed
  * @callback: invoked when an inbound message is received on the channel
+ * @signal:  invoked to received remote flow control signaling.
  */
 struct rpmsg_driver {
 	struct device_driver drv;
@@ -111,6 +115,7 @@ struct rpmsg_driver {
 	int (*probe)(struct rpmsg_device *dev);
 	void (*remove)(struct rpmsg_device *dev);
 	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
+	int (*signals)(struct rpmsg_device *rpdev, void *priv, u32 state);
 };
 
 static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
@@ -188,6 +193,8 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 
 ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 
+int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable);
+
 #else
 
 static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
@@ -306,6 +313,14 @@ static inline ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 	return -ENXIO;
 }
 
+static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
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
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
