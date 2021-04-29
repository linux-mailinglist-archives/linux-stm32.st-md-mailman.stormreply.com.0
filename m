Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F09E36E68F
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Apr 2021 10:07:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2661CC57B53;
	Thu, 29 Apr 2021 08:07:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6FCEC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 08:07:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13T7qkXr011961; Thu, 29 Apr 2021 10:07:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=D7QL7NcUJ9tOd7qvePWnf+YhgefsK20ho31ilFMVp2I=;
 b=Bjk1npPB6851N80K3ICBr1wBZcwg3hG+zCL6x8y/B1s8y+yYj30TSZPQM9ibgeGrOZP+
 IrhffO4k0bYue8IfsTSftDYVTIHhucLG0PJOCQz4FcV/dGwTBne+n5kUSri/dTrSXWPt
 gW13urR7Ypd+GgM3Uss+HcNzR3ynYvSohLT+f28LJKDI9NOiQh1MhegtIdjBaEdtgnTe
 4/+5i+Iq/U0S9ubUOVisIAoszKJDYUu5eUE0NqwUJdReI2vBYSCGcOVF/SgV/DZDhg9m
 Lh2arH9XmQu+CTA5dHg86HpjBy4TlK46VNIiqzPKcXFQduMgfireCWiWgE6ossY2m807 JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38735wqks6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 10:07:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE70510002A;
 Thu, 29 Apr 2021 10:07:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBF5F20E5E0;
 Thu, 29 Apr 2021 10:07:02 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 10:07:02
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 29 Apr 2021 10:06:39 +0200
Message-ID: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_03:2021-04-28,
 2021-04-29 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] rpmsg: char: Remove useless includes
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

Remove includes that are not requested to build the module.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
applied without issue on Bjorn next branch (dc0e14fa833b)
---
 drivers/rpmsg/rpmsg_char.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 2bebc9b2d163..e4e54f515af6 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -10,19 +10,10 @@
  * was based on TI & Google OMX rpmsg driver.
  */
 #include <linux/cdev.h>
-#include <linux/device.h>
-#include <linux/fs.h>
-#include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/poll.h>
 #include <linux/rpmsg.h>
 #include <linux/skbuff.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <uapi/linux/rpmsg.h>
-
-#include "rpmsg_internal.h"
 
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
