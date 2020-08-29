Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA1325685B
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Aug 2020 16:34:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDFF7C32E90;
	Sat, 29 Aug 2020 14:34:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE478C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Aug 2020 14:34:33 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49EF92065F;
 Sat, 29 Aug 2020 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598711672;
 bh=Bt2LcvmRA8aueOn9MiH2KddIvcJ9ARbLl4fgBrMMH28=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wFpkbrgQQGSDHhMuRaTI5o3Q0C950XgQuaRIAhBM2rJVMsZnepCaD0CwIu0xjxS6I
 NkHjakIMpm68h3NjuQT1PFOxzrNnF/Ae4Y/XEfVdcM62EQV1sWjQvLqO3saoLy3LmP
 /aA2XwUc/M9D+lR7f8pKp0RiwWLhQSTsw4dR++9w=
Date: Sat, 29 Aug 2020 15:34:26 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200829153426.5430ad8b@archlinux>
In-Reply-To: <20200829064726.26268-1-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-amlogic@lists.infradead.org, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 01/18] iio: accel: bma180: Simplify
 with dev_err_probe()
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

On Sat, 29 Aug 2020 08:47:09 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Series applied to the togreg branch of iio.git. I'll push that out
as testing for the autobuilders to play with it sometime later
today.

Thanks,

Jonathan

> ---
>  drivers/iio/accel/bma180.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> index 5b7a467c7b27..448faed001fd 100644
> --- a/drivers/iio/accel/bma180.c
> +++ b/drivers/iio/accel/bma180.c
> @@ -1000,19 +1000,15 @@ static int bma180_probe(struct i2c_client *client,
>  		return ret;
>  
>  	data->vdd_supply = devm_regulator_get(dev, "vdd");
> -	if (IS_ERR(data->vdd_supply)) {
> -		if (PTR_ERR(data->vdd_supply) != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get vdd regulator %d\n",
> -				(int)PTR_ERR(data->vdd_supply));
> -		return PTR_ERR(data->vdd_supply);
> -	}
> +	if (IS_ERR(data->vdd_supply))
> +		return dev_err_probe(dev, PTR_ERR(data->vdd_supply),
> +				     "Failed to get vdd regulator\n");
> +
>  	data->vddio_supply = devm_regulator_get(dev, "vddio");
> -	if (IS_ERR(data->vddio_supply)) {
> -		if (PTR_ERR(data->vddio_supply) != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get vddio regulator %d\n",
> -				(int)PTR_ERR(data->vddio_supply));
> -		return PTR_ERR(data->vddio_supply);
> -	}
> +	if (IS_ERR(data->vddio_supply))
> +		return dev_err_probe(dev, PTR_ERR(data->vddio_supply),
> +				     "Failed to get vddio regulator\n");
> +
>  	/* Typical voltage 2.4V these are min and max */
>  	ret = regulator_set_voltage(data->vdd_supply, 1620000, 3600000);
>  	if (ret)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
