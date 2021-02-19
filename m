Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A631F80F
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 12:18:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D020C57B67;
	Fri, 19 Feb 2021 11:18:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B770FC57B6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 11:18:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JBGJCb030410; Fri, 19 Feb 2021 12:18:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=cuI0QyzGfCE9A2PPLZ3Vi0BGYQWHZbe/HztsvrFJe24=;
 b=3P4NPOjUUnLZjDaresCGlDxD1sXjZHpHMZETxJiTnq/RJQpagaIdkzUyhJkJtgbb1fK8
 rAGDS4vibG0OvqXv6qF3jZPdKGD16WrJhc4KzPcqdoz0H44RVzHAX8NDPyjZKiSLP24G
 6QjDO98h2Ph3fRECo9Okt9DLhxoFn7uGPBRGbwTFZtB9SPcduMMTEaLOQBDfUUeKyrEt
 UeTnrqAMkPfYI2dIDUIv5gFWJ0ZgJA9BqUyOMzjEWLvX3eq5lWoFVe3qZwOok0cXHddB
 rlVA1HS4CI2qGLklnARanpDGxdQw4mPlU/KJC87zLE0VkjbLEb9t1Eem1Vt8VyeBh5G7 Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p7072sud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 12:18:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 667C0100034;
 Fri, 19 Feb 2021 12:18:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A86B2266D7;
 Fri, 19 Feb 2021 12:18:05 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:18:05
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Fri, 19 Feb 2021 12:14:53 +0100
Message-ID: <20210219111501.14261-9-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_04:2021-02-18,
 2021-02-19 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 08/16] rpmsg: glink: add sendto and
	trysendto ops
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

Implement the sendto ops to support the future rpmsg_char update for the
vitio backend support.
The use of sendto in rpmsg_char is needed as a destination address is
requested at least by the virtio backend.
The glink implementation does not need a destination address so ignores it.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_glink_native.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index d4e4dd482614..ae2c03b59c55 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1332,6 +1332,20 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_glink_send(channel, data, len, false);
 }
 
+static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+
+	return __qcom_glink_send(channel, data, len, true);
+}
+
+static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+
+	return __qcom_glink_send(channel, data, len, false);
+}
+
 /*
  * Finds the device_node for the glink child interested in this channel.
  */
@@ -1364,7 +1378,9 @@ static const struct rpmsg_device_ops glink_device_ops = {
 static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.destroy_ept = qcom_glink_destroy_ept,
 	.send = qcom_glink_send,
+	.sendto = qcom_glink_sendto,
 	.trysend = qcom_glink_trysend,
+	.trysendto = qcom_glink_trysendto,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
