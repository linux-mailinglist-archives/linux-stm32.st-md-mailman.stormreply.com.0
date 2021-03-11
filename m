Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD643374E5
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 15:04:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A51FC5718F;
	Thu, 11 Mar 2021 14:04:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7089C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 14:04:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BE33M9001723; Thu, 11 Mar 2021 15:04:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Eg4OKsTKzswaEDxBH77D2QEGSARCRjEDw0vkCFnM8gE=;
 b=dNc4BhF6IAA00/6p0bmeVwB2oNGWOjRE2KQZYRpfgKFoBWluVsJyOBGBDb46b4dzxFfm
 pB6FIFZTOKdiIqHx4tIOz2nh1Cli5cSHoI1UkNZaSj+BJO13BPv4AurTmRBN/XicqP2H
 4sqhdfSIQIJA1pfIZjPMf0JUez+QNJYW4Gqxv37a73AN2qfwm+PmpzuiEIoHMVMWTqN3
 n3QCdxMp5X1seQm9Jbm7qEQQ6ULDztEiqOhxHNEhqqizJCqp3wSuzs0W5WxL6mfoTYGv
 P4nj7VujhTIPr8Am5YGtAwZ8/TtbI092TZeLXjyKfPEcSSdyxYAf9agEsFPaffoeFX2P yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yreyxwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 15:04:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5690B100034;
 Thu, 11 Mar 2021 15:04:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 46A82245D4C;
 Thu, 11 Mar 2021 15:04:25 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:24
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Thu, 11 Mar 2021 15:04:08 +0100
Message-ID: <20210311140413.31725-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_05:2021-03-10,
 2021-03-11 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/6] rpmsg: char: Rename rpmsg_char_init to
	rpmsg_chrdev_init
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

To be coherent with the other functions which are prefixed by
rpmsg_chrdev, rename the rpmsg_char_init function.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4bbbacdbf3bb..9e33b53bbf56 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -543,7 +543,7 @@ static struct rpmsg_driver rpmsg_chrdev_driver = {
 	},
 };
 
-static int rpmsg_char_init(void)
+static int rpmsg_chrdev_init(void)
 {
 	int ret;
 
@@ -569,7 +569,7 @@ static int rpmsg_char_init(void)
 
 	return ret;
 }
-postcore_initcall(rpmsg_char_init);
+postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
