Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38AA94FE2
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 13:11:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A6A7C7802E;
	Mon, 21 Apr 2025 11:11:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9032FCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 11:11:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B15B460008;
 Mon, 21 Apr 2025 11:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09667C4CEE4;
 Mon, 21 Apr 2025 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745233906;
 bh=xIOsJ++5ldkl33Ki3QyxhNNEyh/er5ilQpmhljgokC0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JPSKx+d1iKqilsixLE1m1PbLAH9n0c75A2xNSjkla7Z/w6WMcIII6RrrfYIINWeeT
 4eQBAT8W1T06j1O+nSRF/msnKL3PrFMIufjYvetCaAtpS0ARBD2VbxTySnpVFCIyMr
 ao2x0lt/2hyq8UMtbWdYW/EHAOo54ZSRqwXyv1/VI93zjryiB28+S7VkvipNzHlTdi
 NINLEe8eAoS/GKxLz4GWKVX2AcmCS+qVhILaUf1dxmIcBWmVTibrY9sC1rjsxSDkMe
 9Y8j1GoxtQLp01t/NTlOPsp7Oc8TDEht+aWOxS+yqAN90aEjs2YTBnhcDJ+QSDtTcp
 1q37DQAEoUoYg==
Date: Mon, 21 Apr 2025 12:11:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250421121137.26e30217@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-3-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <20250418-iio-prefer-aligned_s64-timestamp-v1-3-4c6080710516@baylibre.com>
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
Subject: Re: [Linux-stm32] [PATCH 03/10] iio: adc: hx711: use struct with
 aligned_s64 timestamp
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

On Fri, 18 Apr 2025 14:58:22 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64_timestamp instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
This one is good and doesn't have the issue with moving timestamps.

Applied.
> ---
>  drivers/iio/adc/hx711.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 8da0419ecfa3575aa54a93707c681ec8ced28be8..7235fa9e13d57c693751757c5d40e8a799622f17 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
> @@ -87,7 +87,10 @@ struct hx711_data {
>  	 * triggered buffer
>  	 * 2x32-bit channel + 64-bit naturally aligned timestamp
>  	 */
> -	u32			buffer[4] __aligned(8);
> +	struct {
> +		u32 channel[2];
> +		aligned_s64 timestamp;
> +	} buffer;
>  	/*
>  	 * delay after a rising edge on SCK until the data is ready DOUT
>  	 * this is dependent on the hx711 where the datasheet tells a
> @@ -361,15 +364,15 @@ static irqreturn_t hx711_trigger(int irq, void *p)
>  
>  	mutex_lock(&hx711_data->lock);
>  
> -	memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> +	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
>  
>  	iio_for_each_active_channel(indio_dev, i) {
> -		hx711_data->buffer[j] = hx711_reset_read(hx711_data,
> +		hx711_data->buffer.channel[j] = hx711_reset_read(hx711_data,
>  					indio_dev->channels[i].channel);
>  		j++;
>  	}
>  
> -	iio_push_to_buffers_with_timestamp(indio_dev, hx711_data->buffer,
> +	iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer,
>  							pf->timestamp);
>  
>  	mutex_unlock(&hx711_data->lock);
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
