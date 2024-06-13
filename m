Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EC9079A0
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 19:20:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6591C78011;
	Thu, 13 Jun 2024 17:20:32 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02D25C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 17:20:24 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0TfD3Fs8z6K91P;
 Fri, 14 Jun 2024 01:19:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 8267F1400CB;
 Fri, 14 Jun 2024 01:20:23 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 13 Jun
 2024 18:20:22 +0100
Date: Thu, 13 Jun 2024 18:20:21 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Message-ID: <20240613182021.00005072@Huawei.com>
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Hans de Goede <hdegoede@redhat.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-amlogic@lists.infradead.org,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RESEND][PATCH] iio: simplify with
 regmap_set_bits(), regmap_clear_bits()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 11 Jun 2024 12:52:06 -0400
Trevor Gamblin <tgamblin@baylibre.com> wrote:

> Simplify the way regmap is accessed in iio drivers.
> =

> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
> =

> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
> =

> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Looks like a good change in general. However...

The problem with a change like this is it results in
non trivial backporting if we need to due to a fix in related
code.

As such, whilst it will obviously generate a lot of patches, I'd
like this split up into a series so each patch touches only one driver.
Fine to keep a single patch for the multiple module for a single
device cases though.

Also some very long lines that need the line breaks put back.

Jonathan


> diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
> index b8ddbfd98f11..40e605c57adb 100644
> --- a/drivers/iio/accel/msa311.c
> +++ b/drivers/iio/accel/msa311.c
> @@ -1034,10 +1034,8 @@ static int msa311_chip_init(struct msa311_priv *ms=
a311)
>  				     "failed to unmap map0/map1 interrupts\n");
>  =

>  	/* Disable all axes by default */
> -	err =3D regmap_update_bits(msa311->regs, MSA311_ODR_REG,
> -				 MSA311_GENMASK(F_X_AXIS_DIS) |
> -				 MSA311_GENMASK(F_Y_AXIS_DIS) |
> -				 MSA311_GENMASK(F_Z_AXIS_DIS), 0);
> +	err =3D regmap_clear_bits(msa311->regs, MSA311_ODR_REG,
> +				MSA311_GENMASK(F_X_AXIS_DIS) | MSA311_GENMASK(F_Y_AXIS_DIS) | MSA311=
_GENMASK(F_Z_AXIS_DIS));
Too long

> diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
> index b6c4ef70484e..8fabf748c36b 100644
> --- a/drivers/iio/adc/cpcap-adc.c
> +++ b/drivers/iio/adc/cpcap-adc.c
> @@ -385,9 +385,8 @@ static irqreturn_t cpcap_adc_irq_thread(int irq, void=
 *data)
> @@ -424,23 +423,17 @@ static void cpcap_adc_setup_calibrate(struct cpcap_=
adc *ddata,
>  	if (error)
>  		return;
>  =

> -	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
> -				   CPCAP_BIT_ATOX_PS_FACTOR |
> -				   CPCAP_BIT_ADC_PS_FACTOR1 |
> -				   CPCAP_BIT_ADC_PS_FACTOR0,
> -				   0);
> +	error =3D regmap_clear_bits(ddata->reg, CPCAP_REG_ADCC2,
> +				  CPCAP_BIT_ATOX_PS_FACTOR | CPCAP_BIT_ADC_PS_FACTOR1 | CPCAP_BIT_AD=
C_PS_FACTOR0);
That one is over 100!  =

>  	if (error)

> diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-c=
ore.c
> index a791ba3a693a..ff1c81553045 100644
> --- a/drivers/iio/gyro/mpu3050-core.c
> +++ b/drivers/iio/gyro/mpu3050-core.c

>  =

> @@ -513,12 +513,8 @@ static irqreturn_t mpu3050_trigger_handler(int irq, =
void *p)
>  				 "FIFO overflow! Emptying and resetting FIFO\n");
>  			fifo_overflow =3D true;
>  			/* Reset and enable the FIFO */
> -			ret =3D regmap_update_bits(mpu3050->map,
> -						 MPU3050_USR_CTRL,
> -						 MPU3050_USR_CTRL_FIFO_EN |
> -						 MPU3050_USR_CTRL_FIFO_RST,
> -						 MPU3050_USR_CTRL_FIFO_EN |
> -						 MPU3050_USR_CTRL_FIFO_RST);
> +			ret =3D regmap_set_bits(mpu3050->map, MPU3050_USR_CTRL,
> +					      MPU3050_USR_CTRL_FIFO_EN | MPU3050_USR_CTRL_FIFO_RST);

Keep the line break to stay under 80 chars.

> @@ -997,11 +991,8 @@ static int mpu3050_drdy_trigger_set_state(struct iio=
_trigger *trig,
>  			return ret;
>  =

>  		/* Reset and enable the FIFO */
> -		ret =3D regmap_update_bits(mpu3050->map, MPU3050_USR_CTRL,
> -					 MPU3050_USR_CTRL_FIFO_EN |
> -					 MPU3050_USR_CTRL_FIFO_RST,
> -					 MPU3050_USR_CTRL_FIFO_EN |
> -					 MPU3050_USR_CTRL_FIFO_RST);
> +		ret =3D regmap_set_bits(mpu3050->map, MPU3050_USR_CTRL,
> +				      MPU3050_USR_CTRL_FIFO_EN | MPU3050_USR_CTRL_FIFO_RST);

For IIO stuff try and stay under 80 chars unless there is a strong
readability argument for going longer.  Here there isn't one.

>  		if (ret)
>  			return ret;
>  =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
