Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B75FF2502CB
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Aug 2020 18:36:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82226C3FAD9;
	Mon, 24 Aug 2020 16:36:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0302C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 16:36:37 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25AC922CF7;
 Mon, 24 Aug 2020 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598286996;
 bh=WhrAFwOzk/Rx5uChKtXnYnxfBGZcnnRc64UJOZ28RDM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZfZUntRf4rOkJ1EKFCGx4fq/Fo8+CaQ9UdZZbjkrACyjWCEBNv36S8FRD0tV1twOV
 cpEs2Uvz5+9jaCVnBzsOhfXcizJh1lc21KF3+7n1z+o90poSNW/xEi5Zk2TWZG8z0T
 B7niwUTNESJeZMEb3rgCkAywE3usPTRNHs2pcd1k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 24 Aug 2020 12:35:40 -0400
Message-Id: <20200824163634.606093-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Tobias Schramm <t.schramm@manjaro.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.7 01/54] spi: stm32: clear only
	asserted irq flags on interrupt
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

From: Tobias Schramm <t.schramm@manjaro.org>

[ Upstream commit ae1ba50f1e706dfd7ce402ac52c1f1f10becad68 ]

Previously the stm32h7 interrupt thread cleared all non-masked interrupts.
If an interrupt was to occur during the handling of another interrupt its
flag would be unset, resulting in a lost interrupt.
This patches fixes the issue by clearing only the currently set interrupt
flags.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
Link: https://lore.kernel.org/r/20200804195136.1485392-1-t.schramm@manjaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 44ac6eb3298d4..ef3be03574e80 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -964,7 +964,7 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 		if (!spi->cur_usedma && (spi->rx_buf && (spi->rx_len > 0)))
 			stm32h7_spi_read_rxfifo(spi, false);
 
-	writel_relaxed(mask, spi->base + STM32H7_SPI_IFCR);
+	writel_relaxed(sr & mask, spi->base + STM32H7_SPI_IFCR);
 
 	spin_unlock_irqrestore(&spi->lock, flags);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
