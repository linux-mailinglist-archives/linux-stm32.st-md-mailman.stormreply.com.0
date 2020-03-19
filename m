Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E533F18B495
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 14:11:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AF46C36B0B;
	Thu, 19 Mar 2020 13:11:08 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E4A6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 13:11:05 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u12so1243868pgb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 06:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4nHSl+0pWGmInbe8FQHGu8YA5O/4e10+dn6tS8W63s=;
 b=gbLWcG94Hw5eFr5F713x2ZHuuzXvDsR7HTPfXMj/bIwF+d8ypI7MQ0pyYwa+09U5TZ
 NqzDcIq3rhIlQ4m3ktNvDy5fiWpyluuTk2aj13Vrd5xi/rvbzDOTKr5HnOlQqlMtqq2I
 M30MLa3Mre/tQuTekAAIEmcBZZtLSzzPQpAZxWmDu3aa4Zrs7fadQ+K7/FGUMgA0sb49
 PyYhYjlIHoob0v7+ijdGrXE0Gm8ie9bwPUlzDJXrH7xRsp8cxgd4KmLEzHO+mBmV/t2S
 jn7lhWtnvbAEt837OOgOCRB6KtNhzETY7bPO8q91avv2t4qOmYnjaaHLMF7/VWFOygUJ
 ukTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4nHSl+0pWGmInbe8FQHGu8YA5O/4e10+dn6tS8W63s=;
 b=hsanr0JWBwrRV/Y34ug4dlBs157kPy2GCjoSeMYXtIaQtal5OQugj2CsgNq3mYh4ck
 xjAPx/VEZj2qJoQPINEN3UlPjXy2OMFr2kqsbdKsEMkZGrAXVLcVB7Oci2xTe1Ot2276
 1O27mhQvpzdeNFEJw/B9uxKdVtC0gpRkBrkVCXfBgoxKktxTBPdSjtOJ09zEWshu5/vM
 XnEWYwfM3CwFZAH04nDh9nNG49poYvr76c6VvZK5k8Xt4j74i6VOFi/8FtbXxR6HFKTW
 HZpunsXzxVZB+MILCuo6S68jDLuVbbPtlWa34PJYZ4J0U+hI+TiBdgoECgvaBcj2gDhc
 PtVQ==
X-Gm-Message-State: ANhLgQ27Ct5QnHcvGYZiPfcnUVbRJzCQCYz2kn7P8qwUbe5WzBFXOvB4
 xv8Or6d4Tc/PU1v7uONrqpg=
X-Google-Smtp-Source: ADFU+vu6U87IPTR0D2iW/QPtoCB5nPrRdEyRPfJY+KBcojiba6nAoCyZgW5BQnWhYb7EwcPvHQuD8w==
X-Received: by 2002:aa7:81c1:: with SMTP id c1mr3943700pfn.236.1584623463897; 
 Thu, 19 Mar 2020 06:11:03 -0700 (PDT)
Received: from localhost ([216.24.188.11])
 by smtp.gmail.com with ESMTPSA id lt11sm2087682pjb.2.2020.03.19.06.11.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Mar 2020 06:11:03 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
Date: Thu, 19 Mar 2020 21:10:19 +0800
Message-Id: <20200319131019.12829-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac_lib: remove unnecessary
	checks in dwmac_dma_reset()
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

it will check the return value of dwmac_dma_reset() in the
stmmac_init_dma_engine() function and report an error if the
return value is not zero. so don't need check here.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 688d36095333..cb87d31a99df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -16,19 +16,14 @@
 int dwmac_dma_reset(void __iomem *ioaddr)
 {
 	u32 value = readl(ioaddr + DMA_BUS_MODE);
-	int err;
 
 	/* DMA SW reset */
 	value |= DMA_BUS_MODE_SFT_RESET;
 	writel(value, ioaddr + DMA_BUS_MODE);
 
-	err = readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
+	return readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
 				 !(value & DMA_BUS_MODE_SFT_RESET),
 				 10000, 100000);
-	if (err)
-		return -EBUSY;
-
-	return 0;
 }
 
 /* CSR1 enables the transmit DMA to check for new descriptor */
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
