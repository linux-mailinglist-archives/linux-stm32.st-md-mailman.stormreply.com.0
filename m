Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9EC481D97
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Dec 2021 16:08:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C44A4C5E2C5;
	Thu, 30 Dec 2021 15:08:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ACDEC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Dec 2021 15:08:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2x2e-0002NA-4e; Thu, 30 Dec 2021 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2x2b-007VMX-5P; Thu, 30 Dec 2021 16:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2x2a-00081Q-4e; Thu, 30 Dec 2021 16:08:28 +0100
Date: Thu, 30 Dec 2021 16:08:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20211230150828.iy7julxbvlcupazx@pengutronix.de>
References: <20211229154441.38045-1-u.kleine-koenig@pengutronix.de>
 <20211230085351.pywngltvdam25emx@pengutronix.de>
 <20211230145826.7f23becb@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20211230145826.7f23becb@jic23-huawei>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 David Lechner <david@lechnology.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Syed Nayyar Waris <syednwaris@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 00/23] counter: cleanups and device
	lifetime fixes
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
Content-Type: multipart/mixed; boundary="===============5930773336522303721=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5930773336522303721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7547pgm5uqxs232y"
Content-Disposition: inline


--7547pgm5uqxs232y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 30, 2021 at 02:58:26PM +0000, Jonathan Cameron wrote:
> On Thu, 30 Dec 2021 09:53:51 +0100
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > Hello,
> >=20
> > On Wed, Dec 29, 2021 at 04:44:18PM +0100, Uwe Kleine-K=F6nig wrote:
> > > this is v3 of my series to fix device lifetime issues in the counter
> > > framework. This hopefully addresses all things pointed out for v2.
> > >=20
> > > Note this depends on 60f07e74f86b (which is in next) now. Full diffst=
at
> > > below.
> > >=20
> > > Things that could be further improved:
> > >=20
> > > [...]
> > >=20
> > > Uwe Kleine-K=F6nig (23):
> > >   counter: Use container_of instead of drvdata to track counter_device
> > >   counter: ftm-quaddec: Drop unused platform_set_drvdata()
> > >   counter: microchip-tcb-capture: Drop unused platform_set_drvdata()
> > >   counter: Provide a wrapper to access device private data
> > >   counter: 104-quad-8: Convert to counter_priv() wrapper
> > >   counter: interrupt-cnt: Convert to counter_priv() wrapper
> > >   counter: microchip-tcb-capture: Convert to counter_priv() wrapper
> > >   counter: intel-qep: Convert to counter_priv() wrapper
> > >   counter: ftm-quaddec: Convert to counter_priv() wrapper
> > >   counter: ti-eqep: Convert to counter_priv() wrapper
> > >   counter: stm32-lptimer-cnt: Convert to counter_priv() wrapper
> > >   counter: stm32-timer-cnt: Convert to counter_priv() wrapper
> > >   counter: Provide alternative counter registration functions
> > >   counter: Update documentation for new counter registration functions
> > >   counter: 104-quad-8: Convert to new counter registration
> > >   counter: interrupt-cnt: Convert to new counter registration
> > >   counter: intel-qep: Convert to new counter registration
> > >   counter: ftm-quaddec: Convert to new counter registration
> > >   counter: microchip-tcb-capture: Convert to new counter registration
> > >   counter: stm32-timer-cnt: Convert to new counter registration
> > >   counter: stm32-lptimer-cnt: Convert to new counter registration
> > >   counter: ti-eqep: Convert to new counter registration
> > >   counter: remove old and now unused registration API
> > >=20
> > >  Documentation/driver-api/generic-counter.rst |  10 +-
> > >  drivers/counter/104-quad-8.c                 |  93 +++++-----
> > >  drivers/counter/counter-core.c               | 186 ++++++++++++++---=
--
> > >  drivers/counter/ftm-quaddec.c                |  36 ++--
> > >  drivers/counter/intel-qep.c                  |  46 ++---
> > >  drivers/counter/interrupt-cnt.c              |  38 ++--
> > >  drivers/counter/microchip-tcb-capture.c      |  44 ++---
> > >  drivers/counter/stm32-lptimer-cnt.c          |  51 ++---
> > >  drivers/counter/stm32-timer-cnt.c            |  48 ++---
> > >  drivers/counter/ti-eqep.c                    |  31 ++--
> > >  include/linux/counter.h                      |  15 +-
> > >  11 files changed, 356 insertions(+), 242 deletions(-)
> > >=20
> > > Range-diff against v2:
> > > [...]
> > >=20
> > > base-commit: a7904a538933c525096ca2ccde1e60d0ee62c08e
> > > prerequisite-patch-id: 9459ad8bc78190558df9123f8bebe28ca1c396ea =20
> >=20
> > All patches have a blessing by at least one of William and Jonathan.
>=20
> For future reference (may be fine this time) William has final say on cou=
nter
> stuff as the maintainer so treat my input as just another set of eyes.

Yeah, right. William only didn't ack patch 13 but wrote in reply it in v2:

	I agree with the approach taken in this patch, and I don't have much to
	add after the suggestions Lars-Peter and Jonathan have already given. So
	assuming those are addressed in the next version I expect to Ack this
	patch as well.

So I assume it's just that William didn't have the time yet to look into
v3 (or v4 that I just sent out) yet.

Best regards and thanks to all who gave feedback to improve this patch
set,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7547pgm5uqxs232y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHNy2gACgkQwfwUeK3K
7AkVxgf/YEpJYjM3bn0tJoCZm5z1+9HEyxBcCdYvZkrR/r1W76x+QjoTmtqoUkOw
W2dJAKUIPtSZrkPAqUudrsQPnWo7wIBGKtC1tW6E38jCe9o7A/SFFopedwIF9clI
X28pk3rY9kFj9l6WK4yef2abY7hGAyi3eYyorm8QJzkdQF3HuiR2BEFevGKcEGMr
HRvP6V5NZ06+pYkNI4arg0hqFAlJZb9h+LdrhcQjFxYW4HROL+pe4iy1xkEGKVQO
mwbVNjhEfNaLwKUm58fyNr77vebIPhNrTuiRDM/f+gKcu07zThgxiaS/CLH5Tqkw
OoVyfyqM6/6thSXjoor4nmGo/xH2Ew==
=Y3X/
-----END PGP SIGNATURE-----

--7547pgm5uqxs232y--

--===============5930773336522303721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5930773336522303721==--
