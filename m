Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0133E78A5E8
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 08:43:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B50DDC6B44F;
	Mon, 28 Aug 2023 06:43:19 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8989C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:43:16 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RZ1BL1G7bzNnG4;
 Mon, 28 Aug 2023 14:39:38 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:13 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 28 Aug 2023 14:38:37 +0800
Message-ID: <20230828063845.3142561-5-chengzhihao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH v2 04/12] ubi: Replace erase_block() with
	sync_erase()
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

Since erase_block() has same logic with sync_erase(), just replace it
with sync_erase(), also rename 'sync_erase()' to 'ubi_sync_erase()'.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 48 ++-------------------------------------
 drivers/mtd/ubi/ubi.h     |  1 +
 drivers/mtd/ubi/wl.c      |  9 ++++----
 3 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index d64bfb986d40..8f6052cb3217 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1389,50 +1389,6 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	return ret;
 }
 
-/**
- * erase_block - Manually erase a PEB.
- * @ubi: UBI device object
- * @e: the physical eraseblock to erase
- *
- * This function returns zero in case of success and a negative error code in
- * case of failure.
- */
-static int erase_block(struct ubi_device *ubi, struct ubi_wl_entry *e)
-{
-	int err;
-	struct ubi_ec_hdr *ec_hdr;
-	long long ec = e->ec;
-
-	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
-	if (!ec_hdr)
-		return -ENOMEM;
-
-	err = ubi_io_sync_erase(ubi, e->pnum, 0);
-	if (err < 0)
-		goto out;
-
-	ec += err;
-	if (ec > UBI_MAX_ERASECOUNTER) {
-		err = -EINVAL;
-		goto out;
-	}
-
-	ec_hdr->ec = cpu_to_be64(ec);
-	err = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
-	if (err < 0)
-		goto out;
-
-	e->ec = ec;
-	spin_lock(&ubi->wl_lock);
-	if (e->ec > ubi->max_ec)
-		ubi->max_ec = e->ec;
-	spin_unlock(&ubi->wl_lock);
-
-out:
-	kfree(ec_hdr);
-	return err;
-}
-
 /**
  * invalidate_fastmap - destroys a fastmap.
  * @ubi: UBI device object
@@ -1573,7 +1529,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 		if (!tmp_e) {
 			if (old_fm && old_fm->e[i]) {
-				ret = erase_block(ubi, old_fm->e[i]);
+				ret = ubi_sync_erase(ubi, old_fm->e[i], 0);
 				if (ret < 0) {
 					ubi_err(ubi, "could not erase old fastmap PEB");
 
@@ -1625,7 +1581,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	if (old_fm) {
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
-			ret = erase_block(ubi, old_fm->e[0]);
+			ret = ubi_sync_erase(ubi, old_fm->e[0], 0);
 			if (ret < 0) {
 				ubi_err(ubi, "could not erase old anchor PEB");
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8f1bd4fa100..2f0c0eacc013 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -902,6 +902,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 		   struct ubi_attach_info *ai_scan);
 
 /* wl.c */
+int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int torture);
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 		   int pnum, int torture);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 26a214f016c1..0c78e09d7960 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -427,7 +427,7 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
 }
 
 /**
- * sync_erase - synchronously erase a physical eraseblock.
+ * ubi_sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
  * @e: the physical eraseblock to erase
  * @torture: if the physical eraseblock has to be tortured
@@ -435,8 +435,7 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
-		      int torture)
+int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int torture)
 {
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
@@ -1094,7 +1093,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	dbg_wl("erase PEB %d EC %d LEB %d:%d",
 	       pnum, e->ec, wl_wrk->vol_id, wl_wrk->lnum);
 
-	err = sync_erase(ubi, e, wl_wrk->torture);
+	err = ubi_sync_erase(ubi, e, wl_wrk->torture);
 	if (!err) {
 		spin_lock(&ubi->wl_lock);
 
@@ -1749,7 +1748,7 @@ static int erase_aeb(struct ubi_device *ubi, struct ubi_ainf_peb *aeb, bool sync
 	ubi->lookuptbl[e->pnum] = e;
 
 	if (sync) {
-		err = sync_erase(ubi, e, false);
+		err = ubi_sync_erase(ubi, e, false);
 		if (err)
 			goto out_free;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
