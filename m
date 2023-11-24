Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5D7F6A4C
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 02:55:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E38ADC6B47A;
	Fri, 24 Nov 2023 01:55:57 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9162C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 01:55:55 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3b5714439b3so757403b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 17:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700790954; x=1701395754;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LyxNW8uNH7iQptXLfUQU9KTeCyjsm7ymwbCx+5iTF1Y=;
 b=IDUMUUOhwKQ32L5MH7lrmIFlckl85zP0FI/nnKfu4q3jNHR6qTcpertsEzNF/ojFkW
 XDaYDrAmGwfiFZWlnDl+8x7zYidHEWMRyd5Al/MjMwgaxPSgphEZAd042oixGy/jX11+
 NmHjmJ6WwTgxgQQkYFXuMlwJTW1bu7qSNgjelJZfBgVKUr/954rlOtJ6bkAhlU/xNL3q
 bSeSSON2AL97xGhjO649hb1HfFdWj6UpBcLDiuMBmOQ6U+Zltrp4EPsYBFW4cQpGkAwd
 mWjqVsCF4rexKUQ4GhEKC1UYadKV3bEwavGcRO8Esf7QQUt/lqqAjUnQFxohtDGINYRB
 8JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700790954; x=1701395754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LyxNW8uNH7iQptXLfUQU9KTeCyjsm7ymwbCx+5iTF1Y=;
 b=QsPBqlnu/93rtdNWsedetfjkKIug6IQuUxM1BFiQK7dTb4WRN+f+7zCPT50sYhxzZj
 ybaKK0+vGn/h/Hgs7llQGtY63YQi52iUyqpjIFqNLsC94FPF8vJkRBIkTEMiz70BLK8v
 p3LKzUwGcT8mOLhVQtbtqlW3MRPcimMjtKGqkWQUWQapV/nHLae/zXPRZyci3HzymBTz
 niBIgKaKJOc1LP8iNsze8+VouJjPeKJvdcyIwgPvhgLchMRL4xwKTk3NoXpbqgC0oxue
 N4fPV6rA5gzBppBy/ZEeTxpjYiGlqPqcAW8X3/eWshIES3Y8hAzMldYB56XKG3KpFRNd
 sHsQ==
X-Gm-Message-State: AOJu0YxnMwS+Dnv9dUcd3ujPTAGeDJpaz6INIJL/u/bmYIo9VLmwu2h9
 G71MKn0nc8HwkLWk2mLOEP0=
X-Google-Smtp-Source: AGHT+IGjt9vU6cD5V+1YXxif0d29i+KbMwSlR2P7yRUyPFecaEYgEXMOWyJrBq8DeHZsNSvmam5zUg==
X-Received: by 2002:a54:4587:0:b0:3a9:b9eb:998e with SMTP id
 z7-20020a544587000000b003a9b9eb998emr1166283oib.51.1700790954616; 
 Thu, 23 Nov 2023 17:55:54 -0800 (PST)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 9-20020a631049000000b005c1ce3c960bsm1991128pgq.50.2023.11.23.17.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 17:55:54 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Fri, 24 Nov 2023 09:54:33 +0800
Message-Id: <20231124015433.2223696-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: xgmac: Disable FPE
	MMC interrupts
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

Commit aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts
by default") tries to disable MMC interrupts to avoid a storm of
unhandled interrupts, but leaves the FPE(Frame Preemption) MMC
interrupts enabled.
Now we mask FPE TX and RX interrupts to disable all MMC interrupts.

Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
Changes in v2:
  - Update commit message, thanks Wojciech and Andrew.
---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index ea4910ae0921..cdd7fbde2bfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -177,8 +177,10 @@
 #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
 #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
 
+#define MMC_XGMAC_FPE_TX_INTR_MASK	0x204
 #define MMC_XGMAC_TX_FPE_FRAG		0x208
 #define MMC_XGMAC_TX_HOLD_REQ		0x20c
+#define MMC_XGMAC_FPE_RX_INTR_MASK	0x224
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
 #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
@@ -352,6 +354,8 @@ static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
 {
 	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
 	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
+	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_TX_INTR_MASK);
+	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_RX_INTR_MASK);
 	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_IPC_INTR_MASK);
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
