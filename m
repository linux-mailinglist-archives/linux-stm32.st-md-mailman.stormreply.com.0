Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 227EB929897
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jul 2024 17:18:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CCAAC6DD96;
	Sun,  7 Jul 2024 15:18:15 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CEACC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jul 2024 15:18:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 58136CE09B4;
 Sun,  7 Jul 2024 15:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8F9C3277B;
 Sun,  7 Jul 2024 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720365490;
 bh=nrwvdizwdUnWq/TgC1N7CWLVZ+4DMJXfMeLgfNtkTAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iDn7oEle1F/f74ENLBwaPj3e3LC/UeDn62IS4+l5LlN7k97qqkH5GzkdOBbAJXS7G
 ea+mifzh/YMUDK48IJD5rFXHaVJH7to0l+u9HoG3dVRDFrdrmH+paMvkWXZntg+aUY
 mTRTNQdYU9ldDa/Bn1QUIF/szF2pVw1+zS7aZKOgTzrCcbjcmM/AI4X7ZAxHnsceps
 Mvu1afq9snFwgpNUjHb8t0YLPH8jo5sdcGERR+AWwiaAKXaBa897KGmZ2bBTadekDj
 4DBiJXLq+Ffp0+oeUEfXwphxf0eamD32UVNWUGxHNEtn7Enl0hBj+geg270aazZkHL
 RpZxYFn7GdYtQ==
Date: Sun, 7 Jul 2024 16:18:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240707161803.35b6f79f@jic23-huawei>
In-Reply-To: <20240704155338.2387858-7-olivier.moysan@foss.st.com>
References: <20240704155338.2387858-1-olivier.moysan@foss.st.com>
 <20240704155338.2387858-7-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 6/8] iio: adc: stm32-dfsdm: adopt
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

On Thu, 4 Jul 2024 17:53:34 +0200
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

A few minor comments inline given looks like you are going to be doing a v5.

Jonathan


> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 200 ++++++++++++++++++++++++------
>  1 file changed, 164 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index fabd654245f5..ae5d95e38cd7 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -666,6 +666,64 @@ static int stm32_dfsdm_channel_parse_of(struct stm32_dfsdm *dfsdm,
>  	return 0;
>  }
>  
> +static int stm32_dfsdm_generic_channel_parse_of(struct stm32_dfsdm *dfsdm,
> +						struct iio_dev *indio_dev,
> +						struct iio_chan_spec *ch,
> +						struct fwnode_handle *node)
> +{
> +	struct stm32_dfsdm_channel *df_ch;
> +	const char *of_str;
> +	int ret, val;
> +
> +	ret = fwnode_property_read_u32(node, "reg", &ch->channel);
> +	if (ret < 0) {
> +		dev_err(&indio_dev->dev, "Missing channel index %d\n", ret);
> +		return ret;

I think this is only called from probe?
If so, return dev_err_probe() throughout is probably appropriate.

> +	}
...

> @@ -1430,43 +1540,61 @@ static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)
>  {
...

> -	for (chan_idx = 0; chan_idx < num_ch; chan_idx++) {
> -		ch[chan_idx].scan_index = chan_idx;
> -		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &ch[chan_idx]);
> -		if (ret < 0) {
> -			dev_err(&indio_dev->dev, "Channels init failed\n");
> -			return ret;
> -		}
> +		adc->backend = devm_kzalloc(&indio_dev->dev, sizeof(*adc->backend) * num_ch,

devm_kcalloc maybe?
We aren't going to overflow here, but perhaps it is also more readable in that it makes
it clear this is an array of pointers.

However I also wanted to check the type of backend. Tricky as you don't introduce
it until 2 patches later.  Fix that. Also on a series like this, make sure to
step patch by patch and ensure it at least builds. Otherwise bisection might not work
and people get very grumpy if that happens.



> +					    GFP_KERNEL);
> +		if (!adc->backend)
> +			return -ENOMEM;
>  	}
>  
> -	indio_dev->num_channels = num_ch;
> +	ch = devm_kcalloc(&indio_dev->dev, num_ch, sizeof(*ch), GFP_KERNEL);
> +	if (!ch)
> +		return -ENOMEM;
>  	indio_dev->channels = ch;
>  
> +	if (legacy)
> +		ret = stm32_dfsdm_chan_init(indio_dev, ch);
> +	else
> +		ret = stm32_dfsdm_generic_chan_init(indio_dev, ch);
> +	if (ret < 0)
> +		return ret;
> +
>  	init_completion(&adc->completion);
>  
>  	/* Optionally request DMA */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
