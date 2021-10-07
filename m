Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C84425936
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Oct 2021 19:19:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E10C597B3;
	Thu,  7 Oct 2021 17:19:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDE58C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 17:19:14 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 645CA61108;
 Thu,  7 Oct 2021 17:19:10 +0000 (UTC)
Date: Thu, 7 Oct 2021 18:23:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Message-ID: <20211007182314.6c53158e@jic23-huawei>
In-Reply-To: <20210928013902.1341-8-caihuoqing@baidu.com>
References: <20210928013902.1341-1-caihuoqing@baidu.com>
 <20210928013902.1341-8-caihuoqing@baidu.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 8/8] iio: dac: ti-dac7311: Make use of
 the helper function dev_err_probe()
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

On Tue, 28 Sep 2021 09:39:01 +0800
Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Series applied to the togreg branch of iio.git and pushed out as testing for
0-day to see if it can find any problems before I push this out in a place
where it can make a mess of linux-next

Thanks,

Jonathan

> ---
>  drivers/iio/dac/ti-dac7311.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/dac/ti-dac7311.c b/drivers/iio/dac/ti-dac7311.c
> index 9d0b253be841..09218c3029f0 100644
> --- a/drivers/iio/dac/ti-dac7311.c
> +++ b/drivers/iio/dac/ti-dac7311.c
> @@ -266,10 +266,9 @@ static int ti_dac_probe(struct spi_device *spi)
>  	ti_dac->resolution = spec->resolution;
>  
>  	ti_dac->vref = devm_regulator_get(dev, "vref");
> -	if (IS_ERR(ti_dac->vref)) {
> -		dev_err(dev, "error to get regulator\n");
> -		return PTR_ERR(ti_dac->vref);
> -	}
> +	if (IS_ERR(ti_dac->vref))
> +		return dev_err_probe(dev, PTR_ERR(ti_dac->vref),
> +				     "error to get regulator\n");
>  
>  	ret = regulator_enable(ti_dac->vref);
>  	if (ret < 0) {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
