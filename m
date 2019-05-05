Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A93140BD
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 17:45:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1DECC055F1
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 15:45:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66B83C055F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 May 2019 15:45:11 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B11FA206DF;
 Sun,  5 May 2019 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557071109;
 bh=aKwSsB4VIQvPHjNpyepX94dwCojn4YcW4pPdu085lpA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0LZ8f5LyLX20WKafPP0af88glvklQ1x0J0Jve8bY4nJCqS9IyvDajjpokrGH3LdVt
 +h1+08XmvOD2KobcKuiqSatQjSlPfOdnfVwZWlZnyukPLprLaQkxFC8O1M/49pfaFZ
 5suhRhYTipcXVWcq6OvfsC/8fdhP0DI17yQOKFFs=
Date: Sun, 5 May 2019 16:45:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Message-ID: <20190505164503.030d6687@archlinux>
In-Reply-To: <20190503135725.9959-3-dev@pschenker.ch>
References: <20190503135725.9959-1-dev@pschenker.ch>
 <20190503135725.9959-3-dev@pschenker.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Max Krummenacher <max.krummenacher@toradex.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] iio: stmpe-adc: Enable all stmpe-adc
 interrupts just once
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

On Fri,  3 May 2019 15:57:25 +0200
Philippe Schenker <dev@pschenker.ch> wrote:

> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> This commit will enable the interrupts of all channels handled by this
> driver only once in the probe function.
> 
> This will improve performance because one byte less has to be written over
> i2c on each read out of the adc. On the fastest ADC mode this will improve
> read out speed by 15%.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Makes sense. I'll pick this up once patch 2 discussion is sorted.

Jonathan

> 
> ---
> 
>  drivers/iio/adc/stmpe-adc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> index baa41ffc0d76..427c890c6e7d 100644
> --- a/drivers/iio/adc/stmpe-adc.c
> +++ b/drivers/iio/adc/stmpe-adc.c
> @@ -72,9 +72,6 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
>  		return -EINVAL;
>  	}
>  
> -	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_EN,
> -			STMPE_ADC_CH(info->channel));
> -
>  	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_CAPT,
>  			STMPE_ADC_CH(info->channel));
>  
> @@ -328,6 +325,9 @@ static int stmpe_adc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_EN,
> +			~(norequest_mask & 0xFF));
> +
>  	return devm_iio_device_register(&pdev->dev, indio_dev);
>  }
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
