Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB8AA5C4
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2019 16:27:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48DF4C35E07;
	Thu,  5 Sep 2019 14:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45B7AC35E06
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 14:27:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x85EQC1b002067; Thu, 5 Sep 2019 16:27:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=I25v1nGgd0oB934K7CvEPzrYGTMEjRKegcH/B1pV2tE=;
 b=aGcnV3R3g8lgKmTYEM6XrDWRO/ZY8NjnWR1BNmyaKMNhkx5KQNO2J5lKDq+2ra1fASoq
 wGPKGkNfG659b+Dg/GCFs/3TaLWgn5qM0ukuby+kTMDumhnjZmlYVNOj4RFHa7kic4Xn
 VLmiO5b62cjs/Zc3BdpVLLy57QU40ufQ+Z+BmwkjGjU8+NOV3yau5eB9DEuEHhLa6mNZ
 b64CjFK/SgXEHa/hZjXYEMFaCYPW2FZ7wZIIeZXJyGzlZ4oZIvvTybFTjVR6QExknJEY
 MiYwJ22QdVneXdXgevGxXfteJPWDnPnkUnlPaLUQQlcmYxkW6NpQUnNiF28Uws5o44pO yQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqec38u1s-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 05 Sep 2019 16:27:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51E7124;
 Thu,  5 Sep 2019 14:27:21 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEFCB2D6C48;
 Thu,  5 Sep 2019 16:27:20 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019
 16:27:20 +0200
Received: from localhost (10.48.0.131) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 5 Sep 2019 16:27:20 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Date: Thu, 5 Sep 2019 16:27:10 +0200
Message-ID: <1567693630-27544-4-git-send-email-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_04:2019-09-04,2019-09-05 signatures=0
Cc: Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH 3/3] rpmsg: smd: implement get_mtu ops
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

Implement the get_mtu ops to return the maximum size of
the message that can be sent.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/qcom_smd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 4abbeea782fa..f233f8d85062 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -989,6 +989,13 @@ static __poll_t qcom_smd_poll(struct rpmsg_endpoint *ept,
 	return mask;
 }
 
+static ssize_t qcom_smd_get_mtu(struct rpmsg_endpoint *ept)
+{
+	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
+
+	return qcom_smd_get_tx_avail(qsept->qsch);
+}
+
 /*
  * Finds the device_node for the smd child interested in this channel.
  */
@@ -1040,6 +1047,7 @@ static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
 	.send = qcom_smd_send,
 	.trysend = qcom_smd_trysend,
 	.poll = qcom_smd_poll,
+	.get_mtu = qcom_smd_get_mtu,
 };
 
 static void qcom_smd_release_device(struct device *dev)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
