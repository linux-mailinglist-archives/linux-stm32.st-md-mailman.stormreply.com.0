Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42144E2136
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Mar 2022 08:23:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EAC6C5EC47;
	Mon, 21 Mar 2022 07:23:32 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CB13C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Mar 2022 07:23:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nWCND-0006et-Tt; Mon, 21 Mar 2022 08:22:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nWCMp-0021t4-Og; Mon, 21 Mar 2022 08:22:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nWCMp-00AcZn-OA; Mon, 21 Mar 2022 08:22:15 +0100
Date: Mon, 21 Mar 2022 08:22:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20220321072215.5lffm7qtpvg5ofk4@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
 <20220319182936.06d75742@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20220319182936.06d75742@jic23-huawei>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Matt Mackall <mpm@selenic.com>, Tomislav Denis <tomislav.denis@avl.com>,
 =?utf-8?B?QW5kcsOp?= Gustavo Nakagomi Lopez <andregnl@usp.br>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-spi@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Alexandru Ardelean <aardelean@deviqon.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Vinod Koul <vkoul@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-amlogic@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 linux-mips@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Cai Huoqing <caihuoqing@baidu.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-crypto@vger.kernel.org,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v8 02/16] clk: Provide new devm_clk
 helpers for prepared and enabled clocks
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
Content-Type: multipart/mixed; boundary="===============4635829536895699357=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4635829536895699357==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oterd73bfcoy35ck"
Content-Disposition: inline


--oterd73bfcoy35ck
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 19, 2022 at 06:29:36PM +0000, Jonathan Cameron wrote:
> On Mon, 14 Mar 2022 15:16:29 +0100
> Uwe Kleine-K=F6nig         <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > When a driver keeps a clock prepared (or enabled) during the whole
> > lifetime of the driver, these helpers allow to simplify the drivers.
> >=20
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> One trivial thing below.
>=20
> > ---
> >  drivers/clk/clk-devres.c | 31 ++++++++++++++
> >  include/linux/clk.h      | 90 +++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 120 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> > index fb7761888b30..4707fe718f0b 100644
> > --- a/drivers/clk/clk-devres.c
> > +++ b/drivers/clk/clk-devres.c
> > @@ -67,12 +67,43 @@ struct clk *devm_clk_get(struct device *dev, const =
char *id)
> >  }
> >  EXPORT_SYMBOL(devm_clk_get);
> > =20
> > +struct clk *devm_clk_get_prepared(struct device *dev, const char *id)
> > +{
> > +	return __devm_clk_get(dev, id, clk_get, clk_prepare, clk_unprepare);
>=20
> Nitpick but this spacing before } in functions is rather unusual and not
> in keeping with the existing code in this file.
>=20
> > +
> > +}

ack, I fixed that in my tree, so this will be part of an v9. I won't
send it just for this change, though. I fixed three further functions
that had a similar empty line, too.

Thanks for looking
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--oterd73bfcoy35ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmI4J6MACgkQwfwUeK3K
7Ak5sAf/aG3oVD1FgzqJLWD3uSmF0uX0/3lky1l56go3LpRjDym8tlGglXT4z7Hl
Z3q8YXru6LSihHT/n6V4EUdpV6f49dxPfrr9hu9OFU+UY0Cd7NgisKr+0Wi61dbS
d8IVGHwcCPqBZanHdAEjhle7d7WdWhfukR1oLljd8B2XM6qP2jQgjFWzrSJfZ+hd
qd6k9TcfIHjy8n8xBtyIYSvYZbywqfa+wJeU54fe4fp4NNPVTmxGtzHFNDipSZGL
uF+yg7qDqSezst7wO3dNeblEvpVZfG9TZAXvGMCZQLn9x4b35iSmZtLVPN+HZZM4
WBr/EA6mCSOr4iHXCKfNr4UegGV4/w==
=gON5
-----END PGP SIGNATURE-----

--oterd73bfcoy35ck--

--===============4635829536895699357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4635829536895699357==--
