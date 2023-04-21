Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1316EA6DA
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Apr 2023 11:25:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0AFCC65E4F;
	Fri, 21 Apr 2023 09:25:06 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36238C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Apr 2023 09:25:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ppn0h-0002lD-EN; Fri, 21 Apr 2023 11:24:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ppn0d-00ClWe-U6; Fri, 21 Apr 2023 11:24:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ppn0d-00F2bw-70; Fri, 21 Apr 2023 11:24:51 +0200
Date: Fri, 21 Apr 2023 11:24:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Message-ID: <20230421092451.gzhvwrlyu5v6zdzc@pengutronix.de>
References: <20230412153709.3557323-1-u.kleine-koenig@pengutronix.de>
 <20230420110111.GM9904@google.com>
MIME-Version: 1.0
In-Reply-To: <20230420110111.GM9904@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-iio@vger.kernel.org,
 William Breathitt Gray <william.gray@linaro.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: Reset TIM_TISEL
 and TIM_SMCR to their default value
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
Content-Type: multipart/mixed; boundary="===============5000731827678344655=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5000731827678344655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bjnsfkotsoxo2uty"
Content-Disposition: inline


--bjnsfkotsoxo2uty
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Thu, Apr 20, 2023 at 12:01:11PM +0100, Lee Jones wrote:
> On Wed, 12 Apr 2023, Uwe Kleine-K=F6nig wrote:
>=20
> > The driver assumes that the input selection register (TIM_TISEL) is at
> > its reset default value. Usually this is the case, but the bootloader
> > might have modified it. Also reset the SMCR register while at it.
> >=20
> > This bases on the effectively same patch submitted by Olivier Moysan for
> > pwm-stm32.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > note that the patch by Olivier Moysan[1] for pwm-stm32 is expected to
> > appear in Thierry's tree soon. It added the definition of TIM_TISEL in
> > the same way, so the two patches should merge just fine. Alternatively
> > you can commit it to a tree that already has the pwm change (and then
> > drop the change to include/linux/mfd/stm32-timers.h from this one).
> >=20
> > Best regards
> > Uwe
> >=20
> > [1] https://lore.kernel.org/linux-pwm/20221213102707.1096345-1-olivier.=
moysan@foss.st.com
> >=20
> >  drivers/counter/stm32-timer-cnt.c | 4 ++++
>=20
> >  include/linux/mfd/stm32-timers.h  | 1 +
>=20
> Acked-by: Lee Jones <lee@kernel.org>

Note there is a v2 at
https://lore.kernel.org/r/20230413212339.3611722-1-u.kleine-koenig@pengutro=
nix.de,
William wrote that he already applied it, so replying with tag in that
thread might be already to late, too.

(nevertheless) Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bjnsfkotsoxo2uty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRCVmIACgkQj4D7WH0S
/k50mQgAk2DRzoWOq3MEG9fmK8vd1LitFammB41nT+Dh8r2Q9oPfxPY2/I4p3GFJ
uO48jePuSswpv3FPeMeVh2eQ+TatlVv0JcTJBq0wBm8SYeX1Nn7muR01ok+HJoa6
v5XJWY49Ok0VBMH53ZIQwawhWmGEQLAWpCUXyysF6+ELz5BvFz3KcRX48KoymejU
Rrvowztodb9mPaK13tvh8q6kPaeOGco+19iQlwDkxrcEL++S1zMv027SK4EQXv8A
0CcvuGE8WixEBiMlLO+F9oq+Nj1UxjUh/90l+R9VK9X/u5ntdLYL2XuG/5af/ZQy
dfXjWeU0mp27O9kpeAb5qY0Y3ST2ZQ==
=w174
-----END PGP SIGNATURE-----

--bjnsfkotsoxo2uty--

--===============5000731827678344655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5000731827678344655==--
