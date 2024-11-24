Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8A9D6F2A
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Nov 2024 14:02:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D78DC78F6D;
	Sun, 24 Nov 2024 13:02:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFA67C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Nov 2024 13:02:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A0FC5C432C;
 Sun, 24 Nov 2024 13:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B6DC4CECC;
 Sun, 24 Nov 2024 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732453370;
 bh=V0Bs0Zy6s73HavYwwymncXPcs1ZrjCVcI3abEBI8kTo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kvgsWMVFDc8l3JAe/gPaphm8u9pGpy8kBrXIHOyFRUMmn6TtyoMF6OCneBCQSdacj
 KsOz6wtjYSXlCCWByw1JHoT6gYN4b7nMm9eqnmYjV0Fs/A1T/1TnHU/oKnoimBro1o
 b66ii7FId/S2qyMAlFrgv75ppIOA9xULNGtQFbDvWPCB9K4Wh4PsjIpsBk1M5XxYeA
 oVYt2IYlIVlJNqnYIqF0Xvo5hUvGr1+9rQb2XrXncfUBrlJws11bdcxHg+rb8x7mXh
 yKF3kL+GqsXuWto+2Es8l38TQKx9RLFtZMNAznpgglzFk6rvQqdUTi26hNL+EAuF/a
 UkHh1s6pS05Sg==
Date: Sun, 24 Nov 2024 13:02:41 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20241124130241.60e922ff@jic23-huawei>
In-Reply-To: <20241114102459.2497178-1-olivier.moysan@foss.st.com>
References: <20241114102459.2497178-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: handle label as an
 optional property
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

On Thu, 14 Nov 2024 11:24:59 +0100
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> The label property is defined as optional in the DFSDM binding.
> Parse the label property only when it is defined in the device tree.
> 
> Fixes: 3208fa0cd919 ("iio: adc: stm32-dfsdm: adopt generic channels bindings")
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
This could be done by just ignoring the return of fw_node_property_read_string()
but your fix will do a little more such as report an error if the property is
the wrong type etc, so I'll take it.

Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 2037f73426d4..e304e3714020 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -691,11 +691,14 @@ static int stm32_dfsdm_generic_channel_parse_of(struct stm32_dfsdm *dfsdm,
>  		return -EINVAL;
>  	}
>  
> -	ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
> -	if (ret < 0) {
> -		dev_err(&indio_dev->dev,
> -			" Error parsing 'label' for idx %d\n", ch->channel);
> -		return ret;
> +	if (fwnode_property_present(node, "label")) {
> +		/* label is optional */
> +		ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev,
> +				" Error parsing 'label' for idx %d\n", ch->channel);
> +			return ret;
> +		}
>  	}
>  
>  	df_ch =  &dfsdm->ch_list[ch->channel];

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
