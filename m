Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DF6DEBE2
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 08:37:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5723CC65E4F;
	Wed, 12 Apr 2023 06:37:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1A98C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 15:52:54 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id kh6so6681181plb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681228373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/oG+epnuD83PJFUb1t02t41ha4irl9qgnZRV9WS+FJU=;
 b=LsSi16s2QaAhnD5StmBi3qTbTfu6k5otTIp04Kgepy4OBb/g3EV75jjw2fZ4qPtK4J
 6IWcwGzEMkbVCNc4GZJ1Cxn5YbdAChFrvivl1t1n0YwzFBCvTj6DQfh3H3zCElqbbRqG
 yrngWHTv3NUJp9du0NHTNGxPyIxCOTVzfY0PQatHPH2RDfxl24kq2036Du9OU44/6Ia0
 aNGBIFFhfAo1MwMBdlJqTq35nVZIDHE9FLZuZip9A/6Q7urdq9FMRXrsvZpb1+ReO4kO
 vKBQEfLc3aF3btYS4rqRTyBD+dbMdSgx3XG9NLfD7vs5/Q4abLA867CPbVe9wTxOmgxL
 espA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681228373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/oG+epnuD83PJFUb1t02t41ha4irl9qgnZRV9WS+FJU=;
 b=PKUHOAkD7XP0z04c461OhZZfPQ5D/Edh/7YH5Ffud+/PwcUu5W6rVJf8SICF/rhLhV
 XacU4+rneNFtXiqTkWaDvTVTIfs4tKRs4ulO3a7lcCe/cOET/9jBsAtbl8cle/ZTsuLH
 qAMLYOcduwNLHnhgw7yPrXOR8RhKGJl3HSl3nptIW5WntElaZoPwei5A8749sFqxZP3G
 qvZ5b4pPuDcZGaJzYHFaj7IdL3XYmxh+8wbk7hd8U8NSiYj0P1kg+RV8z+X1NIgA/oBE
 8wVOQv1CTfV/rOeOvkIrXQVY07BoVPouKhkt6CNn0/lMv4FrK4e6OYRaLhYvu8i7QE3C
 wj5A==
X-Gm-Message-State: AAQBX9f2BiYFs5DiQALZRZ7kUt88c9cJKTrziHi5qVlcqmBtUb0f5dBt
 znVylrfWQ55EQyhQLwfhnkc=
X-Google-Smtp-Source: AKy350bP4ymDA4siTeWNM3hYExZR4vah/5d51CIzH8d82fybAJuDqzPeiRRg5VWjKUeDoSbGI8uAvA==
X-Received: by 2002:a17:902:f9c5:b0:1a5:f36:ae09 with SMTP id
 kz5-20020a170902f9c500b001a50f36ae09mr12465163plb.7.1681228373132; 
 Tue, 11 Apr 2023 08:52:53 -0700 (PDT)
Received: from arm4c24g.vcn09251619.oraclevcn.com ([144.24.45.176])
 by smtp.gmail.com with ESMTPSA id
 jw23-20020a170903279700b0019e60c645b1sm3940765plb.305.2023.04.11.08.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 08:52:52 -0700 (PDT)
From: Xiaobing Luo <luoxiaobing0926@gmail.com>
To: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Tue, 11 Apr 2023 15:46:34 +0000
Message-Id: <20230411154634.149350-1-luoxiaobing0926@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Apr 2023 06:37:33 +0000
Cc: Xiaobing Luo <luoxiaobing0926@gmail.com>, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ubi: fastmap: Reserve PEBs and init fm_work
	when fastmap is used.
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

Don't reserve the two fastmap PEBs when fastmap is disabled, then we can
use the two PEBs in small ubi device.
And don't init the fm_work when fastmap is disabled.

Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
---
 drivers/mtd/ubi/build.c      | 3 ++-
 drivers/mtd/ubi/fastmap-wl.c | 2 +-
 drivers/mtd/ubi/wl.c         | 6 +++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ad025b2ee417..a98a717b0e66 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1120,7 +1120,8 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 		kthread_stop(ubi->bgt_thread);
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	cancel_work_sync(&ubi->fm_work);
+	if (!ubi->fm_disabled)
+		cancel_work_sync(&ubi->fm_work);
 #endif
 	ubi_debugfs_exit_dev(ubi);
 	uif_close(ubi);
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 863f571f1adb..b3df17a782c7 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -344,7 +344,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 		/* We cannot update the fastmap here because this
 		 * function is called in atomic context.
 		 * Let's fail here and refill/update it as soon as possible. */
-		if (!ubi->fm_work_scheduled) {
+		if (!ubi->fm_work_scheduled && !ubi->fm_disabled) {
 			ubi->fm_work_scheduled = 1;
 			schedule_work(&ubi->fm_work);
 		}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 26a214f016c1..8906db89808f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1908,7 +1908,11 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	ubi_assert(ubi->good_peb_count == found_pebs);
 
 	reserved_pebs = WL_RESERVED_PEBS;
-	ubi_fastmap_init(ubi, &reserved_pebs);
+
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	if (!ubi->fm_disabled)
+		ubi_fastmap_init(ubi, &reserved_pebs);
+#endif
 
 	if (ubi->avail_pebs < reserved_pebs) {
 		ubi_err(ubi, "no enough physical eraseblocks (%d, need %d)",
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
