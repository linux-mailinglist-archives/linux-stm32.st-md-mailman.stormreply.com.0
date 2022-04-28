Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B601513B7E
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Apr 2022 20:24:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7E9DC6046D;
	Thu, 28 Apr 2022 18:24:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC3F1C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 18:24:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D837B82EA7;
 Thu, 28 Apr 2022 18:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E50C385A9;
 Thu, 28 Apr 2022 18:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651170293;
 bh=JXRHqXGYhAN3qdh93Rjj4pMQrePTMavErqL2y6eIzws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YQrU1JHRjIWCkra4lxvDexdfa9qtNic2BsHyXxU6j8u49pwBATTGd4HxWgEvzYSig
 CXHPqaP3RhrfMChRdLXuVJT6cRdmhZWuqVNjSacAYsxIwGeA4uhXT1FlhdVQzD0zE6
 Z4S/O7zAPPh+pA5XqwZEZh0WhNaOhIRCRXB4IwCEC8kIviRtVFX9YzZuTz8HDAJjMb
 Uq3kcuLbZlVtQG7gpMYmXTsRzQJdgBMNmwtJQCJwV+F6ShOXgMz0IrmulqVJkj0lmu
 JEL6yZ6upitM4TjwGyFMmaC2OL3lFGVZlrGNyYVdzeJjNQtAIio1bwYCo4MOxgA+lo
 zJ235mQbq24og==
Date: Thu, 28 Apr 2022 19:33:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20220428193304.016c46a3@jic23-huawei>
In-Reply-To: <20220413185656.21994-1-andriy.shevchenko@linux.intel.com>
References: <20220413185656.21994-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] iio: trigger:
 stm32-lptimer-trigger: Make use of device properties
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

On Wed, 13 Apr 2022 21:56:56 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

MAINTAINERS entry for this one uses extensive wild cards so may
escape scripts...

+CC Fabrice.

> ---
>  drivers/iio/trigger/stm32-lptimer-trigger.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> index 98cdc7e47f3d..af46c10cea92 100644
> --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> @@ -13,6 +13,7 @@
>  #include <linux/mfd/stm32-lptimer.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  
>  /* List Low-Power Timer triggers */
>  static const char * const stm32_lptim_triggers[] = {
> @@ -77,7 +78,7 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	if (of_property_read_u32(pdev->dev.of_node, "reg", &index))
> +	if (device_property_read_u32(&pdev->dev, "reg", &index))
>  		return -EINVAL;
>  
>  	if (index >= ARRAY_SIZE(stm32_lptim_triggers))

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
