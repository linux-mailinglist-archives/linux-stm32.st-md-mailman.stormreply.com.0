Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD3647D615
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 18:52:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22A68C5F1EE;
	Wed, 22 Dec 2021 17:52:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 309D3C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 17:52:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n05mK-00038x-DV; Wed, 22 Dec 2021 18:51:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n05mG-0062lA-7p; Wed, 22 Dec 2021 18:51:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n05mF-0002sK-4h; Wed, 22 Dec 2021 18:51:47 +0100
Date: Wed, 22 Dec 2021 18:51:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20211222175139.6smiezanuduod6fm@pengutronix.de>
References: <20211221104546.214066-1-u.kleine-koenig@pengutronix.de>
 <dadb79b2-ac21-1899-48b9-1c6723afb1b4@metafoo.de>
 <20211221113542.rl4aburbzzrgs3km@pengutronix.de>
 <65009237-7e61-21aa-60cd-b7f7e0bb2f91@metafoo.de>
MIME-Version: 1.0
In-Reply-To: <65009237-7e61-21aa-60cd-b7f7e0bb2f91@metafoo.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, linux-kernel@vger.kernel.org,
 David Lechner <david@lechnology.com>, linux-iio@vger.kernel.org,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] counter: Remove struct
	counter_device::priv
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
Content-Type: multipart/mixed; boundary="===============1678828474688168729=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1678828474688168729==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="asrj6mdmugq3ovqq"
Content-Disposition: inline


--asrj6mdmugq3ovqq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Dec 21, 2021 at 01:04:50PM +0100, Lars-Peter Clausen wrote:
> On 12/21/21 12:35 PM, Uwe Kleine-K=F6nig wrote:
> > On Tue, Dec 21, 2021 at 12:12:12PM +0100, Lars-Peter Clausen wrote:
> > > On 12/21/21 11:45 AM, Uwe Kleine-K=F6nig wrote:
> > > > similar to patch
> > > > https://lore.kernel.org/r/4bde7cbd9e43a5909208102094444219d3154466.=
1640072891.git.vilhelm.gray@gmail.com
> > > > the usage of struct counter_device::priv can be replaced by
> > > > container_of which improves type safety and code size.
> > > >=20
> > > > This series depends on above patch, converts the remaining drivers =
and
> > > > finally drops struct counter_device::priv.
> > > Not sure if this is such a good idea. struct counter_device should no=
t be
> > > embedded in the drivers state struct in the first place.
> > Just to mention it: My patch series didn't change this, this was already
> > broken before.
> I know, but this series has to be reverted when the framework is fixed.
> >=20
> > > struct counter_device contains a struct device, which is a reference =
counted
> > > object. But by embedding it in the driver state struct the life time =
of both
> > > the struct counter_device and and struct device are bound to the life=
 time
> > > of the driver state struct.
> > >=20
> > > Which means the struct device memory can get freed before the last re=
ference
> > > is dropped, which leads to a use-after-free and undefined behavior.
> > Well, the driver struct is allocated using devm_kzalloc for all drivers.
>=20
> devm_kzalloc() doesn't make a difference. The managed memory is freed when
> the parent device is unbound/removed. There may very well be reference to
> the counter_device at this point.
>=20
> > So I think it's not *very* urgent to fix. Still you're right, this
> > should be addressed.
>=20
> Yes and no, this can trivially be used for privilege escalation, but then
> again on systems with a counter_device probably everything runs as root
> anyway.

I could provoke an oops with the following shell command:


	{ sleep 5; echo bang; } > /dev/counter0 & sleep 1; echo 40000000.timer:cou=
nter > /sys/bus/platform/drivers/stm32-timer-counter/unbind

I have a protype here to split counter_register() into counter_alloc() +
counter_add(), but I didn't convert a driver to it yet. If you want to
take a look, it's currently available from

	https://git.pengutronix.de/git/ukl/linux counter-dev-livetime

(or if you prefer a webif:

	https://git.pengutronix.de/cgit/ukl/linux/log/?h=3Dcounter-dev-livetime

). I planned to just invest a two or so hours to fix this. But the plan
failed (one reason is that v5.16-rc6 failed to boot on the stm32mp1 I
work on and I bisected that first.)

Maybe I find some time between the years to get this forward a bit.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--asrj6mdmugq3ovqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHDZagACgkQwfwUeK3K
7AkNqQf/fIe5zz5fAatnqj+QS3OUWmufUxx3MXg1a8ghQ2E3sdiTgIbgICfg94Cq
6OqkCvh4W9HBpMUQbVHPtpaxHBRA6UQqOxfcKYcOvaq4HAY+8roCYKMKbBqMEnIY
CY/7CB2s9xCv3cedWaVwtnpM3pVO862mMvGwv7HEZgVcj6wXDFSYXMCZUcZ2yPXc
UTs25lC4sJ9Y1txUFHHiE767NJ9O8itmTwsZ5tj7zY/SaVKwVKSwl1SCEyK6pCmW
DmxCK83zAZnlBfnEe7hA97x+dd3vtWbmMTAVuaU17gp2I7O6s5jQcCLvWQBPn7XD
4Cl3Ox6CVJcgiHvVgLaL9aXQCqQ7TQ==
=8UkX
-----END PGP SIGNATURE-----

--asrj6mdmugq3ovqq--

--===============1678828474688168729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1678828474688168729==--
