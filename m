Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF57B12C6
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 08:25:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D49B3C6B476;
	Thu, 28 Sep 2023 06:25:11 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11D1DC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 18:47:05 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-77574dec71bso121560385a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1695840423; x=1696445223;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xGsoS6S76d+wc39dHVr5d6LqZuXhI4/2gCLnqm1TcHs=;
 b=sfHCZqGhm2Jhs7IikrlBhUpq71J4pVPmEkiGvdZpQskIOb+z9aZeUsg82+rUa6Iw0R
 DJEJaC5Q+47jFjqkaPH/thkCjMaa/Y6CU3189ILKOpBdG7X6q+hWwSr44mbEUEZCEKJE
 w2SP2kV3+y7RcK8xtFA42tVvSchhNSLkPfpTHnKXIBFrjHkgcpuXkTylChDGXYcsrmsE
 ayroRKQXadNd3Q+a4Col/jtSiQXm6JdcN/RDveXMDq6TSkppXHXNiDWZzos4MxRh9GFh
 9vnw/VwMjxwh+sfZD7c6BqAaaiSt3/pT/UGdBNLgWl/RmQY0WjWjo3m5CEftMD3D33Ko
 E+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695840423; x=1696445223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGsoS6S76d+wc39dHVr5d6LqZuXhI4/2gCLnqm1TcHs=;
 b=absftDwww+90MMF4DZmfhrBbQAa2LekU/Sjlc72i2YmzSIuCiutY1baokFQjaZ+6py
 DtLNgVxetGqFXcKWFu7fu6FcPXfn8qRxEGuXP3iMFARHC3cmTf8jbYq3xlvYfVHuB5Fd
 S2Ng6Q7WFNx13dU+AoZemmkgtixlIQKs670LkizUIoNhlkupqOeeElyDAqbe1XFw2Agw
 oBLBPxFy4CYJPCTTD3c634KaTdjgYoOd/YWyDurbddyFrxuMPvST9aXz8sKXy/AsAzcD
 tHwPLlXQfihf4g+B3P9BekziQARW+xoBUbhvkb3ZkjfsoITlvYeHp31icr5SVAtOQd8R
 ItAQ==
X-Gm-Message-State: AOJu0YyxOubLoPfR4Jn/a2htYyOaLw4fPXps5V3nQ38QlGR4a1RWHuwz
 DZmq535WHibCABLBFmRd2UuzWD03BmrAfcKsvrxsEQ==
X-Google-Smtp-Source: AGHT+IG7+8cNxtjYaW8DLvuAzwkpFnOPp3GRgfoPosS/SSNgOQZqBfvWW6vOfnDQFgGdZtkac5nPfA==
X-Received: by 2002:a05:620a:8325:b0:774:2893:3f25 with SMTP id
 pa37-20020a05620a832500b0077428933f25mr2602290qkn.25.1695840423687; 
 Wed, 27 Sep 2023 11:47:03 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 d8-20020ac81188000000b00411fcc18cc1sm5522232qtj.64.2023.09.27.11.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 11:47:03 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 27 Sep 2023 14:45:56 -0400
Message-ID: <20230927184556.1422122-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Sep 2023 06:25:10 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH] mmc: mmci: use peripheral flow control for
	STM32
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

From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>

The STM32 SDMMC peripheral (at least for the STM32F429, STM32F469 and
STM32F746, which are all the currently supported devices using periphid
0x00880180) requires DMA to be performed in peripheral flow controller
mode. From the STM32F74/5 reference manual, section 35.3.2:

"SDMMC host allows only to use the DMA in peripheral flow controller
mode. DMA stream used to serve SDMMC must be configured in peripheral
flow controller mode"

This patch adds a variant option to control peripheral flow control and
enables it for the STM32 variant.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 drivers/mmc/host/mmci.c | 3 ++-
 drivers/mmc/host/mmci.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 769b34afa835..90e32f18abbc 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -249,6 +249,7 @@ static struct variant_data variant_stm32 = {
 	.f_max			= 48000000,
 	.pwrreg_clkgate		= true,
 	.pwrreg_nopower		= true,
+	.dma_flow_controller	= true,
 	.init			= mmci_variant_init,
 };
 
@@ -1012,7 +1013,7 @@ static int _mmci_dmae_prep_data(struct mmci_host *host, struct mmc_data *data,
 		.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
 		.src_maxburst = variant->fifohalfsize >> 2, /* # of words */
 		.dst_maxburst = variant->fifohalfsize >> 2, /* # of words */
-		.device_fc = false,
+		.device_fc = variant->dma_flow_controller,
 	};
 	struct dma_chan *chan;
 	struct dma_device *device;
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 253197f132fc..9a81f30f6748 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -332,6 +332,7 @@ enum mmci_busy_state {
  * @opendrain: bitmask identifying the OPENDRAIN bit inside MMCIPOWER register
  * @dma_lli: true if variant has dma link list feature.
  * @stm32_idmabsize_mask: stm32 sdmmc idma buffer size.
+ * @dma_flow_controller: use peripheral as flow controller for DMA.
  */
 struct variant_data {
 	unsigned int		clkreg;
@@ -378,6 +379,7 @@ struct variant_data {
 	u8			dma_lli:1;
 	u32			stm32_idmabsize_mask;
 	u32			stm32_idmabsize_align;
+	u8			dma_flow_controller:1;
 	void (*init)(struct mmci_host *host);
 };
 
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
