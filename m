Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B188A1D6300
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2020 19:20:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 612D0C36B20;
	Sat, 16 May 2020 17:20:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37DC9C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 17:20:50 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DD06207D4;
 Sat, 16 May 2020 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589649649;
 bh=aTUSYRNg1AIN3df6ElQSFIwBjTcgJ60HMWA94BnEMIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=slPnHaD4n6jUrADNzVFJyfZeQgAXJHcT2NZQmV9SyUP+6SJmZdWy3lUIKwsuFlXMe
 8pE+MnMxuBhUgxWjnjnrD7qgo+z4fZQwlvvADD69hmeHPEPue69NFQB1gap3n0EHEY
 0yfZgAhdfekHmT8/Mx+PIIF4bfxLa3eCmxO9TVlk=
Date: Sat, 16 May 2020 18:20:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Message-ID: <20200516182044.373adf4b@archlinux>
In-Reply-To: <20200514131710.84201-5-alexandru.ardelean@analog.com>
References: <20200514131710.84201-1-alexandru.ardelean@analog.com>
 <20200514131710.84201-5-alexandru.ardelean@analog.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, ak@it-klinger.de, mcoquelin.stm32@gmail.com,
 eugen.hristev@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/8] iio: stm32-dfsdm-adc: pass iio
 device as arg for the interrupt handler
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

On Thu, 14 May 2020 16:17:06 +0300
Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:

> This changes the argument for the interrupt handler to be the IIO device
> instead of the state-struct.
> Since there will be some changes to how iio_priv_to_dev() is implemented,
> it could be that the helper becomes a bit slower, as it will be hidden away
> in the IIO core.
> 
> The iio_priv() call will still be fast enough, as it will return a void
> pointer from the public IIO device structure. So it's better to switch the
> order.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
Whilst this one looks fine to me. I'd definitely like an Ack from
one of the stm people in case I'm missing something.

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 76a60d93fe23..28ef02887bd3 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1313,8 +1313,8 @@ static const struct iio_info stm32_dfsdm_info_adc = {
>  
>  static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
>  {
> -	struct stm32_dfsdm_adc *adc = arg;
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = arg;
> +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>  	struct regmap *regmap = adc->dfsdm->regmap;
>  	unsigned int status, int_en;
>  
> @@ -1603,7 +1603,7 @@ static int stm32_dfsdm_adc_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	ret = devm_request_irq(dev, irq, stm32_dfsdm_irq,
> -			       0, pdev->name, adc);
> +			       0, pdev->name, iio);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to request IRQ\n");
>  		return ret;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
