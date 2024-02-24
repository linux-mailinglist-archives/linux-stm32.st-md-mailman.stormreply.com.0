Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F6862618
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Feb 2024 17:46:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63419C6B47A;
	Sat, 24 Feb 2024 16:46:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E96A3C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Feb 2024 16:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C189260670;
 Sat, 24 Feb 2024 16:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26BAC433C7;
 Sat, 24 Feb 2024 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708793173;
 bh=WaKeKGy3+AF4oMDKya6UkKp1ld9MGGhzhz+ajHDtjFc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sCpS1cF2awDasZbSEsLJF6vVo4oVuvqCFRX13QH+EjHLvT/ZZdg3IIsXWlcUEeq97
 EKsyA12cR4Rv/ozAsb9nnfotGtHc6Ud575Lz2ExhqHXxjbn9DK0M6xMue5cjdQVOvl
 xm2L+4SchwINHBhZdpCfOjG6i+al2GhLrp5iASavPkefQqaGFzxIs4Bb2w2hNyZYE9
 yiUazsnN3yt9mkVadOdOtj8xNhPu97mCE+OpKlR5VyQUmKNoVLGgZ8yP3P6HiTGYxc
 V8BwkAGT8dhp03Z6ss49FiKfZRq4YsjOWtHHj1+e7SMUUkugmebvxq6rX+KnVyltuy
 QGJAQ6eD8k0Bg==
Date: Sat, 24 Feb 2024 16:45:58 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20240224164558.02c08dd6@jic23-huawei>
In-Reply-To: <20240219-mainline-spi-precook-message-v2-3-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <20240219-mainline-spi-precook-message-v2-3-4a762c6701b9@baylibre.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
 David Jander <david@protonic.nl>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] spi: stm32: move splitting
 transfers to optimize_message
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

On Mon, 19 Feb 2024 16:33:20 -0600
David Lechner <dlechner@baylibre.com> wrote:

> Since splitting transfers was moved to spi_optimize_message() in the
> core SPI code, we now need to use the optimize_message callback in the
> STM32 SPI driver to ensure that the operation is only performed once
> when spi_optimize_message() is used by peripheral drivers explicitly.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Trivial comment inline. Otherwise LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

There are changes to when this happens wrt to locking but I think those
are all positive as the bus lock is held for less time and there
is nothing in here that needs that lock held.
> ---
> 
> v2 changes: none
> 
>  drivers/spi/spi-stm32.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index c32e57bb38bd..e4e7ddb7524a 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1118,6 +1118,21 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int stm32_spi_optimize_message(struct spi_message *msg)
> +{
> +	struct spi_controller *ctrl = msg->spi->controller;
> +	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
> +
> +	/* On STM32H7, messages should not exceed a maximum size set
If you spin a v3, this isn't in keeping with local comment style.

	/*
 	 * On...

> +	 * later via the set_number_of_data function. In order to
> +	 * ensure that, split large messages into several messages
> +	 */
> +	if (spi->cfg->set_number_of_data)
> +		return spi_split_transfers_maxwords(ctrl, msg, spi->t_size_max);
> +
> +	return 0;
> +}
> +
>  /**
>   * stm32_spi_prepare_msg - set up the controller to transfer a single message
>   * @ctrl: controller interface
> @@ -1163,18 +1178,6 @@ static int stm32_spi_prepare_msg(struct spi_controller *ctrl,
>  		!!(spi_dev->mode & SPI_LSB_FIRST),
>  		!!(spi_dev->mode & SPI_CS_HIGH));
>  
> -	/* On STM32H7, messages should not exceed a maximum size setted
> -	 * afterward via the set_number_of_data function. In order to
> -	 * ensure that, split large messages into several messages
> -	 */
> -	if (spi->cfg->set_number_of_data) {
> -		int ret;
> -
> -		ret = spi_split_transfers_maxwords(ctrl, msg, spi->t_size_max);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	spin_lock_irqsave(&spi->lock, flags);
>  
>  	/* CPOL, CPHA and LSB FIRST bits have common register */
> @@ -2180,6 +2183,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
>  	ctrl->max_speed_hz = spi->clk_rate / spi->cfg->baud_rate_div_min;
>  	ctrl->min_speed_hz = spi->clk_rate / spi->cfg->baud_rate_div_max;
>  	ctrl->use_gpio_descriptors = true;
> +	ctrl->optimize_message = stm32_spi_optimize_message;
>  	ctrl->prepare_message = stm32_spi_prepare_msg;
>  	ctrl->transfer_one = stm32_spi_transfer_one;
>  	ctrl->unprepare_message = stm32_spi_unprepare_msg;
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
