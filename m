Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8C1ACD14
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A486AC36B10;
	Thu, 16 Apr 2020 16:14:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13BB4C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGDTqq026413; Thu, 16 Apr 2020 18:14:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=sTzUdiEhwGBva7XLbcJkZ9s5PAssf4muQMmT2uqz+CI=;
 b=G0ZBoztVJpQ47jRS9QWRmzksdMPYQPCciv1bd9oV1Qmrp6aYGFpIHUI2Mlra29VIdRd4
 i78j+rlLguqOfmveC60cPGKtXY8ATublAnNvY9bZYTvED60gcAHYgDgGZ7MZV8uFr/qX
 99uIPgTke9cZz7PFd6m5uNg8KHzDSc0Im6JGDK0jVCzLIKo4rOJBAXeAoJiBmeTVXgrT
 uRt8UyQL48vR0b5tkVCDLS7pevHz5QXH45h8NTuLKvt11KVSF7D0kS+8qysB5i0K92t2
 dWO0lAnqBAR+Fxv5zl0hpDI8dqLpehf/xb8mIIRnWL7J/WPolDvyBJAD5v/LpT6Le+Vv 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn8s3kn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDB9210002A;
 Thu, 16 Apr 2020 18:14:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E299F2B2D2A;
 Thu, 16 Apr 2020 18:14:22 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:22
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:24 +0200
Message-ID: <20200416161331.7606-12-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 11/18] remoteproc: Add child node component in
	rproc match list
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

Add the components, associated to the child devices populated, in
the match list for synchronization relying on bind/unbind mechanism.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 75f84fd3bd60..ecb36f64b1a0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1608,6 +1608,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
 static int rproc_platform_populate(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
+	struct device_node *node = dev->of_node;
+	struct device_node *child_np;
 	int ret;
 
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
@@ -1617,6 +1619,19 @@ static int rproc_platform_populate(struct rproc *rproc)
 		goto depopulate;
 	}
 
+	child_np = of_get_next_available_child(node, NULL);
+
+	while (child_np) {
+		of_node_get(node);
+		component_match_add_release(dev, &rproc->match,
+					    rproc_release_of, rproc_compare_of,
+					    child_np);
+		child_np = of_get_next_available_child(node, child_np);
+	}
+
+	if (!rproc->match)
+		dev_dbg(dev, "No available child\n");
+
 	return 0;
 
 depopulate:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
