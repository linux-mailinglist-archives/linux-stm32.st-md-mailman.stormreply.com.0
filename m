Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6065505BA
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Jun 2022 17:28:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE0F0C03FE0;
	Sat, 18 Jun 2022 15:28:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61FADC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 15:28:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE66060B1E;
 Sat, 18 Jun 2022 15:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B478C3411A;
 Sat, 18 Jun 2022 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655566084;
 bh=BVsNfMePkIkcRLJKxWnrPVHIGrWk4Pmg3MuN5L6XZTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YEdkot7sy/W+8Tns+DaPXCCEzI2fvdOGx22Bzu01XVJf8iNNbwtA36CP5KFedCT2A
 vVTeEbf4JQusT+4Q4NRqHAq+XE03j7Tw+129AY6547iNY6UlS3VKqQWGchghwPYtvZ
 BRVotCHJzS6k2YEJIlWppzi9XTEFpgcmp3hPdmyrVwJCKui6AXYrVbv2nquswlAeFK
 a9V1KPwMnsDbXiGicHxl9048UsoFRB+Dq6OjP4Sb0+1RFjaU0yJW2pxEw22pqYkV2t
 y80531VDnHD8aHXVWFE1aJRiFovycfJgh5G2Re1QIGj60TjuS5YXYCOJ26Z9e6XuOC
 ffXOolx148r3Q==
Date: Sat, 18 Jun 2022 16:37:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20220618163721.1cef64c9@jic23-huawei>
In-Reply-To: <20220616220023.9894-1-andriy.shevchenko@linux.intel.com>
References: <20220616220023.9894-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] iio: dac: stm32-dac: Replace open
 coded str_enable_disable()
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

On Fri, 17 Jun 2022 01:00:23 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Replace open coded str_enable_disable() in error message in
> stm32_dac_set_enable_state().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+CC Fabrice.

Looks good + harmless to me, so I'll pick it up now, but still time
for any additional feedback as I'll only push it out for 0-day to poke
at initially.

Applied to the togreg branch of iio.git.

Thanks,

Jonathan

> ---
>  drivers/iio/dac/stm32-dac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> index e842c15c674d..315d66648210 100644
> --- a/drivers/iio/dac/stm32-dac.c
> +++ b/drivers/iio/dac/stm32-dac.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/string_helpers.h>
>  
>  #include "stm32-dac-core.h"
>  
> @@ -79,8 +80,7 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
>  	ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
>  	mutex_unlock(&dac->lock);
>  	if (ret < 0) {
> -		dev_err(&indio_dev->dev, "%s failed\n", en ?
> -			"Enable" : "Disable");
> +		dev_err(&indio_dev->dev, "%s failed\n", str_enable_disable(en));
>  		goto err_put_pm;
>  	}
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
