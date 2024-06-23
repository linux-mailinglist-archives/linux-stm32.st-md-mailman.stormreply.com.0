Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C552913BE1
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 17:01:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05264C71287;
	Sun, 23 Jun 2024 15:01:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F44C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 15:01:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48A6DCE0EA9;
 Sun, 23 Jun 2024 15:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D699C2BD10;
 Sun, 23 Jun 2024 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719154878;
 bh=pLL5EMg6eoF8fo4wvsJ8liZlmjZcP3+0z3EaGf28jIo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oZ8Zhmwi++sv43JIaLV3EeEl6tMSMVE08IJQfwF6QpLLYs6I/4wbFsrsOXX5dcEEB
 XeiTJyJHikVUmlEBINZAFZGwqtpkVL2jTMDlSOooQ/uwCu4hoRcVM7JGy4pg/A/ct0
 GL4jsvEtLVRY39ou7VzKS5i5eYfxt6nEBWxbciUr6S8lnlnDNnsIdVxjfOFjdiZS1S
 D9ZE9/YPS/GIttRocC9evp+dqnEB1CE0zWwnqbDDnzQ34aPUyUtKo3Rm+THXS3miKA
 E+eQmYJEmJJH9F3bELBzlD9KX5ZQp7En6tDmjZanwFN57mZtsrCDdAt0nAGsjZofGQ
 jSpdPi6fm+qkQ==
Date: Sun, 23 Jun 2024 16:01:11 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240623160111.3a675e0b@jic23-huawei>
In-Reply-To: <20240618160836.945242-7-olivier.moysan@foss.st.com>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-7-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/8] iio: adc: stm32-dfsdm: adopt generic
 channels bindings
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

On Tue, 18 Jun 2024 18:08:32 +0200
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
Hi Oliver

A few minor things inline.

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 208 ++++++++++++++++++++++++------
>  1 file changed, 171 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 9a47d2c87f05..69b4764d7cba 100644
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
> +	}
> +
> +	if (ch->channel >= dfsdm->num_chs) {
> +		dev_err(&indio_dev->dev, " Error bad channel number %d (max = %d)\n",
> +			ch->channel, dfsdm->num_chs);
> +		return -EINVAL;
> +	}
> +
> +	ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
> +	if (ret < 0) {
> +		dev_err(&indio_dev->dev,
> +			" Error parsing 'label' for idx %d\n", ch->channel);
> +		return ret;
> +	}
> +
> +	df_ch =  &dfsdm->ch_list[ch->channel];
> +	df_ch->id = ch->channel;
> +
> +	ret = fwnode_property_read_string(node, "st,adc-channel-types", &of_str);
> +	if (!ret) {
> +		val = stm32_dfsdm_str2val(of_str, stm32_dfsdm_chan_type);
> +		if (val < 0)
> +			return val;
> +	} else {
> +		val = 0;

Sometimes better to set a default, then override if if the property is read
successfully.
	df_ch->type = 0;
	if (!fwnode_property_read_string()) {
		int val = ...

		df_ch->type = val;
	}
	
etc
	
> +	}
> +	df_ch->type = val;
> +
> +	ret = fwnode_property_read_string(node, "st,adc-channel-clk-src", &of_str);
> +	if (!ret) {
> +		val = stm32_dfsdm_str2val(of_str, stm32_dfsdm_chan_src);
> +		if (val < 0)
> +			return val;
> +	} else {
> +		val = 0;
> +	}
> +	df_ch->src = val;
> +
> +	ret = fwnode_property_read_u32(node, "st,adc-alt-channel", &df_ch->alt_si);
> +	if (ret != -EINVAL)
> +		df_ch->alt_si = 0;

I'm confused. If it does == EINVAL we just silently carry on with alt_si sort
of undefined. I guess 0?

> +
> +	return 0;
> +}
> +

...

> +static int stm32_dfsdm_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
> +{
> +	int num_ch = indio_dev->num_channels;
> +	int chan_idx = 0, ret = 0;
> +
> +	for (chan_idx = 0; chan_idx < num_ch; chan_idx++) {
> +		channels[chan_idx].scan_index = chan_idx;
> +		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], NULL);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev, "Channels init failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
return 0;    I don't think it's ever positive and can't get here with it negative.

> +}
> +
> +static int stm32_dfsdm_generic_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
> +{
> +	struct fwnode_handle *child;
> +	int chan_idx = 0, ret;
> +
> +	device_for_each_child_node(&indio_dev->dev, child) {

device_for_each_child_node_scoped() and direct returns should tidy this up a tiny bit.


> +		/* Skip DAI node in DFSDM audio nodes */
> +		if (fwnode_property_present(child, "compatible"))
> +			continue;
> +
> +		channels[chan_idx].scan_index = chan_idx;
> +		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], child);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev, "Channels init failed\n");
> +			goto err;

This is consistent with existing code, but would be nice to make extensive
use of dev_err_probe() in this driver and this is a gone place for that.
			return dev_err_probe(indio_dev->dev, ret, "...);


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

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
