Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5E43ACD6
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 09:12:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A39AC5E2A4;
	Tue, 26 Oct 2021 07:12:04 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E5DDC5E2A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:12:03 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id q187so13261985pgq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dxEoE3z3QyUF2/I3A7I9pyjQJbuepmY3kvNx8IZRwGg=;
 b=CmYoQgZTvVIPPzJ6zq3Z+6T3ttzskepfKoJmie5YHSHo1EIgCPN5WWc5Pe7SrNvjZh
 pL9L6hwzUHWtejlW1+Hw3S5hRq7inotQQhYo8Wl9X7OohBCSyD4/LLTN6QXT6jfiuq5E
 HoF6Iba+nHlEfh66Vo9yclfH0A3zvaCylQaAWnfS1LfeHf9SI2qEqRXB+ZM9WrmasQsz
 ryE5SYt4b6hLc8l2OIpRlZ6Yc/nwGQs8RDhlH2orO7MrHV/bXKCSKNoAbgQPBDr+AbUQ
 +SuVQdeW0ghsbt6Y6Ih9mN9S3ozEgS4NIUb+q570VtrqndR2Rg/Gkfr95KCaDHQA9rx0
 cy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dxEoE3z3QyUF2/I3A7I9pyjQJbuepmY3kvNx8IZRwGg=;
 b=Yz6pWvOemy6m4/j7ajNMVsNDecLn5Uv4S4rtWah43h68SgLH4xQTdFA9zThuVECULZ
 hhZrtXh2/L/yaxxr/DYHaQ17q8xN90EQUgzy0oRA6bccY4lUgeKsOslNJ77I5yhuZXlp
 P/ZhKwVYkT+IXRz/v+x8FAfNnK5Mugn4KJCjm7mCZ6E5Tv04hi8tR4wqaOA2kixCeh88
 BFyM6fdw2ctafgoqKdoqKbTIM81JE/QsLZPBf/W1xTVDlx09Hyuwj/YN/0/9UGmVlx/j
 cT1TeMta4n29cR3Ur89y91H3QOhuta0la71abDyRgIlebtpRQJHVeTYGfpOdC8bvxdog
 +FaQ==
X-Gm-Message-State: AOAM531RwCzVTmZVwwHdoUg1YiScugu7b0L3nOpszs8xzac7g19SvRIf
 5iczXGHuTYwMgJzczA+h8GE=
X-Google-Smtp-Source: ABdhPJxl+nO2g7yQI971iTkXUajKfvqScKWHJ40sy8+37DVb/q4vd7Ytk8NPpyCTRi+OClxNXDttXA==
X-Received: by 2002:aa7:914f:0:b0:44d:6f5e:f11a with SMTP id
 15-20020aa7914f000000b0044d6f5ef11amr23157212pfi.10.1635232321984; 
 Tue, 26 Oct 2021 00:12:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:12:01 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 26 Oct 2021 15:11:18 +0800
Message-Id: <1635232282-3992-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 06/10] media: videobuf2: Fix the size
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
