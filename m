Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B875852E769
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 10:30:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F1FBC03FFB;
	Fri, 20 May 2022 08:30:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 136F0C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 08:30:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K3tLia028145;
 Fri, 20 May 2022 10:30:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ELzzZyzi9IIRB85sZHLytKa0QsJoVdFk2Y4D4aQAVAo=;
 b=1t9eTyznf9T4JFHDbh8VG8RC/ucYGYT01BYBBxUFQCAdBPo3LbaZpEV3B0VpJOlPT47Y
 z9zBj2dM1dBRFdWAKxNLiHvNgu2tqnfeo6SqIquE7wsdTU1ZFwIsUzIQ/xMisK5c2B5n
 owV16Vfe8v0KtNgQ0ppzZNoadAu4XGr8NoqQxR7SHzA+8ZOQ4lLB1dIiTo0b317M9TwU
 eK38LqNtlkCidS2ncVH6CKOomVWti61EjxKWPwyaqR0qaBUy8nb1U4j0iNiOJUTtdjFK
 Nogumxsx5vUwU+JbmP9AZP9PqeAddSsL/nGYJtdFTdgqVgf373Y4df/WcZUDuzIqZZwx zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s22tk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 10:30:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C61A10003A;
 Fri, 20 May 2022 10:29:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3572A214D3E;
 Fri, 20 May 2022 10:29:58 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 10:29:57 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 20 May 2022 10:29:33 +0200
Message-ID: <20220520082940.2984914-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
References: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Deepak Kumar Singh <quic_deesin@quicinc.com>,
 Chris Lew <quic_clew@quicinc.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC PATCH 03/10] rpmsg: core: Add rpmsg device
	remote flow control announcement ops
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

This ops is called by the rpmsg flow control service to inform
a rpmsg local device of a remote endpoint flow control state.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_core.c     | 24 ++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h |  7 +++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 8de8aadd9b27..6bbc3b3ace50 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -67,6 +67,30 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
 }
 EXPORT_SYMBOL(rpmsg_release_channel);
 
+/**
+ * rpmsg_channel_remote_fc() - announce remote endpoint flow control state
+ * using source and destination endpoint address info.
+ * @rpdev: rpmsg device
+ * @chinfo: channel_info
+ * @enable: state of the remote endpoint
+ *
+ * Return: 0 on success or an appropriate error value.
+ */
+int rpmsg_channel_remote_fc(struct rpmsg_device *rpdev,
+			    struct rpmsg_channel_info *chinfo,
+			    bool enable)
+{
+	if (WARN_ON(!rpdev))
+		return -EINVAL;
+	if (!rpdev->ops || !rpdev->ops->announce_remote_fc) {
+		dev_err(&rpdev->dev, "no flow control ops found\n");
+		return -ENXIO;
+	}
+
+	return rpdev->ops->announce_remote_fc(rpdev, chinfo, enable);
+}
+EXPORT_SYMBOL(rpmsg_channel_remote_fc);
+
 /**
  * rpmsg_create_ept() - create a new rpmsg_endpoint
  * @rpdev: rpmsg channel device
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 4ce58e68af30..44e2c0f2f5ea 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -43,6 +43,9 @@ struct rpmsg_device_ops {
 
 	int (*announce_create)(struct rpmsg_device *ept);
 	int (*announce_destroy)(struct rpmsg_device *ept);
+	int (*announce_remote_fc)(struct rpmsg_device *rpdev,
+				  struct rpmsg_channel_info *chinfo,
+				  bool enable);
 };
 
 /**
@@ -87,6 +90,10 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
 					  struct rpmsg_channel_info *chinfo);
 int rpmsg_release_channel(struct rpmsg_device *rpdev,
 			  struct rpmsg_channel_info *chinfo);
+
+int rpmsg_channel_remote_fc(struct rpmsg_device *rpdev,
+			    struct rpmsg_channel_info *chinfo,
+			    bool enable);
 /**
  * rpmsg_ctrldev_register_device() - register a char device for control based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
