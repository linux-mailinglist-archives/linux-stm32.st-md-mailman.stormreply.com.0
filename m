Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FAB234556
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:11:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F0BDC36B3C;
	Fri, 31 Jul 2020 12:11:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0275DC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 12:11:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VC85s9026417; Fri, 31 Jul 2020 14:11:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Zev07XZF6gQYZQsYDyxnZ6yZusIc9M6Jp3/EdDM79V8=;
 b=BRg4UNR1l0Yewsw5dRHDTp0KvjZ4Bm/5mS7vrZF4EUCSbvT3ph5c7ZYCJqK5Af9mowkw
 G9lwTg50lFZfdagNhep5EwDnKupev64/1NB4etceFB1+ZIU5z4VJkLDeGoKl4tnyYhg5
 g2gvvaABeS5MwtcgOARp9NtoJAsL1LYYdmuH1dC6lPGmOpa6trOFVbcGKOQNCMwD3TXs
 FtSpkSIFFzNqr/xeDIhGa9S8LpvieijrUYebEzp94sezzoISGcWcLiTve0vCcXFPTn4p
 zdfCbCNZK6cOsxkEopETEyowXU8l5aZxVe/nLIRpHgQvw/9bppFPFQq/0ejlSvUpm48K 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagvnd0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 14:11:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2A4B10002A;
 Fri, 31 Jul 2020 14:11:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D809C2AE6DD;
 Fri, 31 Jul 2020 14:11:06 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:11:06
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 14:10:36 +0200
Message-ID: <20200731121043.24199-7-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121043.24199-1-arnaud.pouliquen@st.com>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 06/13] rpmsg: add RPMsg control info structure
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

Add new structure for RPMsg driver registration.
This structure will be used to link a service to its driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 include/linux/rpmsg.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 5496d27c6f8c..ef8d1b987d38 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -34,6 +34,19 @@ struct rpmsg_endpoint;
 struct rpmsg_device_ops;
 struct rpmsg_endpoint_ops;
 
+/**
+ * struct rpmsg_drv_ctrl_info - rpmsg ctrl structure
+ * @drv_name:	name of the associated driver
+ * @service:	the associated rpmsg service listed in @rpmsg_services
+ *
+ * This structure is used by rpmsg_ctl to link the endpoint creation to the
+ * service rpmsg driver.
+ */
+struct rpmsg_drv_ctrl_info {
+	const char *drv_name;
+	u32  service;
+};
+
 /**
  * struct rpmsg_channel_info - channel info representation
  * @name: name of service
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
