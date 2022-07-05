Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C69566810
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jul 2022 12:36:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC20BC640F4;
	Tue,  5 Jul 2022 10:36:32 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82153C640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 10:36:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fuq-0001LC-19; Tue, 05 Jul 2022 12:36:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fue-004XxA-J7; Tue, 05 Jul 2022 12:36:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fuh-0038F6-8t; Tue, 05 Jul 2022 12:36:15 +0200
Date: Tue, 5 Jul 2022 12:36:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.de>
Message-ID: <20220705103615.ceeq7rku53x743ps@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <20220705120852.049dc235@endymion.delvare>
MIME-Version: 1.0
In-Reply-To: <20220705120852.049dc235@endymion.delvare>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 6/6] i2c: Make remove callback return void
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
Content-Type: multipart/mixed; boundary="===============8144091487164217317=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8144091487164217317==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gut2agzhpaayxotv"
Content-Disposition: inline


--gut2agzhpaayxotv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 12:08:52PM +0200, Jean Delvare wrote:
> On Tue, 28 Jun 2022 16:03:12 +0200, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >=20
> > The value returned by an i2c driver's remove function is mostly ignored.
> > (Only an error message is printed if the value is non-zero that the
> > error is ignored.)
> >=20
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour, all callbacks were prepared to
> > return 0 before.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>=20
> That's a huge change for a relatively small benefit, but if this is
> approved by the I2C core maintainer then fine with me. For:

Agreed, it's huge. The benefit isn't really measureable, the motivation
is to improve the situation for driver authors who with the change
cannot make wrong assumptions about what to return in .remove(). During
the preparation this uncovered a few bugs. See for example
bbc126ae381cf0a27822c1f822d0aeed74cc40d9.

> >  drivers/hwmon/adc128d818.c                                | 4 +---
> >  drivers/hwmon/adt7470.c                                   | 3 +--
> >  drivers/hwmon/asb100.c                                    | 6 ++----
> >  drivers/hwmon/asc7621.c                                   | 4 +---
> >  drivers/hwmon/dme1737.c                                   | 4 +---
> >  drivers/hwmon/f75375s.c                                   | 5 ++---
> >  drivers/hwmon/fschmd.c                                    | 6 ++----
> >  drivers/hwmon/ftsteutates.c                               | 3 +--
> >  drivers/hwmon/ina209.c                                    | 4 +---
> >  drivers/hwmon/ina3221.c                                   | 4 +---
> >  drivers/hwmon/jc42.c                                      | 3 +--
> >  drivers/hwmon/mcp3021.c                                   | 4 +---
> >  drivers/hwmon/occ/p8_i2c.c                                | 4 +---
> >  drivers/hwmon/pcf8591.c                                   | 3 +--
> >  drivers/hwmon/smm665.c                                    | 3 +--
> >  drivers/hwmon/tps23861.c                                  | 4 +---
> >  drivers/hwmon/w83781d.c                                   | 4 +---
> >  drivers/hwmon/w83791d.c                                   | 6 ++----
> >  drivers/hwmon/w83792d.c                                   | 6 ++----
> >  drivers/hwmon/w83793.c                                    | 6 ++----
> >  drivers/hwmon/w83795.c                                    | 4 +---
> >  drivers/hwmon/w83l785ts.c                                 | 6 ++----
> >  drivers/i2c/i2c-core-base.c                               | 6 +-----
> >  drivers/i2c/i2c-slave-eeprom.c                            | 4 +---
> >  drivers/i2c/i2c-slave-testunit.c                          | 3 +--
> >  drivers/i2c/i2c-smbus.c                                   | 3 +--
> >  drivers/i2c/muxes/i2c-mux-ltc4306.c                       | 4 +---
> >  drivers/i2c/muxes/i2c-mux-pca9541.c                       | 3 +--
> >  drivers/i2c/muxes/i2c-mux-pca954x.c                       | 3 +--
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gut2agzhpaayxotv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLEFBwACgkQwfwUeK3K
7AkavggAgLmynakXX/rOF4Jwy2OuBXH29kecKqPd6xj4yHsu3ggy8kd/hlU4jJib
vV0H9ioq69hhMqjme5AHJJsueLFi/t/iwuQwuWUKluCBBlx0RXBsVx8qxV7A0uWa
mdKU3ApPaN7y0cS1jccdN7ydsL3H2ayzIwfQuNqx1G3P/uqXfkusV0fjwQ/rQct3
qs4t2/QiHUd0tStlGw2eSKxp1z5KRrDMstK17fiZSsw/SYoMyldV8Ame6+gaxx0X
e93FqM5jj67ovjD3jJanfOwI5vesu4+szu4GK6vHRWvpsieHsSeyS+GNgfM5oLA7
iguZ0rauzy0je3hrHuKgp1maJ59ibQ==
=fYiS
-----END PGP SIGNATURE-----

--gut2agzhpaayxotv--

--===============8144091487164217317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8144091487164217317==--
