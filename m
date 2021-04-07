Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65431357D12
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Apr 2021 09:12:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC616C57B78;
	Thu,  8 Apr 2021 07:12:19 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AD46C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 12:45:47 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFkb90Pl3z16J2P;
 Wed,  7 Apr 2021 20:43:33 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 20:45:35 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <alexander.shishkin@linux.intel.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
Date: Wed, 7 Apr 2021 20:53:58 +0800
Message-ID: <20210407125358.4135345-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 08 Apr 2021 07:12:17 +0000
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org, yukuai3@huawei.com,
 zhangxiaoxu5@huawei.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stm class: initialize static variable in
	declaration
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

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().

list head can be initialized automatically with LIST_HEAD() rather
than explicitly calling INIT_LIST_HEAD().

srcu_struct can be initialized automatically with DEFINE_STATIC_SRCU()
rather than explicitly calling init_srcu_struct().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/hwtracing/stm/core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 2712e699ba08..1e13993e7969 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -31,7 +31,7 @@ static unsigned int stm_core_up;
  * stm_source_write() caller, which may want to have as little overhead as
  * possible.
  */
-static struct srcu_struct stm_source_srcu;
+DEFINE_STATIC_SRCU(stm_source_srcu);
 
 static ssize_t masters_show(struct device *dev,
 			    struct device_attribute *attr,
@@ -366,8 +366,8 @@ static int major_match(struct device *dev, const void *data)
  * Modules can implement STM protocol drivers and (un-)register them
  * with the STM class framework.
  */
-static struct list_head stm_pdrv_head;
-static struct mutex stm_pdrv_mutex;
+static LIST_HEAD(stm_pdrv_head);
+static DEFINE_MUTEX(stm_pdrv_mutex);
 
 struct stm_pdrv_entry {
 	struct list_head			entry;
@@ -1324,10 +1324,6 @@ static int __init stm_core_init(void)
 	if (err)
 		goto err_src;
 
-	init_srcu_struct(&stm_source_srcu);
-	INIT_LIST_HEAD(&stm_pdrv_head);
-	mutex_init(&stm_pdrv_mutex);
-
 	/*
 	 * So as to not confuse existing users with a requirement
 	 * to load yet another module, do it here.
-- 
2.25.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
