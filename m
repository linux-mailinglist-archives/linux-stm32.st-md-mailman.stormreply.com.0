Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD74430F7F
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 07:05:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27FA0C5C848;
	Mon, 18 Oct 2021 05:05:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B56BDC5C845
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 05:05:26 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y4so10420389plb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 22:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=29PDo+p3EfHpq27CPeMSdLjX2BQJx7Ug0wrORCRfK58=;
 b=WJYWfuPh+OajY6dsQk2+VLx1e7YWW1RyMbR/5byyZ+B/b5kzYKUECdrcefwao9KBAx
 KTU5w4TA691xtWhZCeKRbQyEn+XrHUqnUmzLnoctTfZOlO5a8A92PXlvR7vq+fw14a9y
 gxHv/j7lePr/OmX2X1OjAyCu2XeYpu8OUEMC3Lv9iou+eAm9Ih1p4a1qtc+7dZTomVQB
 FJdgVUQp8McDmnKY69rW7OKEkq3rT4vyIppfPe9M51VKw8KI9qjC3AER6k821Xsbhwjg
 uWyrn8UPwqDn4Rh5xQQVC3LMz+01O40VUN6sYPEmVUP/A850w4+AF0PWTz39Erz9PeLe
 k0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=29PDo+p3EfHpq27CPeMSdLjX2BQJx7Ug0wrORCRfK58=;
 b=IwdJdCsDczMeAIB7OP6kNCZS3EOSQdwkQAy/aen0tn9eFxbANn9aV7/TyWnRQyCqvu
 Gr9Z3FLgI/9qDTw2j5GuvCwgxdRhVC1PXrlnIUm7hrruPEYkzX/pypxQQLrnsKvnK65S
 x0RBlRQt8mRMEt3+xUsIedyIuRwm0p8r1Fsf23Xr31RWwuPb+VHHzXN+YnfoTZeIg6vG
 47Cw3Hv32Jlov/0FMqjWVuQ8nU+Con3doi5p/SXKtMKXZlDUwZJ85c1cPuSAVnrkarei
 Fi0iWiVrmUwS1LvVJFHziooZqwcr5FuRT9vd56pD76gc9/PTFROGTSwChajYaiJobOGF
 o9+g==
X-Gm-Message-State: AOAM531g0q3GlDA8Loi6nuFVKRpkpnyvqLy7SPcOr0dO0b5DAgwAO2dn
 7Id4BK6k/yW4r+zCjTVOEes=
X-Google-Smtp-Source: ABdhPJzQ00mI5AcAKN07GqU2OI5fsgC7XyeknXIjjUsm/1r60g9CUJFoAmlN+s/52us+I1GjFqtQcA==
X-Received: by 2002:a17:90a:6782:: with SMTP id
 o2mr45230800pjj.165.1634533525461; 
 Sun, 17 Oct 2021 22:05:25 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:05:25 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Mon, 18 Oct 2021 13:04:44 +0800
Message-Id: <1634533488-25334-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 06/10] media: videobuf2: Fix the size
	printk format
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

Since the type of parameter size is unsigned long,
it should printk by %lu, instead of %ld, fix it.

Fixes: 7952be9b6ece ("media: drivers/media/common/videobuf2: rename from videobuf")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b052a4e36961..28b917e03929 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -257,7 +257,7 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
 		ret = vb2_dc_alloc_coherent(buf);
 
 	if (ret) {
-		dev_err(dev, "dma alloc of size %ld failed\n", size);
+		dev_err(dev, "dma alloc of size %lu failed\n", size);
 		kfree(buf);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -298,7 +298,7 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
 
 	vma->vm_ops->open(vma);
 
-	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %ld\n",
+	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %lu\n",
 		 __func__, (unsigned long)buf->dma_addr, vma->vm_start,
 		 buf->size);
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
