Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F48437791
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Oct 2021 14:55:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A9D7C5E2A2;
	Fri, 22 Oct 2021 12:55:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B50B0C5E2A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 12:55:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M8o9P3015561; 
 Fri, 22 Oct 2021 14:55:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2Cklww60Q60zoiXLscctpP7BlF1nmV/g12ZYeNXatR0=;
 b=ef6vT5eNRYg7aQtwFGMMNdEnNjFeRaspUwMerN0nhs1o3w8iN0LClVkyIDJkkSNz84X5
 OrZ7p/7S/EOxJmf9kigYd4Ulp2y4hJvKlAGyXX9Gip2U8pBWQXrtGICg05JHmilW/X7l
 IaT1EgzMojE0WjQbF30vtAE9YwuaU9Qw2r6JfIDWIdUuK9m5bOw40JRZffeRKTHuEdZn
 DWsmcU9hAntz8lW0/D3ExpqsWN0fw2u0VliESui6RCXznWvRPkfr3vdCyLTLbq2yvyAj
 mKHv4nEQdPP4gEi1XCR9FLvRVip0WaC/+0Czskz1E2ckeic/6+WZ4mQntMWsv3xzwKvo jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3but4y1f1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 14:55:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58C0D10002A;
 Fri, 22 Oct 2021 14:55:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5145421FEAD;
 Fri, 22 Oct 2021 14:55:47 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:55:46
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 22 Oct 2021 14:54:26 +0200
Message-ID: <20211022125426.2579-11-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
Cc: julien.massot@iot.bzh, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 10/10] rpmsg: core: send a ns announcement
	when a default endpoint is created
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

When a channel is created by user space application with the
RPMSG_CREATE_DEV_IOCTL controls, a ns announcement has to be sent
(depending on backend) to inform the remote side that a new service
is available.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 92557c49d460..4c0c605473c7 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -160,6 +160,7 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
 						struct rpmsg_channel_info chinfo)
 {
 	struct rpmsg_endpoint *ept;
+	int err = 0;
 
 	if (WARN_ON(!rpdev))
 		return NULL;
@@ -179,6 +180,16 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
 	rpdev->ept = ept;
 	rpdev->src = ept->addr;
 
+	if (rpdev->ops->announce_create)
+		err = rpdev->ops->announce_create(rpdev);
+	if (err) {
+		rpmsg_destroy_ept(ept);
+		rpdev->ept = NULL;
+		rpdev->src = RPMSG_ADDR_ANY;
+
+		return NULL;
+	}
+
 	return ept;
 }
 EXPORT_SYMBOL(rpmsg_create_default_ept);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
