Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38104AF8DA7
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 11:09:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D08A3C36B2F;
	Fri,  4 Jul 2025 09:09:20 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF5BDC36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 09:09:18 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bYSRb2XN3z6L5HM;
 Fri,  4 Jul 2025 17:06:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id C9103140393;
 Fri,  4 Jul 2025 17:09:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 4 Jul
 2025 11:09:16 +0200
Date: Fri, 4 Jul 2025 10:09:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20250704100914.000042db@huawei.com>
In-Reply-To: <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
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
 Mike
 Looijmans <mike.looijmans@topic.nl>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 =?ISO-8859-1?Q?Jo=E3o?= Paulo =?ISO-8859-1?Q?Gon=E7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn
 Guo <shawnguo@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 28/80] iio: adc: Remove redundant
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

On Fri,  4 Jul 2025 10:54:19 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/iio/adc/ab8500-gpadc.c     |  1 -
>  drivers/iio/adc/at91-sama5d2_adc.c | 10 ----------
>  drivers/iio/adc/imx8qxp-adc.c      |  2 --
>  drivers/iio/adc/imx93_adc.c        |  1 -
>  drivers/iio/adc/rcar-gyroadc.c     |  1 -
>  drivers/iio/adc/rzg2l_adc.c        |  3 ---
>  drivers/iio/adc/stm32-adc-core.c   |  1 -
>  drivers/iio/adc/stm32-adc.c        |  7 -------
>  drivers/iio/adc/sun4i-gpadc-iio.c  |  2 --
>  drivers/iio/adc/ti-ads1015.c       |  1 -
>  drivers/iio/adc/ti-ads1100.c       |  1 -
>  drivers/iio/adc/ti-ads1119.c       |  2 --
>  12 files changed, 32 deletions(-)
> 
> diff --git a/drivers/iio/adc/ab8500-gpadc.c b/drivers/iio/adc/ab8500-gpadc.c
> index f3b057f92310..8eaa1dd6a89b 100644
> --- a/drivers/iio/adc/ab8500-gpadc.c
> +++ b/drivers/iio/adc/ab8500-gpadc.c
> @@ -607,7 +607,6 @@ static int ab8500_gpadc_read(struct ab8500_gpadc *gpadc,
>  	}
>  
>  	/* This eventually drops the regulator */
> -	pm_runtime_mark_last_busy(gpadc->dev);
>  	pm_runtime_put_autosuspend(gpadc->dev);
>  
>  	return (high_data << 8) | low_data;
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index c3450246730e..67846fefe21a 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -896,7 +896,6 @@ static int at91_adc_config_emr(struct at91_adc_state *st,
>  	emr |= osr | AT91_SAMA5D2_TRACKX(trackx);
>  	at91_adc_writel(st, EMR, emr);
>  
> -	pm_runtime_mark_last_busy(st->dev);
>  	pm_runtime_put_autosuspend(st->dev);
>  
>  	st->oversampling_ratio = oversampling_ratio;
> @@ -971,7 +970,6 @@ static int at91_adc_configure_touch(struct at91_adc_state *st, bool state)
>  				AT91_SAMA5D2_IER_PEN | AT91_SAMA5D2_IER_NOPEN);
>  		at91_adc_writel(st, TSMR, 0);
>  
> -		pm_runtime_mark_last_busy(st->dev);
>  		pm_runtime_put_autosuspend(st->dev);
>  		return 0;
>  	}
> @@ -1143,7 +1141,6 @@ static int at91_adc_configure_trigger(struct iio_trigger *trig, bool state)
>  	at91_adc_configure_trigger_registers(st, state);
>  
>  	if (!state) {
> -		pm_runtime_mark_last_busy(st->dev);

Getting familiar. I'll not comment on other cases but {} should go here.

>  		pm_runtime_put_autosuspend(st->dev);
>  	}

Please fix all those up and post a v2 series for IIO.

I'd guess similar are present in other subsystems though so may well
need a v2 as well with the excess brackets dropped.


Jonathan


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
