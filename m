Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1B3D486A
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jul 2021 17:46:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C3DC597B1;
	Sat, 24 Jul 2021 15:46:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5AB4C597AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jul 2021 15:46:14 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D981360E8C;
 Sat, 24 Jul 2021 15:46:08 +0000 (UTC)
Date: Sat, 24 Jul 2021 16:48:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Yizhuo <yzhai003@ucr.edu>
Message-ID: <20210724164840.7381053b@jic23-huawei>
In-Reply-To: <20210719195313.40341-1-yzhai003@ucr.edu>
References: <20210719195313.40341-1-yzhai003@ucr.edu>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Mugilraj Dhavachelvan <dmugil2000@gmail.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: Fix the
 uninitialized use if regmap_read() fails
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

On Mon, 19 Jul 2021 19:53:11 +0000
Yizhuo <yzhai003@ucr.edu> wrote:

> Inside function stm32_dfsdm_irq(), the variable "status", "int_en"
> could be uninitialized if the regmap_read() fails and returns an error
> code.  However, they are directly used in the later context to decide
> the control flow, which is potentially unsafe.
> 
> Fixes: e2e6771c64625 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>

Hi Yizhou

I want to get some review of this from people familiar with the
hardware as there is a small possibility your reordering might have
introduced a problem.

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 1cfefb3b5e56..d8b78aead942 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1292,9 +1292,11 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>  	struct regmap *regmap = adc->dfsdm->regmap;
>  	unsigned int status, int_en;
> +	int ret;
>  
> -	regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
> -	regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);

Moving this later is only valid if there aren't any side effects.
The current ordering is strange enough it makes me wonder if there might be!

Jonathan

> +	ret = regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
> +	if (ret)
> +		return IRQ_HANDLED;
>  
>  	if (status & DFSDM_ISR_REOCF_MASK) {
>  		/* Read the data register clean the IRQ status */
> @@ -1303,6 +1305,9 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
>  	}
>  
>  	if (status & DFSDM_ISR_ROVRF_MASK) {
> +		ret = regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
> +		if (ret)
> +			return IRQ_HANDLED;
>  		if (int_en & DFSDM_CR2_ROVRIE_MASK)
>  			dev_warn(&indio_dev->dev, "Overrun detected\n");
>  		regmap_update_bits(regmap, DFSDM_ICR(adc->fl_id),

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
