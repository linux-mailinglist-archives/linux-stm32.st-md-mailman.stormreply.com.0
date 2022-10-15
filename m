Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA05FFB1E
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Oct 2022 17:56:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D0F3C64112;
	Sat, 15 Oct 2022 15:56:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66B85C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Oct 2022 15:56:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 200C260C5E;
 Sat, 15 Oct 2022 15:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDBCC433D6;
 Sat, 15 Oct 2022 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665849385;
 bh=QGSTjg5RYI5bnHPXoE3XKdNotgMZOaQIAFpSpm3dcI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gg82aqVOXCtuNJfFEX2Xn/i+g8Z3yiXXg9hlOSFeCFRv1sqhtP0kUMU5WxRlobdfg
 d68+7eDOVWjNm5+PDT564x9JpWbpPdFSSHsmTPl5oCN0+lP8S39ia6HY7aK2BJ0ipx
 tkwELDC2kB0DyCIh9njpFt01uWryuUdb/xU288n9gBSdMu+TLdHi9zpcvwcUC2Xi7P
 /uAI/NWfFaAxd4TJ6nJ0NHTsjZeSVJoO+wbJvBQAoSTQqFfqYXWaonztdx/yspiSOd
 Zjrc9u3faL6mIoEHHxkinWLz/8b1uemnJUzMWKmW+6Tv/swI4stctso0P3ObDn4x4P
 uNfvT+EWVm1Fw==
Date: Sat, 15 Oct 2022 16:56:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20221015165649.7720a101@jic23-huawei>
In-Reply-To: <20221012142205.13041-2-olivier.moysan@foss.st.com>
References: <20221012142205.13041-1-olivier.moysan@foss.st.com>
 <20221012142205.13041-2-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/8] iio: adc: stm32-adc: fix channel
 sampling time init
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

On Wed, 12 Oct 2022 16:21:58 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Fix channel init for ADC generic channel bindings.
> In generic channel initialization, stm32_adc_smpr_init() is called to
> initialize channel sampling time. The "st,min-sample-time-ns" property
> is an optional property. If it is not defined, stm32_adc_smpr_init() is
> currently skipped.
> However stm32_adc_smpr_init() must always be called, to force a minimum
> sampling time for the internal channels, as the minimum sampling time is
> known. Make stm32_adc_smpr_init() call unconditional.
> 
> Fixes: 796e5d0b1e9b ("iio: adc: stm32-adc: use generic binding for sample-time")
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

So I'm crossing my fingers a little that this fix and the rest of the series can
go through different paths - looks like it should be clean.

Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 6256977eb7f7..3cda529f081d 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -2086,18 +2086,19 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>  		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
>  					vin[1], scan_index, differential);
>  
> +		val = 0;
>  		ret = fwnode_property_read_u32(child, "st,min-sample-time-ns", &val);
>  		/* st,min-sample-time-ns is optional */
> -		if (!ret) {
> -			stm32_adc_smpr_init(adc, channels[scan_index].channel, val);
> -			if (differential)
> -				stm32_adc_smpr_init(adc, vin[1], val);
> -		} else if (ret != -EINVAL) {
> +		if (ret && ret != -EINVAL) {
>  			dev_err(&indio_dev->dev, "Invalid st,min-sample-time-ns property %d\n",
>  				ret);
>  			goto err;
>  		}
>  
> +		stm32_adc_smpr_init(adc, channels[scan_index].channel, val);
> +		if (differential)
> +			stm32_adc_smpr_init(adc, vin[1], val);
> +
>  		scan_index++;
>  	}
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
