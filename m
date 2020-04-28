Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D51BC023
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 15:49:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FDB6C36B0C;
	Tue, 28 Apr 2020 13:49:13 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F01F3C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 13:49:11 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1C32781411DE4945C840;
 Tue, 28 Apr 2020 21:49:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 21:49:02 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 28 Apr 2020 13:50:19 +0000
Message-ID: <20200428135019.78920-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH -next] stm class: dummy_stm: fix error return
	code in dummy_stm_init()
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

Fix to return error code -ENOMEM from the error handling case instead
of 0(ret can be overwritted to 0 in for loop).

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwtracing/stm/dummy_stm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/dummy_stm.c b/drivers/hwtracing/stm/dummy_stm.c
index 38528ffdc0b3..36d32e7afb35 100644
--- a/drivers/hwtracing/stm/dummy_stm.c
+++ b/drivers/hwtracing/stm/dummy_stm.c
@@ -68,7 +68,7 @@ static int dummy_stm_link(struct stm_data *data, unsigned int master,
 
 static int dummy_stm_init(void)
 {
-	int i, ret = -ENOMEM;
+	int i, ret;
 
 	if (nr_dummies < 0 || nr_dummies > DUMMY_STM_MAX)
 		return -EINVAL;
@@ -80,8 +80,10 @@ static int dummy_stm_init(void)
 
 	for (i = 0; i < nr_dummies; i++) {
 		dummy_stm[i].name = kasprintf(GFP_KERNEL, "dummy_stm.%d", i);
-		if (!dummy_stm[i].name)
+		if (!dummy_stm[i].name) {
+			ret = -ENOMEM;
 			goto fail_unregister;
+		}
 
 		dummy_stm[i].sw_start		= master_min;
 		dummy_stm[i].sw_end		= master_max;



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
