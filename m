Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4EB1417EE
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Jan 2020 15:22:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3957C36B0F;
	Sat, 18 Jan 2020 14:22:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FDC8C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jan 2020 14:22:19 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD87A2469A;
 Sat, 18 Jan 2020 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579357337;
 bh=JrvLwcwKSbaYduAx1j/+g7iO4bO/gKI4RPpGC3Yexg0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2F4p9QMA24NQEzvX8OMBVSJIXSbPlzCAGzcy7QK5fdv+s54Bng2xUXf16+eqBBPak
 F4JrGFYDJ/Vsq2R+jFQ2rTEUstN43mvE352lpE1zuRvwXNzyJllpx7bvQL1MrpGvzH
 bfcTjg1H+8ckLLEdj7MCzWokAPBgoAi6Aq+5l65U=
Date: Sat, 18 Jan 2020 14:22:12 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200118142212.55ea44fd@archlinux>
In-Reply-To: <1578921539-6353-1-git-send-email-fabrice.gasnier@st.com>
References: <1578921539-6353-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: etienne.carriere@st.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: don't print an error
 on probe deferral
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

On Mon, 13 Jan 2020 14:18:59 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for some resource.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc-core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 97655d7..2df88d2 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -688,7 +688,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	priv->vref = devm_regulator_get(&pdev->dev, "vref");
>  	if (IS_ERR(priv->vref)) {
>  		ret = PTR_ERR(priv->vref);
> -		dev_err(&pdev->dev, "vref get failed, %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "vref get failed, %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -696,7 +697,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->aclk)) {
>  		ret = PTR_ERR(priv->aclk);
>  		if (ret != -ENOENT) {
> -			dev_err(&pdev->dev, "Can't get 'adc' clock\n");
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&pdev->dev, "Can't get 'adc' clock\n");
>  			return ret;
>  		}
>  		priv->aclk = NULL;
> @@ -706,7 +708,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->bclk)) {
>  		ret = PTR_ERR(priv->bclk);
>  		if (ret != -ENOENT) {
> -			dev_err(&pdev->dev, "Can't get 'bus' clock\n");
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&pdev->dev, "Can't get 'bus' clock\n");
>  			return ret;
>  		}
>  		priv->bclk = NULL;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
