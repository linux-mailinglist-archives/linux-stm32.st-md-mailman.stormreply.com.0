Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B14AD7A05
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 20:54:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA077C32E8E;
	Thu, 12 Jun 2025 18:54:09 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C61B2C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 18:54:08 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 0D12D1C00B7; Thu, 12 Jun 2025 20:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1749754448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ES0AMk0wkXmaqMy9pIGghKd77rIPki0K7cABoa+Z/Lw=;
 b=bEFAWNrqxiDB3hTLYkNNin93KGymmobI30NxboUjySkMZZbQ1tDkw60ZqsrwZWSPzNXRLT
 19enMfhHWWz0Q5ewQBDGlyH0l4C9Yl59JXD+rK7DCySYJz3mn+lT8d5y3fwG56k5w4oziS
 988hpv7ySCcn9jbXEUW0jKpc8UQ+ntg=
Date: Thu, 12 Jun 2025 20:54:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <aEsiTy++yKGe1p9W@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz> <2243943.irdbgypaU6@workhorse>
MIME-Version: 1.0
In-Reply-To: <2243943.irdbgypaU6@workhorse>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>, linux-rockchip@lists.infradead.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 David Lechner <dlechner@baylibre.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============2875977889778057064=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2875977889778057064==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qHcR0wTfGJLS0CPf"
Content-Disposition: inline


--qHcR0wTfGJLS0CPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi1

> I thought I'd chime in as someone uninvolved because this seemed
> interesting.
>=20
> On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Mac=
hek wrote:
> > Hi!
> >=20
> > > Jonathan mentioned recently that he would like to get away from using
> > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > have it on good authority that initializing a struct or array with =
=3D { }
> > > is the preferred way to do this in the kernel [1]. So here is a series
> > > to take care of that.
> >=20
> > 1) Is it worth the churn?
> >=20
> > 2) Will this fail to initialize padding with some obscure compiler?
>=20
> as of right now, the only two C compilers that are supported are
> GCC >=3D 8.1, and Clang >=3D 13.0.1. If anyone even manages to get the
> kernel

Well... I'm pretty sure parts of this would make it into -stable as a
dependency, or because AUTOSEL decides it is a bugfix. So..

GNU C                  4.9              gcc --version
Clang/LLVM (optional)  10.0.1           clang --version

:-).

Best regards,
									Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--qHcR0wTfGJLS0CPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaEsiTwAKCRAw5/Bqldv6
8rWCAJ9iuK1SPCz8Iqmtg2YYJA3QcN1ZcQCcCDOYZeP9LCuc6TXu3fDJPaQEqxk=
=IRlm
-----END PGP SIGNATURE-----

--qHcR0wTfGJLS0CPf--

--===============2875977889778057064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2875977889778057064==--
