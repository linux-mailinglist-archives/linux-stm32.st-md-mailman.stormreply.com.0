Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C75D78A5EF
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 08:43:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5491EC6B44F;
	Mon, 28 Aug 2023 06:43:25 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D84C1C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:43:21 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RZ1BR2ZFXzNnFc;
 Mon, 28 Aug 2023 14:39:43 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:19 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 28 Aug 2023 14:38:44 +0800
Message-ID: <20230828063845.3142561-12-chengzhihao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH v2 11/12] ubi: fastmap: Add module parameter
	to control reserving filling pool PEBs
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

Adding 6th module parameter in 'mtd=xxx' to control whether or not
reserving PEBs for filling pool/wl_pool.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c | 26 ++++++++++++++++++++++----
 drivers/mtd/ubi/cdev.c  |  3 ++-
 drivers/mtd/ubi/ubi.h   |  2 +-
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 66d7b6a16aad..7d4ff1193db6 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -35,7 +35,7 @@
 #define MTD_PARAM_LEN_MAX 64
 
 /* Maximum number of comma-separated items in the 'mtd=' parameter */
-#define MTD_PARAM_MAX_COUNT 5
+#define MTD_PARAM_MAX_COUNT 6
 
 /* Maximum value for the number of bad PEBs per 1024 PEBs */
 #define MAX_MTD_UBI_BEB_LIMIT 768
@@ -54,6 +54,7 @@
  * @vid_hdr_offs: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEBs per 1024 PEBs
  * @enable_fm: enable fastmap when value is non-zero
+ * @need_resv_pool: reserve pool->max_size pebs when value is none-zero
  */
 struct mtd_dev_param {
 	char name[MTD_PARAM_LEN_MAX];
@@ -61,6 +62,7 @@ struct mtd_dev_param {
 	int vid_hdr_offs;
 	int max_beb_per1024;
 	int enable_fm;
+	int need_resv_pool;
 };
 
 /* Numbers of elements set in the @mtd_dev_param array */
@@ -825,6 +827,7 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @vid_hdr_offset: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  * @disable_fm: whether disable fastmap
+ * @need_resv_pool: whether reserve pebs to fill fm_pool
  *
  * This function attaches MTD device @mtd_dev to UBI and assign @ubi_num number
  * to the newly created UBI device, unless @ubi_num is %UBI_DEV_NUM_AUTO, in
@@ -840,7 +843,8 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @ubi_devices_mutex.
  */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
-		       int vid_hdr_offset, int max_beb_per1024, bool disable_fm)
+		       int vid_hdr_offset, int max_beb_per1024, bool disable_fm,
+		       bool need_resv_pool)
 {
 	struct ubi_device *ubi;
 	int i, err;
@@ -951,7 +955,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		UBI_FM_MIN_POOL_SIZE);
 
 	ubi->fm_wl_pool.max_size = ubi->fm_pool.max_size / 2;
-	ubi->fm_pool_rsv_cnt = ubi->fm_pool.max_size;
+	ubi->fm_pool_rsv_cnt = need_resv_pool ? ubi->fm_pool.max_size : 0;
 	ubi->fm_disabled = (!fm_autoconvert || disable_fm) ? 1 : 0;
 	if (fm_debug)
 		ubi_enable_dbg_chk_fastmap(ubi);
@@ -1274,7 +1278,8 @@ static int __init ubi_init(void)
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, p->ubi_num,
 					 p->vid_hdr_offs, p->max_beb_per1024,
-					 p->enable_fm == 0);
+					 p->enable_fm == 0,
+					 p->need_resv_pool != 0);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			pr_err("UBI error: cannot attach mtd%d\n",
@@ -1483,6 +1488,18 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 	} else
 		p->enable_fm = 0;
 
+	token = tokens[5];
+	if (token) {
+		int err = kstrtoint(token, 10, &p->need_resv_pool);
+
+		if (err) {
+			pr_err("UBI error: bad value for need_resv_pool parameter: %s\n",
+				token);
+			return -EINVAL;
+		}
+	} else
+		p->need_resv_pool = 0;
+
 	mtd_devs += 1;
 	return 0;
 }
@@ -1496,6 +1513,7 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
 		      __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0)\n"
 		      "Optional \"ubi_num\" parameter specifies UBI device number which have to be assigned to the newly created UBI device (assigned automatically by default)\n"
 		      "Optional \"enable_fm\" parameter determines whether to enable fastmap during attach. If the value is non-zero, fastmap is enabled. Default value is 0.\n"
+		      "Optional \"need_resv_pool\" parameter determines whether to reserve pool->max_size pebs during attach. If the value is non-zero, peb reservation is enabled. Default value is 0.\n"
 		      "\n"
 		      "Example 1: mtd=/dev/mtd0 - attach MTD device /dev/mtd0.\n"
 		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device with name \"content\" using VID header offset 1984, and MTD device number 4 with default VID header offset.\n"
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f43430b9c1e6..98aa00344b29 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1041,7 +1041,8 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		 */
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
-					 req.max_beb_per1024, !!req.disable_fm);
+					 req.max_beb_per1024, !!req.disable_fm,
+					 false);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 6e20a0fee72f..a5ec566df0d7 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -944,7 +944,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 /* build.c */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		       int vid_hdr_offset, int max_beb_per1024,
-		       bool disable_fm);
+		       bool disable_fm, bool need_resv_pool);
 int ubi_detach_mtd_dev(int ubi_num, int anyway);
 struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
