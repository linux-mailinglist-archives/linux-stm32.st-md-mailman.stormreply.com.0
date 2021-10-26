Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6256C43ACCD
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 09:11:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A01C5E2A4;
	Tue, 26 Oct 2021 07:11:59 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C78D4C5E2A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:11:57 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 187so13374272pfc.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 00:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YJt0hdV4kzdXc6X1C3SE5PDn2rhPDieOGx+r2tKEjZE=;
 b=HYeqwC260+v7LmqrfNhi8BodcmsCMqshSPxR4nFgNmstTkvQUcDqsmYoDqpRDnhe0P
 N5R0YrW7+b3NDKIWHa43KY1ni03gfzLWU/cTAfs8NVoWpF4D6Al30KM7inCMqDpWPvf0
 DPKX0XEJVC14/ygeP24nTEtaIOBeh8/lM21tGKocXH4AcL97bF/mWquqB80SClSkjoYz
 S0bRkgzsifWRI9BNZ8KSTYLpiRnnmFb9IJz3OxLNxneUQre9GLLxSLXuHX3Dawmq5cuw
 SVSEDZTP//P2wkdNj+EuuRCmQRMINpqX6Kvy9VAXW/4xAyYd7WiAgPq/mPiipksiKYJ5
 AFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YJt0hdV4kzdXc6X1C3SE5PDn2rhPDieOGx+r2tKEjZE=;
 b=6g4sPs0cFH9O8PGCjwqq3V9Gh/WHkwOP1i4l60U1F/f/Bz8zlU1KurdnFGo+DxJavI
 6vL+iG40PqKN/+H+2b8b6+jFndLK9CL+o5Cfpv0u8/YR//Wsq4yLD+I1FBNMp+J4Ftgv
 xtqzSdL+JvytXwXr0ZyDuDGXmWoTlg/JqdksMFyInEsH+8JyROgXW8jFrNgMO6dvB/AD
 Lowixgqg9J3g2OVpcoZZqrvRHVjf+TBbd0yjurpt2XLheouXRd9SVZl22sBRdYrmLnm6
 YN4mD1G6rtcymgD1qUYYJOC8rAWXCOrQvwaYAVmkBmmMCr5/zXTH4uU7nui/WQaYwj6i
 jXZQ==
X-Gm-Message-State: AOAM530vfZ1LiPuU5h3g/fwHWPFoaLgbsIltWEUTgxEvtrFooRk49iOZ
 HhQFjO+A+UNdzPeim99qXlo=
X-Google-Smtp-Source: ABdhPJyKVKyyzYptJNlN1szbfFlQqhI4CiYZWnN19Y5i6NZft9uz62l9xG7RV3OpWbGicirrwFhc4w==
X-Received: by 2002:a05:6a00:c8a:b0:47b:ff6e:4cf3 with SMTP id
 a10-20020a056a000c8a00b0047bff6e4cf3mr7880068pfv.50.1635232316568; 
 Tue, 26 Oct 2021 00:11:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:11:56 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 26 Oct 2021 15:11:17 +0800
Message-Id: <1635232282-3992-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 05/10] media: v4l2-mem2mem: add
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

For platforms without MMU the m2m provides a helper method
v4l2_m2m_get_unmapped_area(), The mmap() routines will call
this to get a proposed address for the mapping.

More detailed information about get_unmapped_area can be found in
Documentation/nommu-mmap.txt

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
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
