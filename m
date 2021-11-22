Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2F4592AA
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Nov 2021 17:08:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8494EC5A4FD;
	Mon, 22 Nov 2021 16:08:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EDACC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 16:08:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMB3vXw000844;
 Mon, 22 Nov 2021 17:08:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=JUfDtadMUblm027RI2ylSBjI6IFG9jvYkFA5bjRWYso=;
 b=jNgwyqJuRvLhuEmT1/rJ6WapxGuLznmoRXQDRX5AbnY59UQolS1+05e+u7m2ej7/BClv
 TuSq2nH9FEYWX3iZo52Sh2FGm/G7XNV1Kl7/WxSL3xin2mAPVPw5+cG31pOcYTzZCFMF
 c8zntrZKeS8ugYN+jepuDcAy5tj60HwfdQY9eqMCLu/85GraVR/sYDyL9KMATIhaluWy
 C5qrz1KrXACNvCd2XzrwDvVyoHW1KUsNbOIpX+fdqpWzh0z5jiOtg2D3Q1dXeqbbPtaB
 jhSi3VRs1Qy2HbOKYyjvcRgEvM83gKLEsHe34+317hcBs3qUKOZ9tjwgtr0kQLMYq8FP TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cg5sfka9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 17:08:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3568410002A;
 Mon, 22 Nov 2021 17:08:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 277D021E17D;
 Mon, 22 Nov 2021 17:08:16 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 17:08:15
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 22 Nov 2021 17:08:12 +0100
Message-ID: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_08,2021-11-22_02,2020-04-07_01
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] rpmsg: virtio: don't let virtio core to
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

For RX virtqueue, the used length is validated in all the three paths
(big, small and mergeable). For control vq, we never tries to use used
length. So this patch forbids the core to validate the used length.

Without patch the rpmsg client sample does not work.

Fixes: 939779f5152d ("virtio_ring: validate used buffer length")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
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
