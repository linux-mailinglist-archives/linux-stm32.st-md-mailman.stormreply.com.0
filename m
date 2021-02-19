Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA56E31F808
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 12:18:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C0D4C57B58;
	Fri, 19 Feb 2021 11:18:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58F3EC5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 11:18:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JBGJqW030398; Fri, 19 Feb 2021 12:18:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=FcW1J/setFwTwOH+VhdGFYbPkMfYg30KWwRW0YzViPA=;
 b=MaTOl+P7eVOuQD8KnmZu5oBmWfZhVKLWtFHWqZDQyGxedBlq+y27KUuwbPS9zEm8vXHb
 OOYeG9zJm1tWgvThMvH3doGzbDILlE3zrkHHDonAaEFmBlMLZ7C/Bn47yrARbJqxQXmb
 zDp28xTjejaP8Roaq6LcymxA1VXP2fQGY+G++0p/q5qnx04ziV51diyOrKsqYAe6SM7Z
 5ejTIpyk1dGrrRFygFiyno6X3oQPDlPHTtsTwEZqDvkIB9yhlrJrYsdCYHTQknjMRs1A
 JlHVR5e9lSIbJDJvDKub0eQXxw7aMUh1CTzklrmgo/EBg26VUCsXPAmCvSsiYZkFllZX 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p7072str-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 12:18:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8983110002A;
 Fri, 19 Feb 2021 12:18:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F19E2266D7;
 Fri, 19 Feb 2021 12:18:00 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:18:00
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Fri, 19 Feb 2021 12:14:47 +0100
Message-ID: <20210219111501.14261-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_04:2021-02-18,
 2021-02-19 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 02/16] rpmsg: move RPMSG_ADDR_ANY in user
	API
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

As the RPMSG_ADDR_ANY is a valid src or dst address that can be set by
user applications,  migrate its definition in user API.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 include/linux/rpmsg.h      | 3 +--
 include/uapi/linux/rpmsg.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index a5db828b2420..d97dcd049f18 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -18,8 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/poll.h>
 #include <linux/rpmsg/byteorder.h>
-
-#define RPMSG_ADDR_ANY		0xFFFFFFFF
+#include <uapi/linux/rpmsg.h>
 
 struct rpmsg_device;
 struct rpmsg_endpoint;
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index e14c6dab4223..5e00748da319 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -9,6 +9,8 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+#define RPMSG_ADDR_ANY		0xFFFFFFFF
+
 /**
  * struct rpmsg_endpoint_info - endpoint info representation
  * @name: name of service
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
