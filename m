Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEC831F817
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 12:19:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BCB3C57B55;
	Fri, 19 Feb 2021 11:19:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFE1FC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 11:19:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JBIH3O024160; Fri, 19 Feb 2021 12:19:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9otI8hBeC46Slwkg9Iec+E1E6ulCMz/xpbQrJjFhILA=;
 b=nfbXS3sy4uWQ0xrA03klZDh0wq+a+D69/LixFP3MUJ36WSHERVi7XabcR2IhyLVjtEZt
 S/XwHheSen3Y7FhtMcJDtylF3mSYTPf8gdm3MZhKwMUyBesHv2Y9JATHw7ZtS7FWlr6W
 TnY7wel/dBScZEpOTVW7W+8HinC3mafVsD6CdbdGF46h954/KJKmxrEZXc6GH+LEHBQk
 B100oCGvQ6fzrF2efgbI0o7hYbKyaJVzL8mr2v6yLPTrsCX+8e6GM0mzMVqpXwYk7wMC
 l2Vj6TtnBdmyQZW0bjKjtjTMSM58ane6p5OjKDo2Ycd2D9VkmFLnt3Jrep7dpi9ZTAUw bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36sqadeyvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 12:19:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C88A10002A;
 Fri, 19 Feb 2021 12:19:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FEF7221760;
 Fri, 19 Feb 2021 12:19:07 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:19:06
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Fri, 19 Feb 2021 12:14:55 +0100
Message-ID: <20210219111501.14261-11-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_04:2021-02-18,
 2021-02-19 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 10/16] rpmsg: char: use sendto to specify
	the message destination address
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

When the endpoint device is created by the application a destination
address as been specified in the rpmsg_channel_info structure.
Send the message to this address instead of the default one.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 83c10b39b139..09ae1304837c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -225,9 +225,9 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
 	}
 
 	if (filp->f_flags & O_NONBLOCK)
-		ret = rpmsg_trysend(eptdev->ept, kbuf, len);
+		ret = rpmsg_trysendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 	else
-		ret = rpmsg_send(eptdev->ept, kbuf, len);
+		ret = rpmsg_sendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 
 unlock_eptdev:
 	mutex_unlock(&eptdev->ept_lock);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
