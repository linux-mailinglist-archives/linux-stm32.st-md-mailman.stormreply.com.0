Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3067A5EB905
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 05:58:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0BC9C63325;
	Tue, 27 Sep 2022 03:58:12 +0000 (UTC)
Received: from out199-12.us.a.mail.aliyun.com (out199-12.us.a.mail.aliyun.com
 [47.90.199.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AB53C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 03:58:10 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R971e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VQq8mOj_1664251084; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VQq8mOj_1664251084) by smtp.aliyun-inc.com;
 Tue, 27 Sep 2022 11:58:07 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: richard@nod.at
Date: Tue, 27 Sep 2022 11:57:58 +0800
Message-Id: <20220927035758.46804-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, vigneshr@ti.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, mcoquelin.stm32@gmail.com,
 miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] UBI: Fastmap: Fix kernel-doc
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

drivers/mtd/ubi/fastmap.c:104: warning: expecting prototype for new_fm_vhdr(). Prototype was for new_fm_vbuf() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2289
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ca2d9efe62c3..28c8151a0725 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -93,7 +93,7 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi)
 
 
 /**
- * new_fm_vhdr - allocate a new volume header for fastmap usage.
+ * new_fm_vbuf() - allocate a new volume header for fastmap usage.
  * @ubi: UBI device description object
  * @vol_id: the VID of the new header
  *
-- 
2.20.1.7.g153144c

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
