Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 135F58C8A68
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 18:57:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94FF5C6DD6E;
	Fri, 17 May 2024 16:57:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F84FC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 16:57:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HB5Q50030594;
 Fri, 17 May 2024 18:57:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=1x3zNv0
 wWyw7cTZL90zUJ++UJYF71S4Lfwa4wuiTe/Q=; b=LlWxPsbjkwgETGOhbaETgRJ
 Yf+VExUD/jsQLWreFofcrhZuwrR5P4M4fHJ4oFZrjUF7MGG3vi0cUPXTxYvtCanV
 YJ4hss9p5gC5cd5vaE6korNe5/9qipUQl6Xx97t6vOQJRadkV9N3i1d9Lz5tXKmX
 jcxdiJigPIfYoJZp+v4a/r+Ky3hQJ3aRV7uDLcUXsgY4STSFdCn3v5YRx7YLGYeF
 T56YVZNzTqTVCtUWWe2Z/ER6Z2nXpE75Ws0nj8TqTueLxbBtm9MB0vGdkJlyiOg+
 zztbtpOZzK5lFEPj1p4NzAXhfToRm680ZdROItthkdbDK4Kl/8uExrb+GvnixTg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6628h8jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 May 2024 18:57:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BBBB140044;
 Fri, 17 May 2024 18:57:30 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3054C223F00;
 Fri, 17 May 2024 18:57:08 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 18:57:08 +0200
Received: from localhost (10.252.31.224) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 18:57:07 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 17 May 2024 18:56:54 +0200
Message-ID: <20240517165654.427746-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.31.224]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] rpmsg: char: fix rpmsg_eptdev structure
	documentation
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

Add missing @ tags for some rpmsg_eptdev structure parameters.

This fixes warning messages on build:
drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_restricted' not described in 'rpmsg_eptdev'
drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_updated' not described in 'rpmsg_eptdev'

Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 1cb8d7474428..98d95ce5b6fb 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -52,8 +52,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @readq:	wait object for incoming queue
  * @default_ept: set to channel default endpoint if the default endpoint should be re-used
  *              on device open to prevent endpoint address update.
- * remote_flow_restricted: to indicate if the remote has requested for flow to be limited
- * remote_flow_updated: to indicate if the flow control has been requested
+ * @remote_flow_restricted: to indicate if the remote has requested for flow to be limited
+ * @remote_flow_updated: to indicate if the flow control has been requested
  */
 struct rpmsg_eptdev {
 	struct device dev;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
