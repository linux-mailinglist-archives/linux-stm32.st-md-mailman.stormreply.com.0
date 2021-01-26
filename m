Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B18AB3045FF
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 19:10:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E64BC57181;
	Tue, 26 Jan 2021 18:10:45 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D747C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 18:10:39 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4SaJ-00032e-0a; Tue, 26 Jan 2021 18:56:59 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4SaD-0007NA-AL; Tue, 26 Jan 2021 18:56:53 +0100
Date: Tue, 26 Jan 2021 18:56:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>
Message-ID: <20210126175652.3caoqfnsky2es42f@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
 <3e42b2ea-c713-31b2-9c86-c49a70d8e1f4@arm.com>
MIME-Version: 1.0
In-Reply-To: <3e42b2ea-c713-31b2-9c86-c49a70d8e1f4@arm.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Eric Anholt <eric@anholt.net>, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/5] amba: Make the remove callback
	return void
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
Content-Type: multipart/mixed; boundary="===============3182357290830123592=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3182357290830123592==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2x4mwcdrgqmlamtu"
Content-Disposition: inline


--2x4mwcdrgqmlamtu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 26, 2021 at 05:08:40PM +0000, Suzuki K Poulose wrote:
> On 1/26/21 4:58 PM, Uwe Kleine-K=F6nig wrote:
> > All amba drivers return 0 in their remove callback. Together with the
> > driver core ignoring the return value anyhow, it doesn't make sense to
> > return a value here.
> >=20
> > Change the remove prototype to return void, which makes it explicit that
> > returning an error value doesn't work as expected. This simplifies chan=
ging
> > the core remove callback to return void, too.
> >=20
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org> # for drivers/memory
> > Acked-by: Mark Brown <broonie@kernel.org>
>  > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
>=20
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +---
>=20
> You are most likely to have a conflict for the above file, with what is
> in coresight/next. It should be easy to resolve.

I'm surprised to see that the remove callback introduced in 2952ecf5df33
("coresight: etm4x: Refactor probing routine") has an __exit annotation.

With .suppress_bind_attrs =3D true you don't need a remove callback at
all. (And without .suppress_bind_attrs =3D true the remove callback must
have no __exit annotation.)

This make me looking at commit 45fe7befe0db ("coresight: remove broken
__exit annotations") by Arnd. Unless I miss something the better change
would have been to remove the unused remove callbacks instead of dropping
their __exit annotation?!

Anyhow, my conflict resolution looks as follows:

diff --cc drivers/hwtracing/coresight/coresight-etm4x-core.c
index 82787cba537d,473ab7480a36..000000000000
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@@ -1703,6 -1903,28 +1903,27 @@@ static int __exit etm4_remove_dev(struc
  	cpus_read_unlock();
 =20
  	coresight_unregister(drvdata->csdev);
+=20
+ 	return 0;
+ }
+=20
 -static int __exit etm4_remove_amba(struct amba_device *adev)
++static void __exit etm4_remove_amba(struct amba_device *adev)
+ {
+ 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&adev->dev);
+=20
+ 	if (drvdata)
 -		return etm4_remove_dev(drvdata);
 -	return 0;
++		etm4_remove_dev(drvdata);
+ }
+=20
+ static int __exit etm4_remove_platform_dev(struct platform_device *pdev)
+ {
+ 	int ret =3D 0;
+ 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&pdev->dev);
+=20
+ 	if (drvdata)
+ 		ret =3D etm4_remove_dev(drvdata);
+ 	pm_runtime_disable(&pdev->dev);
+ 	return ret;
  }
 =20
  static const struct amba_id etm4_ids[] =3D {

If this series should make it in for 5.12 we probably need an immutable
branch between hwtracing and amba.

> Otherwise, the changes look good for the drivers/hwtracing/coresight/*
>=20
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2x4mwcdrgqmlamtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAQV+EACgkQwfwUeK3K
7AmVuQf6AtGutKPgbsyG3MlTDGKL2CFRBxCLR4sxog0b3QoNLrxr97ZAm+29XP+R
/C9AgAEdBYZEp/2H2BkQe8cuBFS4UgHD/WEPZ5cI+JN475DZiqoF6T0qdSyCMF8m
zEDDLZljJzggeci88eRuo1WxD4fyaD//srG7TdZYqXjasRvJ7uKPN4yTi7TrbMtU
ECXScjnQQcZQPBSaUSqOzJfFs5iGDejv5lIG/emf+7QYEDD+AftUvKNVv/FyQYmL
2jPJY9rLusZQGMxlZWQMyo5AzhkjmMkXv3GJVOiLzAUiEZ6WfU0kdtrZuzScshOW
IRo6dRIxQLZOE4k2D+rDx3M/+KGaZQ==
=Ozgm
-----END PGP SIGNATURE-----

--2x4mwcdrgqmlamtu--

--===============3182357290830123592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3182357290830123592==--
