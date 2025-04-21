Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB3FA94FDD
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 13:10:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A567C7802E;
	Mon, 21 Apr 2025 11:10:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28917CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 11:10:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 332A444D6D;
 Mon, 21 Apr 2025 11:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE7AC4CEE4;
 Mon, 21 Apr 2025 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745233828;
 bh=qBNeYTCCeJLPNODBt8loEIk8Uz5A8LZFmdC8vvl9rQM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i0/qTr8hB4VUINlgBBJ+1dH9hr0Bfy6rW8xEjEnkBFICRaT5N5K3To9a48uuNl602
 9Fg7MzxfZyF9nlnJMdZ+rsTUzGYm6wEv0IKfKKgciN9GGdr35379JMNRQ/ps9pA73J
 Jt9qKTv953bM922uwYv6HBi5yEsY3i6zMBGkWkYz9/cKegiPxelGIfbRutEu58cwuP
 qUhnf2uytx6KmLFQd+aVD+zLKJKamHqrcxpr5cQq9S3KtbuWB0z26VFUaKHhkiV+UO
 OTmJr9/4U3csWp5ky5iPWBko0Fc/TOCWtynTBcyHLa+Dy3k62Fhca/Q5Aa5x9V9BT6
 3kDgzPC0jJrgQ==
Date: Mon, 21 Apr 2025 12:10:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250421121018.5b09ea21@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, imx@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Eugen Hristev <eugen.hristev@linaro.org>, Andreas Klinger <ak@it-klinger.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/10] iio: adc: at91-sama5d2_adc: use
 struct with aligned_s64 timestamp
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

On Fri, 18 Apr 2025 14:58:21 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64 timestamp_instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index 414610afcb2c4128a63cf76767803c32cb01ac5e..07ced924f7a6ae36fe538021a45adbf7d76c2e69 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/sched.h>
> +#include <linux/types.h>
>  #include <linux/units.h>
>  #include <linux/wait.h>
>  #include <linux/iio/iio.h>
> @@ -586,15 +587,6 @@ struct at91_adc_temp {
>  	u16				saved_oversampling;
>  };
>  
> -/*
> - * Buffer size requirements:
> - * No channels * bytes_per_channel(2) + timestamp bytes (8)
> - * Divided by 2 because we need half words.
> - * We assume 32 channels for now, has to be increased if needed.
> - * Nobody minds a buffer being too big.
> - */
> -#define AT91_BUFFER_MAX_HWORDS ((32 * 2 + 8) / 2)
> -
>  struct at91_adc_state {
>  	void __iomem			*base;
>  	int				irq;
> @@ -617,7 +609,10 @@ struct at91_adc_state {
>  	struct iio_dev			*indio_dev;
>  	struct device			*dev;
>  	/* Ensure naturally aligned timestamp */
> -	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
> +	struct {
> +		u16 data[32];

When you rework this into the large buffer scheme, can you add a define
or some other means to establish where that 32 comes from!
We've lost the comment as a result of this refactor so need to put that
info back somehow.


> +		aligned_s64 timestamp;
> +	} buffer;
>  	/*
>  	 * lock to prevent concurrent 'single conversion' requests through
>  	 * sysfs.
> @@ -1481,14 +1476,14 @@ static void at91_adc_trigger_handler_nodma(struct iio_dev *indio_dev,
>  		if (chan->type == IIO_VOLTAGE) {
>  			val = at91_adc_read_chan(st, chan->address);
>  			at91_adc_adjust_val_osr(st, &val);
> -			st->buffer[i] = val;
> +			st->buffer.data[i] = val;
>  		} else {
> -			st->buffer[i] = 0;
> +			st->buffer.data[i] = 0;
>  			WARN(true, "This trigger cannot handle this type of channel");
>  		}
>  		i++;
>  	}
> -	iio_push_to_buffers_with_timestamp(indio_dev, st->buffer,
> +	iio_push_to_buffers_with_timestamp(indio_dev, &st->buffer,
>  					   pf->timestamp);
>  }
>  
> @@ -1643,7 +1638,7 @@ static void at91_adc_touch_data_handler(struct iio_dev *indio_dev)
>  			at91_adc_read_pressure(st, chan->channel, &val);
>  		else
>  			continue;
> -		st->buffer[i] = val;
> +		st->buffer.data[i] = val;
>  		i++;
>  	}
>  	/*
> @@ -1691,7 +1686,7 @@ static void at91_adc_workq_handler(struct work_struct *workq)
>  					struct at91_adc_state, touch_st);
>  	struct iio_dev *indio_dev = st->indio_dev;
>  
> -	iio_push_to_buffers(indio_dev, st->buffer);
> +	iio_push_to_buffers(indio_dev, st->buffer.data);
>  }
>  
>  static irqreturn_t at91_adc_interrupt(int irq, void *private)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
