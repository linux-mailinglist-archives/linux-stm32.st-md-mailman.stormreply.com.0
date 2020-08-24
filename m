Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6915F2502F2
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Aug 2020 18:38:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32402C3FADB;
	Mon, 24 Aug 2020 16:38:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E405C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 16:38:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F1D722E01;
 Mon, 24 Aug 2020 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598287086;
 bh=gU9+oL8QuHBfkGQPrxNxOBrABrrUSMiM7oT+OpPKktw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X8jLZgWqfBnob1FnRqAp3CXS59pdh1DdoSKUFpeR3qgaKZFyH0AJ+Eci2Rxox45QQ
 6XBDfysh1nf/xemGCw3o5lLW+k4DNrSP7SRISIXJJiEgoPtQE8ZlTq8lx6zwaHOLTH
 5lNcOEJs9HqpnjHkrJxYJbjmqIpPSnty0yGXRuLw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 24 Aug 2020 12:37:23 -0400
Message-Id: <20200824163751.606577-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163751.606577-1-sashal@kernel.org>
References: <20200824163751.606577-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-spi@vger.kernel.org,
 Alain Volmat <alain.volmat@st.com>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 11/38] spi: stm32: fix fifo
	threshold level in case of short transfer
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

From: Amelie Delaunay <amelie.delaunay@st.com>

[ Upstream commit 3373e9004acc0603242622b4378c64bc01d21b5f ]

When transfer is shorter than half of the fifo, set the data packet size
up to transfer size instead of up to half of the fifo.
Check also that threshold is set at least to 1 data frame.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
Link: https://lore.kernel.org/r/1597043558-29668-3-git-send-email-alain.volmat@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-stm32.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index cb54471456145..264a7e937f9eb 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -468,20 +468,27 @@ static int stm32_spi_prepare_mbr(struct stm32_spi *spi, u32 speed_hz,
 /**
  * stm32h7_spi_prepare_fthlv - Determine FIFO threshold level
  * @spi: pointer to the spi controller data structure
+ * @xfer_len: length of the message to be transferred
  */
-static u32 stm32h7_spi_prepare_fthlv(struct stm32_spi *spi)
+static u32 stm32h7_spi_prepare_fthlv(struct stm32_spi *spi, u32 xfer_len)
 {
-	u32 fthlv, half_fifo;
+	u32 fthlv, half_fifo, packet;
 
 	/* data packet should not exceed 1/2 of fifo space */
 	half_fifo = (spi->fifo_size / 2);
 
+	/* data_packet should not exceed transfer length */
+	if (half_fifo > xfer_len)
+		packet = xfer_len;
+	else
+		packet = half_fifo;
+
 	if (spi->cur_bpw <= 8)
-		fthlv = half_fifo;
+		fthlv = packet;
 	else if (spi->cur_bpw <= 16)
-		fthlv = half_fifo / 2;
+		fthlv = packet / 2;
 	else
-		fthlv = half_fifo / 4;
+		fthlv = packet / 4;
 
 	/* align packet size with data registers access */
 	if (spi->cur_bpw > 8)
@@ -489,6 +496,9 @@ static u32 stm32h7_spi_prepare_fthlv(struct stm32_spi *spi)
 	else
 		fthlv -= (fthlv % 4); /* multiple of 4 */
 
+	if (!fthlv)
+		fthlv = 1;
+
 	return fthlv;
 }
 
@@ -1395,7 +1405,7 @@ static void stm32h7_spi_set_bpw(struct stm32_spi *spi)
 	cfg1_setb |= (bpw << STM32H7_SPI_CFG1_DSIZE_SHIFT) &
 		     STM32H7_SPI_CFG1_DSIZE;
 
-	spi->cur_fthlv = stm32h7_spi_prepare_fthlv(spi);
+	spi->cur_fthlv = stm32h7_spi_prepare_fthlv(spi, spi->cur_xferlen);
 	fthlv = spi->cur_fthlv - 1;
 
 	cfg1_clrb |= STM32H7_SPI_CFG1_FTHLV;
@@ -1581,6 +1591,8 @@ static int stm32_spi_transfer_one_setup(struct stm32_spi *spi,
 
 	spin_lock_irqsave(&spi->lock, flags);
 
+	spi->cur_xferlen = transfer->len;
+
 	if (spi->cur_bpw != transfer->bits_per_word) {
 		spi->cur_bpw = transfer->bits_per_word;
 		spi->cfg->set_bpw(spi);
@@ -1628,8 +1640,6 @@ static int stm32_spi_transfer_one_setup(struct stm32_spi *spi,
 			goto out;
 	}
 
-	spi->cur_xferlen = transfer->len;
-
 	dev_dbg(spi->dev, "transfer communication mode set to %d\n",
 		spi->cur_comm);
 	dev_dbg(spi->dev,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
