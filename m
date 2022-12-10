Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA98F648DE9
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Dec 2022 10:22:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A309C65E6E;
	Sat, 10 Dec 2022 09:22:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 247A0C65E63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Dec 2022 09:22:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w3Y-0003nU-Gl; Sat, 10 Dec 2022 10:22:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w3T-003YC4-IF; Sat, 10 Dec 2022 10:22:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w3T-003yUw-Ba; Sat, 10 Dec 2022 10:21:59 +0100
Date: Sat, 10 Dec 2022 10:21:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: dri-devel@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, Dave Airlie <airlied@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Tomi Valkeinen <tomba@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] drm: Drop ARCH_MULTIPLATFORM from
	dependencies
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
Content-Type: multipart/mixed; boundary="===============0373594036388834952=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0373594036388834952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lx3uyybbmyqkxs4g"
Content-Disposition: inline


--lx3uyybbmyqkxs4g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Arnd,

On Fri, Dec 09, 2022 at 11:53:49PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 9, 2022, at 23:05, Uwe Kleine-K=F6nig wrote:
> > Some of these dependencies used to be sensible when only a small part of
> > the platforms supported by ARCH=3Darm could be compiled together in a
> > single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a guard
> > for kernel options incompatible with a multiplatform image. See commit
> > 84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some more
> > details.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Makes sense,
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks. (But honestly I'm not surprised you agree to this patch after
our conversation on irc :-)
=20
> > diff --git a/drivers/gpu/drm/omapdrm/Kconfig=20
> > b/drivers/gpu/drm/omapdrm/Kconfig
> > index 455e1a91f0e5..76ded1568bd0 100644
> > --- a/drivers/gpu/drm/omapdrm/Kconfig
> > +++ b/drivers/gpu/drm/omapdrm/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_OMAP
> >  	tristate "OMAP DRM"
> >  	depends on DRM && OF
> > -	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
> > +	depends on ARCH_OMAP2PLUS
> >  	select DRM_KMS_HELPER
> >  	select VIDEOMODE_HELPERS
> >  	select HDMI
>=20
> Since the original purpose of the ||ARCH_MULTIPLATFORM was to allow
> building the driver on more targets, I wonder if we should instead
> make that ||COMPILE_TEST, which would also allow building it on
> x86 and others.

I wondered about that, too, but thought that would be a new patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lx3uyybbmyqkxs4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOUT7AACgkQwfwUeK3K
7Amcbgf9FjDJ3Y/G6MIauV6V2InYndp8uCxtZzkthWGB+KJwzC9s9h5qnAAmOmpE
qN/t2/cHhGqjOrbdBWvHZbXZVRkp9b3O8YhTSXGaavSOPGo2hdRofAJ77nnwXbzn
V56RWaNtHq115LwxdWUnj2Gj8J2vl69XCUCawcT8sjT7QA7fP9/WA/tyrFS+Qkiz
kwxBgJsyNtpy9K/0bMdvOy/E5FI4CkRy2U6h7Lq0SxZIwM3hx22elrLbrjgdaiZC
lKJSyfB2mELNGEYzmhyXXI49cbfcwjMw3i6z8+/jXTSFGHhta2ARzHlPGl945VFn
Vtlv+RShs/Yf3gqhsSYCL6q8o0zehA==
=ZXhE
-----END PGP SIGNATURE-----

--lx3uyybbmyqkxs4g--

--===============0373594036388834952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0373594036388834952==--
