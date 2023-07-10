Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D074D75C
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 15:21:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C24CEC6B457;
	Mon, 10 Jul 2023 13:21:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED319C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 13:21:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C621F60DED;
 Mon, 10 Jul 2023 13:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94191C433C7;
 Mon, 10 Jul 2023 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688995274;
 bh=ruJlO0wimIrsDY1JgPUqCqS7prBe1pSopi+dM4yYAWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tCUvqCttiPcwuUH6oQaeDTVlt/jVMTKddukpB3Rq2NTAjbzgaXhOs+IbQKiqA2zFS
 A9RwOziobHTKo8xtAoLCbw9/G5XP7z93lwwcMiVxafq8PiTNYdyOWz2ZmNVbJqaRu3
 p+o7GErUG6dN3D+2vdmSUok/vpvLEP/d4e2/6uVM8lFbtbK1g1KhHRcJ+YzSNSc8aV
 vzC9RTasZiyt6DNQvmgXjaDeqvMTkrDbkZFHHHz5OJ3MwZifaBQsXsj96SFX7XFS5/
 2yl7VTCIzPWHRNx1uEfr8lQDSlw+D72llgC2cC8KCiu81fGygjzL2Umg2d4uKSVdv1
 5QaNEib99pP6w==
Date: Mon, 10 Jul 2023 14:21:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
 <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
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
Content-Type: multipart/mixed; boundary="===============3894712438315947000=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3894712438315947000==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bc8mzeK4BJwaYeTa"
Content-Disposition: inline


--Bc8mzeK4BJwaYeTa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 03:37:59PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> > On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:

> > > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > > and kill the not used anymore definitions.

...

> > > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

> > What part of the above change is replacing _NO_ with _MUST_?

> None, that's why assuming the split by name should be fine.

That's what the above changelog sounds like it's trying to do (I'm not
sure the change itself makes sense but the first thing I ran into when
reviewing the patch), AFIACT you're missing a "from" in the changelog?

--Bc8mzeK4BJwaYeTa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsBcAACgkQJNaLcl1U
h9BDYgf/Sarsl9t6SagewIDl2ctlFPl7f++zP6SLId0C0LErq2lPLxZKf8tzzV5x
7mUMpK3rPcygDeYAqOKLncxnrZp/i7yix/98fZtls9IesvOQa29aRYKVSvhKnB6y
dHoZoMBdYj1Rbo/olUcS1xjzzZ0o1VUHkLsp9rjoMW4lcz6Hu3o8GSOq1pbc9lRd
qlCYAjMqjR9K3te5I6FICKKGnIrXm2uxuzSPZl1G7LaN0THUZGZJvcBHjhR2PcJs
K9i9m0gJ9xsQXDOQgLTcXrm8hdSF7yQoRI3TBZ7RXzdWeO3mjNjeHGbVDRr3DMZy
Oici+Ga3mBLzIlFlF51Tg71+BGqcoQ==
=NWL6
-----END PGP SIGNATURE-----

--Bc8mzeK4BJwaYeTa--

--===============3894712438315947000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3894712438315947000==--
