Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E97A95003
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 13:13:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B63CDC7802E;
	Mon, 21 Apr 2025 11:13:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D192CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 11:13:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7576E61154;
 Mon, 21 Apr 2025 11:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B71C4CEE4;
 Mon, 21 Apr 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745234033;
 bh=EUhH7aYFac9sc/wyQBo7qu9EZp51eX8uWaVTZ7t44SY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z6iQy0ik2BTl7s407AP+AfzItY2uswsoguchw3FTINiQsSrBLAuEZYES6USY//DtU
 dbGQXhuT7sZQDUDlNVmOXdb6gqoYTT9zz6aAOyUN+D8qdUwlQV8NSJtS+aqZ8wuzWs
 LirPseKUdVmMDj9uMZ8GPSw4gcnRaHhmJXfPzvDzGHJPYtkQQgta9fvLZehOmlHbBJ
 dM/xZ01zxcy7IIso4vPq3WgwbhE8gxiGE6YuQme/B3pC4F1nS+3gpqS9Alq7++1UO4
 b3pY8j/0zwZGNuG1g2mvbKB1ZezgdUgi6mzX+PToeB5c0LmCJyr41X1GXyTDF0JXJc
 VAU4B6xPAE1Vg==
Date: Mon, 21 Apr 2025 12:13:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250421121341.49e28ddf@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
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
Subject: Re: [Linux-stm32] [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct
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

On Fri, 18 Apr 2025 14:58:23 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64_timestamp instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/mxs-lradc-adc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
> index 92baf3f5f5601b863c694eb03b6d8f287e4fe6ab..73e42f0ebcaeaaa437ba5c64ecdd7759a1191e6c 100644
> --- a/drivers/iio/adc/mxs-lradc-adc.c
> +++ b/drivers/iio/adc/mxs-lradc-adc.c
> @@ -116,7 +116,10 @@ struct mxs_lradc_adc {
>  
>  	void __iomem		*base;
>  	/* Maximum of 8 channels + 8 byte ts */

If we were keeping this (I think the buffer solution is better)
then we could drop that coment as to me this just became self describing code.
That's why I like these structures where we can use them with out confusion!

> -	u32			buffer[10] __aligned(8);
> +	struct {
> +		u32 data[8];
> +		aligned_u64 ts;
aligned_s64 

I've not idea why timestamps are signed, but they always have been!

> +	} buffer;
>  	struct iio_trigger	*trig;
>  	struct completion	completion;
>  	spinlock_t		lock;
> @@ -418,14 +421,14 @@ static irqreturn_t mxs_lradc_adc_trigger_handler(int irq, void *p)
>  	unsigned int i, j = 0;
>  
>  	for_each_set_bit(i, iio->active_scan_mask, LRADC_MAX_TOTAL_CHANS) {
> -		adc->buffer[j] = readl(adc->base + LRADC_CH(j));
> +		adc->buffer.data[j] = readl(adc->base + LRADC_CH(j));
>  		writel(chan_value, adc->base + LRADC_CH(j));
> -		adc->buffer[j] &= LRADC_CH_VALUE_MASK;
> -		adc->buffer[j] /= LRADC_DELAY_TIMER_LOOP;
> +		adc->buffer.data[j] &= LRADC_CH_VALUE_MASK;
> +		adc->buffer.data[j] /= LRADC_DELAY_TIMER_LOOP;
>  		j++;
>  	}
>  
> -	iio_push_to_buffers_with_ts(iio, adc->buffer, sizeof(adc->buffer),
> +	iio_push_to_buffers_with_ts(iio, &adc->buffer, sizeof(adc->buffer),
>  				    pf->timestamp);
>  
>  	iio_trigger_notify_done(iio->trig);
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
