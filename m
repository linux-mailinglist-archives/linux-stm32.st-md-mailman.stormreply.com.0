Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E5C946A47
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Aug 2024 17:12:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFD59C712A2;
	Sat,  3 Aug 2024 15:12:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFBE5C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Aug 2024 15:12:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D909060ACA;
 Sat,  3 Aug 2024 15:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11728C4AF0A;
 Sat,  3 Aug 2024 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722697951;
 bh=hKygohsOdeB7ONXdsjrCJbuO58oXWXkp2aNHcwRceSk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EqDYIEQKd2oRqXFxDim9V5p/bk/1AbaQ2C6SahaSHkP20Wdo5/vGP8pcKmO1efEJq
 lcj05rDMqnWZfjqDbGV0/bh7fqY2NjLt+19SzkhS/TnG2eAsMm1jlQ1e86lBNkoVqZ
 ZPvhxZQtdvdHdd7Ot9pTONdyHi/akA0FpdzHgsqgU9E2S8HzRVhPlnGk98sRdGULlN
 etTE5A0McSsz/cFmOekb43mb1W7k5QS8qFUpSlmzTaYjHyZghjWQMS6ck0rlbZkyET
 22SI5AFHPAuOknTKNTnaMZDfWuJ/rO7ogPcL6K+xZPYt82n49nmVwkiV8PDx2GO9j0
 2eddEsOC8m/bA==
Date: Sat, 3 Aug 2024 16:12:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240803161222.1f320fcc@jic23-huawei>
In-Reply-To: <20240730084640.1307938-8-olivier.moysan@foss.st.com>
References: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
 <20240730084640.1307938-8-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 7/9] iio: adc: stm32-dfsdm: adopt
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

On Tue, 30 Jul 2024 10:46:37 +0200
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

One trivial thing noted inline.  If you spin a v7 for other reasons
tidy it up, if not I 'might' (if I remember and can be bothered)
tweak it whilst applying, but probably not.

Jonathan

>  
> +static int stm32_dfsdm_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
> +{
> +	int num_ch = indio_dev->num_channels;
> +	int chan_idx = 0;
> +	int ret;
> +
> +	for (chan_idx = 0; chan_idx < num_ch; chan_idx++) {
> +		channels[chan_idx].scan_index = chan_idx;
> +		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], NULL);
> +		if (ret < 0)
> +			return dev_err_probe(&indio_dev->dev, ret, "Channels init failed\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32_dfsdm_generic_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
> +{
> +	int chan_idx = 0, ret;

As in the above function, I'd have slightly preferred these on separate lines.
If that's all that comes up, I might tweak it whilst applying.

> +
> +	device_for_each_child_node_scoped(&indio_dev->dev, child) {
> +		/* Skip DAI node in DFSDM audio nodes */
> +		if (fwnode_property_present(child, "compatible"))
> +			continue;
> +
> +		channels[chan_idx].scan_index = chan_idx;
> +		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], child);
> +		if (ret < 0)
> +			return dev_err_probe(&indio_dev->dev, ret, "Channels init failed\n");
> +
> +		chan_idx++;
> +	}
> +
> +	return chan_idx;
> +}
> +
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
