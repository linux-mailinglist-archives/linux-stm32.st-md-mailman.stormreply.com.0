Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A678A5ED
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 08:43:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A02EC6B454;
	Mon, 28 Aug 2023 06:43:23 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72986C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:43:20 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RZ1BP627QzNmv0;
 Mon, 28 Aug 2023 14:39:41 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:17 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 28 Aug 2023 14:38:42 +0800
Message-ID: <20230828063845.3142561-10-chengzhihao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH v2 09/12] ubi: fastmap: Get wl PEB even ec
	beyonds the 'max' if free PEBs are run out
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

This is the part 2 to fix cyclically reusing single fastmap data PEBs.

Consider one situation, if there are four free PEBs for fm_anchor, pool,
wl_pool and fastmap data PEB with erase counter 100, 100, 100, 5096
(ubi->beb_rsvd_pebs is 0). PEB with erase counter 5096 is always picked
for fastmap data according to the realization of find_wl_entry(), since
fastmap data PEB is not scheduled for wl, finally there are two PEBs
(fm data) with great erase counter than other PEBS.
Get wl PEB even its erase counter exceeds the 'max' in find_wl_entry()
when free PEBs are run out after filling pools and fm data. Then the PEB
with biggest erase conter is taken as wl PEB, it can be scheduled for wl.

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 44 ++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/wl.c         | 16 ++++++++-----
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 490514da1e00..03c1f1016c0a 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -138,23 +138,44 @@ static void wait_free_pebs_for_pool(struct ubi_device *ubi)
 }
 
 /*
- * has_enough_free_count - whether ubi has enough free pebs to fill fm pools
+ * left_free_count - returns the number of free pebs to fill fm pools
  * @ubi: UBI device description object
  *
- * This helper function checks whether there are enough free pebs (deducted
+ * This helper function returns the number of free pebs (deducted
  * by fastmap pebs) to fill fm_pool and fm_wl_pool.
  */
-static bool has_enough_free_count(struct ubi_device *ubi)
+static int left_free_count(struct ubi_device *ubi)
 {
 	int fm_used = 0;	// fastmap non anchor pebs.
 
 	if (!ubi->free.rb_node)
-		return false;
+		return 0;
 
 	if (!ubi->ro_mode && !ubi->fm_disabled)
 		fm_used = ubi->fm_size / ubi->leb_size - 1;
 
-	return ubi->free_count > fm_used;
+	return ubi->free_count - fm_used;
+}
+
+/*
+ * can_fill_pools - whether free PEBs will be left after filling pools
+ * @ubi: UBI device description object
+ * @free: current number of free PEBs
+ *
+ * Return %1 if there are still left free PEBs after filling pools,
+ * otherwise %0 is returned.
+ */
+static int can_fill_pools(struct ubi_device *ubi, int free)
+{
+	struct ubi_fm_pool *wl_pool = &ubi->fm_wl_pool;
+	struct ubi_fm_pool *pool = &ubi->fm_pool;
+	int pool_need = pool->max_size - pool->size +
+			wl_pool->max_size - wl_pool->size;
+
+	if (free - pool_need < 1)
+		return 0;
+
+	return 1;
 }
 
 /**
@@ -199,7 +220,7 @@ void ubi_refill_pools_and_lock(struct ubi_device *ubi)
 	for (;;) {
 		enough = 0;
 		if (pool->size < pool->max_size) {
-			if (!has_enough_free_count(ubi))
+			if (left_free_count(ubi) <= 0)
 				break;
 
 			e = wl_get_wle(ubi);
@@ -212,10 +233,13 @@ void ubi_refill_pools_and_lock(struct ubi_device *ubi)
 			enough++;
 
 		if (wl_pool->size < wl_pool->max_size) {
-			if (!has_enough_free_count(ubi))
+			int left_free = left_free_count(ubi);
+
+			if (left_free <= 0)
 				break;
 
-			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF,
+					  !can_fill_pools(ubi, left_free));
 			self_check_in_wl_tree(ubi, e, &ubi->free);
 			rb_erase(&e->u.rb, &ubi->free);
 			ubi->free_count--;
@@ -355,12 +379,12 @@ static bool need_wear_leveling(struct ubi_device *ubi)
 	if (!e) {
 		if (!ubi->free.rb_node)
 			return false;
-		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 		ec = e->ec;
 	} else {
 		ec = e->ec;
 		if (ubi->free.rb_node) {
-			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 			ec = max(ec, e->ec);
 		}
 	}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 40a1c306b8af..a357f3d27f2f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -317,12 +317,14 @@ static void prot_queue_add(struct ubi_device *ubi, struct ubi_wl_entry *e)
  * @ubi: UBI device description object
  * @root: the RB-tree where to look for
  * @diff: maximum possible difference from the smallest erase counter
+ * @pick_max: pick PEB even its erase counter beyonds 'min_ec + @diff'
  *
  * This function looks for a wear leveling entry with erase counter closest to
  * min + @diff, where min is the smallest erase counter.
  */
 static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
-					  struct rb_root *root, int diff)
+					  struct rb_root *root, int diff,
+					  int pick_max)
 {
 	struct rb_node *p;
 	struct ubi_wl_entry *e;
@@ -336,9 +338,11 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
 		struct ubi_wl_entry *e1;
 
 		e1 = rb_entry(p, struct ubi_wl_entry, u.rb);
-		if (e1->ec >= max)
+		if (e1->ec >= max) {
+			if (pick_max)
+				e = e1;
 			p = p->rb_left;
-		else {
+		} else {
 			p = p->rb_right;
 			e = e1;
 		}
@@ -375,7 +379,7 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 		 */
 		e = may_reserve_for_fm(ubi, e, root);
 	} else
-		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2);
+		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2, 0);
 
 	return e;
 }
@@ -1048,7 +1052,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 		 * %UBI_WL_THRESHOLD.
 		 */
 		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
-		e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+		e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 
 		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD))
 			goto out_unlock;
@@ -2079,7 +2083,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 {
 	struct ubi_wl_entry *e;
 
-	e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+	e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 	self_check_in_wl_tree(ubi, e, &ubi->free);
 	ubi->free_count--;
 	ubi_assert(ubi->free_count >= 0);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
