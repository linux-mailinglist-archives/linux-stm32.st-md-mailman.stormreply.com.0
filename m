Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D0D390A72
	for <lists+linux-stm32@lfdr.de>; Tue, 25 May 2021 22:24:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26DD7C5978A;
	Tue, 25 May 2021 20:24:35 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA98BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 May 2021 20:24:30 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lldbG-0003k0-F6; Tue, 25 May 2021 22:24:26 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lldbE-0002MN-Jf; Tue, 25 May 2021 22:24:24 +0200
Date: Tue, 25 May 2021 22:24:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20210525202423.j44jd4qqkfegeupc@pengutronix.de>
References: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
 <1bd7cad8-723b-ec43-745c-0be32d105c0b@foss.st.com>
 <20210514140843.fmwxb777vaommodw@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210514140843.fmwxb777vaommodw@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: stm32-lp: Don't modify HW state
 in .remove callback
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
Content-Type: multipart/mixed; boundary="===============3015044142341477756=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3015044142341477756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="45j4xlhkaffbxc5p"
Content-Disposition: inline


--45j4xlhkaffbxc5p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Fabrice,

On Fri, May 14, 2021 at 04:08:43PM +0200, Uwe Kleine-K=F6nig wrote:
> On Wed, May 12, 2021 at 09:41:45AM +0200, Fabrice Gasnier wrote:
> > On 5/5/21 6:28 PM, Uwe Kleine-K=F6nig wrote:
> > > A consumer is expected to disable a PWM before calling pwm_put(). And=
 if
> > > they didn't there is hopefully a good reason (or the consumer needs
> > > fixing).
> >=20
> > As you pointed out, (ideally) consumers need to disable the PWM before
> > undind or remove of the driver. Calling pwm_disable in the remove is a
> > "fail safe".
> >=20
> > > Also if disabling an enabled PWM was the right thing to do,
> > > this should better be done in the framework instead of in each low le=
vel
> > > driver.
> >=20
> > Not doing so, in case the driver gets unbind when the PWM is enabled,
> > then bind again, it leads to unbalanced clock enable count.
>=20
> Ah, the clk must indeed be properly freed, hmm. I will respin the patch.

I took a deeper look now, and I don't agree any more to what I wrote
here. The clock is provided by the parent device, so .probe() doesn't
call clk_get() (or one of its variants). The clock is only enabled when
the .apply() callback is called with .enabled =3D true. So indeed if the
driver is unloaded while the PWM is still running, the enable count is
non-zero at the end. The unbalanced clock enable count isn't a big
problem (it just never reaches zero any more, which is harmless compared
to becoming negative).

I don't think this should be fixed or handled at the driver level.
Consumers should be fixed to not produce such a leak and if we are sure
that this is really always wrong, a check (and maybe a call to
pwm_disable()) should be added to the PWM core code.

So I'm in favour of applying the patch as is.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--45j4xlhkaffbxc5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCtXPQACgkQwfwUeK3K
7AmuDQgAlTxav4zuot8XqBV5L4q2+ItZyzqZxrRRcBJs+elkfzdgQ1qLmp4mXOay
curw0RKu4vFqPUS6R2iSWVMMxnFk4TQsAI0s81x0MWNBBCTyvZcS36+UOr74vTiU
Szft2WXM6tG+kg/y3uR62eLMwSSwZVy11YRQ+FGSAQPNOyR3SPvVUZvTjoqXmPbp
ZYhmZnuJ8e4pxwELo7DcrklATYi7yKXmWZDNyBH4TWuBLvlCP4diSAIwhR9K2JHq
uj/dFYmhm1qhIDh1U7rsKYT3Xs5TLOP2W1OGZj8FphGfPpSmm5QiLzLcDya67OFu
SdHFhnTbPE1zNU1fEOxfZJAXXytoMw==
=5YHM
-----END PGP SIGNATURE-----

--45j4xlhkaffbxc5p--

--===============3015044142341477756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3015044142341477756==--
