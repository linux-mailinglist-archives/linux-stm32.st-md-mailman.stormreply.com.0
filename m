Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2005E1A780
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 12:15:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 727F6C46D54
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 10:15:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13B43C46D53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2019 10:15:57 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7916D208C0;
 Sat, 11 May 2019 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557569755;
 bh=GVjvzUgaZO5L08Vrif/Gj4NVQZ3V+nUBXORBy/xPtl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VGf7UATU+wbNMZj8Vn2IfAkAO93ECqaYnkNM0nI0ktDg20F/OWYS4d5STB4IPid8V
 bJwGWBld4bljFXZoG2vYlPdfr6JILEOLGCkmixATxgCYkevjNLgQrSVoWQqRtQa9mJ
 m7Z56V8aACpmRetJEsb5WCM9t/TRbG56GmxM5S4k=
Date: Sat, 11 May 2019 11:15:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Message-ID: <20190511111548.504948ae@archlinux>
In-Reply-To: <20190507143615.28477-4-dev@pschenker.ch>
References: <20190507143615.28477-1-dev@pschenker.ch>
 <20190507143615.28477-4-dev@pschenker.ch>
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
Subject: Re: [Linux-stm32] [PATCH 4/5] iio: stmpe-adc: Use
	wait_for_completion_timeout
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

On Tue,  7 May 2019 16:36:14 +0200
Philippe Schenker <dev@pschenker.ch> wrote:

> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> Use wait_for_completion_timeout instead of
> wait_for_completion_interuptible_timeout.
> 
> The interruptible variant gets constantly interrupted if a user
> program is compiled with the -pg option.
> The killable variant was not used due to the fact that a second
> program, reading on this device, that gets killed is then also killing
> that wait.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Hi Phillippe

This one clashed a little bit with our earlier patch to remove the
unnecessary assignment.  I've applied it by hand but please check it.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
> 
>  drivers/iio/adc/stmpe-adc.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> index 82b43e4522b6..cc752a47444c 100644
> --- a/drivers/iio/adc/stmpe-adc.c
> +++ b/drivers/iio/adc/stmpe-adc.c
> @@ -77,17 +77,11 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
>  	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_CAPT,
>  			STMPE_ADC_CH(info->channel));
>  
> -	*val = info->value;
> -
> -	ret = wait_for_completion_interruptible_timeout
> -		(&info->completion, STMPE_ADC_TIMEOUT);
> +	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
>  
>  	if (ret <= 0) {
>  		mutex_unlock(&info->lock);
> -		if (ret == 0)
> -			return -ETIMEDOUT;
> -		else
> -			return ret;
> +		return -ETIMEDOUT;
>  	}
>  
>  	*val = info->value;
> @@ -116,15 +110,11 @@ static int stmpe_read_temp(struct stmpe_adc *info,
>  	stmpe_reg_write(info->stmpe, STMPE_REG_TEMP_CTRL,
>  			STMPE_START_ONE_TEMP_CONV);
>  
> -	ret = wait_for_completion_interruptible_timeout
> -		(&info->completion, STMPE_ADC_TIMEOUT);
> +	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
>  
>  	if (ret <= 0) {
>  		mutex_unlock(&info->lock);
> -		if (ret == 0)
> -			return -ETIMEDOUT;
> -		else
> -			return ret;
> +		return -ETIMEDOUT;
>  	}
>  
>  	/*

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
