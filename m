Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2A77113E
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 20:05:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDDE4C6B46E;
	Sat,  5 Aug 2023 18:05:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B550BC6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 18:05:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A30CD60D3E;
 Sat,  5 Aug 2023 18:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80FEC433C7;
 Sat,  5 Aug 2023 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691258733;
 bh=6ngnT+YpvhD93TEqzBDpiBPquP2+w46b9BGTWjyu8w0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ltdF/niLESAi+aozfLjIa4kbuIJibRedI0s7K6xJq4WCpejM8K0nuWsnKRFVtQmXT
 bh5uEipChE7m5I0WIVZY/LqNHWKYVOcC067ocbBGMcePhrmbZA4OOMKkx2g/41CsMt
 wubx6QngdGf/sGnMeUxZIjqv8ltjliF1eh+udig+gI/vCqOLqfXU3wywGd4PuVLcR7
 QF/SbUyQ/hmzYtHViN9wVgVuXMiHslBRxFE/h3jXj4UxkRCfxDrd6BXsdWY3oFfmh3
 Fj/qMb4sxyv9dnBTnOOvc8WGkJB1s/iW8ESC/apFjnq421auhVGFVUBTlSOSZYc1Qa
 qcE823d/JH3rA==
Date: Sat, 5 Aug 2023 19:05:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andrei Coardos <aboutphysycs@gmail.com>
Message-ID: <20230805190524.5dc00883@jic23-huawei>
In-Reply-To: <20230802133509.29381-1-aboutphysycs@gmail.com>
References: <20230802133509.29381-1-aboutphysycs@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org,
 Alexandru Ardelean <alex@shruggie.ro>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: trigger: stm32-lptimer-trigger:
 remove unneeded platform_set_drvdata()
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

On Wed,  2 Aug 2023 16:35:09 +0300
Andrei Coardos <aboutphysycs@gmail.com> wrote:

> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>

Oops. Missed there was a v2.  Ah well, end result the same ;)

Thanks,

Jonathan

> ---
> 
> Changelog V1->V2:
> 
> * https://lore.kernel.org/linux-iio/CAH3L5QpuoDYU6qvWH7_z5Yx0cW2qPMbCA8AFEYAPsiEkSzCiwQ@mail.gmail.com/T/#t
> * Adjusted the returning values of the function
> 
> 
>  drivers/iio/trigger/stm32-lptimer-trigger.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> index df2416e33375..ab1cc6a05f26 100644
> --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> @@ -88,11 +88,7 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
>  	priv->dev = &pdev->dev;
>  	priv->trg = stm32_lptim_triggers[index];
>  
> -	ret = stm32_lptim_setup_trig(priv);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return stm32_lptim_setup_trig(priv);
>  }
>  
>  static const struct of_device_id stm32_lptim_trig_of_match[] = {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
