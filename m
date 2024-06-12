Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD39056A5
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2024 17:17:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E8ECC78005;
	Wed, 12 Jun 2024 15:17:21 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9356AC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2024 08:09:18 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a6f13dddf7eso430775666b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2024 01:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718179758; x=1718784558;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RKb/vtoIHaAuT7eS6tdIIVHB4rHiCLnX6z8pJYSRJNs=;
 b=lb465GM1cUzvmko85jTfiqtVztHxm1C883PIyPY6TtIFaatCX7/6sRkoLMShkM7FY2
 GdKsgXl84k+qcbNU6mCDkww0nyvYT0vwUSVnc1I5BGdQ5/kJPsfBUX3Kb05TkxPs3XXI
 XLbob4i5Uuyy8xhXZBF2m1971tCKoWPi4nVTNp5Ysgnnna6fIrR9LjqK8mmnr98Ymy+h
 lO9/d7E+l6e8F7lWaySO1xCYEq7i2ldF5zmpoEzYrLyu+Bnqxw3HGZ5W3btLLyIUkwAS
 riooHxAiBnBBVeXX3HC3SPtTKPaeN+L88MyxlMb1tMWDGCt/cMSIC5bgUtfpm+nNCqyt
 sGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718179758; x=1718784558;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKb/vtoIHaAuT7eS6tdIIVHB4rHiCLnX6z8pJYSRJNs=;
 b=gPF42LKjgZ01lgqoAehHqyNCQSw9Qa1VjZ3/dwkenB1FzLLWY1+tC9N5mJGDM2ufLR
 kPCrmbtOacPB29Z5mSeHHrUmclj7mA+z4ZqPBYjxgbjHXbWVeF6/Brm58WeRAQrQclte
 Jr+LneX0Izpr8ErQp0JyAct1q5MWh0kyebkrPJ9KivfpZC36Qc2Uu7pfrwdR54809Y32
 V/2wXp3xwZL9KBbMn9LMB/Z5PsPH9WUPn5OKiXFBAQ+Nmv5WQeLMqKfparmmVIvZXssp
 suGcXzAVPf3lPaxuVE2aKxwidZuEdQSy5XdHFtgfVJc/6fYCMc5r/VHdwIPAfyYXNzf9
 tqxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5lZ22fVVE+/xIpWgbwSUI8iKflz9GMTMqzz1o4HUYCin8VgRjEHh08cxO7n77BLakQ5cDzmlI34QmMXdw0PBZgD8D0XO7bI8aQe5NQERt2FBoDzEzgWVx
X-Gm-Message-State: AOJu0Yxu4+9RbhmrlayhVh2+nWIIxU3AW2RoSjyn/HtuXt4HxPseVC5d
 IeJHK5A/tI3/E/3lEEPtaL6ggdCFH6PX2pBhNdFVImzbzIb19y9lb85koCF0hyU=
X-Google-Smtp-Source: AGHT+IEyUqS7xeGpS62654NQBM20ZnTsaBaQtVWFbZpKweR38cT7xpNYg2DKAqfcljsV5Jo8GYnSxQ==
X-Received: by 2002:a17:906:3c47:b0:a6f:1c38:3370 with SMTP id
 a640c23a62f3a-a6f47fad6b3mr75793666b.36.1718179757867; 
 Wed, 12 Jun 2024 01:09:17 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f16427842sm439552466b.100.2024.06.12.01.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:09:16 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:09:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Message-ID: <6grkkioyfqvjy37ztevbs7lbkhc4yfvvomwk7jx5qjmrsdihir@mlluicav2cvs>
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
X-Mailman-Approved-At: Wed, 12 Jun 2024 15:17:19 +0000
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
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
Content-Type: multipart/mixed; boundary="===============0704740527704524372=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0704740527704524372==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kp4epuvmx3jkqhoq"
Content-Disposition: inline


--kp4epuvmx3jkqhoq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trevor,

On Tue, Jun 11, 2024 at 12:52:06PM -0400, Trevor Gamblin wrote:
> Simplify the way regmap is accessed in iio drivers.
>=20
> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>=20
> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>=20
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> CC list got suppressed on first submission, so resending. Sorry about
> that.
>=20
>  drivers/iio/accel/adxl313_core.c              |   4 +-
>  drivers/iio/accel/adxl313_spi.c               |   4 +-
>  drivers/iio/accel/fxls8962af-core.c           |  18 ++--
>  drivers/iio/accel/kxsd9.c                     |   6 +-
>  drivers/iio/accel/msa311.c                    |   6 +-
>  drivers/iio/adc/ad4130.c                      |   4 +-
>  drivers/iio/adc/axp20x_adc.c                  |   5 +-
>  drivers/iio/adc/axp288_adc.c                  |   4 +-
>  drivers/iio/adc/bcm_iproc_adc.c               |   8 +-
>  drivers/iio/adc/berlin2-adc.c                 |  24 ++---
>  drivers/iio/adc/cpcap-adc.c                   |  44 +++-----
>  drivers/iio/adc/fsl-imx25-gcq.c               |  16 ++-
>  drivers/iio/adc/ina2xx-adc.c                  |   3 +-
>  drivers/iio/adc/intel_mrfld_adc.c             |   4 +-
>  drivers/iio/adc/meson_saradc.c                | 101 ++++++++----------
>  drivers/iio/adc/mp2629_adc.c                  |  19 ++--
>  drivers/iio/adc/qcom-spmi-rradc.c             |  50 +++++----
>  drivers/iio/adc/rn5t618-adc.c                 |   5 +-
>  drivers/iio/adc/sc27xx_adc.c                  |  41 ++++---
>  drivers/iio/adc/stm32-dfsdm-adc.c             |  29 +++--
>  drivers/iio/dac/ltc2688.c                     |   5 +-
>  drivers/iio/dac/stm32-dac-core.c              |   5 +-
>  drivers/iio/gyro/bmg160_core.c                |   4 +-
>  drivers/iio/gyro/mpu3050-core.c               |  33 +++---
>  drivers/iio/health/afe4403.c                  |   9 +-
>  drivers/iio/health/afe4404.c                  |   9 +-
>  drivers/iio/health/max30100.c                 |   5 +-
>  drivers/iio/health/max30102.c                 |   5 +-
>  .../imu/inv_icm42600/inv_icm42600_buffer.c    |  14 ++-
>  .../iio/imu/inv_icm42600/inv_icm42600_core.c  |   9 +-
>  .../iio/imu/inv_icm42600/inv_icm42600_i2c.c   |   4 +-
>  .../iio/imu/inv_icm42600/inv_icm42600_spi.c   |   4 +-
>  drivers/iio/light/adux1020.c                  |  13 ++-
>  drivers/iio/light/iqs621-als.c                |   4 +-
>  drivers/iio/light/isl29018.c                  |   6 +-
>  drivers/iio/light/st_uvis25_core.c            |   4 +-
>  drivers/iio/light/veml6030.c                  |   4 +-
>  drivers/iio/magnetometer/ak8974.c             |  11 +-
>  drivers/iio/magnetometer/mmc35240.c           |   8 +-
>  drivers/iio/pressure/bmp280-core.c            |   4 +-
>  drivers/iio/proximity/sx9324.c                |   5 +-
>  drivers/iio/proximity/sx9360.c                |   5 +-
>  drivers/iio/proximity/sx9500.c                |  12 +--
>  drivers/iio/proximity/sx_common.c             |   9 +-
>  drivers/iio/temperature/mlx90632.c            |   4 +-
>  drivers/iio/trigger/stm32-timer-trigger.c     |  34 +++---
>  46 files changed, 273 insertions(+), 351 deletions(-)

I found five more drivers below drivers/iio that could benefit from such
a conversion:

 drivers/iio/adc/ad7173.c                      |  2 +-
 drivers/iio/adc/ti-ads1298.c                  | 13 ++++++-------
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c    |  4 ++--
 drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c |  8 ++++----
 drivers/iio/light/veml6075.c                  |  4 ++--
 5 files changed, 15 insertions(+), 16 deletions(-)

But even without addressing these:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks for picking up my suggestion,
Uwe

--kp4epuvmx3jkqhoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZpV6cACgkQj4D7WH0S
/k5HtQf/VeZ8OLgNz7dXrFmR7AQ9UOUpW7yE/aNJ/0jp+/7SKFUid8kLelq2CIon
ZVEOQoxGVhsBhSmzwJGvZf6cOMAu4nWRuACbap5soHOv/ycOA3QIKizvIGt1TEEh
0/VqnqKzkXb9oxxMVSpN3tbFXRuYlvx7+jpdDVoguOBsVI5jeZb+AXseQscpy/nt
qD1t26pVyaJH3/Rhp0912HRYo6zsvpSCWJ/IssmngcMCXSnCjNUYK8mWeQX+QG47
rd6Yx/Q79PT6dB778e1LYvrOx5QTfFUe1NjjNJP+SjJH8mHE8CRBLdBXAVQJGfMf
tXTZy24yn6DSipC1sqLciFOAvQns1A==
=/peH
-----END PGP SIGNATURE-----

--kp4epuvmx3jkqhoq--

--===============0704740527704524372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0704740527704524372==--
