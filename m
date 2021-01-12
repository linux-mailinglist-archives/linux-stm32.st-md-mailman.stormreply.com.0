Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5D2F341C
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jan 2021 16:26:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E420C32EA7;
	Tue, 12 Jan 2021 15:26:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B677C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 15:26:12 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kzLYQ-0005FN-Rg; Tue, 12 Jan 2021 16:25:54 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kzLYM-0005St-Si; Tue, 12 Jan 2021 16:25:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Olivier Moysan <olivier.moysan@st.com>
Date: Tue, 12 Jan 2021 16:24:42 +0100
Message-Id: <20210112152441.20665-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Holger Assmann <has@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: fix erroneous handling
	of spurious IRQs
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

1c6c69525b40 ("genirq: Reject bogus threaded irq requests") makes sure
that threaded IRQs either
  - have IRQF_ONESHOT set
  - don't have the default just return IRQ_WAKE_THREAD primary handler

This is necessary because level-triggered interrupts need to be masked,
either at device or irqchip, to avoid an interrupt storm.

For spurious interrupts, the STM32 ADC driver still does this bogus
request though:
  - It doesn't set IRQF_ONESHOT
  - Its primary handler just returns IRQ_WAKE_THREAD if the interrupt
    is unexpected, i.e. !(status & enabled_mask)
  - stm32mp151.dtsi describes the ADC interrupt as level-triggered

Fix this by setting IRQF_ONESHOT to have the irqchip mask the IRQ
until the IRQ thread has finished.

IRQF_ONESHOT also has the effect that the primary handler is no longer
forced into a thread. This makes the issue with spurious interrupts
interrupts disappear when reading the ADC on a threadirqs=1 kernel.
This used to result in following kernel error message:

	iio iio:device1: Unexpected IRQ: IER=0x00000000, ISR=0x0000100e
or
	iio iio:device1: Unexpected IRQ: IER=0x00000004, ISR=0x0000100a

But with this patch applied (or threaded IRQs disabled), this no longer
occurs.

Cc: Lucas Stach <l.stach@pengutronix.de>
Reported-by: Holger Assmann <has@pengutronix.de>
Fixes: 695e2f5c289b ("iio: adc: stm32-adc: fix a regression when using dma and irq")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/iio/adc/stm32-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index c067c994dae2..7e0e21c79ac8 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1910,7 +1910,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, adc->irq, stm32_adc_isr,
 					stm32_adc_threaded_isr,
-					0, pdev->name, indio_dev);
+					IRQF_ONESHOT, pdev->name, indio_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request IRQ\n");
 		return ret;
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
