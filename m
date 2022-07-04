Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848A565D94
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 20:46:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC920C640EF;
	Mon,  4 Jul 2022 18:46:05 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48536C640EC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 18:46:04 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 8R57ovKj1E80K8R58oOSoK; Mon, 04 Jul 2022 20:46:03 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 04 Jul 2022 20:46:03 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon,  4 Jul 2022 20:46:00 +0200
Message-Id: <64cde893efca8f4dc381184cd7f6e5a54cd000f9.1656960335.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ubi: fastmap: Use the bitmap API to allocate
	bitmaps
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

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/ubi/fastmap.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 6e95c4b1473e..ca2d9efe62c3 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -20,8 +20,7 @@ static inline unsigned long *init_seen(struct ubi_device *ubi)
 	if (!ubi_dbg_chk_fastmap(ubi))
 		return NULL;
 
-	ret = kcalloc(BITS_TO_LONGS(ubi->peb_count), sizeof(unsigned long),
-		      GFP_KERNEL);
+	ret = bitmap_zalloc(ubi->peb_count, GFP_KERNEL);
 	if (!ret)
 		return ERR_PTR(-ENOMEM);
 
@@ -34,7 +33,7 @@ static inline unsigned long *init_seen(struct ubi_device *ubi)
  */
 static inline void free_seen(unsigned long *seen)
 {
-	kfree(seen);
+	bitmap_free(seen);
 }
 
 /**
@@ -1108,8 +1107,7 @@ int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count)
 	if (!ubi->fast_attach)
 		return 0;
 
-	vol->checkmap = kcalloc(BITS_TO_LONGS(leb_count), sizeof(unsigned long),
-				GFP_KERNEL);
+	vol->checkmap = bitmap_zalloc(leb_count, GFP_KERNEL);
 	if (!vol->checkmap)
 		return -ENOMEM;
 
@@ -1118,7 +1116,7 @@ int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count)
 
 void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol)
 {
-	kfree(vol->checkmap);
+	bitmap_free(vol->checkmap);
 }
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
