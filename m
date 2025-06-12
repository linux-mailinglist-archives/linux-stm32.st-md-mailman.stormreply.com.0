Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF9AD6E22
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 12:46:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27116C32E8F;
	Thu, 12 Jun 2025 10:46:03 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09390C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 10:46:01 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHzbl64zPz6L54g;
 Thu, 12 Jun 2025 18:41:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 1B8241402A5;
 Thu, 12 Jun 2025 18:46:01 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 12 Jun
 2025 12:45:59 +0200
Date: Thu, 12 Jun 2025 11:45:57 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20250612114557.00007628@huawei.com>
In-Reply-To: <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?UTF-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>, linux-rockchip@lists.infradead.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 David Lechner <dlechner@baylibre.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?UTF-8?Q?G?= =?UTF-8?Q?=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?UTF-8?Q?Jo=C3=A3o?= Paulo =?UTF-8?Q?Gon=C3=A7al?= =?UTF-8?Q?ves?=
 <jpaulo.silvagoncalves@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/28] iio: zero init stack with { }
	instead of memset()
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

On Thu, 12 Jun 2025 11:17:52 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > Jonathan mentioned recently that he would like to get away from using
> > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > have it on good authority that initializing a struct or array with = { }
> > is the preferred way to do this in the kernel [1]. So here is a series
> > to take care of that.  
> 
> 1) Is it worth the churn?
> 
> 2) Will this fail to initialize padding with some obscure compiler?
> 
> 3) Why do you believe that {} is the preffered way? All we have is
> Kees' email that explains that = {} maybe works in configs he tested.
> 
Pavel,

I think main thing that matters in Kees email is there is a self test
that should fire if a compiler ever does this wrong.

Using this syntax is definitely not a 'kernel wide' preference yet
but I do prefer to make some changes like this in IIO just because it
reduces the amount of code that smells different when reviewing.
Given how many drivers we now have, sadly people pick different ones
to cut and paste from so we get a lot of new drivers that look like
how we preferred to do things 10 years ago :(

However it is a fair bit of churn. hmm.  Let's let this sit for
a little while and see if other view points come in.

Thanks 

Jonathan
 

> BR,
> 								Pavel
> 
> > [1]:
> > https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/  
> 
> 
> 
> > ---
> > David Lechner (28):
> >       iio: accel: adxl372: use = { } instead of memset()
> >       iio: accel: msa311: use = { } instead of memset()
> >       iio: adc: dln2-adc: use = { } instead of memset()
> >       iio: adc: mt6360-adc: use = { } instead of memset()
> >       iio: adc: rockchip_saradc: use = { } instead of memset()
> >       iio: adc: rtq6056: use = { } instead of memset()
> >       iio: adc: stm32-adc: use = { } instead of memset()
> >       iio: adc: ti-ads1015: use = { } instead of memset()
> >       iio: adc: ti-ads1119: use = { } instead of memset()
> >       iio: adc: ti-lmp92064: use = { } instead of memset()
> >       iio: adc: ti-tsc2046: use = { } instead of memset()
> >       iio: chemical: scd4x: use = { } instead of memset()
> >       iio: chemical: scd30: use = { } instead of memset()
> >       iio: chemical: sunrise_co2: use = { } instead of memset()
> >       iio: dac: ad3552r: use = { } instead of memset()
> >       iio: imu: inv_icm42600: use = { } instead of memset()
> >       iio: imu: inv_mpu6050: use = { } instead of memset()
> >       iio: light: bh1745: use = { } instead of memset()
> >       iio: light: ltr501: use = { } instead of memset()
> >       iio: light: opt4060: use = { } instead of memset()
> >       iio: light: veml6030: use = { } instead of memset()
> >       iio: magnetometer: af8133j: use = { } instead of memset()
> >       iio: pressure: bmp280: use = { } instead of memset()
> >       iio: pressure: mpl3115: use = { } instead of memset()
> >       iio: pressure: mprls0025pa: use = { } instead of memset()
> >       iio: pressure: zpa2326: use = { } instead of memset()
> >       iio: proximity: irsd200: use = { } instead of memset()
> >       iio: temperature: tmp006: use = { } instead of memset()
> > 
> >  drivers/iio/accel/adxl372.c                       | 3 +--
> >  drivers/iio/accel/msa311.c                        | 4 +---
> >  drivers/iio/adc/dln2-adc.c                        | 4 +---
> >  drivers/iio/adc/mt6360-adc.c                      | 3 +--
> >  drivers/iio/adc/rockchip_saradc.c                 | 4 +---
> >  drivers/iio/adc/rtq6056.c                         | 4 +---
> >  drivers/iio/adc/stm32-adc.c                       | 3 +--
> >  drivers/iio/adc/ti-ads1015.c                      | 4 +---
> >  drivers/iio/adc/ti-ads1119.c                      | 4 +---
> >  drivers/iio/adc/ti-lmp92064.c                     | 4 +---
> >  drivers/iio/adc/ti-tsc2046.c                      | 3 +--
> >  drivers/iio/chemical/scd30_core.c                 | 3 +--
> >  drivers/iio/chemical/scd4x.c                      | 3 +--
> >  drivers/iio/chemical/sunrise_co2.c                | 6 ++----
> >  drivers/iio/dac/ad3552r.c                         | 3 +--
> >  drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
> >  drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
> >  drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c        | 4 +---
> >  drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c        | 6 ++----
> >  drivers/iio/light/bh1745.c                        | 4 +---
> >  drivers/iio/light/ltr501.c                        | 4 +---
> >  drivers/iio/light/opt4060.c                       | 4 +---
> >  drivers/iio/light/veml6030.c                      | 4 +---
> >  drivers/iio/magnetometer/af8133j.c                | 4 +---
> >  drivers/iio/pressure/bmp280-core.c                | 5 +----
> >  drivers/iio/pressure/mpl3115.c                    | 3 +--
> >  drivers/iio/pressure/mprls0025pa_i2c.c            | 5 +----
> >  drivers/iio/pressure/zpa2326.c                    | 4 +---
> >  drivers/iio/proximity/irsd200.c                   | 3 +--
> >  drivers/iio/temperature/tmp006.c                  | 4 +---
> >  30 files changed, 34 insertions(+), 85 deletions(-)
> > ---
> > base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
> > change-id: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb
> > 
> > Best regards,  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
