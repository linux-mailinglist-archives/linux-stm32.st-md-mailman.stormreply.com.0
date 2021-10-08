Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC8F4267E0
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:30:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1071FC597B4;
	Fri,  8 Oct 2021 10:30:48 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFDD4C597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:30:45 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 66so2672468pgc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pBo7c2kFajdI9Nm9R8mqavk8f116rJWLIMcenVbgOoU=;
 b=dpYpA9cP2bfPz+SB/WK+hbllZ/75GiCSKdCi/bE4MAf8QAmFtCc1ur5vuI7dZ1kBSS
 HzXdkMk7s+IU+++wyzGgdaeiUkiYlY1FHaUY1cnGe5dKZp6EVQ2IahKwHmLJ1+SuWYfg
 +dwVf77ehnLL2tUwLNr4xaIE/QRB3qSNVhKlmfqrtY06APv597hoZ+TeuEuPY9fmWBLP
 PfI9tmxhILneqON5iqlV4E2LJDAUimJrw6rpIMUwsPiY0IE67tO4ONlgwmyDWryV7pgB
 ntcjbr4ouwxuRB4KHqod0v1XMHWQDTmYO08f+io6mtzgkDxig4M7yJ3BVO0kgEuQjzUt
 sUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pBo7c2kFajdI9Nm9R8mqavk8f116rJWLIMcenVbgOoU=;
 b=p4ud+BMmC/5ETxr9mo9P0ChtbH+mX1BUXKGv8WVZGTAKxWU2Tvb/fKxGknsXb+if1E
 GJ04mWyuhmiEclTIoL2kFhicgUsF9leiyFcXix4392+hRa/ZytZyDb56LvFBxSLAVJle
 h9Y9OIbtG1kkJrhE6jImw4pyjVcIt9bjG5wu5XA0hb/cr+pux5ZVDjenrmQmeMbVFUvn
 urBcsgiVVZS5DICgQbg+UcQsBMHaiLA6uTMpNG7sa0HpK4HpXvgOdVQe+aReSZI+lJgh
 davNwN2IEh1q65zIQK541nfDE9+WzxbWNMCPmw/nZ3n1e/svIxec1zVpMqT/8NqeeAQD
 mbbQ==
X-Gm-Message-State: AOAM5323GFGEycHIIN1xKEq7WqRnp5gcKaG7SKmFXx/l02oDxmbSCFlO
 /SAWVkl9zhiSug6fwLvvkXg=
X-Google-Smtp-Source: ABdhPJwcFNrmkRIVRazfMBFzkiEOQKiy2lgPhhAug1+muumDWMyF8dSTFyO3FUgWuKJzPzQtbkrhIA==
X-Received: by 2002:a63:1d10:: with SMTP id d16mr3920017pgd.13.1633689044630; 
 Fri, 08 Oct 2021 03:30:44 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:30:44 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Fri,  8 Oct 2021 18:30:09 +0800
Message-Id: <1633689012-14492-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 5/8] media: v4l2-mem2mem: add
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
v3: no change

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
