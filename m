Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CA750E614
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1E4AC628AC;
	Mon, 25 Apr 2022 16:45:09 +0000 (UTC)
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E2C7C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Apr 2022 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650282445; x=1681818445;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=n2+oqVAGuq8c/aT6QcC6vtRWS7aPsK4XrbOxWAUb+cM=;
 b=UBT6oYQAU5keoHZo3hSbf+FfQWuD0hJtKxUjiwip6JR7RLeTTPURc9fS
 wnk5uIzGZqQNyjGoD+3g2J3IIqavcFZVmRuCXuzK5Mg1KXdCkoqjZlJa/
 aOmjVFRItOJ1zbl4uhI6nj93NaezDfnrRB+kd5u4fHLh3UlvDIhHDFu9v g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Apr 2022 04:47:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 04:47:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 04:47:22 -0700
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 04:47:19 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 18 Apr 2022 19:46:58 +0800
Message-ID: <20220418114658.6491-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: linux-arm-msm@vger.kernel.org, Mao Jinlong <quic_jinlmao@quicinc.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, Hao Zhang <quic_hazha@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stm class: Fix double add issue when store
	source_link
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

If two threads store the same stm device to stm_source_link
at the same time when stm->link_list is empty, it is possible
that stm_source_link_add will be called for both of these two
threads. Then double add issue below will happen. Add mutex
lock for stm_source_link drop and stm_source_link add to avoid
this race condition.

[ 12.386579][ T1024] list_add double add: new=ffffff87b73ebd90,
prev=ffffff87b73ebd90, next=ffffffc012737700.
[ 12.386657][ T1024] -----------[ cut here ]-----------
[ 12.386671][ T1024] kernel BUG at lib/list_debug.c:31!
[ 12.388845][ T1024] CPU: 2 PID: 1024 Comm: sh
[ 12.389162][ T1024] Call trace:
[ 12.389174][ T1024] __list_add_valid+0x68/0x98
[ 12.389199][ T1024] stm_source_link_store+0xcc/0x314 [stm_core]
[ 12.389213][ T1024] dev_attr_store+0x38/0x8c
[ 12.389228][ T1024] sysfs_kf_write+0xa0/0x100
[ 12.389239][ T1024] kernfs_fop_write_iter+0x1b0/0x2f8
[ 12.389253][ T1024] vfs_write+0x300/0x37c
[ 12.389264][ T1024] ksys_write+0x84/0x12c

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/stm/core.c | 7 ++++++-
 drivers/hwtracing/stm/stm.h  | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 2712e699ba08..e73ac961acb2 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -1171,11 +1171,14 @@ static ssize_t stm_source_link_store(struct device *dev,
 	struct stm_device *link;
 	int err;
 
+	mutex_lock(&src->link_mutex);
 	stm_source_link_drop(src);
 
 	link = stm_find_device(buf);
-	if (!link)
+	if (!link) {
+		mutex_lock(&src->link_mutex);
 		return -EINVAL;
+	}
 
 	pm_runtime_get(&link->dev);
 
@@ -1185,6 +1188,7 @@ static ssize_t stm_source_link_store(struct device *dev,
 		/* matches the stm_find_device() above */
 		stm_put_device(link);
 	}
+	mutex_unlock(&src->link_mutex);
 
 	return err ? : count;
 }
@@ -1251,6 +1255,7 @@ int stm_source_register_device(struct device *parent,
 
 	stm_output_init(&src->output);
 	spin_lock_init(&src->link_lock);
+	mutex_init(&src->link_mutex);
 	INIT_LIST_HEAD(&src->link_entry);
 	src->data = data;
 	data->src = src;
diff --git a/drivers/hwtracing/stm/stm.h b/drivers/hwtracing/stm/stm.h
index a9be49fc7a6b..60b814cc00e0 100644
--- a/drivers/hwtracing/stm/stm.h
+++ b/drivers/hwtracing/stm/stm.h
@@ -79,6 +79,7 @@ void stm_put_device(struct stm_device *stm);
 struct stm_source_device {
 	struct device		dev;
 	struct stm_source_data	*data;
+	struct mutex		link_mutex;
 	spinlock_t		link_lock;
 	struct stm_device __rcu	*link;
 	struct list_head	link_entry;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
