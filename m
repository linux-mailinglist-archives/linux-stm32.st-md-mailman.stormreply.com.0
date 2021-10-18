Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBB430F7D
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 07:05:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B874C5C848;
	Mon, 18 Oct 2021 05:05:23 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0E2CC5C845
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 05:05:21 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id ls18so11371283pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 22:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/KgrHMBG00+hza4vEi3Sk5N+IhB5EN8dqeg+sPQiG6I=;
 b=pzPqaClK6ufzAvRjvqqGVvNodlH+jFduWTq3rrLMyo1Yfv9N+HKZnyTtipSk7tEnu7
 7p/L4vQDzml6066nVC1pkb2uKk+317ERWxHfeVRE3DYWOeM7NlbcQAp0HI9WsgL0x8JK
 eMJ5taQ82xnJsE/jVfvyazB4R8Fjuo88XvQNExTyh8GynNjUtXkX/805ZTPrbjwvltTB
 upDOsxhJQ/SjMKt0eX/sPtR5hNH5XL78mxVAHRYKFgBsEx8IaMTPVVl9HFmsPpkdXwlA
 q2xFIvP0gLA3tr8fGGL4H6ZnhzRQJ/ggz1K3ESxP2nPaHCiZiVXhIx52nkRnmc8nBg7D
 9TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/KgrHMBG00+hza4vEi3Sk5N+IhB5EN8dqeg+sPQiG6I=;
 b=NMKyXnSEUatY9IBUCJ8rDuWEU/pQClMZv/hdAmwwJ4SaJplr4yJihAkDnxggW1x5Cn
 NdSth5mwAt4TQ1hE3yo6CW8NqmUyOsfPQcFkUtVmleV8RyG3JMGKct9/oODdp1vuLVIf
 EmrOR7nk9FNhyxcj3JN9tpsvb58hpE79DFlT5Yi9nK9dppaA2x4qUpJWHtMkrb5rOtp4
 bE9iwwXjxgOayW5ezKg/htRTjLsV+Pe+I9xmRo79s+uiqFX1q44TN8EF+smu1Fq8WXGN
 txCKD1mCNaUbG5M2MOyxiF5mroktmwpSSUN4Fjgilt9BqDEz3XXn1EthbkaUq+pAs4ng
 LH1Q==
X-Gm-Message-State: AOAM532O2C97GAhBjkuAIuflWmMXkI78OzK9nYbQW/mReVt581gRBqhr
 xE1rc98Oqo0LPNgWNjkNIEs=
X-Google-Smtp-Source: ABdhPJz/mImGiCkwikDmckDe5cBvFzhIYC2QZquvZMhrF13R4qnXEjlRrntbc5i8TeX5qn5A1bcf0A==
X-Received: by 2002:a17:902:e353:b0:13f:3276:a9d8 with SMTP id
 p19-20020a170902e35300b0013f3276a9d8mr25215762plc.81.1634533520585; 
 Sun, 17 Oct 2021 22:05:20 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:05:20 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Mon, 18 Oct 2021 13:04:43 +0800
Message-Id: <1634533488-25334-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 05/10] media: v4l2-mem2mem: add
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
v5: no change.

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
