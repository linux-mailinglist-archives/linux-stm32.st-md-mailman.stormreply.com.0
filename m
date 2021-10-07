Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7AF42590D
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Oct 2021 19:14:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5847C597B3;
	Thu,  7 Oct 2021 17:14:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 603DAC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 17:14:25 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE32E61108;
 Thu,  7 Oct 2021 17:14:20 +0000 (UTC)
Date: Thu, 7 Oct 2021 18:18:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Message-ID: <20211007181741.65f56d13@jic23-huawei>
In-Reply-To: <20210928013902.1341-1-caihuoqing@baidu.com>
References: <20210928013902.1341-1-caihuoqing@baidu.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] iio: dac: ad8801: Make use of the
 helper function dev_err_probe()
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

On Tue, 28 Sep 2021 09:38:54 +0800
Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Hi Cai,

I made a modification to this patch whilst applying as described below.
Please take care to not mix different types of change like you did here
in one patch.

With that change applied to the togreg branch of iio.git and pushed out as testing
for 0-day to work it's magic and see if we missed anything,

Thanks,

Jonathan

> ---
>  drivers/iio/dac/ad8801.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/dac/ad8801.c b/drivers/iio/dac/ad8801.c
> index 6354b7c8f052..8acb9fee273c 100644
> --- a/drivers/iio/dac/ad8801.c
> +++ b/drivers/iio/dac/ad8801.c
> @@ -123,10 +123,9 @@ static int ad8801_probe(struct spi_device *spi)
>  	id = spi_get_device_id(spi);
>  
>  	state->vrefh_reg = devm_regulator_get(&spi->dev, "vrefh");
> -	if (IS_ERR(state->vrefh_reg)) {
> -		dev_err(&spi->dev, "Vrefh regulator not specified\n");
> -		return PTR_ERR(state->vrefh_reg);
> -	}
> +	if (IS_ERR(state->vrefh_reg))
> +		return dev_err_probe(&spi->dev, PTR_ERR(state->vrefh_reg),
> +				     "Vrefh regulator not specified\n");
>  
>  	ret = regulator_enable(state->vrefh_reg);
>  	if (ret) {
> @@ -146,15 +145,15 @@ static int ad8801_probe(struct spi_device *spi)
>  	if (id->driver_data == ID_AD8803) {
>  		state->vrefl_reg = devm_regulator_get(&spi->dev, "vrefl");
>  		if (IS_ERR(state->vrefl_reg)) {
> -			dev_err(&spi->dev, "Vrefl regulator not specified\n");
> -			ret = PTR_ERR(state->vrefl_reg);
> +			ret = dev_err_probe(&spi->dev, PTR_ERR(state->vrefl_reg),
> +					    "Vrefl regulator not specified\n");
>  			goto error_disable_vrefh_reg;
>  		}
>  
>  		ret = regulator_enable(state->vrefl_reg);
>  		if (ret) {
> -			dev_err(&spi->dev, "Failed to enable vrefl regulator: %d\n",
> -					ret);
> +			dev_err(&spi->dev,
> +				"Failed to enable vrefl regulator: %d\n", ret);
This last change is unconnected to the rest of the patch. I've dropped it whilst
applying.

>  			goto error_disable_vrefh_reg;
>  		}
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
