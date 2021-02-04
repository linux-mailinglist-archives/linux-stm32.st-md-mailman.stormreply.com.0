Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299730EED0
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Feb 2021 09:46:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F16B0C57B55;
	Thu,  4 Feb 2021 08:46:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93A16C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Feb 2021 08:46:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1148hBSl031731; Thu, 4 Feb 2021 09:46:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=CRnSbQdFwvKmyMc039keRokTHONUmSL8dsL/yTFkE0w=;
 b=ePxY2HbPMpCuB8kddpwEm6Emz4/cYsmwvRWwohDT1FctlKzcBD2op2D6/H90Wi2mr3VI
 Lpwrut+VYD1RLsRaQ5lAAdccXY4aiT7xg9l0n3b/YfDWG3BpkP3qGnHYwVQxnWBhxahz
 1DCwGqAjZ71BhXyPiJY/pMZ9UtsF1zBeAmOCoUyXoo8OQjsbQoIki9Z+U+geqOyRs/ra
 +L5/qRuva1epfkhkJ05j0/8ee3vxZYUE56VEmHxJtJlR9FVsJo2w5lLvFGCtxGx+rZ36
 6H+zkb6yMyAere215uFYUEg+4yhcpDllh8lSWpK9ijXP1n5M8zNbIe+Pos8xWJBIwpsI Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36e7x16f1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 09:46:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5E9310002A;
 Thu,  4 Feb 2021 09:46:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7FF622AE4F;
 Thu,  4 Feb 2021 09:46:47 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:47
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Thu, 4 Feb 2021 09:45:34 +0100
Message-ID: <20210204084534.10516-16-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 15/15] rpmsg: char: return an error if
	device already open
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

The rpmsg_create_ept function is invoked when the device is opened.
As only one endpoint must be created per device. It is not possible to
open the same device twice. But there is nothing to prevent multi open.
Return -EBUSY when device is already opened to have a generic error
instead of relying on the back-end to potentially detect the error.

Without this patch for instance the GLINK driver return -EBUSY while
the virtio bus return -ENOSPC.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 0b0a6b7c0c9a..2eacddb83e29 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -116,6 +116,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	struct device *dev = &eptdev->dev;
 	u32 addr = eptdev->chinfo.src;
 
+	if (eptdev->ept)
+		return -EBUSY;
+
 	get_device(dev);
 
 	/*
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
