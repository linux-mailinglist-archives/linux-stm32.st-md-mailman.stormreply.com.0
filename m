Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2C4480B5
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Nov 2021 15:01:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7961BC5E2CF;
	Mon,  8 Nov 2021 14:01:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D4EFC5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Nov 2021 14:01:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8DGOhU021040;
 Mon, 8 Nov 2021 15:01:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=G26Ve/HFn2wXHMnOpCOEz7WG0SiuPkgmMHKdcZnpApE=;
 b=G4XywgKF/KG2XlKQbaQVfawPeH/cbo6DwsjHG0n0WssAvgqltnKMYtp4cp7TKYJL8SJ2
 mJZYqF+EWm+uFOM8HZqO4JGOFrbjDxTjar8PaPlHxy2P8e5SU+yXnopYq69GXgo+tVbI
 pCZpnmDxBUyo4YADduhRSumo4EjS8TJ9t7SGOp4cRmkcPMibG2rRJuBzK5IaT1Y+lXIC
 yB+H+vakNEHBNkxLSi8XJWS38ZCMulJZ6zKnb1a8wR0H2dNDiJJ//AVNCAZxVnxR77PB
 Rz7Ial5i0D2ZSGweiSkcFLCjRUfA7E502AMxdc/Rw8PRdx9xzAgbSp3djJNX6alSYIgo fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c709q26am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 15:01:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79D4710002A;
 Mon,  8 Nov 2021 15:01:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 698A322D19D;
 Mon,  8 Nov 2021 15:01:32 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:01:32
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 8 Nov 2021 15:01:26 +0100
Message-ID: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] rpmsg: Fix documentation return formatting
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

kernel documentation specification:
"The return value, if any, should be described in a dedicated section
named Return."

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_glink_native.c |  2 +-
 drivers/rpmsg/qcom_smd.c          |  2 +-
 drivers/rpmsg/rpmsg_core.c        | 24 ++++++++++++------------
 drivers/rpmsg/virtio_rpmsg_bus.c  |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 3f377a795b33..1030cfa80e04 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -427,7 +427,7 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
  * Allocates a local channel id and sends a RPM_CMD_OPEN message to the remote.
  * Will return with refcount held, regardless of outcome.
  *
- * Returns 0 on success, negative errno otherwise.
+ * Return: 0 on success, negative errno otherwise.
  */
 static int qcom_glink_send_open_req(struct qcom_glink *glink,
 				    struct glink_channel *channel)
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 8da1b5cb31b3..540e027f08c4 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1467,7 +1467,7 @@ ATTRIBUTE_GROUPS(qcom_smd_edge);
  * @parent:    parent device for the edge
  * @node:      device_node describing the edge
  *
- * Returns an edge reference, or negative ERR_PTR() on failure.
+ * Return: an edge reference, or negative ERR_PTR() on failure.
  */
 struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 					     struct device_node *node)
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index d3eb60059ef1..f031b2b1b21c 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -26,7 +26,7 @@
  * @rpdev: rpmsg device
  * @chinfo: channel_info to bind
  *
- * Returns a pointer to the new rpmsg device on success, or NULL on error.
+ * Return: a pointer to the new rpmsg device on success, or NULL on error.
  */
 struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
 					  struct rpmsg_channel_info *chinfo)
@@ -48,7 +48,7 @@ EXPORT_SYMBOL(rpmsg_create_channel);
  * @rpdev: rpmsg device
  * @chinfo: channel_info to bind
  *
- * Returns 0 on success or an appropriate error value.
+ * Return: 0 on success or an appropriate error value.
  */
 int rpmsg_release_channel(struct rpmsg_device *rpdev,
 			  struct rpmsg_channel_info *chinfo)
@@ -102,7 +102,7 @@ EXPORT_SYMBOL(rpmsg_release_channel);
  * dynamically assign them an available rpmsg address (drivers should have
  * a very good reason why not to always use RPMSG_ADDR_ANY here).
  *
- * Returns a pointer to the endpoint on success, or NULL on error.
+ * Return: a pointer to the endpoint on success, or NULL on error.
  */
 struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
 					rpmsg_rx_cb_t cb, void *priv,
@@ -146,7 +146,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  *
  * Can only be called from process context (for now).
  *
- * Returns 0 on success and an appropriate error value on failure.
+ * Return: 0 on success and an appropriate error value on failure.
  */
 int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 {
@@ -175,7 +175,7 @@ EXPORT_SYMBOL(rpmsg_send);
  *
  * Can only be called from process context (for now).
  *
- * Returns 0 on success and an appropriate error value on failure.
+ * Return: 0 on success and an appropriate error value on failure.
  */
 int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
 {
@@ -206,7 +206,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
  *
  * Can only be called from process context (for now).
  *
- * Returns 0 on success and an appropriate error value on failure.
+ * Return: 0 on success and an appropriate error value on failure.
  */
 int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 			  void *data, int len)
@@ -235,7 +235,7 @@ EXPORT_SYMBOL(rpmsg_send_offchannel);
  *
  * Can only be called from process context (for now).
  *
- * Returns 0 on success and an appropriate error value on failure.
+ * Return: 0 on success and an appropriate error value on failure.
  */
 int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 {
@@ -263,7 +263,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
  *
  * Can only be called from process context (for now).
  *
- * Returns 0 on success and an appropriate error value on failure.
+ * Return: 0 on success and an appropriate error value on failure.
  */
 int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
 {
@@ -282,7 +282,7 @@ EXPORT_SYMBOL(rpmsg_trysendto);
  * @filp:	file for poll_wait()
  * @wait:	poll_table for poll_wait()
  *
- * Returns mask representing the current state of the endpoint's send buffers
+ * Return: mask representing the current state of the endpoint's send buffers
  */
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait)
@@ -313,7 +313,7 @@ EXPORT_SYMBOL(rpmsg_poll);
  *
  * Can only be called from process context (for now).
  *
- * Returns 0 on success and an appropriate error value on failure.
+ * Return: 0 on success and an appropriate error value on failure.
  */
 int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 			     void *data, int len)
@@ -623,7 +623,7 @@ EXPORT_SYMBOL(rpmsg_unregister_device);
  * @rpdrv: pointer to a struct rpmsg_driver
  * @owner: owning module/driver
  *
- * Returns 0 on success, and an appropriate error value on failure.
+ * Return: 0 on success, and an appropriate error value on failure.
  */
 int __register_rpmsg_driver(struct rpmsg_driver *rpdrv, struct module *owner)
 {
@@ -637,7 +637,7 @@ EXPORT_SYMBOL(__register_rpmsg_driver);
  * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
  * @rpdrv: pointer to a struct rpmsg_driver
  *
- * Returns 0 on success, and an appropriate error value on failure.
+ * Return: 0 on success, and an appropriate error value on failure.
  */
 void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
 {
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 9c112aa65040..c37451512835 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -547,7 +547,7 @@ static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
  * should use the appropriate rpmsg_{try}send{to, _offchannel} API
  * (see include/linux/rpmsg.h).
  *
- * Returns 0 on success and an appropriate error value on failure.
+ * Return: 0 on success and an appropriate error value on failure.
  */
 static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 				     u32 src, u32 dst,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
