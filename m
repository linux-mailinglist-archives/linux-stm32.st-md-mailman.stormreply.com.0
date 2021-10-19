Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91143315A
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 10:44:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35261C5C84D;
	Tue, 19 Oct 2021 08:44:01 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32193C5C84B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:44:00 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id m26so17027965pff.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bzatNTKpIv4BlIffEmGaVOIbeC0H54OClaqsGTk2+Zw=;
 b=qk7Y6aaMUw7p1AOJxfTf2XvqG/q3sA/j53YkVdm8QLrdckbgaUezhy/mMlukXg90zo
 MZV5oN4Aaxku9fKZllIPnAuQ6NNK405v/+g/WgeZxy+chQlTrKLjwhulejmmdmRlIR7K
 2hJEF85Zno0QNPzYP8m02Q1tuQlVtxAtw4hH/t9FE2/TbPftRREs41NVFkfbEE9CxSGf
 dEHCi8BNUNF1ahlouuwBqL6YnmYOEPuZCBvB7HI9U/ZiRMUWdaLw5Eu2Go9GUrnSzIvR
 fiJn1CwBWTsflWGR95/gRCKBHKYkQ2c6UOUUg89AlKQR/1tWPlmc2nhxxzsUgjtY3kB8
 nQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bzatNTKpIv4BlIffEmGaVOIbeC0H54OClaqsGTk2+Zw=;
 b=P1/EVYDkloZOTaeFVrAgPbVMqpQOK6ftwwO8ctrZO/cs3cbUJjpQ+hZwP8Wr8Qh5g8
 yQ6NeuXzY6TlEM5HLOtUzFYfRGJPBfM7QkfSz6FSoxWeY+qAuguiD0iR45vLiMzgps1x
 ahh5ysxJsK3eYCwCo20noL9fgBa0VGzyVGSDsiglnwS1rBpe49EP2DKZoKhU4vXjSyqv
 r6IMVClh4X6p/Ge2137Qjyinbiuli+JRoErTiYcz5CpgGagfsRWFGazUPDvFpPnGBDu+
 LtFA9bOiaW4rdAXfrmL8IaeoBnwyujIWufJE6nlxfnVj0UCpIxpus2B5zfPptgHthogr
 Xktw==
X-Gm-Message-State: AOAM530cdl0rz69g8guKuczV9raGvmFlI5onNOgRFUQLSpvxI3Gty++d
 crr+yEqQhDi3KRg/D3Bfh1U=
X-Google-Smtp-Source: ABdhPJz+zYTYXbwfcmo91WNsXUpc7Oih0DAr+aAgVCIyj8vNlImqLPgcmEXprlJD34M6ApWH0IUUCA==
X-Received: by 2002:a63:5b09:: with SMTP id p9mr27544244pgb.321.1634633038976; 
 Tue, 19 Oct 2021 01:43:58 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:43:58 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 19 Oct 2021 16:43:19 +0800
Message-Id: <1634633003-18132-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 06/10] media: videobuf2: Fix the size
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

Since the type of parameter size is unsigned long,
it should printk by %lu, instead of %ld, fix it.

Fixes: 7952be9b6ece ("media: drivers/media/common/videobuf2: rename from videobuf")

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b052a4e36961..7cd6648ccd26 100644
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
@@ -298,9 +298,9 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
 
 	vma->vm_ops->open(vma);
 
-	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %ld\n",
-		__func__, (unsigned long)buf->dma_addr, vma->vm_start,
-		buf->size);
+	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %lu\n",
+		 __func__, (unsigned long)buf->dma_addr, vma->vm_start,
+		 buf->size);
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
