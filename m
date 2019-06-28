Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 885295A17B
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 18:56:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D1A9C35E04;
	Fri, 28 Jun 2019 16:56:39 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EFDAC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 16:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=lK0iOan3AVtLl5dzxhYffiHPtchPL13jyFaUkzzdnGY=; b=obVpWn5MXCPj
 xsB7YM7Fl/AleM+yoj8xzMyX8MH6l9FGSrYsiLhtQYDHnbihQfnQNAgHQGSJBYYa7isdgs+zog5xP
 sYNtslMjaYfQNaLjcglfBmSQi1qZ1FR7Hrhy3qyFSnQK5kZv9FeLJ54GeO8tvR3xlSrkSfuuMrhMU
 /kTLo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAs-0007D3-B1; Fri, 28 Jun 2019 16:56:34 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E5C44440046; Fri, 28 Jun 2019 17:56:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ludovic Barre <ludovic.barre@st.com>
In-Reply-To: <1561621439-7305-2-git-send-email-ludovic.Barre@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165633.E5C44440046@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:33 +0100 (BST)
Cc: devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "spi: stm32-qspi: remove signal sensitive on
	completion" to the spi tree
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

The patch

   spi: stm32-qspi: remove signal sensitive on completion

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 775c4c0032c408b8a57a3fc2695eeda101da003a Mon Sep 17 00:00:00 2001
From: Ludovic Barre <ludovic.barre@st.com>
Date: Thu, 27 Jun 2019 09:43:59 +0200
Subject: [PATCH] spi: stm32-qspi: remove signal sensitive on completion

On umount step a sigkill signal is set (without user specific
action), due to sigkill signal the completion will be interrupted and
the data transfer can't be finished if a sync is needed.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-stm32-qspi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 42f8e3c6aa1f..0b07182f5660 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -245,12 +245,8 @@ static int stm32_qspi_tx_dma(struct stm32_qspi *qspi,
 	writel_relaxed(cr | CR_DMAEN, qspi->io_base + QSPI_CR);
 
 	t_out = sgt.nents * STM32_COMP_TIMEOUT_MS;
-	if (!wait_for_completion_interruptible_timeout(&qspi->dma_completion,
-						       msecs_to_jiffies(t_out)))
-		err = -ETIMEDOUT;
-
-	if (dma_async_is_tx_complete(dma_ch, cookie,
-				     NULL, NULL) != DMA_COMPLETE)
+	if (!wait_for_completion_timeout(&qspi->dma_completion,
+					 msecs_to_jiffies(t_out)))
 		err = -ETIMEDOUT;
 
 	if (err)
@@ -304,7 +300,7 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
 	cr = readl_relaxed(qspi->io_base + QSPI_CR);
 	writel_relaxed(cr | CR_TCIE | CR_TEIE, qspi->io_base + QSPI_CR);
 
-	if (!wait_for_completion_interruptible_timeout(&qspi->data_completion,
+	if (!wait_for_completion_timeout(&qspi->data_completion,
 				msecs_to_jiffies(STM32_COMP_TIMEOUT_MS))) {
 		err = -ETIMEDOUT;
 	} else {
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
