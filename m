Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01A52E76A
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 10:30:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 804D7C56630;
	Fri, 20 May 2022 08:30:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB5FC03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 08:30:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K4Uw9T017719;
 Fri, 20 May 2022 10:30:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=YHFIJxRiiXd7Hm4A9fpzYXfeaDCgITQVThJATlJXER4=;
 b=z5qsmjMr8pw8Svt/HbQH0xtotQE8l+Mn3cYrlhh8Aa+OcfRZMJ96KSVKVtnyThp4wn8D
 7UoKzxRDp6SXMvlraZ7mU77s4UDpmRwoS6UG6u4AmUf1IbbFvdmm5MT1VjbrEaT/ddSh
 YtEglG8n+mlG3zYngJg8lZVApY8bXGxo6bfkaUDd7eRjQDIGCWTj+V06VMZ1hKBmH1eM
 8hU1xKUMKj75ojomsOERYK0BwcEgchjM4F5vhmgsslbwMtUkSSJsmlA4doW+yUXQ5VeE
 ecuSuCvuJZd3LXETD5aMG7W64cUAWwdw/pjlqQ3wX1Jc1xE9zEXuoczk6A9wWvopYfeT aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9f79s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 10:30:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8966210003B;
 Fri, 20 May 2022 10:29:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F1C7215122;
 Fri, 20 May 2022 10:29:58 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 10:29:58 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 20 May 2022 10:29:34 +0200
Message-ID: <20220520082940.2984914-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
References: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Deepak Kumar Singh <quic_deesin@quicinc.com>,
 Chris Lew <quic_clew@quicinc.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC PATCH 04/10] rpmsg: virtio: Implement the
	announce_remote_fc ops
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

Add the capability for a rpmsg local endpoint to receive information
of a remote endpoint state using the flow control channel.

The virtio_rpmsg_remote_flowctrl function calls the endpoint which
matches with the chinfo.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 0db8043e6c49..785fda77984e 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -305,6 +305,7 @@ __rpmsg_destroy_ept(struct virtproc_info *vrp, struct rpmsg_endpoint *ept)
 	/* make sure in-flight inbound messages won't invoke cb anymore */
 	mutex_lock(&ept->cb_lock);
 	ept->cb = NULL;
+	ept->sig_cb =  NULL;
 	mutex_unlock(&ept->cb_lock);
 
 	kref_put(&ept->refcount, __ept_release);
@@ -365,12 +366,49 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 	return err;
 }
 
+static int virtio_rpmsg_remote_flowctrl(struct rpmsg_device *rpdev,
+					struct rpmsg_channel_info *chinfo,
+					bool enable)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+	struct rpmsg_endpoint *ept;
+
+	/* Use the dst addr to fetch the callback of the appropriate user */
+	mutex_lock(&vrp->endpoints_lock);
+
+	ept = idr_find(&vrp->endpoints, chinfo->dst);
+
+	/* Let's make sure no one deallocates ept while we use it */
+	if (ept)
+		kref_get(&ept->refcount);
+
+	mutex_unlock(&vrp->endpoints_lock);
+
+	if (!ept)
+		return -EINVAL;
+
+	/* Make sure ept->sig_cb doesn't go away while we use it */
+	mutex_lock(&ept->cb_lock);
+
+	if (ept->sig_cb)
+		ept->sig_cb(ept->rpdev, ept->priv, enable);
+
+	mutex_unlock(&ept->cb_lock);
+
+	/* Farewell, ept, we don't need you anymore */
+	kref_put(&ept->refcount, __ept_release);
+
+	return 0;
+}
+
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
 	.create_channel = virtio_rpmsg_create_channel,
 	.release_channel = virtio_rpmsg_release_channel,
 	.create_ept = virtio_rpmsg_create_ept,
 	.announce_create = virtio_rpmsg_announce_create,
 	.announce_destroy = virtio_rpmsg_announce_destroy,
+	.announce_remote_fc = virtio_rpmsg_remote_flowctrl,
 };
 
 static void virtio_rpmsg_release_device(struct device *dev)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
