Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49230EEBD
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Feb 2021 09:46:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56DBAC57B55;
	Thu,  4 Feb 2021 08:46:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE5EC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Feb 2021 08:46:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1148hDeO031781; Thu, 4 Feb 2021 09:46:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=M1W7lnH3WVTrEg/mRlrlwrtBldl3psNcbgfNxLcMeWc=;
 b=4XUyY1UBfr7spoU1GYbxWORWavHiLvbCGTvu1mC5qzU7Nlj7r6ujlZw+L+rgwnEcHypY
 XBXICLLjYWondcXrHz0EhIs5m7BQbkPa8K01ajzdB/E6uXsdi+BMxD3sbUZgE3j7JgFd
 ar4uLhlKPjXJCNtlmpnznUdp7AfmMTg/iSWgRSbg7llCAVCim8x/CDbf2Q5BGs6LPbX0
 2n3hPZWo/247F1qI/HCcSz6Rvq/JdrfACIv69Cn6lSW+0cGhcAPawXKZxkGa6K5dBEO5
 kDwObxnvsm8rVXLCc/fNlkpPLE8jqLvnEkzk2JgByldOV2Ks6MU3ZuziBZDjimp/3Ryw 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36e7x16ev5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 09:46:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D96A310002A;
 Thu,  4 Feb 2021 09:46:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDF3622AE49;
 Thu,  4 Feb 2021 09:46:07 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:07
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Thu, 4 Feb 2021 09:45:23 +0100
Message-ID: <20210204084534.10516-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 04/15] rpmsg: char: dissociate the control
	device from the rpmsg class
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

The RPMsg control device is a RPMsg device, it is already
referenced in the RPMsg bus. There is only an interest to
reference the ept char devices in the rpmsg class.
This patch prepares the code split of the control and end point
devices in two separate files.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 78a6d19fdf82..23e369a00531 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -485,7 +485,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	dev = &ctrldev->dev;
 	device_initialize(dev);
 	dev->parent = &rpdev->dev;
-	dev->class = rpmsg_class;
 
 	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
 	ctrldev->cdev.owner = THIS_MODULE;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
