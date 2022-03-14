Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6A4D8A43
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 18:01:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EBEEC60497;
	Mon, 14 Mar 2022 17:01:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 016C2C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 17:01:48 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22ECqR3q031663;
 Mon, 14 Mar 2022 18:01:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=FZjj/Sy1HgARjNayPDlJKjY5zb3GhwzO8FDF6NTyqwE=;
 b=xVQji2Pa1OJWeadqCvqoB5Za4OpLf5RRTRQc5XXv6z/sOVSD1ftdO61P8aW9+tassSXr
 FfRDobPeRf4xEhgI2M/pf2B0VIeIp5eM7NIJ3XOc4h8TBy68mtXOZ/KJVozxHpvNpxtj
 h872b4IxcqqjRxfkQCZnG+IrWICr3GgjVo7Z7T9ChBOFezBG4idyXNHRN+iSOqsWj0er
 m8OMxpw/jPjhgh/B/vvJ4Ifgm1EwgGoyKrbSxYalwOPnxnRbwynf3w3BNqeZfS/qhgA6
 7Ya+hyN6T2cGnS3quDvO+tJWYX1zrm1SO8XctZPGJLB4Gg47Ql1n2C6BkbhFK1w4yVL+ 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63hsemr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 18:01:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8103B10002A;
 Mon, 14 Mar 2022 18:01:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 794662309F1;
 Mon, 14 Mar 2022 18:01:42 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Mar 2022 18:01:42
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Mon, 14 Mar 2022 18:01:24 +0100
Message-ID: <20220314170126.2333996-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314170126.2333996-1-arnaud.pouliquen@foss.st.com>
References: <20220314170126.2333996-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_12,2022-03-14_02,2022-02-23_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, Christoph Hellwig <hch@lst.de>
Subject: [Linux-stm32] [RFC PATCH v4 2/4] remoteproc: core: Introduce
	rproc_register_rvdev function
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

The rproc structure contains a list of registered rproc_vdev structure.
To be able to move the management of the rproc_vdev structure in
remoteproc_virtio.c (i.e rproc_rvdev_add_device and
rproc_rvdev_remove_device functions), introduce the rproc_register_rvdev
and rproc_unregister_rvdev functions.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
Update vs previous revision:
 - rename rproc_register_rvdev/rproc_unregister_rvdev to rproc_add_rvdev/rproc_remove_rvdev
---
 drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 42daa36a94c0..1ca7320f04da 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -484,6 +484,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
 	return 0;
 }
 
+static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
+{
+	if (rvdev && rproc)
+		list_add_tail(&rvdev->node, &rproc->rvdevs);
+}
+
+static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
+{
+	if (rvdev)
+		list_del(&rvdev->node);
+}
+
 static struct rproc_vdev *
 rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
 {
@@ -547,7 +559,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
 			goto unwind_vring_allocations;
 	}
 
-	list_add_tail(&rvdev->node, &rproc->rvdevs);
+	rproc_add_rvdev(rproc, rvdev);
 
 	rvdev->subdev.start = rproc_vdev_do_start;
 	rvdev->subdev.stop = rproc_vdev_do_stop;
@@ -576,7 +588,7 @@ static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
 	}
 
 	rproc_remove_subdev(rproc, &rvdev->subdev);
-	list_del(&rvdev->node);
+	rproc_remove_rvdev(rvdev);
 	device_unregister(&rvdev->dev);
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
