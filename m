Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD72F8E76
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jan 2021 18:53:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B6D9C57190;
	Sat, 16 Jan 2021 17:53:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A764AC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 17:53:40 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED47A2246B;
 Sat, 16 Jan 2021 17:53:36 +0000 (UTC)
Date: Sat, 16 Jan 2021 17:53:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20210116175333.4d8684c5@archlinux>
In-Reply-To: <20210112152441.20665-1-a.fatoum@pengutronix.de>
References: <20210112152441.20665-1-a.fatoum@pengutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>, Holger Assmann <has@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: fix erroneous
 handling of spurious IRQs
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

On Tue, 12 Jan 2021 16:24:42 +0100
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> 1c6c69525b40 ("genirq: Reject bogus threaded irq requests") makes sure
> that threaded IRQs either
>   - have IRQF_ONESHOT set
>   - don't have the default just return IRQ_WAKE_THREAD primary handler
> 
> This is necessary because level-triggered interrupts need to be masked,
> either at device or irqchip, to avoid an interrupt storm.
> 
> For spurious interrupts, the STM32 ADC driver still does this bogus
> request though:
>   - It doesn't set IRQF_ONESHOT
>   - Its primary handler just returns IRQ_WAKE_THREAD if the interrupt
>     is unexpected, i.e. !(status & enabled_mask)

This seems 'unusual'.  If this is a spurious interrupt we should be
returning IRQ_NONE and letting the spurious interrupt protection
stuff kick in.

The only reason I can see that it does this is print an error message.
I'm not sure why we need to go into the thread to do that given
it's not supposed to happen. If we need that message at all, I'd
suggest doing it in the interrupt handler then return IRQ_NONE;

>   - stm32mp151.dtsi describes the ADC interrupt as level-triggered
> 
> Fix this by setting IRQF_ONESHOT to have the irqchip mask the IRQ
> until the IRQ thread has finished.
> 
> IRQF_ONESHOT also has the effect that the primary handler is no longer
> forced into a thread. This makes the issue with spurious interrupts
> interrupts disappear when reading the ADC on a threadirqs=1 kernel.
> This used to result in following kernel error message:
> 
> 	iio iio:device1: Unexpected IRQ: IER=0x00000000, ISR=0x0000100e
> or
> 	iio iio:device1: Unexpected IRQ: IER=0x00000004, ISR=0x0000100a
> 
> But with this patch applied (or threaded IRQs disabled), this no longer
> occurs.
> 
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Reported-by: Holger Assmann <has@pengutronix.de>
> Fixes: 695e2f5c289b ("iio: adc: stm32-adc: fix a regression when using dma and irq")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  drivers/iio/adc/stm32-adc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index c067c994dae2..7e0e21c79ac8 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1910,7 +1910,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  
>  	ret = devm_request_threaded_irq(&pdev->dev, adc->irq, stm32_adc_isr,
>  					stm32_adc_threaded_isr,
> -					0, pdev->name, indio_dev);
> +					IRQF_ONESHOT, pdev->name, indio_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request IRQ\n");
>  		return ret;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
