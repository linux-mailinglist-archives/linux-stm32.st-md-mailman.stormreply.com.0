Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538B91CEA4
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jun 2024 21:04:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A3F9C71282;
	Sat, 29 Jun 2024 19:04:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A3C1C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jun 2024 19:03:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3AD7E60B54;
 Sat, 29 Jun 2024 19:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8FCC2BBFC;
 Sat, 29 Jun 2024 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719687833;
 bh=VhwYj9wYMKcVVnuUSektec5JaiNKACPQOUGlOLJi5/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qmie8DnLr6Vjc/blzQEer4aMbo82Jb7MiaMVnje2nVNSePWdJDfRKc3BY/ZkBzHzT
 C/L2Jsqxmx8OrJVy9UPoHDhip063TJY6v836mwM7GF6an5ZruBHdW+dnpY6GjSL1cw
 Hjowd9V4K4PZIYvTYPCzE+9wR9FxRlN0tP8QdTagFy+cYCJpAWyiYTNBrNE2/bNJgQ
 +4X0LFhE6OZABjFhUy/mc5a2M9aeAff2PWSD2nXyqC4Pc4N15CGihDSs56J0PzzjA5
 W0wkuGH4zJ1XgRoxzJ1NSSOBLEhjZE8iz/cVgu9z5I/5SgVLCYvm1+CTPcYyAR9tVB
 pVigWgq+T1Ceg==
Date: Sat, 29 Jun 2024 20:03:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240629200347.4e282f21@jic23-huawei>
In-Reply-To: <20240625150717.1038212-7-olivier.moysan@foss.st.com>
References: <20240625150717.1038212-1-olivier.moysan@foss.st.com>
 <20240625150717.1038212-7-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 6/8] iio: adc: stm32-dfsdm: adopt
 generic channels bindings
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

On Tue, 25 Jun 2024 17:07:14 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Move to generic channels binding to ease new backend framework adoption
> and prepare the convergence with MDF IP support on STM32MP2 SoC family.
> 
> Legacy binding:
> DFSDM is an IIO channel consumer.
> SD modulator is an IIO channels provider.
> The channel phandles are provided in DT through io-channels property
> and channel indexes through st,adc-channels property.
> 
> New binding:
> DFSDM is an IIO channel provider.
> The channel indexes are given by reg property in channel child node.
> 
> This new binding is intended to be used with SD modulator IIO backends.
> It does not support SD modulator legacy IIO devices.
> The st,adc-channels property presence is used to discriminate
> between legacy and backend bindings.
> 
> The support of the DFSDM legacy channels and SD modulator IIO devices
> is kept for backward compatibility.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Hi Olivier

Some minor comments inline.

thanks,

Jonathan



> @@ -1362,15 +1422,20 @@ static int stm32_dfsdm_dma_request(struct device *dev,
>  	return 0;
>  }
>  
> -static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
> -					 struct iio_chan_spec *ch)
> +static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev, struct iio_chan_spec *ch,
> +					 struct fwnode_handle *child)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>  	int ret;
>  
> -	ret = stm32_dfsdm_channel_parse_of(adc->dfsdm, indio_dev, ch);
> -	if (ret < 0)
> +	if (child)
> +		ret = stm32_dfsdm_generic_channel_parse_of(adc->dfsdm, indio_dev, ch, child);
> +	else /* Legacy binding */
> +		ret = stm32_dfsdm_channel_parse_of(adc->dfsdm, indio_dev, ch);
> +	if (ret < 0) {
> +		dev_err(&indio_dev->dev, "Failed to parse channel\n");
>  		return ret;

return dev_err_probe() assuming only called from probe() which I think is the case
but haven't actually checked.


> +	}
>  
>  	ch->type = IIO_VOLTAGE;
>  	ch->indexed = 1;
> @@ -1385,6 +1450,7 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
>  
>  	if (adc->dev_data->type == DFSDM_AUDIO) {
>  		ch->ext_info = dfsdm_adc_audio_ext_info;
> +		ch->scan_index = 0;
>  	} else {
>  		ch->scan_type.shift = 8;
>  	}
> @@ -1392,8 +1458,51 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
>  	ch->scan_type.realbits = 24;
>  	ch->scan_type.storagebits = 32;
>  
> -	return stm32_dfsdm_chan_configure(adc->dfsdm,
> -					  &adc->dfsdm->ch_list[ch->channel]);
> +	return stm32_dfsdm_chan_configure(adc->dfsdm, &adc->dfsdm->ch_list[ch->channel]);
Is there a change here? If it's just a line wrap don't do that in same patch
making real changes.

> +}
> +
> +static int stm32_dfsdm_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
> +{
> +	int num_ch = indio_dev->num_channels;
> +	int chan_idx = 0, ret = 0;

	int ret;

> +
> +	for (chan_idx = 0; chan_idx < num_ch; chan_idx++) {
> +		channels[chan_idx].scan_index = chan_idx;
> +		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], NULL);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev, "Channels init failed\n");
> +			return ret;
			return dev_err_probe()
(I think this is only called from probe?)

> +		}
> +	}
> +
> +	return ret;
return 0;
at least I assume it can't be positive? 
> +}
> +
> +static int stm32_dfsdm_generic_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
> +{
> +	struct fwnode_handle *child;
> +	int chan_idx = 0, ret;
> +
> +	device_for_each_child_node(&indio_dev->dev, child) {

device_for_each_child_node_scoped()  as then you can do direct returns.


> +		/* Skip DAI node in DFSDM audio nodes */
> +		if (fwnode_property_present(child, "compatible"))
> +			continue;
> +
> +		channels[chan_idx].scan_index = chan_idx;
> +		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], child);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev, "Channels init failed\n");
> +			goto err;
return dev_err_probe() once using scoped above.


> +		}
> +
> +		chan_idx++;
> +	}
> +	return chan_idx;
> +
> +err:
> +	fwnode_handle_put(child);
> +
> +	return ret;
>  }
>
>  
> @@ -1430,43 +1547,60 @@ static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)

> -	ch = devm_kcalloc(&indio_dev->dev, num_ch, sizeof(*ch),
> -			  GFP_KERNEL);
> -	if (!ch)
> -		return -ENOMEM;
> +	if (legacy) {
> +		/* Bind to SD modulator IIO device. */
> +		adc->hwc = devm_iio_hw_consumer_alloc(&indio_dev->dev);
> +		if (IS_ERR(adc->hwc))
> +			return -EPROBE_DEFER;

Obviously in the legacy path, but worth a dev_err_probe() because
if we defer, debug info gets stashed away so it is easy to see
why a driver is continuing to defer.

> +	} else {
> +		/* Generic binding. SD modulator IIO device not used. Use SD modulator backend. */
> +		adc->hwc = NULL;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
