Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D06A9500A
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 13:15:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E11AEC7802E;
	Mon, 21 Apr 2025 11:15:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53986CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 11:15:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B7285C5784;
 Mon, 21 Apr 2025 11:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D609C4CEE4;
 Mon, 21 Apr 2025 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745234131;
 bh=TdFSkW6rqypU0+ImrYwDMTJM3iLFX0OMR7ZgNNK8YxA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Myzm4XAFqBLGoeUjlyfyQjhc7KPyaHZA16g4xxJMBb7l20uElkuxTHmsAWf8saup6
 adlybNGy/G7BUnaHEPf8718dBJGEgRFuQeQkCxtqX8Bn9p/2l2vvxhcpjI9hB0bsPM
 lJ2+qyke6mrPwKI8Hh8un4rovBOZX2OkCk4Q8X9nn227DZEF2okAnm8j/vbca6YH+g
 VaMbt/bih3JxM+cQak8hKBgGM5Hm7usTKDTOQkny7+xPYSR7/bJtZQyYZOZQ94UFRL
 zmDWSIkMfemzQLrVhOmcFqQVVSellMq3+ImJPvJP9nDSEsU1RBZZE8h7a7SANHZNZ4
 E3UN3wWgZ/wMQ==
Date: Mon, 21 Apr 2025 12:15:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250421121519.4189bd3d@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-6-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <20250418-iio-prefer-aligned_s64-timestamp-v1-6-4c6080710516@baylibre.com>
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
Subject: Re: [Linux-stm32] [PATCH 06/10] iio: adc: ti-adc0832: use struct
 with aligned_s64 timestamp
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

On Fri, 18 Apr 2025 14:58:25 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64_timestamp instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/ti-adc0832.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-adc0832.c b/drivers/iio/adc/ti-adc0832.c
> index cfcdafbe284b103a069857028886411bc72dea4f..f508f7113faa2610a2889f3c36c5a679fa72264d 100644
> --- a/drivers/iio/adc/ti-adc0832.c
> +++ b/drivers/iio/adc/ti-adc0832.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/spi/spi.h>
> +#include <linux/types.h>
>  #include <linux/iio/iio.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/iio/buffer.h>
> @@ -29,12 +30,10 @@ struct adc0832 {
>  	struct regulator *reg;
>  	struct mutex lock;
>  	u8 mux_bits;
> -	/*
> -	 * Max size needed: 16x 1 byte ADC data + 8 bytes timestamp
> -	 * May be shorter if not all channels are enabled subject
> -	 * to the timestamp remaining 8 byte aligned.

If the comment is going, we need to capture that there are 16 channels
via a define or a comment.

This one probably wants to stay as a buffer but the same will apply to a new
patch doing that.


> -	 */
> -	u8 data[24] __aligned(8);
> +	struct {
> +		u8 data[16];
> +		aligned_s64 timestamp;
> +	} buffer;
>  
>  	u8 tx_buf[2] __aligned(IIO_DMA_MINALIGN);
>  	u8 rx_buf[2];
> @@ -222,10 +221,10 @@ static irqreturn_t adc0832_trigger_handler(int irq, void *p)
>  			goto out;
>  		}
>  
> -		adc->data[i] = ret;
> +		adc->buffer.data[i] = ret;
>  		i++;
>  	}
> -	iio_push_to_buffers_with_ts(indio_dev, adc->data, sizeof(adc->data),
> +	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
>  				    iio_get_time_ns(indio_dev));
>  out:
>  	mutex_unlock(&adc->lock);
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
