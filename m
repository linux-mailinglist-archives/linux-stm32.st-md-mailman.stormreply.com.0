Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F81204BF
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 13:06:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF918C36B0B;
	Mon, 16 Dec 2019 12:06:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C97F8C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 12:06:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 438391FB;
 Mon, 16 Dec 2019 04:06:21 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B82FC3F719;
 Mon, 16 Dec 2019 04:06:20 -0800 (PST)
Date: Mon, 16 Dec 2019 12:06:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20191212135550.4634-2-peter.ujfalusi@ti.com>
Message-Id: <applied-20191212135550.4634-2-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Cc: baohua@kernel.org, f.fainelli@gmail.com, sbranden@broadcom.com,
 rjui@broadcom.com, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, nsaenzjulienne@suse.de, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "spi: atmel: Use dma_request_chan() instead
	dma_request_slave_channel()" to the spi tree
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

   spi: atmel: Use dma_request_chan() instead dma_request_slave_channel()

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.6

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

From d947c9d26c2381cc10067e76e71bf9ddb0fedb8b Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 12 Dec 2019 15:55:42 +0200
Subject: [PATCH] spi: atmel: Use dma_request_chan() instead
 dma_request_slave_channel()

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20191212135550.4634-2-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-atmel.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 56f0ca361deb..013458cabe3c 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -514,26 +514,19 @@ static int atmel_spi_configure_dma(struct spi_master *master,
 	master->dma_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(master->dma_tx)) {
 		err = PTR_ERR(master->dma_tx);
-		if (err == -EPROBE_DEFER) {
-			dev_warn(dev, "no DMA channel available at the moment\n");
-			goto error_clear;
-		}
-		dev_err(dev,
-			"DMA TX channel not available, SPI unable to use DMA\n");
-		err = -EBUSY;
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "No TX DMA channel, DMA is disabled\n");
 		goto error_clear;
 	}
 
-	/*
-	 * No reason to check EPROBE_DEFER here since we have already requested
-	 * tx channel. If it fails here, it's for another reason.
-	 */
-	master->dma_rx = dma_request_slave_channel(dev, "rx");
-
-	if (!master->dma_rx) {
-		dev_err(dev,
-			"DMA RX channel not available, SPI unable to use DMA\n");
-		err = -EBUSY;
+	master->dma_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(master->dma_rx)) {
+		err = PTR_ERR(master->dma_rx);
+		/*
+		 * No reason to check EPROBE_DEFER here since we have already
+		 * requested tx channel.
+		 */
+		dev_err(dev, "No RX DMA channel, DMA is disabled\n");
 		goto error;
 	}
 
@@ -548,7 +541,7 @@ static int atmel_spi_configure_dma(struct spi_master *master,
 
 	return 0;
 error:
-	if (master->dma_rx)
+	if (!IS_ERR(master->dma_rx))
 		dma_release_channel(master->dma_rx);
 	if (!IS_ERR(master->dma_tx))
 		dma_release_channel(master->dma_tx);
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
