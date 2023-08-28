Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB378A5E5
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 08:43:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B2E1C6B44F;
	Mon, 28 Aug 2023 06:43:16 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6898C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:43:14 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RZ1Bp2CqMzLp2V;
 Mon, 28 Aug 2023 14:40:02 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:11 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 28 Aug 2023 14:38:34 +0800
Message-ID: <20230828063845.3142561-2-chengzhihao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH v2 01/12] ubi: fastmap: Fix missed ec updating
	after erasing old fastmap data block
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

After running fsstress on ubifs for a long time, UBI(16384 blocks,
fastmap takes 2 blocks) has an erase block with different erase
counters displayed from two views:

From ubiscan view: PEB 8031 has erase counter 31581
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:    16383      290      315      781
1000     ..     9999:        0        0        0        0
10000    ..    99999:        1    31581    31581    31581
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :    16384      290      317    31581

From detailed_erase_block_info view: PEB 8031 has erase counter 7
physical_block_number   erase_count
8030                    421
8031                    7   # mem info is different from disk info
8032                    434
8033                    425
8034                    431

Following process missed updating erase counter in wl_entry(in memory):
ubi_update_fastmap
 for (i = 1; i < new_fm->used_blocks; i++) // update fastmap data
  if (!tmp_e)
   if (old_fm && old_fm->e[i])
    erase_block(ubi, old_fm->e[i]->pnum)
     ret = ubi_io_sync_erase(ubi, pnum, 0)
     ec = be64_to_cpu(ec_hdr->ec)
     ec += ret
     ec_hdr->ec = cpu_to_be64(ec)
     ubi_io_write_ec_hdr(ubi, pnum, ec_hdr)  // ec is updated on flash
   // ec is not updated in old_fm->e[i] (in memory)

Fix it by passing wl_enter into erase_block() and updating erase
counter in erase_block().

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 28c8151a0725..f8c230acc55e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1392,11 +1392,12 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 /**
  * erase_block - Manually erase a PEB.
  * @ubi: UBI device object
- * @pnum: PEB to be erased
+ * @e: the physical eraseblock to erase
  *
- * Returns the new EC value on success, < 0 indicates an internal error.
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
  */
-static int erase_block(struct ubi_device *ubi, int pnum)
+static int erase_block(struct ubi_device *ubi, struct ubi_wl_entry *e)
 {
 	int ret;
 	struct ubi_ec_hdr *ec_hdr;
@@ -1406,7 +1407,7 @@ static int erase_block(struct ubi_device *ubi, int pnum)
 	if (!ec_hdr)
 		return -ENOMEM;
 
-	ret = ubi_io_read_ec_hdr(ubi, pnum, ec_hdr, 0);
+	ret = ubi_io_read_ec_hdr(ubi, e->pnum, ec_hdr, 0);
 	if (ret < 0)
 		goto out;
 	else if (ret && ret != UBI_IO_BITFLIPS) {
@@ -1414,7 +1415,7 @@ static int erase_block(struct ubi_device *ubi, int pnum)
 		goto out;
 	}
 
-	ret = ubi_io_sync_erase(ubi, pnum, 0);
+	ret = ubi_io_sync_erase(ubi, e->pnum, 0);
 	if (ret < 0)
 		goto out;
 
@@ -1426,11 +1427,16 @@ static int erase_block(struct ubi_device *ubi, int pnum)
 	}
 
 	ec_hdr->ec = cpu_to_be64(ec);
-	ret = ubi_io_write_ec_hdr(ubi, pnum, ec_hdr);
+	ret = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
 	if (ret < 0)
 		goto out;
 
-	ret = ec;
+	e->ec = ec;
+	spin_lock(&ubi->wl_lock);
+	if (e->ec > ubi->max_ec)
+		ubi->max_ec = e->ec;
+	spin_unlock(&ubi->wl_lock);
+
 out:
 	kfree(ec_hdr);
 	return ret;
@@ -1576,7 +1582,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 		if (!tmp_e) {
 			if (old_fm && old_fm->e[i]) {
-				ret = erase_block(ubi, old_fm->e[i]->pnum);
+				ret = erase_block(ubi, old_fm->e[i]);
 				if (ret < 0) {
 					ubi_err(ubi, "could not erase old fastmap PEB");
 
@@ -1628,7 +1634,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	if (old_fm) {
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
-			ret = erase_block(ubi, old_fm->e[0]->pnum);
+			ret = erase_block(ubi, old_fm->e[0]);
 			if (ret < 0) {
 				ubi_err(ubi, "could not erase old anchor PEB");
 
@@ -1640,7 +1646,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				goto err;
 			}
 			new_fm->e[0] = old_fm->e[0];
-			new_fm->e[0]->ec = ret;
 			old_fm->e[0] = NULL;
 		} else {
 			/* we've got a new anchor PEB, return the old one */
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
