Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A874A0AA74
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2025 16:27:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AA43C78013;
	Sun, 12 Jan 2025 15:27:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7433C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 15:27:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C18C65C41F2;
 Sun, 12 Jan 2025 15:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B44C4CEDF;
 Sun, 12 Jan 2025 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736695620;
 bh=oQB4d3mtZNWze0IAzdVih8xUg0nziFR7hFNGRVfmzgE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kXvUmjwYxKBceJrH7aU+jE3oW4MizvS+7TZOOGhRVef3y974AtqDgPhhSbN5MHvZ/
 lNT3GFCnRq9q9j2ahjyqJXyLI5jTEN0bX3pKN6jqsPC/Ovmg86d2l8Sn2ARdOGBeNd
 VxLvnzWvHhRW+it2C6E0v/8hG8d8b8pVfn8iMvaYCIzr7qWP6Pr4wtX72D0uV0LyDV
 m9NcJ7bppwlg/g9ZhIMZdAWcniFm7wcCZMJO0ZyBIsY3qpcnxFKX0ZJjpioldI+jH9
 p7qgS44K0n2rHjrHf3yVJCp+Cm2Xbbwix4fhCm1sUr2O9J8z+O7hkGAHl0ieVwyRfg
 3ezxYbJcuTH+w==
Date: Sun, 12 Jan 2025 15:26:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20250112152651.30b343dd@jic23-huawei>
In-Reply-To: <20250109182325.3973684-2-robh@kernel.org>
References: <20250109182325.3973684-2-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32: Drop unnecessary DT
 property presence check
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

On Thu,  9 Jan 2025 12:23:25 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> There's no reason to check for regulator supply property presence before
> calling devm_regulator_get_optional() as that will return -ENODEV if
> the supply is not present.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> The diff context doesn't show it, but the next line returns on error 
> other than -ENODEV.
Thanks for that. Saved me opening the file.

Applied to the testing branch of iio.git. Probably next cycle material now.

Jonathan

> 
>  drivers/iio/adc/stm32-adc-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 2201ee9987ae..0914148d1a22 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -615,8 +615,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  	}
>  
>  	/* Booster can be used to supply analog switches (optional) */
> -	if (priv->cfg->has_syscfg & HAS_VBOOSTER &&
> -	    of_property_read_bool(np, "booster-supply")) {
> +	if (priv->cfg->has_syscfg & HAS_VBOOSTER) {
>  		priv->booster = devm_regulator_get_optional(dev, "booster");
>  		if (IS_ERR(priv->booster)) {
>  			ret = PTR_ERR(priv->booster);
> @@ -628,8 +627,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  	}
>  
>  	/* Vdd can be used to supply analog switches (optional) */
> -	if (priv->cfg->has_syscfg & HAS_ANASWVDD &&
> -	    of_property_read_bool(np, "vdd-supply")) {
> +	if (priv->cfg->has_syscfg & HAS_ANASWVDD) {
>  		priv->vdd = devm_regulator_get_optional(dev, "vdd");
>  		if (IS_ERR(priv->vdd)) {
>  			ret = PTR_ERR(priv->vdd);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
