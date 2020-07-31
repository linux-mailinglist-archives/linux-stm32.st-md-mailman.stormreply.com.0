Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A55272344BF
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 13:47:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70ED2C36B3A;
	Fri, 31 Jul 2020 11:47:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 211A9C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 11:47:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VBcegX030181; Fri, 31 Jul 2020 13:47:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Al7/FWHuiKIExSa/T5bbmCEZ2bGtSZGlFAqWKG8rmMA=;
 b=HkU9S/+lcHz2FLd0drohPVM+U+RBzT3b7ggjqmjvfqFeFOglU0OXbysVBIq2YQSVwjg4
 okcYNwpREz+9Oq9vMPDoqN8OBG4gvGQuyMtidTQycxRJld+XCS5bXFY2IekQ3Rg/eieY
 Yeo/B9j80tHNppPunUZxD0MIee5PFq2Zjuy2y8niAMD5d33xt1KGulTEaxuoA6Qfdc2c
 +5G3JPIuJb3l3O4sMBkV0GabaenRgTI41ULQq+nh+/bVE8fXQRu5Fw/U23Ne5J9hiYlK
 DB927EcSsbOPvcJikONeG4TyAGgeKclyTmv2C04MBHWUNrehVSSraThpmv+XF7Faa89b pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga72d9jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 13:47:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88B39100038;
 Fri, 31 Jul 2020 13:47:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D8DD2A7A83;
 Fri, 31 Jul 2020 13:47:48 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 13:47:47
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 13:47:30 +0200
Message-ID: <20200731114732.12815-8-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731114732.12815-1-arnaud.pouliquen@st.com>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 7/9] rpmsg: ns: add name service announcement
	service
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

As the RPMsg driver is in charge of the name service announcement,
create an API to send channel creation and destruction to the remote
processor.
Notice that the source address of the message sent is now RPMSG_NS_ADDR.
Legacy implementation was to send the message with source address
corresponding to the ept created.
RPMSG_NS_ADDR as source address make sense as we want to send a message
belonging to the NS announcement service and the created ept address is
already in the message payload.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_internal.h |  3 +++
 drivers/rpmsg/rpmsg_ns.c       | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 641b48f6bf2a..d1549e5cb607 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -119,4 +119,7 @@ static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
 	return rpmsg_register_device(rpdev);
 }
 
+int rpmsg_ns_announce_create(struct rpmsg_device *rpdev);
+int rpmsg_ns_announce_destroy(struct rpmsg_device *rpdev);
+
 #endif
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index fe7713e737c2..cc2bd47c415a 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -37,6 +37,45 @@ struct rpmsg_ns_msg {
 	u32 flags;
 } __packed;
 
+/**
+ * rpmsg_ns_announce_create() -announce to the remote processor
+ * the service creation or destruction
+ * @rpdev: the rpmsg channel
+ * @ns_flag: related to the @rpmsg_ns_flags enum
+ *
+ * This function can be called on a channel creation or destruction to inform
+ * the remote processor, using the reserved name service anouncement channel.
+ */
+static int rpmsg_ns_channel_announce(struct rpmsg_device *rpdev, int ns_flag)
+{
+	struct rpmsg_ns_msg nsm;
+
+	if (!rpdev->announce || !rpdev->ept)
+		return 0;
+
+	if (ns_flag != RPMSG_NS_CREATE && ns_flag != RPMSG_NS_DESTROY)
+		return -EINVAL;
+
+	strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
+	nsm.addr = rpdev->ept->addr;
+	nsm.flags = ns_flag;
+
+	return rpmsg_send_offchannel(rpdev->ept, RPMSG_NS_ADDR, RPMSG_NS_ADDR,
+				     &nsm, sizeof(nsm));
+}
+
+int rpmsg_ns_announce_create(struct rpmsg_device *rpdev)
+{
+	return rpmsg_ns_channel_announce(rpdev, RPMSG_NS_CREATE);
+}
+EXPORT_SYMBOL(rpmsg_ns_announce_create);
+
+int rpmsg_ns_announce_destroy(struct rpmsg_device *rpdev)
+{
+	return rpmsg_ns_channel_announce(rpdev, RPMSG_NS_DESTROY);
+}
+EXPORT_SYMBOL(rpmsg_ns_announce_destroy);
+
 /* invoked when a name service announcement arrives */
 static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 		       void *priv, u32 src)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
