Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 594EB78A5EC
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 08:43:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19AB8C6B44F;
	Mon, 28 Aug 2023 06:43:23 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2014C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:43:19 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RZ1Cp37rqzVjXv;
 Mon, 28 Aug 2023 14:40:54 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:16 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 28 Aug 2023 14:38:41 +0800
Message-ID: <20230828063845.3142561-9-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
Cc: bagasdotme@gmail.com, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/12] ubi: fastmap: may_reserve_for_fm:
	Don't reserve PEB if fm_anchor exists
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

This is the part 1 to fix cyclically reusing single fastmap data PEBs.

After running fsstress on UBIFS for a while, UBI (16384 blocks, fastmap
takes 2 blocks) has an erase block(PEB: 8031) with big erase counter
greater than any other pebs:

=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:      532       84       92       99
100      ..      999:    15787      100      147      229
1000     ..     9999:       64     4699     4765     4826
10000    ..    99999:        0        0        0        0
100000   ..      inf:        1   272935   272935   272935
---------------------------------------------------------
Total               :    16384       84      180   272935

Not like fm_anchor, there is no candidate PEBs for fastmap data area,
so old fastmap data pebs will be reused after all free pebs are filled
into pool/wl_pool:
ubi_update_fastmap
 for (i = 1; i < new_fm->used_blocks; i++)
  erase_block(ubi, old_fm->e[i]->pnum)
  new_fm->e[i] = old_fm->e[i]

According to wear leveling algorithm, UBI selects one small erase
counter PEB from ubi->used and one big erase counter PEB from wl_pool,
the reused fastmap data PEB is not in these trees. UBI won't schedule
this PEB for wl even it is in ubi->used because wl algorithm expects
small erase counter for used PEB.

Don't reserve PEB for fastmap in may_reserve_for_fm() if fm_anchor
already exists. Otherwise, when UBI is running out of free PEBs,
the only one free PEB (pnum < 64) will be skipped and fastmap data
will be written on the same old PEB.

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 2 +-
 drivers/mtd/ubi/wl.c         | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 7c4cfd80da31..490514da1e00 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -521,7 +521,7 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
 					   struct ubi_wl_entry *e,
 					   struct rb_root *root) {
-	if (e && !ubi->fm_disabled && !ubi->fm &&
+	if (e && !ubi->fm_disabled && !ubi->fm && !ubi->fm_anchor &&
 	    e->pnum < UBI_FM_MAX_START)
 		e = rb_entry(rb_next(root->rb_node),
 			     struct ubi_wl_entry, u.rb);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 14edb65ce6a6..40a1c306b8af 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -367,9 +367,12 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 	if (last->ec - first->ec < WL_FREE_MAX_DIFF) {
 		e = rb_entry(root->rb_node, struct ubi_wl_entry, u.rb);
 
-		/* If no fastmap has been written and this WL entry can be used
-		 * as anchor PEB, hold it back and return the second best
-		 * WL entry such that fastmap can use the anchor PEB later. */
+		/*
+		 * If no fastmap has been written and fm_anchor is not
+		 * reserved and this WL entry can be used as anchor PEB
+		 * hold it back and return the second best WL entry such
+		 * that fastmap can use the anchor PEB later.
+		 */
 		e = may_reserve_for_fm(ubi, e, root);
 	} else
 		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
