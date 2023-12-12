Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8180F8DA
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 22:05:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34737C6C85B;
	Tue, 12 Dec 2023 21:05:14 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F94C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 21:05:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD9wF-0001Oy-5K; Tue, 12 Dec 2023 22:05:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD9wE-00FQEY-2C; Tue, 12 Dec 2023 22:05:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD9wD-001snP-Ol; Tue, 12 Dec 2023 22:05:09 +0100
Date: Tue, 12 Dec 2023 22:05:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20231212210509.focpb63fbmahqij3@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <ZXM4CdJxg-XrYhkn@orome.fritz.box>
 <20231208185033.e6ty2cajcfle6dgk@pengutronix.de>
 <ZXbzcFTnDTKoZAta@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZXbzcFTnDTKoZAta@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v4 000/115] pwm: Fix lifetime issues for
	pwm_chips
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
Content-Type: multipart/mixed; boundary="===============8085867818314662983=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8085867818314662983==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gyt34nc3mm25zmmf"
Content-Disposition: inline


--gyt34nc3mm25zmmf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Mon, Dec 11, 2023 at 12:33:04PM +0100, Thierry Reding wrote:
> On Fri, Dec 08, 2023 at 07:50:33PM +0100, Uwe Kleine-K=F6nig wrote:
> > You don't need to touch all drivers because you didn't change struct
> > pwm_chip::dev yet. (If you really want, you don't need to change that,
> > but then you have some duplication as chip->dev holds the same value as
> > priv->dev.parent in the end.)
>=20
> I don't think that's a problem. These are for two logically separate
> things, after all.

How are they different? I'd say one is the initializer for the other and
(ideally) unused after that. With that interpretation they are indeed
different, but then it's ugly that the initializer keeps staying around.

> Duplication can also sometimes be useful to simplify
> things. There are plently of cases where we use local variables for the
> same reason.

local variables go away though after the respective function is left.
chip->dev and its copy priv->dev.parent stay around for the full
lifetime of the chip.

> > > @@ -58,23 +60,24 @@ static struct pwm_chip *pwmchip_find_by_name(cons=
t char *name)
> > > =20
> > >  static int pwm_device_request(struct pwm_device *pwm, const char *la=
bel)
> > >  {
> > > +	struct pwm_chip *chip =3D pwm->priv->chip;
> >=20
> > With my approach getting the chip of a struct pwm_device is only one
> > pointer dereference away. You need two.
>=20
> None of the functions here are called very often, so even if this isn't
> optimized away it would hardly matter.

I'd say pwm_apply_state() at least matters. Also I think that making a
slow path quicker is a good thing.=20

I wonder how we'll converge to an approach that can go into the
mainline given that we both have our strong opinions.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gyt34nc3mm25zmmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV4ywQACgkQj4D7WH0S
/k4AOQf/Rn+1it6Pa2jcb+shcSHEefw76NASZ1jTJwzdnczaZca+4/TdY0/HLE/V
27TLO93Qd9e4o0E4uFjg/T9KbZy+cu9WxiCJ9LgBEhgPaLIWe9opiDarsy2BNLJi
e6lERFOmyBoG3USP7t/iEQn5C+0+gC6/pcPVWk8TJO/mc2kr8ioQRsaHtaE0AsX0
hpZS0GH+ypW5d1saF+TMkSDV4QUzmTaXxsSDqG9/vnXhjln6wlriyIo2gJI2qQ6R
gBrGVWoz8SnG3OjfGZwo9KhL+KPTbjIba4erb1KbE9j9Ul7c3xF/nA6GcTwU/IcQ
6WQMUp7Ez5oG8txpknnsR9R2Iimimw==
=APXJ
-----END PGP SIGNATURE-----

--gyt34nc3mm25zmmf--

--===============8085867818314662983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8085867818314662983==--
