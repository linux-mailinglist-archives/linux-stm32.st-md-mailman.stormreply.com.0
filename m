Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E685384C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 18:35:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 905C7C6DD69;
	Tue, 13 Feb 2024 17:35:48 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D8B2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 17:35:47 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TZ7gT4cFdz67LmL;
 Wed, 14 Feb 2024 01:32:21 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id A9F471400D9;
 Wed, 14 Feb 2024 01:35:46 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 17:35:46 +0000
Date: Tue, 13 Feb 2024 17:35:45 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20240213173545.00006564@Huawei.com>
In-Reply-To: <20240212-mainline-spi-precook-message-v1-2-a2373cd72d36@baylibre.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-2-a2373cd72d36@baylibre.com>
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
Subject: Re: [Linux-stm32] [PATCH 2/5] spi: move splitting transfers to
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

On Mon, 12 Feb 2024 17:26:42 -0600
David Lechner <dlechner@baylibre.com> wrote:

> Splitting transfers is an expensive operation so we can potentially
> optimize it by doing it only once per optimization of the message
> instead of repeating each time the message is transferred.
> 
> The transfer splitting functions are currently the only user of
> spi_res_alloc() so spi_res_release() can be safely moved at this time
> from spi_finalize_current_message() to spi_unoptimize_message().
> 
> The doc comments of the public functions for splitting transfers are
> also updated so that callers will know when it is safe to call them
> to ensure proper resource management.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
Trivial thing (which applies equally to the original code).
Otherwise LGTM.
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> +/**
> + * spi_split_transfers - generic handling of transfer splitting
> + * @msg: the message to split
> + *
> + * Under certain conditions, a SPI controller may not support arbitrary
> + * transfer sizes or other features required by a peripheral. This function
> + * will split the transfers in the message into smaller transfers that are
> + * supported by the controller.
> + *
> + * Controllers with special requirements not covered here can also split
> + * transfers in the optimize_message() callback.
> + *
> + * Context: can sleep
> + * Return: zero on success, else a negative error code
> + */
> +static int spi_split_transfers(struct spi_message *msg)
> +{
> +	struct spi_controller *ctlr = msg->spi->controller;
> +	struct spi_transfer *xfer;
> +	int ret;
> +
> +	/*
> +	 * If an SPI controller does not support toggling the CS line on each
> +	 * transfer (indicated by the SPI_CS_WORD flag) or we are using a GPIO
> +	 * for the CS line, we can emulate the CS-per-word hardware function by
> +	 * splitting transfers into one-word transfers and ensuring that
> +	 * cs_change is set for each transfer.
> +	 */
> +	if ((msg->spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WORD) ||
> +					       spi_is_csgpiod(msg->spi))) {
	if ((msg->spi->mode & SPI_CS_WORD) &&
	    (!(ctlr->mode_bits & SPI_CS_WORD) || spi_is_csgpiod(msg->spi))) {

Seems easier to read to me. I appreciate you are just moving it though so
don't mind that much if you leave it in the original form.



> +		ret = spi_split_transfers_maxwords(ctlr, msg, 1);
> +		if (ret)
> +			return ret;
> +
> +		list_for_each_entry(xfer, &msg->transfers, transfer_list) {
> +			/* Don't change cs_change on the last entry in the list */
> +			if (list_is_last(&xfer->transfer_list, &msg->transfers))
> +				break;
> +
> +			xfer->cs_change = 1;
> +		}
> +	} else {
> +		ret = spi_split_transfers_maxsize(ctlr, msg,
> +						  spi_max_transfer_size(msg->spi));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
