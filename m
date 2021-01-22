Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D51FA3001AE
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 12:35:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 363C9C424BE;
	Fri, 22 Jan 2021 11:35:16 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01433C3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 11:35:10 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1l2uiX-0001iv-7n; Fri, 22 Jan 2021 12:35:05 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1l2uiV-0004DT-Fd; Fri, 22 Jan 2021 12:35:03 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Fri, 22 Jan 2021 12:33:55 +0100
Message-Id: <20210122113355.32384-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Holger Assmann <has@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: enable timestamping
	for non-DMA usage
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

For non-DMA usage, we have an easy way to associate a timestamp with a
sample: iio_pollfunc_store_time stores a timestamp in the primary
trigger IRQ handler and stm32_adc_trigger_handler runs in the IRQ thread
to push out the buffer along with the timestamp.

For this to work, the driver needs to register an IIO_TIMESTAMP channel.
Do this.

For DMA, it's not as easy, because we don't push the buffers out of
stm32_adc_trigger, but out of stm32_adc_dma_buffer_done, which runs in
a tasklet scheduled after a DMA completion.

Preferably, the DMA controller would copy us the timestamp into that buffer
as well. Until this is implemented, restrict timestamping support to
only PIO. For low-frequency sampling, PIO is probably good enough.

Cc: Holger Assmann <has@pengutronix.de>
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - Added comment about timestamping being PIO only (Fabrice)
  - Added missing DMA resource clean up in error path (Fabrice)
  - Added Fabrice's Acked-by
---
 drivers/iio/adc/stm32-adc.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index c067c994dae2..885bb514503c 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1718,7 +1718,7 @@ static void stm32_adc_chan_init_one(struct iio_dev *indio_dev,
 	}
 }
 
-static int stm32_adc_chan_of_init(struct iio_dev *indio_dev)
+static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 {
 	struct device_node *node = indio_dev->dev.of_node;
 	struct stm32_adc *adc = iio_priv(indio_dev);
@@ -1766,6 +1766,9 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev)
 		return -EINVAL;
 	}
 
+	if (timestamping)
+		num_channels++;
+
 	channels = devm_kcalloc(&indio_dev->dev, num_channels,
 				sizeof(struct iio_chan_spec), GFP_KERNEL);
 	if (!channels)
@@ -1816,6 +1819,19 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev)
 		stm32_adc_smpr_init(adc, channels[i].channel, smp);
 	}
 
+	if (timestamping) {
+		struct iio_chan_spec *timestamp = &channels[scan_index];
+
+		timestamp->type = IIO_TIMESTAMP;
+		timestamp->channel = -1;
+		timestamp->scan_index = scan_index;
+		timestamp->scan_type.sign = 's';
+		timestamp->scan_type.realbits = 64;
+		timestamp->scan_type.storagebits = 64;
+
+		scan_index++;
+	}
+
 	indio_dev->num_channels = scan_index;
 	indio_dev->channels = channels;
 
@@ -1875,6 +1891,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	irqreturn_t (*handler)(int irq, void *p) = NULL;
 	struct stm32_adc *adc;
+	bool timestamping = false;
 	int ret;
 
 	if (!pdev->dev.of_node)
@@ -1931,16 +1948,22 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ret = stm32_adc_chan_of_init(indio_dev);
-	if (ret < 0)
-		return ret;
-
 	ret = stm32_adc_dma_request(dev, indio_dev);
 	if (ret < 0)
 		return ret;
 
-	if (!adc->dma_chan)
+	if (!adc->dma_chan) {
+		/* For PIO mode only, iio_pollfunc_store_time stores a timestamp
+		 * in the primary trigger IRQ handler and stm32_adc_trigger_handler
+		 * runs in the IRQ thread to push out buffer along with timestamp.
+		 */
 		handler = &stm32_adc_trigger_handler;
+		timestamping = true;
+	}
+
+	ret = stm32_adc_chan_of_init(indio_dev, timestamping);
+	if (ret < 0)
+		goto err_dma_disable;
 
 	ret = iio_triggered_buffer_setup(indio_dev,
 					 &iio_pollfunc_store_time, handler,
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
