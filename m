Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C694D4DB4DF
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 16:30:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FDEFC5F1F2;
	Wed, 16 Mar 2022 15:30:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ABEBC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 15:30:11 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22GEDsXd005355;
 Wed, 16 Mar 2022 16:30:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=c2g6I4As5BWCLWcUp9SWPHmLYhsOd/4wcTcA+mh+Uv4=;
 b=HjOO/44Fw06Ezka90aXRsOVUgdvqhFg/1YfLErtLJakF926nVRgcLzELZFfDEMQ3XVQ/
 j0P555mxEGPqPTJB/2s/YNi3JJi61/uUrL7SeiVaLkOWTDUDRR4V1gKL6lG78+qgw9NY
 vhyLQMuQ8rToSqGdM0ZXwHBbCgegd9kIACFOmdklDg4YnOfm4vEAu1CvfnW/caNjqI7j
 YxMw0Q0y+vfVk14tTEqxkYybn+jKh0THbJhMhnmeqPJMw0wBskwKKUHqVkhgcwnMUBnM
 Rci4RXurkppp3SCV5OuOc+9m3VYK4dq3HGxiL8dAUg+lcKFRpjvY/rh/NeLQOFVK+4xc aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63j6kw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 16:30:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6498E10002A;
 Wed, 16 Mar 2022 16:30:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5842422FA29;
 Wed, 16 Mar 2022 16:30:09 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 16 Mar 2022 16:30:09
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 16 Mar 2022 16:30:01 +0100
Message-ID: <20220316153001.662422-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_06,2022-03-15_01,2022-02-23_01
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] rpmsg: virtio: set dst address on first
	message received
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

When a rpmsg channel has been created locally with a destination address
set to RPMSG_ADDR_ANY, a name service announcement message is sent to
the remote side. Then the destination address is never updated, making it
impossible to send messages to the remote.

An example of kernel trace observed:
rpmsg_tty virtio0.rpmsg-tty.29.-1: invalid addr (src 0x1d, dst 0xffffffff)

Implement same strategy than the open-amp library:
On the reception of the first message, if the destination address is
RPMSG_ADDR_ANY, then set it to address of the remote endpoint that
send the message.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
Update from V1:
- fix rpmsg address conversion from fvirtio to cpu format,
  reported-by the kernel test robot <lkp@intel.com>.

Remarks:

- This issue has been detected during validation of the rpmsg_char
  restructuring series on going[1].
  Tested on the rpmsg_next branch[2]

- An alternative (or a complement?) could be to add a NS bind/unbind in
  the NS announcement channel (in rpmsg_ns.c).
  This would allow the local and/or the remote processor to inform the
  remote side the the service announced in bound.

[1] https://lkml.org/lkml/2022/1/24/293
[2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=for-next

---
 drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 3ede25b1f2e4..152b54b83782 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -708,6 +708,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 			     struct rpmsg_hdr *msg, unsigned int len)
 {
+	struct rpmsg_device *rpdev;
 	struct rpmsg_endpoint *ept;
 	struct scatterlist sg;
 	bool little_endian = virtio_is_little_endian(vrp->vdev);
@@ -746,6 +747,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	mutex_unlock(&vrp->endpoints_lock);
 
 	if (ept) {
+		rpdev = ept->rpdev;
+		if (rpdev->ept == ept && rpdev->dst == RPMSG_ADDR_ANY) {
+			/*
+			 * First message received from the remote side on the default endpoint,
+			 * update channel destination address.
+			 */
+			rpdev->dst = __rpmsg32_to_cpu(little_endian, msg->src);
+		}
+
 		/* make sure ept->cb doesn't go away while we use it */
 		mutex_lock(&ept->cb_lock);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
