Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E98FFAD9A87
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 08:47:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82CC0C36B3D;
	Sat, 14 Jun 2025 06:47:28 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0BC7C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 06:47:26 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 7C4A51C00A4; Sat, 14 Jun 2025 08:47:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1749883645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nq2VMzusQXJdAZDR0PVqMFoxiMFSHB1Zq1d1MUyO7/M=;
 b=CJtZWBrchouIXzaomFU7ufFekRA9oTEVUBcRxPh1aGCtkolSl3PPeUm6Vdy4Zi/qq+BbIL
 y2+ONs7eJB1n3//ZNGV+92vplpiqJ2BlqPTy1sNLOONnGZeMEAgOBFJnqxNXIKKVm7uBAk
 4iLfWoLwa540gktZliYA0g8h3ffD41Y=
Date: Sat, 14 Jun 2025 08:47:25 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <aE0a/Y9qVByfA2vI@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz> <2243943.irdbgypaU6@workhorse>
 <aEsiTy++yKGe1p9W@duo.ucw.cz> <aEsmDyc44P8amm5p@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <aEsmDyc44P8amm5p@smile.fi.intel.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-rockchip@lists.infradead.org,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 David Lechner <dlechner@baylibre.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
 kernel@pengutronix.de, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/28] iio: zero init stack with { }
	instead of memset()
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
Content-Type: multipart/mixed; boundary="===============6700077267814582828=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6700077267814582828==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8EN7Mf+Ky8207VFl"
Content-Disposition: inline


--8EN7Mf+Ky8207VFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-06-12 22:10:07, Andy Shevchenko wrote:
> On Thu, Jun 12, 2025 at 08:54:07PM +0200, Pavel Machek wrote:
> > > On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel=
 Machek wrote:
> > > >=20
> > > > > Jonathan mentioned recently that he would like to get away from u=
sing
> > > > > memset() to zero-initialize stack memory in the IIO subsystem. An=
d we
> > > > > have it on good authority that initializing a struct or array wit=
h =3D { }
> > > > > is the preferred way to do this in the kernel [1]. So here is a s=
eries
> > > > > to take care of that.
> > > >=20
> > > > 1) Is it worth the churn?
> > > >=20
> > > > 2) Will this fail to initialize padding with some obscure compiler?
> > >=20
> > > as of right now, the only two C compilers that are supported are
> > > GCC >=3D 8.1, and Clang >=3D 13.0.1. If anyone even manages to get the
> > > kernel
> >=20
> > Well... I'm pretty sure parts of this would make it into -stable as a
> > dependency, or because AUTOSEL decides it is a bugfix. So..
> >=20
> > GNU C                  4.9              gcc --version
> > Clang/LLVM (optional)  10.0.1           clang --version
>=20
> Even though, what the kernel versions are you referring to? I am sure the=
re
> plenty of cases with {} there.

5.10, for example. I'm sure they are, uninitialized padding is a
security hole, but rather hard to detect if they are not specifically
looking.

BR,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--8EN7Mf+Ky8207VFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaE0a/QAKCRAw5/Bqldv6
8s8GAJwP0O7BqJu50EUbwvpDrfK4gyMKdACfahroIQZ2mLJdQs4CjH06C6Xtr0Q=
=2Vk7
-----END PGP SIGNATURE-----

--8EN7Mf+Ky8207VFl--

--===============6700077267814582828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6700077267814582828==--
