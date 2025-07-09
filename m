Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED09FAFEDE4
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:38:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0946C36B2A;
	Wed,  9 Jul 2025 15:38:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 546ADC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:38:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B715343EB8;
 Wed,  9 Jul 2025 15:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C79C4CEEF;
 Wed,  9 Jul 2025 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752075492;
 bh=Xl25DKWUzLXWpg5KhyYoRSsxahTDR5DpYlzJd9W9CaA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uYdDGgmoD68kb2rNpNP/hz5SiwAXDsyvezTzMSDMKDb2YClMAF2yt/AxOjTPs7sNl
 ZTOE8jKrng1ejwdimLIcfCR+DZXhizhMc2qXzwb7YBRhhYhR+Xnf7h120quqvHtuXQ
 vwH5eiko3xNTUaDORSLeGHicywXRuFhftgO6XszyBy6kDg/HN0KkQYjiYK9KT3zzls
 T5Wx4zQYlggDBTLa0AXA3d8QhmsyQveEUAZY1P8m2i8gSq2eYriSLniXhAiyw5Yn+g
 o8IjE8LQibgIjGnYjnHpSjOCrrGvcXASgZXGde0dgcLjH93VVyf4X6KUiYxOt+Ess8
 Oo5M4FmCysnGA==
Date: Wed, 9 Jul 2025 16:37:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20250709163756.32b0e1d1@jic23-huawei>
In-Reply-To: <20250708231152.971398-1-sakari.ailus@linux.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
 <20250708231152.971398-1-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Rob Herring \(Arm\)" <robh@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>, Samuel Holland <samuel@sholland.org>,
 "Jiri Slaby
 \(SUSE\)" <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Haibo Chen <haibo.chen@nxp.com>, Marek Vasut <marek.vasut@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, David Lechner <dlechner@baylibre.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [Linux-stm32] [PATCH v2 02/12] iio: adc: Remove redundant
 pm_runtime_mark_last_busy() calls
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

On Wed,  9 Jul 2025 02:11:52 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Some comments for the future as more about what can be improved on the back
of this than what you have here.

>
> diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
> index cc326f21d398..3a17b3898bf6 100644
> --- a/drivers/iio/adc/rcar-gyroadc.c
> +++ b/drivers/iio/adc/rcar-gyroadc.c
> @@ -163,12 +163,10 @@ static int rcar_gyroadc_set_power(struct rcar_gyroadc *priv, bool on)
>  {
>  	struct device *dev = priv->dev;
>  
This is a very clear example of where the *_set_power() pattern is a bad idea.
There are two calls of this function, one with it hard coded as on and one with it
hard coded as off.  We can just push the pm_runtime_resume_and_get()
to the on case etc.

I don't mind that much if we do so as a follow up patch so this one can
be the mechanical change and then we follow up with the enabled simplification.

> -	if (on) {
> +	if (on)
>  		return pm_runtime_resume_and_get(dev);
> -	} else {
> -		pm_runtime_mark_last_busy(dev);
> -		return pm_runtime_put_autosuspend(dev);
> -	}
> +
> +	return pm_runtime_put_autosuspend(dev);
>  }
>  
>  static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
>> diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
> index 48549d617e5f..f2a93c63ca14 100644
> --- a/drivers/iio/adc/ti-ads1015.c
> +++ b/drivers/iio/adc/ti-ads1015.c
> @@ -374,12 +374,10 @@ static int ads1015_set_power_state(struct ads1015_data *data, bool on)
>  	int ret;
>  	struct device *dev = regmap_get_device(data->regmap);
>  
> -	if (on) {
> +	if (on)
>  		ret = pm_runtime_resume_and_get(dev);
> -	} else {
> -		pm_runtime_mark_last_busy(dev);
> +	else
>  		ret = pm_runtime_put_autosuspend(dev);
> -	}
>  
>  	return ret < 0 ? ret : 0;
So this one has a stub version which only brings benefits because
we have checks on the pm_runtime_put_autosuspend() path failing
(which it does if we have !CONFIG_PM).

I think the right option there is check the return value is < 0
for the resume_and_get() and don't check the _put_autosuspend()
return value at all.  Then we can just push this down to the
call sites as all of them hard code the bool value.

>  }

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
