Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C18537B3
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 18:28:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 093CAC6DD69;
	Tue, 13 Feb 2024 17:28:36 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A5C7C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 17:28:35 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TZ7W919xfz67LmL;
 Wed, 14 Feb 2024 01:25:09 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 32A7C1400D9;
 Wed, 14 Feb 2024 01:28:34 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 17:28:33 +0000
Date: Tue, 13 Feb 2024 17:28:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20240213172832.00004fab@Huawei.com>
In-Reply-To: <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
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
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: adc: ad7380: use
	spi_optimize_message()
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

On Mon, 12 Feb 2024 17:26:45 -0600
David Lechner <dlechner@baylibre.com> wrote:

> This modifies the ad7380 ADC driver to use spi_optimize_message() to
> optimize the SPI message for the buffered read operation. Since buffered
> reads reuse the same SPI message for each read, this can improve
> performance by reducing the overhead of setting up some parts the SPI
> message in each spi_sync() call.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/ad7380.c | 52 +++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
> index abd746aef868..5c5d2642a474 100644
> --- a/drivers/iio/adc/ad7380.c
> +++ b/drivers/iio/adc/ad7380.c
> @@ -133,6 +133,7 @@ struct ad7380_state {
>  	struct spi_device *spi;
>  	struct regulator *vref;
>  	struct regmap *regmap;
> +	struct spi_message *msg;
>  	/*
>  	 * DMA (thus cache coherency maintenance) requires the
>  	 * transfer buffers to live in their own cache lines.
> @@ -231,19 +232,55 @@ static int ad7380_debugfs_reg_access(struct iio_dev *indio_dev, u32 reg,
>  	return ret;
>  }
>  
> +static int ad7380_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad7380_state *st = iio_priv(indio_dev);
> +	struct spi_transfer *xfer;
> +	int ret;
> +
> +	st->msg = spi_message_alloc(1, GFP_KERNEL);

As it only ever has one element, is there a clear advantage over
just embedding the spi_message in the structure rather than
as a separate allocation? You'd need the transfer as well.

	spi_message_init_with_transfers(st->msg, &st->trans, 1);

The transfer is then also available without walking the list (though
obviously you don't walk very far ;).

> +	if (!st->msg)
> +		return -ENOMEM;
> +
> +	xfer = list_first_entry(&st->msg->transfers, struct spi_transfer,
> +				transfer_list);
> +
> +	xfer->bits_per_word = st->chip_info->channels[0].scan_type.realbits;
> +	xfer->len = 4;
> +	xfer->rx_buf = st->scan_data.raw;
> +
> +	ret = spi_optimize_message(st->spi, st->msg);
> +	if (ret) {
> +		spi_message_free(st->msg);
Would avoid freeing explicitly here or later if it was embedded in
struct ad7380_state

Also, this doesn't seem very dynamic in general. Anything stopping this
being done at probe() as a one time thing?

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ad7380_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ad7380_state *st = iio_priv(indio_dev);
> +
> +	spi_unoptimize_message(st->msg);
> +	spi_message_free(st->msg);
> +
> +	return 0;
> +}
> +
> +static const struct iio_buffer_setup_ops ad7380_buffer_setup_ops = {
> +	.preenable = ad7380_buffer_preenable,
> +	.postdisable = ad7380_buffer_postdisable,
> +};
> +
>  static irqreturn_t ad7380_trigger_handler(int irq, void *p)
>  {
>  	struct iio_poll_func *pf = p;
>  	struct iio_dev *indio_dev = pf->indio_dev;
>  	struct ad7380_state *st = iio_priv(indio_dev);
> -	struct spi_transfer xfer = {
> -		.bits_per_word = st->chip_info->channels[0].scan_type.realbits,
> -		.len = 4,
> -		.rx_buf = st->scan_data.raw,
> -	};
>  	int ret;
>  
> -	ret = spi_sync_transfer(st->spi, &xfer, 1);
> +	ret = spi_sync(st->spi, st->msg);
>  	if (ret)
>  		goto out;
>  
> @@ -420,7 +457,8 @@ static int ad7380_probe(struct spi_device *spi)
>  
>  	ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev,
>  					      iio_pollfunc_store_time,
> -					      ad7380_trigger_handler, NULL);
> +					      ad7380_trigger_handler,
> +					      &ad7380_buffer_setup_ops);
>  	if (ret)
>  		return ret;
>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
