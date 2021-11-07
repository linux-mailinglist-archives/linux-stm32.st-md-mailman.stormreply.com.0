Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A6447358
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Nov 2021 15:41:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5BB7C5A4F8;
	Sun,  7 Nov 2021 14:41:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EE4FC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Nov 2021 14:41:52 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id o14so14127206plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Nov 2021 06:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrbpIa2R21nt9CsUHSpqQAdzhw13K5VFRKU4lZDfbyE=;
 b=oKZrRbI/SUBOu+OiClukmnFZpxRlDN5huFzwvEf0bjZHQXroydaB+/X+a5nqBSumpa
 QjvWhZcmGRxSPzGPu0Ud/9dC/CsqWtAVzi20+5ll6JN6NXddd7lsiRE+QSY4PjbeECeC
 fTAW6sBa/+2ToFws1NBC/2iNVYmFLQs7aS9+Y3eXcER4QXUqMkGcJfkT2/ndZ3Of6Fdf
 NCkfSZ8vcslGJXvEeg5z8Gzr6EnQTJxleM3PbU8uBf+tPO4xxveSTgj7GBkKfSIgNOkz
 cFkFNYMUSonssfnZ1sgVsNUTXEn5Q+9J/Ddl+CyMRD04yJ+Q2ujrbYIuoElPoP33jqxJ
 NFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrbpIa2R21nt9CsUHSpqQAdzhw13K5VFRKU4lZDfbyE=;
 b=S+7AKm85+CIfI3EDKX0k2W3bYzZR7UcagvjhAGwLJMV7/xNEuHJ/a2xezBIAipFfOO
 Bsf3Q59E40KM7CcuM4KXxTfHF+QLtco3yHtrg1Ju15qvGrHJLS1S2RLkYKxD6xLSDPzQ
 Q+5CYlV1cTErVBItqKf+Ws5G+PBmNYGuKgPsXLPS/TPcLlAwuDpjCbIDSMm36zLhvCAh
 dSibmxkc3j69oVm0129sMNyyruqJmt+LCYAGzfKwV6GM7SVhF0qFPSHKh8X6rrDBT0uf
 77yPlj3+1OcjiIB+WalhR8XA5c9U4gYz+6/yJP97zHdabb3yAom334hQNd/oNWj47qdv
 am2w==
X-Gm-Message-State: AOAM531ZWSiFZ9WoTC3kbMIAyc5lBowgxb1KQu24wnalT1LHhifboA1s
 XmFmd9KiCusrsqkh8ceujNY=
X-Google-Smtp-Source: ABdhPJwABYLHqc1afqQP1rkSVQdMHlYkszHG+qtGeTZkZ5Q0jtHqy+7ZaUghWKrcUz5kv9MEl+UQEQ==
X-Received: by 2002:a17:903:2445:b0:142:830:ea8e with SMTP id
 l5-20020a170903244500b001420830ea8emr37491574pls.54.1636296110594; 
 Sun, 07 Nov 2021 06:41:50 -0800 (PST)
Received: from localhost.localdomain ([37.120.154.98])
 by smtp.gmail.com with ESMTPSA id c6sm12669781pfd.114.2021.11.07.06.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 06:41:50 -0800 (PST)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Date: Sun,  7 Nov 2021 22:41:44 +0800
Message-Id: <20211107144144.482969-1-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: stm32-dma2d: fix compile errors when
	W=1
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

remove unused functions to avoid compile errors when W=1.

>> drivers/media/platform/stm32/dma2d/dma2d-hw.c:29:20:
	error: unused function 'reg_set' [-Werror,-Wunused-function]
	static inline void reg_set(void __iomem *base, u32 reg, u32 mask)

>> drivers/media/platform/stm32/dma2d/dma2d-hw.c:34:20:
	error: unused function 'reg_clear' [-Werror,-Wunused-function]
	static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)

Fixes: bdbbd511ef0c ("media: stm32-dma2d: STM32 DMA2D driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/platform/stm32/dma2d/dma2d-hw.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/platform/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
index 8c1c664ab13b..ea4cc84d8a39 100644
--- a/drivers/media/platform/stm32/dma2d/dma2d-hw.c
+++ b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
@@ -26,16 +26,6 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
 	writel_relaxed(val, base + reg);
 }
 
-static inline void reg_set(void __iomem *base, u32 reg, u32 mask)
-{
-	reg_write(base, reg, reg_read(base, reg) | mask);
-}
-
-static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)
-{
-	reg_write(base, reg, reg_read(base, reg) & ~mask);
-}
-
 static inline void reg_update_bits(void __iomem *base, u32 reg, u32 mask,
 				   u32 val)
 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
