Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D929E74D447
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 13:10:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88C1EC6B457;
	Mon, 10 Jul 2023 11:10:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BED2C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 11:10:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AAB360F99;
 Mon, 10 Jul 2023 11:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE7CC433C7;
 Mon, 10 Jul 2023 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688987414;
 bh=gBzc2tZIawZS0PUBWYuNntkIVRyxrqJrpV4aYLufX50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YCpsYi8hZ5dhRZJo2dzz+GDrlvZ3y3Af66p3CIYUZn5Y7dTwO5nu+KqKKyalcHXoR
 PkygyNMxxD1kJ/lpREraWAr7ptMwrZdtMjK3PU29AnATl/uf8vAL9Nckrl/+MeLppg
 19u1l5oucwxlHlsOpcNXdgeY/3jdD6Md8RpxHE5vhqDd2CdGQZpt4EJ9jkXLMIe2Vi
 j8G3+oragW3KzCHXGkgfsqlqyuDdPjSBwMnDouPbYGO7j5vHL2lOm/CiBcEG3D/6Yt
 UEI3ZfBZW8x+aJt6SPMz70Pu1DNSCBE7XnZHCFijw9ibPwJlex9VzJs5Gg1OIblL+p
 7Sf/vgDKmS0KA==
Date: Mon, 10 Jul 2023 12:10:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <bb3b9ef2-0a32-4f8a-8d92-06d47875b562@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
X-Cookie: Do you have lysdexia?
Cc: Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Kris Bahnsen <kris@embeddedts.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 4/8] spi: Get rid of old
 SPI_MASTER_NO_.X and SPI_MASTER_MUST_.X
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
Content-Type: multipart/mixed; boundary="===============7316895863605451088=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7316895863605451088==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XsbcL+9pzd4b793B"
Content-Disposition: inline


--XsbcL+9pzd4b793B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> >=20
> > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > and kill the not used anymore definitions.

> > The above is not what this change does:

> How to improve it? I was sure that the form of "converting to something a=
nd
> something" is clear...

> > > -	controller->flags =3D SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > +	controller->flags =3D SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_=
TX;

The change here is not the change that is described above.

--XsbcL+9pzd4b793B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSr5woACgkQJNaLcl1U
h9AETQf/V6X5zgJr6k7uYHVQFcwbbL/m5vofjoxPJtbBrBmanG5Gk4nvQRtvE5KM
RpVSjTeFZ6uC+MkUxft/VIyhHYX0UETqWF2qmW7X91ieOzQ+qA80TTz19J1soL8A
bdQuSDpZRGY0O5f9XVApQSJ9PvLzql1IvaU8JVkUlF9HL8cNol+5w/YPdvB3kKU0
zxUG62Tx0R0Qvo/ku288lZhsKbhtXH6jwNvsxH39TNsnewnat7fJiZvShg6theLk
vV02J7JmsFAeUR3ZH24aBIcYM3bYv86vKInV1cKHAzBjoan98DG8cghY3IvapKia
sf0W5e1oHmvyUi1zga0aGvHvsKHkcA==
=AmsT
-----END PGP SIGNATURE-----

--XsbcL+9pzd4b793B--

--===============7316895863605451088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7316895863605451088==--
