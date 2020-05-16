Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6E1D62F3
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2020 19:17:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A04A7C36B20;
	Sat, 16 May 2020 17:17:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CD49C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 17:17:55 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C1C720756;
 Sat, 16 May 2020 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589649474;
 bh=IcHZ7TOh5vvvk0say8vEkTHU3vT+7RvmCSLthgNzCLg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vsrsTh6IOhShbQ5wYFS+COo68gFFwCD/TNQhprwkiTMwrVUbFGacw8W+L7ruNT0gR
 Y3ZgdhYioeixFEVMOs7E/sH4nkzIPXAeKAICDRXl71IcDuXvQHxBenOPs1px1ZcyQv
 Gzrpg3u8nQn+nJq0CYd3hVneWeX9woZBBrJnR35c=
Date: Sat, 16 May 2020 18:17:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Message-ID: <20200516181749.243c9515@archlinux>
In-Reply-To: <20200514131710.84201-4-alexandru.ardelean@analog.com>
References: <20200514131710.84201-1-alexandru.ardelean@analog.com>
 <20200514131710.84201-4-alexandru.ardelean@analog.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, ak@it-klinger.de, mcoquelin.stm32@gmail.com,
 eugen.hristev@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/8] iio: at91_adc: pass ref to IIO
 device via param for int function
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

On Thu, 14 May 2020 16:17:05 +0300
Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:

> Since there will be some changes to how iio_priv_to_dev() is implemented,
> it could be that the helper becomes a bit slower, as it will be hidden away
> in the IIO core.
> 
> For this driver, the IIO device can be passed directly as a parameter to
> the at91_ts_sample() function, thus making it immune to the change of
> iio_priv_to_dev().
> The function gets called in an interrupt context.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
I wonder. Should we just pass the struct device?  It's only used for
error printing I think, so we could make that explicit.

I'm not that bothered either way though.

Jonathan

> ---
>  drivers/iio/adc/at91_adc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index 0368b6dc6d60..5999defe47cd 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -287,13 +287,12 @@ static void handle_adc_eoc_trigger(int irq, struct iio_dev *idev)
>  	}
>  }
>  
> -static int at91_ts_sample(struct at91_adc_state *st)
> +static int at91_ts_sample(struct iio_dev *idev, struct at91_adc_state *st)
>  {
>  	unsigned int xscale, yscale, reg, z1, z2;
>  	unsigned int x, y, pres, xpos, ypos;
>  	unsigned int rxp = 1;
>  	unsigned int factor = 1000;
> -	struct iio_dev *idev = iio_priv_to_dev(st);
>  
>  	unsigned int xyz_mask_bits = st->res;
>  	unsigned int xyz_mask = (1 << xyz_mask_bits) - 1;
> @@ -449,7 +448,7 @@ static irqreturn_t at91_adc_9x5_interrupt(int irq, void *private)
>  
>  		if (status & AT91_ADC_ISR_PENS) {
>  			/* validate data by pen contact */
> -			at91_ts_sample(st);
> +			at91_ts_sample(idev, st);
>  		} else {
>  			/* triggered by event that is no pen contact, just read
>  			 * them to clean the interrupt and discard all.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
