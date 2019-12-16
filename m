Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D771204BB
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 13:06:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCD3FC36B0D;
	Mon, 16 Dec 2019 12:06:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 118EBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 12:06:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 913D9106F;
 Mon, 16 Dec 2019 04:06:11 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA113F719;
 Mon, 16 Dec 2019 04:06:10 -0800 (PST)
Date: Mon, 16 Dec 2019 12:06:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20191212135550.4634-6-peter.ujfalusi@ti.com>
Message-Id: <applied-20191212135550.4634-6-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Cc: baohua@kernel.org, f.fainelli@gmail.com, sbranden@broadcom.com,
 rjui@broadcom.com, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, nsaenzjulienne@suse.de, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "spi: mxs: Use dma_request_chan() instead
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

   spi: mxs: Use dma_request_chan() instead dma_request_slave_channel()

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

From 7ccffd41b2d4d180dcdcc03c54c446621e34bca5 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 12 Dec 2019 15:55:46 +0200
Subject: [PATCH] spi: mxs: Use dma_request_chan() instead
 dma_request_slave_channel()

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20191212135550.4634-6-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mxs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mxs.c b/drivers/spi/spi-mxs.c
index 996c1c8a9c71..dce85ee07cd0 100644
--- a/drivers/spi/spi-mxs.c
+++ b/drivers/spi/spi-mxs.c
@@ -590,10 +590,10 @@ static int mxs_spi_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_master_free;
 
-	ssp->dmach = dma_request_slave_channel(&pdev->dev, "rx-tx");
-	if (!ssp->dmach) {
+	ssp->dmach = dma_request_chan(&pdev->dev, "rx-tx");
+	if (IS_ERR(ssp->dmach)) {
 		dev_err(ssp->dev, "Failed to request DMA\n");
-		ret = -ENODEV;
+		ret = PTR_ERR(ssp->dmach);
 		goto out_master_free;
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
