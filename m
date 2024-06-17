Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6990B5FD
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 18:14:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE33DC69067;
	Mon, 17 Jun 2024 16:14:03 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2568BC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 16:13:57 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W2vzZ4Ym4z67FbS;
 Tue, 18 Jun 2024 00:12:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id A93C6140A90;
 Tue, 18 Jun 2024 00:13:55 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 17 Jun
 2024 17:13:54 +0100
Date: Mon, 17 Jun 2024 17:13:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Message-ID: <20240617171353.00006b1f@Huawei.com>
In-Reply-To: <20240617-review-v3-22-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-22-88d1338c4cca@baylibre.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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
 Uwe =?ISO-8859-1?Q?Kleine-K=F6n?= =?ISO-8859-1?Q?ig?=
 <u.kleine-koenig@baylibre.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 22/41] iio: gyro: mpu3050-core: make
 use of regmap_clear_bits(), regmap_set_bits()
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

On Mon, 17 Jun 2024 09:50:02 -0400
Trevor Gamblin <tgamblin@baylibre.com> wrote:

> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
> =

> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
> =

> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  drivers/iio/gyro/mpu3050-core.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> =

> diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-c=
ore.c
> index a791ba3a693a..ff1c81553045 100644
> --- a/drivers/iio/gyro/mpu3050-core.c
> +++ b/drivers/iio/gyro/mpu3050-core.c
> @@ -197,8 +197,8 @@ static int mpu3050_start_sampling(struct mpu3050 *mpu=
3050)
>  	int i;
>  =

>  	/* Reset */
> -	ret =3D regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_RESET, MPU3050_PWR_MGM_RESET);
> +	ret =3D regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
> +			      MPU3050_PWR_MGM_RESET);
>  	if (ret)
>  		return ret;
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

I'll probably break this line up whilst applying.

>  			if (ret) {
>  				dev_info(mpu3050->dev, "error resetting FIFO\n");
>  				goto out_trigger_unlock;
> @@ -799,10 +795,8 @@ static int mpu3050_hw_init(struct mpu3050 *mpu3050)
>  	u64 otp;
>  =

>  	/* Reset */
> -	ret =3D regmap_update_bits(mpu3050->map,
> -				 MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_RESET,
> -				 MPU3050_PWR_MGM_RESET);
> +	ret =3D regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
> +			      MPU3050_PWR_MGM_RESET);
>  	if (ret)
>  		return ret;
>  =

> @@ -872,8 +866,8 @@ static int mpu3050_power_up(struct mpu3050 *mpu3050)
>  	msleep(200);
>  =

>  	/* Take device out of sleep mode */
> -	ret =3D regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_SLEEP, 0);
> +	ret =3D regmap_clear_bits(mpu3050->map, MPU3050_PWR_MGM,
> +				MPU3050_PWR_MGM_SLEEP);
>  	if (ret) {
>  		regulator_bulk_disable(ARRAY_SIZE(mpu3050->regs), mpu3050->regs);
>  		dev_err(mpu3050->dev, "error setting power mode\n");
> @@ -895,8 +889,8 @@ static int mpu3050_power_down(struct mpu3050 *mpu3050)
>  	 * then we would be wasting power unless we go to sleep mode
>  	 * first.
>  	 */
> -	ret =3D regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_SLEEP, MPU3050_PWR_MGM_SLEEP);
> +	ret =3D regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
> +			      MPU3050_PWR_MGM_SLEEP);
>  	if (ret)
>  		dev_err(mpu3050->dev, "error putting to sleep\n");
>  =

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
and this one.

Assuming we don't need a v4 for some other reason,

Jonathan

>  		if (ret)
>  			return ret;
>  =

> =


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
