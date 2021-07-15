Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F13C9B88
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3654CC597B1;
	Thu, 15 Jul 2021 09:25:50 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C857C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:25:48 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id j9so4623798pfc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m/Lq62zQC/ZLuIP1g6AP3azBlb4BnAyoWJG0y535CEU=;
 b=vB8qWgvszPrVov8dYj++hZ2fJhc4aqqN0FIeK3DUvRUtROJ3VgqvE830dgeKBC0Bwu
 TSrgVf2w77p69NsuDjWaxXZnlHaB4yRny1PKlaCDJ+n85Rt5z70tSE81AMV6eevARIF8
 KQ1h6l89bZKSUOE+wPcZB58SVikjE6qMOWba57l9uzPBKQyFs57IXnhCa8klKFfrxK5z
 yP7rDmjMwp+1vmk3PG4n6H5nHnUX0t5L1fLfBnA6TVGD3vOa/Djr567QLl8paFbM+iqW
 DMwMXQDTHTs1kGsg0woaBR3q0xUwA/j91oayQDrrBaojJ7NzYI6cM7h/730Yjc+59kww
 P6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m/Lq62zQC/ZLuIP1g6AP3azBlb4BnAyoWJG0y535CEU=;
 b=sSb3zhTcoZlkLo6kuV5vIemGueXIcRA//IcSWwKZN5J4AqG2UYl4vo+jmyyqv9LZjd
 ItjbcHdiZFLY+1ZslZ1i/tIKKbig+sVH6fyzPVtAL4GqOibx3BHig8nYfdqBr0KWyphY
 q8mcO2+FpXoAgS6qblMgnlPfyCz4r691GX2G4yBSqgkGnq3bvEi23ydckUtUd4G1vea1
 jDRwBBO0ZGiJSDIblah8iCzYVuRPJx0ym7gTVOXb81ni4iEAXqZdqdElYW7fOu1LGzp7
 vHDAI8i/s3QUUrUig/mzxhmf55eVQlevjFuWfXq4syzCz4SoccGXOh8VAEdkjuKxheIi
 z/zQ==
X-Gm-Message-State: AOAM5305TECoyCQEX1uNkOMoWCyGwOOhRJ5IlwBN5itdCLWYowCzhsXt
 /IcUsMDTJBbPX0DgRIFnTco=
X-Google-Smtp-Source: ABdhPJzu45VGLxWM4fORPzTRwfpeV4fv13X1p6VBNpeHKocOwsluXxeGLD4lvtI1wJvBI6bZNohAPg==
X-Received: by 2002:a05:6a00:158e:b029:32b:9de5:a198 with SMTP id
 u14-20020a056a00158eb029032b9de5a198mr3741860pfk.3.1626341146759; 
 Thu, 15 Jul 2021 02:25:46 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:25:46 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:25 +0800
Message-Id: <1626341068-20253-17-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 6/9] media: v4l2-mem2mem: add
	v4l2_m2m_get_unmapped_area for no-mmu platform
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Dillon Min <dillon.minfei@gmail.com>

For platforms without MMU the m2m provides a helper method
v4l2_m2m_get_unmapped_area(), The mmap() routines will call
this to get a proposed address for the mapping.

More detailed information about get_unmapped_area can be found in
Documentation/nommu-mmap.txt

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: fix the warrnings from checkpatch.pl --strict, thanks Hans

 drivers/media/v4l2-core/v4l2-mem2mem.c | 21 +++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e7f4bf5bc8dd..e2654b422334 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -966,6 +966,27 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL(v4l2_m2m_mmap);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+					 unsigned long len, unsigned long pgoff,
+					 unsigned long flags)
+{
+	struct v4l2_fh *fh = file->private_data;
+	unsigned long offset = pgoff << PAGE_SHIFT;
+	struct vb2_queue *vq;
+
+	if (offset < DST_QUEUE_OFF_BASE) {
+		vq = v4l2_m2m_get_src_vq(fh->m2m_ctx);
+	} else {
+		vq = v4l2_m2m_get_dst_vq(fh->m2m_ctx);
+		pgoff -= (DST_QUEUE_OFF_BASE >> PAGE_SHIFT);
+	}
+
+	return vb2_get_unmapped_area(vq, addr, len, pgoff, flags);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_get_unmapped_area);
+#endif
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 void v4l2_m2m_unregister_media_controller(struct v4l2_m2m_dev *m2m_dev)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 5a91b548ecc0..fdbd5257e020 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -495,6 +495,11 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct vm_area_struct *vma);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+					 unsigned long len, unsigned long pgoff,
+					 unsigned long flags);
+#endif
 /**
  * v4l2_m2m_init() - initialize per-driver m2m data
  *
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
