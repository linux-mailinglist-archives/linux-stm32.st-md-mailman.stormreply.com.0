Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9074267CC
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:30:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A77CDC597B4;
	Fri,  8 Oct 2021 10:30:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E083EC597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:30:25 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id o133so1578602pfg.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=W+wytSR0PH1/4yPeQFTyssJnKJVMVbzdE/AdZsuZR3M=;
 b=KKziDLqrhKOFfLQbFvNcL9pI7NP89A/Rg3PKEisfhdx77MZkiANWMElHnq4xeUDhAO
 60w5IYFSHB3z1WnhUspXC6SLC6k/hmEQ3DBoKDZSh6hU+at8m94cItQqiSLOjniZ3z+X
 3MUL1zdBxEXoe0aD0oSZRyEEAWo91SxFCkA1WPXrjS/tZr2GCgBRalYmvTRd3yFCEBin
 5N7Ur+p8Am3NBP03tfBhBODIgRZfFpWBjUARYOLL2CjRAWqmdWYUdSGwrwWUVOlgiuTO
 NupTrhvQWiz+MipodDoQBeBd/ngNhCVTS27YKOW6ZQPciuCm9mVX5usRerLjJgYZp+Ct
 aj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=W+wytSR0PH1/4yPeQFTyssJnKJVMVbzdE/AdZsuZR3M=;
 b=gUYQP+0cGcNH+zvNoaaRp+147lCYI6uP7y0ZEQYIbrmc8ECvue2vf/IbooDjz20QhA
 pDjeFv+2ynW5JtSxAC1DyTI6NnhtKw3iNfUIMlHjLATOoic30Ec0zYdC5TdTUaWKs2Gd
 oCRME/RVvwfW5oQDHlgq4miPbIP0V4rTJ/P4ex2Dwdy8GZSXGvCfcNFVsTsOtVfF0wBj
 5CcOeCpnTbunLKkM0AGFCrq9++jT0gEFBo8xqme2PBI/crm04b3bxWvkTT+KioSKgMaV
 APKPvc4ZDT4BpmUy0FWN0wEep7Yo/wGJPLMu1kdhWBq64QwRdcYRgHcw6O9jjpAdgvXo
 VAoQ==
X-Gm-Message-State: AOAM531waB1P/K06Ww7i8Uq9J9RdKKFtTgZb7PMe3hhK2iU/bTWwIuxm
 Rzh9Zz09l8/845s6Yg4Pubo=
X-Google-Smtp-Source: ABdhPJwVQg2QQsEuWmOcgcJ6zhRhQqkDeqWGYlPofw6AkJEjdDvpsDCJ1+xkzFMAlfA+LFOArVDw8Q==
X-Received: by 2002:aa7:9203:0:b0:44c:aa4f:5496 with SMTP id
 3-20020aa79203000000b0044caa4f5496mr9535011pfo.60.1633689024589; 
 Fri, 08 Oct 2021 03:30:24 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:30:24 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Fri,  8 Oct 2021 18:30:05 +0800
Message-Id: <1633689012-14492-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 1/8] media: admin-guide: add stm32-dma2d
	description
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

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v3: no change

 Documentation/admin-guide/media/platform-cardlist.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
index 261e7772eb3e..ac73c4166d1e 100644
--- a/Documentation/admin-guide/media/platform-cardlist.rst
+++ b/Documentation/admin-guide/media/platform-cardlist.rst
@@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
 sh_veu             SuperH VEU mem2mem video processing
 sh_vou             SuperH VOU video output
 stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
+stm32-dma2d        STM32 Chrom-Art Accelerator Unit
 sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
 sun6i-csi          Allwinner V3s Camera Sensor Interface
 sun8i-di           Allwinner Deinterlace
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
