Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E145C9C9
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Nov 2021 17:21:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17E45C597BE;
	Wed, 24 Nov 2021 16:21:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2624C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 16:21:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AOEA2pg002275;
 Wed, 24 Nov 2021 17:20:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=adKEflnLS0Jlowfij4j2LZC1wrIbON7DqDHcbelKZlE=;
 b=GxIZND9mnS9GpIfZYW21VW6Cbb37SrUNflLIK2dDddloD6qoDGMwy9nu2v5og/sRHI5l
 kWUQPTNfnPIN+JAAxQp8ByiDlKBq0iB8HyNjZAPyF9O1X8+w/C1tCVNwev+YGm5qbm6e
 Lq2l7JDZhdIOR5X6YosoHM9qh+1bd39Fct3yQ+wDCwIShe05Adw/8EzBd7UKv3ih8nlK
 AAWNh48WTGraoXHsFaIew64m3oWzLx6Z54h8UyEIbw06cm1E/o7jof4HM4gkihRZns3h
 KHy58LteDhCKxO7VQw9EkMSnuzcxR3xrR6E+fKSdjnkyKmzPhWxSS7SA0vZwp28vlnVo fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3chbnecp3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 17:20:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E6A010002A;
 Wed, 24 Nov 2021 17:20:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 563CD2C420A;
 Wed, 24 Nov 2021 17:20:58 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 24 Nov 2021 17:20:57
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 24 Nov 2021 17:20:45 +0100
Message-ID: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] rpmsg: virtio: don't let virtio core to
	validate used length
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

Using OpenAMP library on remote side, when the rpmsg framework tries to
reuse the buffer the following error message is displayed in
the virtqueue_get_buf_ctx_split function:
"virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"

As described in virtio specification:
"many drivers ignored the len value, as a result, many devices set len
incorrectly. Thus, when using the legacy interface, it is generally
a good idea to ignore the len value in used ring entries if possible."

To stay in compliance with the legacy libraries, this patch prevents the
virtio core from validating used length.

Fixes: 939779f5152d ("virtio_ring: validate used buffer length")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
Update vs v1[1]: update commit message to clarify the context.

base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf

[1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 9c112aa65040..5f73f19c2c38 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name	= KBUILD_MODNAME,
 	.driver.owner	= THIS_MODULE,
+	.suppress_used_validation = true,
 	.id_table	= id_table,
 	.probe		= rpmsg_probe,
 	.remove		= rpmsg_remove,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
