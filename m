Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E44C523C667
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 09:04:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACDE5C36B3A;
	Wed,  5 Aug 2020 07:04:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D4BCC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 07:04:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07573JAQ012732; Wed, 5 Aug 2020 09:04:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6HEYx4CJ/TEY1W/3JDEab5AKC7WRGnQIhZXGA4yNhC0=;
 b=jeI2WxySP3nimvauzE/ZjBZMbjSgxw67skG8jm50trh2oUd2adGA5A+ggwIJ+00Bcuol
 7xNVfiaUFE8kQG2/UAVymMVFiVl1Xj6Md8WIDj/myG21j23MsmkDpcu8pSqwguvn3V0+
 8wvv4iuWG+FIMOJzrTExnCCH/41QW0C32Lt+mVcAzODLSkDV3Ey8f9pWkN4n4jhAOWm+
 e7Y1dO+pJXlXpWREWeY3kF+hEF41T3y7quBa9TiU7jVk7hv54v+VaWVcGklr+PliTMfl
 g3MCt4+ck0TdpdrFKSv+6mqbeFNDryUD9O+ZgyFAwBvhJprc2rfYGPi0+WLWSwVXh2DN jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6theqj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 09:04:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E44FB100034;
 Wed,  5 Aug 2020 09:04:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D82A42A4D8E;
 Wed,  5 Aug 2020 09:04:18 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug 2020 09:04:18
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <broonie@kernel.org>, <amelie.delaunay@st.com>
Date: Wed, 5 Aug 2020 09:02:08 +0200
Message-ID: <1596610933-32599-14-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_04:2020-08-03,
 2020-08-05 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 alain.volmat@st.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 13/18] spi: stm32h7: fix handling of dma
	transfer completed
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

The rx dma is completed "after" the last data is received
from spi. Thus, to avoid loss of rx data, it's mandatory to
wait for the dma callback before tearing down the rx dma in
stm32_spi_disable().

The tx dma is of course already completed when last data is
sent from spi. But both spi and dma use threaded interrupts,
thus there is no guarantee that the dma irq handler is already
executed when the spi irq handler triggers stm32_spi_disable().
Waiting for dma callback will allow a clean termination of the
dma.

Remove the unused code in the current dma callback, signal the
end of dma through completion, then delay spi disable until
the dma callback has been executed.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/spi/spi-stm32.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 1a703c4a65db..b0a9642392e9 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -275,6 +275,7 @@ struct stm32_spi_cfg {
  * @rx_len: number of data to be read in bytes
  * @dma_tx: dma channel for TX transfer
  * @dma_rx: dma channel for RX transfer
+ * @dma_completion: completion to wait for end of DMA transfer
  * @phys_addr: SPI registers physical base address
  * @xfer_completion: completion to wait for end of transfer
  * @xfer_status: current transfer status
@@ -304,6 +305,7 @@ struct stm32_spi {
 	int rx_len;
 	struct dma_chan *dma_tx;
 	struct dma_chan *dma_rx;
+	struct completion dma_completion;
 	dma_addr_t phys_addr;
 	struct completion xfer_completion;
 	int xfer_status;
@@ -1062,25 +1064,18 @@ static void stm32f4_spi_dma_rx_cb(void *data)
  * stm32h7_spi_dma_cb - dma callback
  * @data: pointer to the spi controller data structure
  *
- * DMA callback is called when the transfer is complete or when an error
- * occurs. If the transfer is complete, EOT flag is raised.
+ * DMA callback is called when the transfer is complete.
  */
 static void stm32h7_spi_dma_cb(void *data)
 {
 	struct stm32_spi *spi = data;
 	unsigned long flags;
-	u32 sr;
 
 	spin_lock_irqsave(&spi->lock, flags);
 
-	sr = readl_relaxed(spi->base + STM32H7_SPI_SR);
+	complete(&spi->dma_completion);
 
 	spin_unlock_irqrestore(&spi->lock, flags);
-
-	if (!(sr & STM32H7_SPI_SR_EOT))
-		dev_warn(spi->dev, "DMA error (sr=0x%08x)\n", sr);
-
-	/* Now wait for EOT, or SUSP or OVR in case of error */
 }
 
 /**
@@ -1274,12 +1269,20 @@ static int stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 				      struct spi_transfer *xfer)
 {
+	dma_async_tx_callback rx_done = NULL, tx_done = NULL;
 	struct dma_slave_config tx_dma_conf, rx_dma_conf;
 	struct dma_async_tx_descriptor *tx_dma_desc, *rx_dma_desc;
 	unsigned long flags;
 
 	spin_lock_irqsave(&spi->lock, flags);
 
+	if (spi->rx_buf)
+		rx_done = spi->cfg->dma_rx_cb;
+	else if (spi->tx_buf)
+		tx_done = spi->cfg->dma_tx_cb;
+
+	reinit_completion(&spi->dma_completion);
+
 	rx_dma_desc = NULL;
 	if (spi->rx_buf && spi->dma_rx) {
 		stm32_spi_dma_config(spi, &rx_dma_conf, DMA_DEV_TO_MEM);
@@ -1316,7 +1319,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 		goto dma_desc_error;
 
 	if (rx_dma_desc) {
-		rx_dma_desc->callback = spi->cfg->dma_rx_cb;
+		rx_dma_desc->callback = rx_done;
 		rx_dma_desc->callback_param = spi;
 
 		if (dma_submit_error(dmaengine_submit(rx_dma_desc))) {
@@ -1330,7 +1333,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 	if (tx_dma_desc) {
 		if (spi->cur_comm == SPI_SIMPLEX_TX ||
 		    spi->cur_comm == SPI_3WIRE_TX) {
-			tx_dma_desc->callback = spi->cfg->dma_tx_cb;
+			tx_dma_desc->callback = tx_done;
 			tx_dma_desc->callback_param = spi;
 		}
 
@@ -1658,6 +1661,7 @@ static int stm32_spi_transfer_one(struct spi_master *master,
 {
 	struct stm32_spi *spi = spi_master_get_devdata(master);
 	u32 xfer_time, midi_delay_ns;
+	unsigned long timeout;
 	int ret;
 
 	spi->tx_buf = transfer->tx_buf;
@@ -1690,10 +1694,14 @@ static int stm32_spi_transfer_one(struct spi_master *master,
 	midi_delay_ns = spi->cur_xferlen * 8 / spi->cur_bpw * spi->cur_midi;
 	xfer_time += DIV_ROUND_UP(midi_delay_ns, NSEC_PER_MSEC);
 	xfer_time = max(2 * xfer_time, 100U);
+	timeout = msecs_to_jiffies(xfer_time);
+
+	timeout = wait_for_completion_timeout(&spi->xfer_completion, timeout);
+	if (timeout && spi->cur_usedma)
+		timeout = wait_for_completion_timeout(&spi->dma_completion,
+						      timeout);
 
-	ret = wait_for_completion_timeout(&spi->xfer_completion,
-					  (msecs_to_jiffies(xfer_time)));
-	if (!ret) {
+	if (!timeout) {
 		dev_err(spi->dev, "SPI transfer timeout (%u ms)\n", xfer_time);
 		spi->xfer_status = -ETIMEDOUT;
 	}
@@ -1854,6 +1862,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	spi->master = master;
 	spin_lock_init(&spi->lock);
 	init_completion(&spi->xfer_completion);
+	init_completion(&spi->dma_completion);
 
 	spi->cfg = (const struct stm32_spi_cfg *)
 		of_match_device(pdev->dev.driver->of_match_table,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
