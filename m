Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9678A5EA
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 08:43:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D878BC6B458;
	Mon, 28 Aug 2023 06:43:19 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D6C9C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:43:17 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RZ1B60fhBzhZFT;
 Mon, 28 Aug 2023 14:39:26 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:14 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 28 Aug 2023 14:38:38 +0800
Message-ID: <20230828063845.3142561-6-chengzhihao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH v2 05/12] ubi: fastmap: Use free pebs reserved
	for bad block handling
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

If new bad PEBs occur, UBI firstly consumes ubi->beb_rsvd_pebs, and then
ubi->avail_pebs, finally UBI becomes read-only if above two items are 0,
which means that the amount of PEBs for user volumes is not effected.
Besides, UBI reserves count of free PBEs is ubi->beb_rsvd_pebs while
filling wl pool or getting free PEBs, but ubi->avail_pebs is not reserved.
So ubi->beb_rsvd_pebs and ubi->avail_pebs have nothing to do with the
usage of free PEBs, UBI can use all free PEBs.

Commit 78d6d497a648 ("UBI: Move fastmap specific functions out of wl.c")
has removed beb_rsvd_pebs checking while filling pool. Now, don't reserve
ubi->beb_rsvd_pebs while filling wl_pool. This will fill more PEBs in pool
and also reduce fastmap updating frequency.

Also remove beb_rsvd_pebs checking in ubi_wl_get_fm_peb.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 863f571f1adb..4611a75f1241 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -76,7 +76,7 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor)
 {
 	struct ubi_wl_entry *e = NULL;
 
-	if (!ubi->free.rb_node || (ubi->free_count - ubi->beb_rsvd_pebs < 1))
+	if (!ubi->free.rb_node)
 		goto out;
 
 	if (anchor)
@@ -100,28 +100,22 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor)
 /*
  * has_enough_free_count - whether ubi has enough free pebs to fill fm pools
  * @ubi: UBI device description object
- * @is_wl_pool: whether UBI is filling wear leveling pool
  *
  * This helper function checks whether there are enough free pebs (deducted
  * by fastmap pebs) to fill fm_pool and fm_wl_pool, above rule works after
  * there is at least one of free pebs is filled into fm_wl_pool.
- * For wear leveling pool, UBI should also reserve free pebs for bad pebs
- * handling, because there maybe no enough free pebs for user volumes after
- * producing new bad pebs.
  */
-static bool has_enough_free_count(struct ubi_device *ubi, bool is_wl_pool)
+static bool has_enough_free_count(struct ubi_device *ubi)
 {
 	int fm_used = 0;	// fastmap non anchor pebs.
-	int beb_rsvd_pebs;
 
 	if (!ubi->free.rb_node)
 		return false;
 
-	beb_rsvd_pebs = is_wl_pool ? ubi->beb_rsvd_pebs : 0;
 	if (ubi->fm_wl_pool.size > 0 && !(ubi->ro_mode || ubi->fm_disabled))
 		fm_used = ubi->fm_size / ubi->leb_size - 1;
 
-	return ubi->free_count - beb_rsvd_pebs > fm_used;
+	return ubi->free_count > fm_used;
 }
 
 /**
@@ -159,7 +153,7 @@ void ubi_refill_pools(struct ubi_device *ubi)
 	for (;;) {
 		enough = 0;
 		if (pool->size < pool->max_size) {
-			if (!has_enough_free_count(ubi, false))
+			if (!has_enough_free_count(ubi))
 				break;
 
 			e = wl_get_wle(ubi);
@@ -172,7 +166,7 @@ void ubi_refill_pools(struct ubi_device *ubi)
 			enough++;
 
 		if (wl_pool->size < wl_pool->max_size) {
-			if (!has_enough_free_count(ubi, true))
+			if (!has_enough_free_count(ubi))
 				break;
 
 			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
