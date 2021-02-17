Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6847031DA82
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Feb 2021 14:32:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E24DC57B6C;
	Wed, 17 Feb 2021 13:32:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9CB9C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 13:32:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11HDS2Ze026032; Wed, 17 Feb 2021 14:31:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=CRnSbQdFwvKmyMc039keRokTHONUmSL8dsL/yTFkE0w=;
 b=DSef1EykTWXbQKXEkRUowgzcLAMtb/V4v2KJMScqU7BEvPVA+8zmBFbF/LDLxqcs+ID/
 pvqjfVLszTMveOwN6hhaFD+4X1fgFO8IcCurctgaMXyAo1wJUEpeH8vwiGCc4EKtuj9D
 COwumNzXdbfNcaX4B0Cs8tBsQWblZLnQdrasw5fZBB7bbU0og4kXAmqUJuIujkMCdDyO
 SJECRr4+xex0omxWGW/zbATFpYfHUp0w6c9eILqxmIMjKW5fFjDXXBrOMg3Knp+2GszI
 ky7MWCSTpKW4LpNWdV1GZs/1no9HzjQzyipdulg4MDelOoyhpUZ14/Mj+89z/DcOt+vR 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p547p3wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 14:31:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C99710002A;
 Wed, 17 Feb 2021 14:31:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3F982370CE;
 Wed, 17 Feb 2021 14:31:58 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:31:58
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Wed, 17 Feb 2021 14:29:05 +0100
Message-ID: <20210217132905.1485-17-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_11:2021-02-16,
 2021-02-17 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 16/16] rpmsg: char: return an error if
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
