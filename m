Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF77438A9E3
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 13:06:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 749DCC57B6A;
	Thu, 20 May 2021 11:06:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB68DC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 11:06:01 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 gb21-20020a17090b0615b029015d1a863a91so5250029pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IO9gCXt5G5Vx6kyEErgKK+AsLPPmYTdtrOpDyDyzIfE=;
 b=BaA/UJNpsKEcjBOX6ghvwnyih8vBBnH2fgzDmx2jktPD/xKfrOBuMX+9BdaReBeo6Q
 3+wADgFOpDZJWOrJEb48CvtpVxcxerq3LOb0FiDdcBf3cF0k1z6vKM8KIslBr9ID4yKK
 +bn8BAL2ZC4idEELSHX2vuN+yXYFrK1Q5LCizjsQH4kjb2qak+kSHiK7Lth6cSHQdv+C
 HBYrwmraY/U7jMmtyYX2u+VlDQxHWV+FTDoA+mN/DqwcL5jq3aDGXAFannrTszrSP+M8
 AxxOHC2Ihv4htsbhTHTGe2hGdYcF14tHPHjlvesVoaafhD/T0guBdSlPVgo5V++QD3EY
 7vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IO9gCXt5G5Vx6kyEErgKK+AsLPPmYTdtrOpDyDyzIfE=;
 b=Hef660E9HtRlTtNZw023wAzedyXgVDTRl3U5thSzx3vmFnKRJQzqCdYHW38rIztgz9
 ILxDEYDm40qzHCVwl7EDHn96TCogMrTO7OhF6rZDswwmwH3undLmEWTa9Zj7hRe2S4/6
 SBwYXrv9ndgsnYOozvjA0L6Fe5ZM4A4B3VOa/EsVs3mBIrVNcn1mj88/DYoQEhZah7ZX
 FUOsA699ZuHAYb3FEZSHI8/9UzLAwqFWiaCcRg1sL2YgqTfeDPxDSQveyLWZNSczqvRX
 zAyEcvBHvnadz7kfeFa9VFpGgftGhEy9hzl0RxWWfgmljJYwF8iwFJ08swneJWZ5q2s6
 CUmA==
X-Gm-Message-State: AOAM5311ZWdBkq96+gep4TvMRmre1FeCJzSOKHJE7F0hJJFzhG3h9UBC
 ajPhxjV4PfSl0acJaY2iDfA=
X-Google-Smtp-Source: ABdhPJxD360vWD89Doeb1D5W6uK02Tt1N3UM2GmGK7odaUpIi575QvqaXGc0IElISKF9+cphuXZbRA==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id
 w15-20020a170902a70fb02900ead4a86a84mr5271791plq.42.1621508760307; 
 Thu, 20 May 2021 04:06:00 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 May 2021 04:06:00 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 20 May 2021 19:05:26 +0800
Message-Id: <1621508727-24486-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 6/7] media: v4l2-mem2mem: add
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
 drivers/media/v4l2-core/v4l2-mem2mem.c | 20 ++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e7f4bf5bc8dd..f82a18ecab2f 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -966,6 +966,26 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL(v4l2_m2m_mmap);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
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
index 5a91b548ecc0..91269227c265 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -495,6 +495,10 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct vm_area_struct *vma);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags);
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
