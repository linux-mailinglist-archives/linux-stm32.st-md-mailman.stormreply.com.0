Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825B355581
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 15:44:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E61C5719D;
	Tue,  6 Apr 2021 13:44:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B305C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 13:44:04 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTlzt-0004HM-FT; Tue, 06 Apr 2021 15:44:01 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTlzo-00033c-7n; Tue, 06 Apr 2021 15:43:56 +0200
Date: Tue, 6 Apr 2021 15:43:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20210406134356.dda74heeshkwdarw@pengutronix.de>
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
 <YGxDD4jVZx/H/Zdr@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YGxDD4jVZx/H/Zdr@orome.fritz.box>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Fabio Estevam <festevam@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-pwm@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Stephen Boyd <sboyd@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] pwm: Rename pwm_get_state() to better
 reflect its semantic
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
Content-Type: multipart/mixed; boundary="===============7708663844110671701=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7708663844110671701==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6hkzfhuwxujjtpy"
Content-Disposition: inline


--t6hkzfhuwxujjtpy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Tue, Apr 06, 2021 at 01:16:31PM +0200, Thierry Reding wrote:
> On Tue, Apr 06, 2021 at 09:30:36AM +0200, Uwe Kleine-K=F6nig wrote:
> > Given that lowlevel drivers usually cannot implement exactly what a
> > consumer requests with pwm_apply_state() there is some rounding involve=
d.
> >=20
> > pwm_get_state() traditionally returned the setting that was requested m=
ost
> > recently by the consumer (opposed to what was actually implemented in
> > hardware in reply to the last request). To make this semantic obvious
> > rename the function.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  Documentation/driver-api/pwm.rst           |  6 +++-
> >  drivers/clk/clk-pwm.c                      |  2 +-
> >  drivers/gpu/drm/i915/display/intel_panel.c |  4 +--
> >  drivers/input/misc/da7280.c                |  2 +-
> >  drivers/input/misc/pwm-beeper.c            |  2 +-
> >  drivers/input/misc/pwm-vibra.c             |  4 +--
> >  drivers/pwm/core.c                         |  4 +--
> >  drivers/pwm/pwm-atmel-hlcdc.c              |  2 +-
> >  drivers/pwm/pwm-atmel.c                    |  2 +-
> >  drivers/pwm/pwm-imx27.c                    |  2 +-
> >  drivers/pwm/pwm-rockchip.c                 |  2 +-
> >  drivers/pwm/pwm-stm32-lp.c                 |  4 +--
> >  drivers/pwm/pwm-sun4i.c                    |  2 +-
> >  drivers/pwm/sysfs.c                        | 18 ++++++------
> >  drivers/regulator/pwm-regulator.c          |  4 +--
> >  drivers/video/backlight/pwm_bl.c           | 10 +++----
> >  include/linux/pwm.h                        | 34 ++++++++++++++--------
> >  17 files changed, 59 insertions(+), 45 deletions(-)
>=20
> Honestly, I don't think this is worth the churn. If you think people
> will easily get confused by this then a better solution might be to more
> explicitly document the pwm_get_state() function to say exactly what it
> returns.

I'm not so optimistic that people become aware of the semantic just
because there is documentation describing it and I strongly believe that
a good name for functions is more important than accurate documentation.

If you don't agree, what do you think about the updated wording in
Documentation/driver-api/pwm.rst?

> But there's no need to make life difficult for everyone by
> renaming this to something as cumbersome as this.

I don't expect any merge conflicts (and if still a problem occurs
resolving should be trivial enough). So I obviously don't agree to your
weighing.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t6hkzfhuwxujjtpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBsZZkACgkQwfwUeK3K
7AnKfQf8CsJvMKdyRy2ch/MNcEI+IBzOnV6nRAbwkLN/G3pbTRHLCtd8Zg/Iobf1
P7ADJlOPATvorbWWUoagJrzcsXswh3ctV5aSWs0Ax1GJQ+PxNtz20n+MtsiTq2gZ
flPfVN0AurTPqh+oGXK+f9C9N0ASjR7i2qjuUoub37yQ/abR5exNOpaM8FEnIbcF
OHcBHOokDL0GpBDir8M9UyfrsPt8TfVD5fk5hXr7hmBhY/iuGQynYDRMQ11/zkvM
lqdH7zPujy5oNqA/+6OSE8vbqoyTRoSqFHuyPRirxDrO14Yu2U570iUznQfg2O/t
3egDaTaqSuaJjxZHzKE4dbx3R/z8wQ==
=ePEJ
-----END PGP SIGNATURE-----

--t6hkzfhuwxujjtpy--

--===============7708663844110671701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7708663844110671701==--
