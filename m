Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B92FC267EFE
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Sep 2020 11:45:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6459BC3FADE;
	Sun, 13 Sep 2020 09:45:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56AD6C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Sep 2020 09:45:12 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74CB920796;
 Sun, 13 Sep 2020 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599990310;
 bh=k+BofSh+QwxaRrl2wyYgP2XKH965o2mEBGH18y12SN0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R7Xyly+0py1yFDNy5z9Dh+KtcMDagJ/XnH2dOjPUi2EzQ0MB94hTe5lZUuD3ds1oI
 1YfSWb9X8ggHn4eTYxY8BH4KdcYnh1tDHeTk4575oCcSDtJkGbgmvaEZ2blBYqGQ+T
 T9IYUxCO7TThqJrsPv46K0SvY81J31CwVPYOk62o=
Date: Sun, 13 Sep 2020 10:45:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200913104505.1e4b661c@archlinux>
In-Reply-To: <1599727927-7776-1-git-send-email-krzk@kernel.org>
References: <1599727927-7776-1-git-send-email-krzk@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Greg KH <greg@kroah.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32: Fix missing return in
 booster error path
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

On Thu, 10 Sep 2020 10:52:07 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Conversion of error paths to dev_err_probe() dropped one return
> statement.  The driver will continue to probe if getting booster
> regulator fails.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: ce30eeb613cb ("iio: adc: stm32: Simplify with dev_err_probe()")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to poke at it.

Thanks,

Jonathan

> 
> ---
> 
> Commit sha from linux-next.

This is applying to an (in theory) non rebasing tree, so hopefully
that will remain stable!

> ---
>  drivers/iio/adc/stm32-adc-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 3f27b4817a42..6a0338d33bd8 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -595,7 +595,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  		if (IS_ERR(priv->booster)) {
>  			ret = PTR_ERR(priv->booster);
>  			if (ret != -ENODEV)
> -				dev_err_probe(dev, ret, "can't get booster\n");
> +				return dev_err_probe(dev, ret, "can't get booster\n");
>  
>  			priv->booster = NULL;
>  		}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
