Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93496AED46F
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 08:23:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FD77C3089D;
	Mon, 30 Jun 2025 06:23:48 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A87C2C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jun 2025 00:02:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so171117f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 17:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandelbit.com; s=google; t=1751068954; x=1751673754;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VzxBghiapRo0aX1nK0c+nhbUFh9iAun9Qlu08MsGo1c=;
 b=gnjzvhYdimdd6Dd8rSWepzUQL/J0eizDMgfuaof01/S5lLFAWX0TQKVd7T2/JLxC2q
 MawXY/zF4N6f7uWNBUpVHb8vogyvNol5D07kCjocy+H80UTP+0oCY9DlOX0vw4zjMAXY
 3yf9A/wqEgtqmtgnAddEQF7yMEjZGSOmKSI9Mb0sGCI9I9djmJLbh2bhakyp3Q+QobNf
 9cBtuGiHyxism19Ht4STwv5n2lJCKof8vA1FRHfTuwohW32+ik/5fPxZsYxRus9VV+KC
 Mh+0G/Vm5RL1M4k9sWwnm+DJ3q33LKmmSrPEpTVRvJtIYXqT/TAWp5eiyX6vf5+O77Gf
 bcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751068954; x=1751673754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VzxBghiapRo0aX1nK0c+nhbUFh9iAun9Qlu08MsGo1c=;
 b=QASTLix6CsB9juHOHwU3gqHjQZH6l6jYoo3Z7KpFx1KL7T1xKMPTeTXjkfTKeJvxPM
 cpuOaOLENyHnSlwR9gSgDNy3GTrbv1tO9014AuTlMauUcuRko2Kvk2Ua7ywApC6VCGh3
 WZrYMSwkl1xteSuzp1UkaK+xi5oVNtC3md0PzclIl8uL3cUUnczBG231QQsgvVevNrdA
 MqlDKS9MX+h32krteu+1S2r5VDNNAMblVgT8B/cpeEbQNr73KDQO3w47O1P+5UZ1eitx
 LxkImOGmwzJFQH4EbQmuXosmK/r7cVqHXKKYiYjnwIt8aOFIWUk3lIxPXeGPsJeHb8TY
 VQDw==
X-Gm-Message-State: AOJu0Yy8YA1yLY5gLT7jmW0l8BJPMpetAisV/pG70buzSX5CtcikgNKy
 Vpv3Bs8zRU6N/isL0JRVwjyNShE53nh/maKs+WWxZ7GS8D3w0n8KQW7ZOWk8yxW93OM=
X-Gm-Gg: ASbGncsb+b3QpbJk2HwbSYFUOTrMct0GSZcJ5dxVJ0ZydUBnsRyVNOsFnLpW6LefC/x
 lJFh1hhX4GCrV7Gs/omntHLrcBp1Hkn4FITeW3wLB1FrfYp+kNCc85vgSdegbs45Job4XODuDyf
 nTolxqoPOaVMw96PFtejFkdzjc5Tp7PmAiREEg0EpVcpLkMYd1vroE6IU161z5yGeGinXPsYOJg
 +G14ZoeNY6PKtQBm1n2TY2L+XaKu9EB9olTnyp4u0fz+HMXt3zPsodsfOaNmmnnUujav4dTVRCc
 qbrNelAU2mz6JcS4ZKzoudTiQpbD06sbLFpIbz3o1IWDG2NY1aCoOG/yhlRxR1Q1cKe9wGJ2otr
 GulzR7fKg9JSc
X-Google-Smtp-Source: AGHT+IECU//FZnUMFlsTYIRoyghzMGUC/zod9WnPCi6VKfNKXOA/f3HCNrR2SW3KH5umXabnco5DLg==
X-Received: by 2002:a05:6000:248a:b0:3a4:c9d4:2fb2 with SMTP id
 ffacd0b85a97d-3a8ff149554mr4015024f8f.46.1751068953621; 
 Fri, 27 Jun 2025 17:02:33 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com
 ([2001:67c:2fbc:1:9bca:2bf0:5e15:c50e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453835798acsm91685845e9.10.2025.06.27.17.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 17:02:33 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-spi@vger.kernel.org
Date: Sat, 28 Jun 2025 02:02:27 +0200
Message-ID: <20250628000227.22895-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Jun 2025 06:23:47 +0000
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Antonio Quartulli <antonio@mandelbit.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: fix NULL check on
	pointer-to-pointer variable
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

In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
and rx_mdma_desc are passed as pointer-to-pointer arguments.

The goal is to pass back to the caller the value returned
by dmaengine_prep_slave_sg(), when it is not NULL.

However, the NULL check on the result is erroneously
performed without dereferencing the pointer.

Add the proper dereference operator to both checks.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Addresses-Coverity-ID: 1644715 ("Null pointer dereferences (REVERSE_INULL)")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/spi/spi-stm32.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..e9fa17e52fb0 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1529,7 +1529,7 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 					       DMA_PREP_INTERRUPT);
 	sg_free_table(&dma_sgt);
 
-	if (!rx_dma_desc)
+	if (!*rx_dma_desc)
 		return -EINVAL;
 
 	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
@@ -1563,8 +1563,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 						DMA_PREP_INTERRUPT);
 	sg_free_table(&mdma_sgt);
 
-	if (!rx_mdma_desc) {
-		rx_dma_desc = NULL;
+	if (!*rx_mdma_desc) {
+		*rx_dma_desc = NULL;
 		return -EINVAL;
 	}
 
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
