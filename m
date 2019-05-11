Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95D1A78A
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 12:24:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18D2FC1630E
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 10:24:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ADACC1630D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2019 10:24:37 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE1E62173B;
 Sat, 11 May 2019 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557570276;
 bh=Ol9ib5bihEYIjrd1c8mt+AxCWFeb4Ti7BaHuwJkxvQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=v4U603/bLabnldrLM6MOiPNDVz7DK0r/MC9QoaiSqqorwz+ySd4TjrJKypZ3+bF9s
 Oi7pE83vuWve+W8K6qopE3LO/K10MtfkVM1TJXht3uXte67oWPnpF2vxXDyky7JEUN
 So9eLCXfDPm7MdKyCanuDsLdFHH6/rXp2DvYpyD8=
Date: Sat, 11 May 2019 11:24:29 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Message-ID: <20190511112429.25ddd84d@archlinux>
In-Reply-To: <20190507143615.28477-5-dev@pschenker.ch>
References: <20190507143615.28477-1-dev@pschenker.ch>
 <20190507143615.28477-5-dev@pschenker.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Philippe Schenker <philippe.schenker@toradex.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: stmpe-adc: Reset possible
	interrupts
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

On Tue,  7 May 2019 16:36:15 +0200
Philippe Schenker <dev@pschenker.ch> wrote:

> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> Clear any interrupt that still is on the device on every channel
> this driver is activated for in probe and specific channels in
> the timeout handler.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
I'm never particularly clean on blanket resets as they do tend to
hide bugs. However, the probe one is something that would happen anyway
if there was a 'reset' function.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> 
> ---
> 
>  drivers/iio/adc/stmpe-adc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> index cc752a47444c..a5990e9f2c80 100644
> --- a/drivers/iio/adc/stmpe-adc.c
> +++ b/drivers/iio/adc/stmpe-adc.c
> @@ -80,6 +80,8 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
>  	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
>  
>  	if (ret <= 0) {
> +		stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_STA,
> +				STMPE_ADC_CH(info->channel));
>  		mutex_unlock(&info->lock);
>  		return -ETIMEDOUT;
>  	}
> @@ -326,6 +328,9 @@ static int stmpe_adc_probe(struct platform_device *pdev)
>  	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_EN,
>  			~(norequest_mask & 0xFF));
>  
> +	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_STA,
> +			~(norequest_mask & 0xFF));
> +
>  	return devm_iio_device_register(&pdev->dev, indio_dev);
>  }
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
