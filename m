Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA5853778
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 18:25:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B997FC6DD69;
	Tue, 13 Feb 2024 17:25:55 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8499FC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 17:25:53 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TZ7Rn3QwWz6K5pj;
 Wed, 14 Feb 2024 01:22:13 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id E6EB01400D9;
 Wed, 14 Feb 2024 01:25:51 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 17:25:51 +0000
Date: Tue, 13 Feb 2024 17:25:50 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20240213172550.000023a7@Huawei.com>
In-Reply-To: <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Nuno =?ISO-8859-1?Q?S?= =?ISO-8859-1?Q?=E1?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] spi: add spi_optimize_message() APIs
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

On Mon, 12 Feb 2024 17:26:41 -0600
David Lechner <dlechner@baylibre.com> wrote:

> This adds a new spi_optimize_message() function that can be used to
> optimize SPI messages that are used more than once. Peripheral drivers
> that use the same message multiple times can use this API to perform SPI
> message validation and controller-specific optimizations once and then
> reuse the message while avoiding the overhead of revalidating the
> message on each spi_(a)sync() call.
> 
> Internally, the SPI core will also call this function for each message
> if the peripheral driver did not explicitly call it. This is done to so
> that controller drivers don't have to have multiple code paths for
> optimized and non-optimized messages.
> 
> A hook is provided for controller drivers to perform controller-specific
> optimizations.
> 
> Suggested-by: Martin Sperl <kernel@martin.sperl.org>
> Link: https://lore.kernel.org/linux-spi/39DEC004-10A1-47EF-9D77-276188D2580C@martin.sperl.org/
> Signed-off-by: David Lechner <dlechner@baylibre.com>

A few trivial things inline but looks good to me in general.

I thought about suggesting splitting this into an initial patch that just does
the bits without the controller callbacks. Maybe it would work better that way
with that introduced after the validate and splitting of transfers (so most
of patches 1 and 2) as a patch 3 prior to the stm32 additions?

> ---
>  drivers/spi/spi.c       | 145 ++++++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/spi/spi.h |  19 +++++++
>  2 files changed, 160 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index c2b10e2c75f0..5bac215d7009 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2106,6 +2106,41 @@ struct spi_message *spi_get_next_queued_message(struct spi_controller *ctlr)
>  }
>  EXPORT_SYMBOL_GPL(spi_get_next_queued_message);
>  
> +/**
> + * __spi_unoptimize_message - shared implementation of spi_unoptimize_message()
> + *                            and spi_maybe_unoptimize_message()
> + * @msg: the message to unoptimize
> + *
> + * Periperhal drivers should use spi_unoptimize_message() and callers inside
> + * core should use spi_maybe_unoptimize_message() rather than calling this
> + * function directly.
> + *
> + * It is not valid to call this on a message that is not currently optimized.
> + */
> +static void __spi_unoptimize_message(struct spi_message *msg)
> +{
> +	struct spi_controller *ctlr = msg->spi->controller;
> +
> +	if (ctlr->unoptimize_message)
> +		ctlr->unoptimize_message(msg);
> +
> +	msg->optimized = false;
> +	msg->opt_state = NULL;
> +}

Seems misbalanced that this doesn't take a pre_optimized flag in but
__spi_optimize does. I'd move handling that to outside the call in both cases.


>  	spin_lock_irqsave(&ctlr->bus_lock_spinlock, flags);
> @@ -4271,6 +4401,8 @@ int spi_async(struct spi_device *spi, struct spi_message *message)
>  
>  	spin_unlock_irqrestore(&ctlr->bus_lock_spinlock, flags);
>  
> +	spi_maybe_unoptimize_message(message);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(spi_async);
> @@ -4331,10 +4463,15 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
>  		return -ESHUTDOWN;
>  	}
>  
> -	status = __spi_validate(spi, message);
> -	if (status != 0)
> +	status = spi_maybe_optimize_message(spi, message);
> +	if (status)
>  		return status;
>  
> +	/*
> +	 * NB: all return paths after this point must ensure that
> +	 * spi_finalize_current_message() is called to avoid leaking resources.

I'm not sure a catch all like that makes sense. Not sufficient to call
the finer grained spi_maybe_unoptimize_message()  ?
> +	 */
> +
>  	SPI_STATISTICS_INCREMENT_FIELD(ctlr->pcpu_statistics, spi_sync);
>  	SPI_STATISTICS_INCREMENT_FIELD(spi->pcpu_statistics, spi_sync);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
