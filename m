Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F282D380B1C
	for <lists+linux-stm32@lfdr.de>; Fri, 14 May 2021 16:08:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AE26C57B53;
	Fri, 14 May 2021 14:08:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9BDAC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 14:08:49 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lhYUg-00089O-EY; Fri, 14 May 2021 16:08:46 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lhYUd-0006U2-Ox; Fri, 14 May 2021 16:08:43 +0200
Date: Fri, 14 May 2021 16:08:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20210514140843.fmwxb777vaommodw@pengutronix.de>
References: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
 <1bd7cad8-723b-ec43-745c-0be32d105c0b@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1bd7cad8-723b-ec43-745c-0be32d105c0b@foss.st.com>
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
Content-Type: multipart/mixed; boundary="===============1251539187310886350=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1251539187310886350==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3ssbadqkkhfrize"
Content-Disposition: inline


--w3ssbadqkkhfrize
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Fabrice,

On Wed, May 12, 2021 at 09:41:45AM +0200, Fabrice Gasnier wrote:
> On 5/5/21 6:28 PM, Uwe Kleine-K=F6nig wrote:
> > A consumer is expected to disable a PWM before calling pwm_put(). And if
> > they didn't there is hopefully a good reason (or the consumer needs
> > fixing).
>=20
> As you pointed out, (ideally) consumers need to disable the PWM before
> undind or remove of the driver. Calling pwm_disable in the remove is a
> "fail safe".
>=20
> > Also if disabling an enabled PWM was the right thing to do,
> > this should better be done in the framework instead of in each low level
> > driver.
>=20
> Not doing so, in case the driver gets unbind when the PWM is enabled,
> then bind again, it leads to unbalanced clock enable count.

Ah, the clk must indeed be properly freed, hmm. I will respin the patch.

> There's no change to recover the balance after it.
>=20
> Also, I'm also wondering if it's a good idea to let a free running PWM
> channel? (That's probably a more general discussion).

It might make sense, e.g. if you don't want your backlight to go out
for a reboot because the display shows a "I'm rebooting" message.

> > So drop the hardware modification from the .remove() callback.
>=20
> For now, I'd prefer to keep the current implementation, e.g. not to
> simply drop this fail safe.
>=20
> Is there a reason to address only the STM32 LP Timer pwm driver in your
> patch ?

Whenever I find a driver I fix it. So I already fixed some other drivers
accordingly. See

	git lg --grep=3D"modify HW state in .remove"

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--w3ssbadqkkhfrize
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCehGgACgkQwfwUeK3K
7An71wgAky5o74AzdJqyKcYzqPPLAD7k6swxNYuaiImmItvaxOrxSIR+nV+ouv/T
ozk4V2UxvaC9YMPVBFM5DPYhuithVSbK6VRTAOQlQgobOEomR/DHqrqeZhVGi5v7
MIML2N2fEXr+FxfTlB3NnrwBipZgKOJnamcbTG74Zd1CM9MDWrEkf3F/SxBf0mdz
mHx3P4GB44/gKJA17PEW/cOZUeLFVPskNFv7CtcUdTJZbhPeNBAVuSf53/9iIcjk
jJP6u9mL81Z/a0nQq5I/3m7HPBp4Mk82/cIGUeZbS4TIb4A/B3VHtjuYtVLU3caj
vsk7xzsofKcU0F3E8AxQFUQIQ5FUEg==
=8jsU
-----END PGP SIGNATURE-----

--w3ssbadqkkhfrize--

--===============1251539187310886350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1251539187310886350==--
