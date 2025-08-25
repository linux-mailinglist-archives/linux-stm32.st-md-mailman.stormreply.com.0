Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3290B3454E
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 17:13:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92BADC349C3;
	Mon, 25 Aug 2025 15:13:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFE44C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 15:13:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 73E5B40141;
 Mon, 25 Aug 2025 15:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6642C4CEED;
 Mon, 25 Aug 2025 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756134812;
 bh=qVVGVCmEX81q9uESMpI7TyxhGRS5UoJ7gvEO8EB+yKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jlcjShzrpC72PpmqNkeR39/m61HIsV3DNjisBUSZiC/W8SqEEV4YFNHCO8Qa8xIuD
 NiC06ZgFtIH0OE1APL1wBlFbg9bsrDazQlbFXLYKOfSq3YOCS3Hxj8gtAqoTSeAqAk
 xHy10Uy3I4bcpojyqbaQH+nB/Ye700rvMaz/1ZlTspjO+ohq4z7m56aL23NM7F4Xqi
 0lMU+z786eKA46L4NwBMDPlm9TaAjm1wxkkXAyRqRioOdLBvbR815CnAaHTxl9rWWJ
 APuE0BKQqqW0QwTbV/9a4f0QgiUVgpxD5vh5EGyKs9tAWbYEDUwflKsKVyDeRDMPRe
 ZBOgUeKDLA8kA==
Date: Mon, 25 Aug 2025 16:13:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20250825161305.611ecb75@jic23-huawei>
In-Reply-To: <20250825135401.1765847-9-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
 <20250825135401.1765847-9-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Crt Mori <cmo@melexis.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Frank Li <Frank.Li@nxp.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Rob Herring \(Arm\)" <robh@kernel.org>, linux-iio@vger.kernel.org,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Samuel Holland <samuel@sholland.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Abhash Jha <abhashkumarjha123@gmail.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Bo Liu <liubo03@inspur.com>,
 Sean Nyekjaer <sean@geanix.com>, chuguangqing <chuguangqing@inspur.com>,
 David Lechner <dlechner@baylibre.com>, Waqar Hameed <waqar.hameed@axis.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6?= =?UTF-8?B?w6ltw6Fu?=
 <barnabas.czeman@mainlining.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Vasileios Amoiridis <vassilisamir@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jakob Hauser <jahau@rocketmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Andreas Klinger <ak@it-klinger.de>,
 Han Xu <han.xu@nxp.com>, Julien Stephan <jstephan@baylibre.com>,
 Alexandru Ardelean <aardelean@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Gustavo Vaz <gustavo.vaz@usp.br>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, David Laight <david.laight@aculab.com>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rayyan Ansari <rayyan@ansari.sh>, Cai Huoqing <cai.huoqing@linux.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Hans de Goede <hansg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Linux-stm32] [PATCH v3 08/12] iio: light: Remove redundant
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

On Mon, 25 Aug 2025 16:53:57 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Hi Sakari,

I'm going to apply this as it stands, but there has been a lot
of cut and paste in these drivers, so a common pattern is to have
a no entirely pointless power(bool enable) function.  
Previously it at least wrapped up 2 calls, now it is doing a choice
between two single line calls so makes no sense.

Anyhow, if anyone wants to clean these up that would be great.
In meantime I'd rather not leave cases of the pm_runtime_mark_last_busy()
around to get pasted into more drivers.

So applied,

Jonathan

> diff --git a/drivers/iio/light/isl29028.c b/drivers/iio/light/isl29028.c
> index 0e4284823d44..374bccad9119 100644
> --- a/drivers/iio/light/isl29028.c
> +++ b/drivers/iio/light/isl29028.c
> @@ -336,16 +336,11 @@ static int isl29028_ir_get(struct isl29028_chip *chip, int *ir_data)
>  static int isl29028_set_pm_runtime_busy(struct isl29028_chip *chip, bool on)
>  {
>  	struct device *dev = regmap_get_device(chip->regmap);
As below.

> -	int ret;
>  
> -	if (on) {
> -		ret = pm_runtime_resume_and_get(dev);
> -	} else {
> -		pm_runtime_mark_last_busy(dev);
> -		ret = pm_runtime_put_autosuspend(dev);
> -	}
> +	if (on)
> +		return pm_runtime_resume_and_get(dev);
>  
> -	return ret;
> +	return pm_runtime_put_autosuspend(dev);
>  }
>  

> diff --git a/drivers/iio/light/tsl2583.c b/drivers/iio/light/tsl2583.c
> index fc3b0c4226be..8801a491de77 100644
> --- a/drivers/iio/light/tsl2583.c
> +++ b/drivers/iio/light/tsl2583.c
> @@ -641,16 +641,10 @@ static const struct iio_chan_spec tsl2583_channels[] = {
>  
>  static int tsl2583_set_pm_runtime_busy(struct tsl2583_chip *chip, bool on)
>  {

As below.

> -	int ret;
> +	if (on)
> +		return pm_runtime_resume_and_get(&chip->client->dev);
>  
> -	if (on) {
> -		ret = pm_runtime_resume_and_get(&chip->client->dev);
> -	} else {
> -		pm_runtime_mark_last_busy(&chip->client->dev);
> -		ret = pm_runtime_put_autosuspend(&chip->client->dev);
> -	}
> -
> -	return ret;
> +	return pm_runtime_put_autosuspend(&chip->client->dev);
>  }

> diff --git a/drivers/iio/light/us5182d.c b/drivers/iio/light/us5182d.c
> index 61a0957317a1..d2f5a44892a8 100644
> --- a/drivers/iio/light/us5182d.c
> +++ b/drivers/iio/light/us5182d.c
> @@ -361,19 +361,13 @@ static int us5182d_shutdown_en(struct us5182d_data *data, u8 state)
>  
>  static int us5182d_set_power_state(struct us5182d_data *data, bool on)

As below.

>  {
> -	int ret;
> -
>  	if (data->power_mode == US5182D_ONESHOT)
>  		return 0;
>  
> -	if (on) {
> -		ret = pm_runtime_resume_and_get(&data->client->dev);
> -	} else {
> -		pm_runtime_mark_last_busy(&data->client->dev);
> -		ret = pm_runtime_put_autosuspend(&data->client->dev);
> -	}
> +	if (on)
> +		return pm_runtime_resume_and_get(&data->client->dev);
>  
> -	return ret;
> +	return pm_runtime_put_autosuspend(&data->client->dev);
>  }
>  
>  static int us5182d_read_value(struct us5182d_data *data,
> diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
> index cc81a30b7c70..4dbb2294a843 100644
> --- a/drivers/iio/light/vcnl4000.c
> +++ b/drivers/iio/light/vcnl4000.c
> @@ -576,16 +576,11 @@ static bool vcnl4010_is_in_periodic_mode(struct vcnl4000_data *data)
>  static int vcnl4000_set_pm_runtime_state(struct vcnl4000_data *data, bool on)

As below.

>  {
>  	struct device *dev = &data->client->dev;
> -	int ret;
>  
> -	if (on) {
> -		ret = pm_runtime_resume_and_get(dev);
> -	} else {
> -		pm_runtime_mark_last_busy(dev);
> -		ret = pm_runtime_put_autosuspend(dev);
> -	}
> +	if (on)
> +		return pm_runtime_resume_and_get(dev);
>  
> -	return ret;
> +	return pm_runtime_put_autosuspend(dev);
>  }
>  
>  static int vcnl4040_read_als_it(struct vcnl4000_data *data, int *val, int *val2)
> diff --git a/drivers/iio/light/vcnl4035.c b/drivers/iio/light/vcnl4035.c
> index 01bc99564f98..963747927425 100644
> --- a/drivers/iio/light/vcnl4035.c
> +++ b/drivers/iio/light/vcnl4035.c
> @@ -141,17 +141,12 @@ static const struct iio_trigger_ops vcnl4035_trigger_ops = {
>  
>  static int vcnl4035_set_pm_runtime_state(struct vcnl4035_data *data, bool on)

I'd like to get rid of this function.  It was of marginal benefit before it got
even simpler, not it is actively making the code worse to read.

>  {
> -	int ret;
>  	struct device *dev = &data->client->dev;
>  
> -	if (on) {
> -		ret = pm_runtime_resume_and_get(dev);
> -	} else {
> -		pm_runtime_mark_last_busy(dev);
> -		ret = pm_runtime_put_autosuspend(dev);
> -	}
> +	if (on)
> +		return pm_runtime_resume_and_get(dev);
>  
> -	return ret;
> +	return pm_runtime_put_autosuspend(dev);
>  }
>  
>  static int vcnl4035_read_info_raw(struct iio_dev *indio_dev,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
