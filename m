Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD20AD6BFF
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 11:17:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C5D5C36B24;
	Thu, 12 Jun 2025 09:17:55 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B835C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 09:17:53 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id C9E871C00B7; Thu, 12 Jun 2025 11:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1749719872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jK207JmCPoreSPAxEuJucLTQP5EiXczQgWbs/TTbYI0=;
 b=PkZDjm+VNaBiHoM19j/d5n9YER5Bd3SVefh8dKqwEN8k5jc2k65ob+oA7hwkxHW6kxGWBX
 9O4xDZh7LriFaoxfmyvFJQg3qyg3IlrtwF8xT0JGHqOaRBnYof2s+Lj763My4eXvfO6kxu
 0RF39dsnyWVpKCOD3wdHEG1hkzigaK4=
Date: Thu, 12 Jun 2025 11:17:52 +0200
From: Pavel Machek <pavel@ucw.cz>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>, linux-rockchip@lists.infradead.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============3182591771682401156=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3182591771682401156==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rtWrUApkft0MEwbP"
Content-Disposition: inline


--rtWrUApkft0MEwbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Jonathan mentioned recently that he would like to get away from using
> memset() to zero-initialize stack memory in the IIO subsystem. And we
> have it on good authority that initializing a struct or array with =3D { }
> is the preferred way to do this in the kernel [1]. So here is a series
> to take care of that.

1) Is it worth the churn?

2) Will this fail to initialize padding with some obscure compiler?

3) Why do you believe that {} is the preffered way? All we have is
Kees' email that explains that =3D {} maybe works in configs he tested.

BR,
								Pavel

> [1]:
> https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/



> ---
> David Lechner (28):
>       iio: accel: adxl372: use =3D { } instead of memset()
>       iio: accel: msa311: use =3D { } instead of memset()
>       iio: adc: dln2-adc: use =3D { } instead of memset()
>       iio: adc: mt6360-adc: use =3D { } instead of memset()
>       iio: adc: rockchip_saradc: use =3D { } instead of memset()
>       iio: adc: rtq6056: use =3D { } instead of memset()
>       iio: adc: stm32-adc: use =3D { } instead of memset()
>       iio: adc: ti-ads1015: use =3D { } instead of memset()
>       iio: adc: ti-ads1119: use =3D { } instead of memset()
>       iio: adc: ti-lmp92064: use =3D { } instead of memset()
>       iio: adc: ti-tsc2046: use =3D { } instead of memset()
>       iio: chemical: scd4x: use =3D { } instead of memset()
>       iio: chemical: scd30: use =3D { } instead of memset()
>       iio: chemical: sunrise_co2: use =3D { } instead of memset()
>       iio: dac: ad3552r: use =3D { } instead of memset()
>       iio: imu: inv_icm42600: use =3D { } instead of memset()
>       iio: imu: inv_mpu6050: use =3D { } instead of memset()
>       iio: light: bh1745: use =3D { } instead of memset()
>       iio: light: ltr501: use =3D { } instead of memset()
>       iio: light: opt4060: use =3D { } instead of memset()
>       iio: light: veml6030: use =3D { } instead of memset()
>       iio: magnetometer: af8133j: use =3D { } instead of memset()
>       iio: pressure: bmp280: use =3D { } instead of memset()
>       iio: pressure: mpl3115: use =3D { } instead of memset()
>       iio: pressure: mprls0025pa: use =3D { } instead of memset()
>       iio: pressure: zpa2326: use =3D { } instead of memset()
>       iio: proximity: irsd200: use =3D { } instead of memset()
>       iio: temperature: tmp006: use =3D { } instead of memset()
>=20
>  drivers/iio/accel/adxl372.c                       | 3 +--
>  drivers/iio/accel/msa311.c                        | 4 +---
>  drivers/iio/adc/dln2-adc.c                        | 4 +---
>  drivers/iio/adc/mt6360-adc.c                      | 3 +--
>  drivers/iio/adc/rockchip_saradc.c                 | 4 +---
>  drivers/iio/adc/rtq6056.c                         | 4 +---
>  drivers/iio/adc/stm32-adc.c                       | 3 +--
>  drivers/iio/adc/ti-ads1015.c                      | 4 +---
>  drivers/iio/adc/ti-ads1119.c                      | 4 +---
>  drivers/iio/adc/ti-lmp92064.c                     | 4 +---
>  drivers/iio/adc/ti-tsc2046.c                      | 3 +--
>  drivers/iio/chemical/scd30_core.c                 | 3 +--
>  drivers/iio/chemical/scd4x.c                      | 3 +--
>  drivers/iio/chemical/sunrise_co2.c                | 6 ++----
>  drivers/iio/dac/ad3552r.c                         | 3 +--
>  drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
>  drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
>  drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c        | 4 +---
>  drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c        | 6 ++----
>  drivers/iio/light/bh1745.c                        | 4 +---
>  drivers/iio/light/ltr501.c                        | 4 +---
>  drivers/iio/light/opt4060.c                       | 4 +---
>  drivers/iio/light/veml6030.c                      | 4 +---
>  drivers/iio/magnetometer/af8133j.c                | 4 +---
>  drivers/iio/pressure/bmp280-core.c                | 5 +----
>  drivers/iio/pressure/mpl3115.c                    | 3 +--
>  drivers/iio/pressure/mprls0025pa_i2c.c            | 5 +----
>  drivers/iio/pressure/zpa2326.c                    | 4 +---
>  drivers/iio/proximity/irsd200.c                   | 3 +--
>  drivers/iio/temperature/tmp006.c                  | 4 +---
>  30 files changed, 34 insertions(+), 85 deletions(-)
> ---
> base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
> change-id: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7e=
cb
>=20
> Best regards,

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--rtWrUApkft0MEwbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaEqbQAAKCRAw5/Bqldv6
8quUAJ9TqDazu4enIZD/WIHKSEebP5o8lQCgo2StzDEJ7G4crF9oQEjDZPrt78A=
=/MEA
-----END PGP SIGNATURE-----

--rtWrUApkft0MEwbP--

--===============3182591771682401156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3182591771682401156==--
