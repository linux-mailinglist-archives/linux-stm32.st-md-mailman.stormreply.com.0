Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E652344C3
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 13:47:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBB2CC36B38;
	Fri, 31 Jul 2020 11:47:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4E68C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 11:47:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VBbbei031331; Fri, 31 Jul 2020 13:47:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=k7ltq3/ZPaKQIqQq9LylBJfe8kS7T2cxwS2tEwGJ8FM=;
 b=joW8sDzXNZeMc8r5/zaM+7A1pWt15kDnuOuf/mIpk+QIvdT8vxGhwQGhQ++9Q3uOSpwD
 +Qs0E6PvtCSd3CE4cO1Z3QG51g7ryzi8wgFSzS6uD4jLWfh0gMy8b9NG+JxWhqrYPywo
 6EU3H90l/YFqnnObN75RSzJXaNWXxCVRcknNH+WgXf90XEoLBl+LTNtEcRE6/Q4zEldj
 FEIAvoWI7kPK/XuWJ8ssyFvDRGXPYmubuBmUOnOViCgQMfwsqhBFHVaOmfJqwOh6tUk/
 8fiEltUKyWbT0g5km1A9ZduM2x/f8BQI2AELq1U6XkrpLwhhFOpoa5pklFjzfIfTAddU fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9xgsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 13:47:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF65E10002A;
 Fri, 31 Jul 2020 13:47:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3FA02A7A83;
 Fri, 31 Jul 2020 13:47:50 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 13:47:50
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 13:47:32 +0200
Message-ID: <20200731114732.12815-10-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731114732.12815-1-arnaud.pouliquen@st.com>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 9/9] rpmsg: ns: name service announcement
	endianness
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

The endianness has to be fixed to ensure that both sides can
decode the message. The Little endian format is used according
to the generic virtio implementation.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_ns.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index cc2bd47c415a..b478e2b55213 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -33,8 +33,8 @@ enum rpmsg_ns_flags {
  */
 struct rpmsg_ns_msg {
 	char name[RPMSG_NAME_SIZE];
-	u32 addr;
-	u32 flags;
+	__le32 addr;
+	__le32 flags;
 } __packed;
 
 /**
@@ -57,8 +57,8 @@ static int rpmsg_ns_channel_announce(struct rpmsg_device *rpdev, int ns_flag)
 		return -EINVAL;
 
 	strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-	nsm.addr = rpdev->ept->addr;
-	nsm.flags = ns_flag;
+	nsm.addr = cpu_to_le32(rpdev->ept->addr);
+	nsm.flags = cpu_to_le32(ns_flag);
 
 	return rpmsg_send_offchannel(rpdev->ept, RPMSG_NS_ADDR, RPMSG_NS_ADDR,
 				     &nsm, sizeof(nsm));
@@ -84,6 +84,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_device *newch;
 	struct rpmsg_channel_info chinfo;
 	struct device *dev = &rpdev->dev;
+	unsigned int flags = le32_to_cpu(msg->flags);
 	int ret;
 
 #if defined(CONFIG_DYNAMIC_DEBUG)
@@ -101,13 +102,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 
 	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
 	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = msg->addr;
+	chinfo.dst = le32_to_cpu(msg->addr);
 
 	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
-		 msg->name, msg->addr);
+		 flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
+		 msg->name, chinfo.dst);
 
-	if (msg->flags & RPMSG_NS_DESTROY) {
+	if (flags & RPMSG_NS_DESTROY) {
 		ret = rpmsg_release_channel(rpdev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
