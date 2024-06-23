Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D515913C27
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 17:21:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1566CC71289;
	Sun, 23 Jun 2024 15:21:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B036C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 15:21:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DBD2ACE0F05;
 Sun, 23 Jun 2024 15:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15F4C2BD10;
 Sun, 23 Jun 2024 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719156079;
 bh=8R5yRhx5HD3Qdpebye/X5fiOJqmtxqaT2hxCrl24IRg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NH88dh1lxv1ZgGw2LykIVmIsCvg40jS4wnMhugJsHZjFjYJ9pLcnnASVl1lXt1MhS
 hgEeTDb//LFMRbykDgY6L3T6i63jABIAQ/2HZXNTSczhTc7aVZiFoDe3MpVi39w1gM
 mL5aTQH/Yw6CKQ8HVfp01PplV2PHALH1t1hJpXemfI2KCljBZRgbiZVGXbT5k3GrL9
 NjSs0AFwUWyvCOXHfdDrLpdCKYlloNwGac43KJK0z/wQzJEIPYhKUZ71PMA62LYYGa
 AhEBjcI5pIupwS9CiIWij5LO+U5H9lgFcDnACuPqKoC0yvFqt86kKnqBREGu3So07G
 R7TWKcvmm6pyQ==
Date: Sun, 23 Jun 2024 16:21:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240623162110.708032af@jic23-huawei>
In-Reply-To: <20240618160836.945242-9-olivier.moysan@foss.st.com>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-9-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 8/8] iio: adc: stm32-dfsdm: add scaling
	support to dfsdm
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

On Tue, 18 Jun 2024 18:08:34 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add scaling support to STM32 DFSDM.
Perhaps a short description here of how this works?  Where does the scale come
from, what assumptions are made etc.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Some minor stuff.

> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 69b4764d7cba..93bf6035bd6d 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
urn 0;
>  }
>  
> @@ -1060,7 +1072,7 @@ static int stm32_dfsdm_update_scan_mode(struct iio_dev *indio_dev,
>  static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> -	int ret;
> +	int i = 0, ret;

Don't mix assigned and unassigned variable declarations. Just use a separate line
as this can mean subtle assignment or lack of assignment issues sneak in.

>  
>  	/* Reset adc buffer index */
>  	adc->bufi = 0;
> @@ -1071,6 +1083,15 @@ static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
>  			return ret;
>  	}
>  
> +	if (adc->backend) {
> +		while (adc->backend[i]) {

Could do similar to the suggestion below.
Mostly I don't like the index variable manipulation.

> +			ret = iio_backend_enable(&indio_dev->dev, adc->backend[i]);
> +			if (ret < 0)
> +				return ret;
> +			i++;
> +		}
> +	}
> +
>  	ret = stm32_dfsdm_start_dfsdm(adc->dfsdm);
>  	if (ret < 0)
>  		goto err_stop_hwc;
> @@ -1103,6 +1124,7 @@ static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
>  static int stm32_dfsdm_predisable(struct iio_dev *indio_dev)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> +	int i = 0;
>  
>  	stm32_dfsdm_stop_conv(indio_dev);
>  
> @@ -1110,6 +1132,13 @@ static int stm32_dfsdm_predisable(struct iio_dev *indio_dev)
>  
>  	stm32_dfsdm_stop_dfsdm(adc->dfsdm);
>  
> +	if (adc->backend) {
> +		while (adc->backend[i]) {
> +			iio_backend_disable(&indio_dev->dev, adc->backend[i]);
> +			i++;
> +		}
Something like
		struct iio_backend **be = &adc->backend[0];
		do {
			iio_backend_disable(&indio-dev->dev, be);
		} while (be++);

maybe. Up to you.
		

> +	}

> @@ -1320,6 +1360,45 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
>  		*val = adc->sample_freq;
>  
>  		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		/*
> +		 * Scale is expressed in mV.
> +		 * When fast mode is disabled, actual resolution may be lower
> +		 * than 2^n, where n=realbits-1.

As below, use a few more spaces.

> +		 * This leads to underestimating input voltage. To
> +		 * compensate this deviation, the voltage reference can be
> +		 * corrected with a factor = realbits resolution / actual max
> +		 */
> +		if (adc->backend[idx]) {
> +			iio_backend_read_raw(adc->backend[idx], val, val2, mask);
> +
> +			*val = div_u64((u64)*val * (u64)BIT(DFSDM_DATA_RES - 1), max);
> +			*val2 = chan->scan_type.realbits;
> +			if (chan->differential)
> +				*val *= 2;
> +		}
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	case IIO_CHAN_INFO_OFFSET:
> +		/*
> +		 * DFSDM output data are in the range [-2^n,2^n],
Use a few more spaces. [-2^2, 2^n]
> +		 * with n=realbits-1.
n = realbits - 1

Just to keep it closer to the C coding style.

> +		 * - Differential modulator:
> +		 * Offset correspond to SD modulator offset.
> +		 * - Single ended modulator:
> +		 * Input is in [0V,Vref] range, where 0V corresponds to -2^n, and Vref to 2^n.

Avoid that long line with a suitable line break.

> +		 * Add 2^n to offset. (i.e. middle of input range)
> +		 * offset = offset(sd) * vref / res(sd) * max / vref.
> +		 */
> +		if (adc->backend[idx]) {
> +			iio_backend_read_raw(adc->backend[idx], val, val2, mask);
> +
> +			*val = div_u64((u64)max * *val, BIT(*val2 - 1));
> +			if (!chan->differential)
> +				*val += max;
> +		}
> +		return IIO_VAL_INT;
>  	}
>  
>  	return -EINVAL;
> @@ -1449,7 +1528,15 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev, struct iio_c
>  	 * IIO_CHAN_INFO_RAW: used to compute regular conversion
>  	 * IIO_CHAN_INFO_OVERSAMPLING_RATIO: used to set oversampling
>  	 */
> -	ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
> +	if (child) {
> +		ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
> +					BIT(IIO_CHAN_INFO_SCALE) |
> +					BIT(IIO_CHAN_INFO_OFFSET);

Indent looks a little odd. Maybe one more space neede?

> +	} else {
> +		/* Legacy. Scaling not supported */
> +		ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
> +	}
> +
>  	ch->info_mask_shared_by_all = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
>  					BIT(IIO_CHAN_INFO_SAMP_FREQ);
>  
> @@ -1816,3 +1903,4 @@ module_platform_driver(stm32_dfsdm_adc_driver);
>  MODULE_DESCRIPTION("STM32 sigma delta ADC");
>  MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS(IIO_BACKEND);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
