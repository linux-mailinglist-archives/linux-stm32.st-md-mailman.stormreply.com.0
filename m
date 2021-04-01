Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE135268C
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Apr 2021 08:21:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38672C57B79;
	Fri,  2 Apr 2021 06:21:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A268C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 15:44:24 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso1226824pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Apr 2021 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L7OE5i32xqp2hZR46nimIfKkiwZGHT1inF3gekHLXDk=;
 b=SpKmHRTJB0YwvLzZBV4ng2u4aIRSqa4wlNadMwbL7IhXlN+i18QZ6diB1fjjiHOceW
 aIpzOwMcBjM5ES/kjU6jx5jzDma2XZ3BVs9TSzmATxp+EMBXftIalt3Gvc8WAVinFobE
 iStmjpV2+nN4Lu4MLIXbzcBwwFXxP7U8vc2GHguS4sXg9h8sQC9/mOTy1NrJ+/jLesqn
 qr1bUm611OxLeYRYQT0F+tWy+ApLN13ULwVcWLmF2rWWKY9hXdlwz0bVDXBE6AVyQkGk
 jtqQZc1KQXss738+jFsKYQv4DX43l2QEGLYMCrmlkJ8jbQhmyPHkqXD3mPATz/WOQvAh
 FE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L7OE5i32xqp2hZR46nimIfKkiwZGHT1inF3gekHLXDk=;
 b=Df2bEdUC2nFhexniFSikbvzmRBSYxQbeWo6JTV7LMfNBKRUHSV3TuRCeSXl6MaCYlQ
 QOa+Eiyw4t2rrVBsRcH0XFzRLvCzmBGm+l/mKquRILdEFfiyQXq4LTmAVmw3RNry4sae
 CPov8LB9F0hah3VO3+MpYqHrCraqXvB7k8dA8nqFfZMRcmrgEmz/DJmhMhJiV66sGv0l
 eOxr46JC0a63o2m3tkvWKN/Ewsacq/l5RvH0/3ciysUqTMPZfWii+6HckK6YhkuXY9Oj
 04WScV/gTrcSRKOrQQam3aVBaeiCI4GMR73jfgbVHs+Ei8B6lNJm4+xRSipflFdyzs5g
 DC/g==
X-Gm-Message-State: AOAM531hxf1MXPawAi/2H7kz4w58jpAKjFoLezql03HjtiRpjUx4nMaz
 VAcYOU/wkAMa7qkydVoA/9I=
X-Google-Smtp-Source: ABdhPJyhownPWGsKaGGfB9TosD1NuukP+16rbvj9ZGpkWFPybd+q/Fjmx9cmapGv3WhXWBtPuZJIig==
X-Received: by 2002:a17:90a:bb02:: with SMTP id
 u2mr9676740pjr.175.1617291863249; 
 Thu, 01 Apr 2021 08:44:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6307:8389:a773:d07f:cd55:994a])
 by smtp.googlemail.com with ESMTPSA id i8sm5957174pjl.32.2021.04.01.08.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:44:22 -0700 (PDT)
From: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Mugilraj Dhavachelvan <dmugil2000@gmail.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  1 Apr 2021 21:13:43 +0530
Message-Id: <20210401154343.41527-1-dmugil2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Apr 2021 06:21:05 +0000
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: drop __func__ while
	using Dynamic debug
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

dropped __func__ while using dev_dbg() and pr_debug()

Signed-off-by: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 76a60d93fe23..95ec5f3c3126 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -198,7 +198,7 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
 	unsigned int p = fl->ford;	/* filter order (ford) */
 	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fast];
 
-	pr_debug("%s: Requested oversampling: %d\n",  __func__, oversamp);
+	pr_debug("Requested oversampling: %d\n", oversamp);
 	/*
 	 * This function tries to compute filter oversampling and integrator
 	 * oversampling, base on oversampling ratio requested by user.
@@ -294,8 +294,8 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
 				}
 				flo->max = (s32)max;
 
-				pr_debug("%s: fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
-					 __func__, fast, flo->fosr, flo->iosr,
+				pr_debug("fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
+					 fast, flo->fosr, flo->iosr,
 					 flo->res, bits, flo->rshift,
 					 flo->lshift);
 			}
@@ -858,7 +858,7 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
 	 * support in IIO.
 	 */
 
-	dev_dbg(&indio_dev->dev, "%s: pos = %d, available = %d\n", __func__,
+	dev_dbg(&indio_dev->dev, "pos = %d, available = %d\n",
 		adc->bufi, available);
 	old_pos = adc->bufi;
 
@@ -912,7 +912,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev *indio_dev)
 	if (!adc->dma_chan)
 		return -EINVAL;
 
-	dev_dbg(&indio_dev->dev, "%s size=%d watermark=%d\n", __func__,
+	dev_dbg(&indio_dev->dev, "size=%d watermark=%d\n",
 		adc->buf_sz, adc->buf_sz / 2);
 
 	if (adc->nconv == 1 && !indio_dev->trig)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
