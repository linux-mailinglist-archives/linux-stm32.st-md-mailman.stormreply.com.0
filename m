Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF874D479
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 13:23:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D39CC6B457;
	Mon, 10 Jul 2023 11:23:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C9A7C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 11:23:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE3060D3E;
 Mon, 10 Jul 2023 11:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F29C433C7;
 Mon, 10 Jul 2023 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688988188;
 bh=rVbOiKgyxND9mKZk3rAKjAS4exnyG60MuJg/qoml1Vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NmQJc/tPCMy3i5v1VlHdRroye/CciPC/ZvFOKcppf3TZf0qRJ3dgdRYwmDVOMOmqP
 VHTHnUz3SjT2CkGo2po+jFLM51kzErpdYTDzbIh1ssyixtC39WoS5AEx1AHhOh2rUT
 oGH0Cj/eImkEiRwQY+a6G/4uTBojRaP1c3PpTvWdlPa8OmIjqYJiqIt27qBeoOyByD
 uIezS9sRdsa2l0+EXR9NmvWwdDucaVOT+HG9neus16SKNTI7aq5f6UxW++970eT5gb
 zfoX4LNe9GA9UuIFwotHUiqYP63tgZEO9J8trRSJc2+FmmGG2Hl/AKVEk1ykYfoY0k
 6E9c0qXH0JqVA==
Date: Mon, 10 Jul 2023 12:22:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
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
Content-Type: multipart/mixed; boundary="===============9066410010358712284=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9066410010358712284==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SoPr26CyLWhD+5za"
Content-Disposition: inline


--SoPr26CyLWhD+5za
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:

> > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > and kill the not used anymore definitions.

> > > The above is not what this change does:

> > How to improve it? I was sure that the form of "converting to something and
> > something" is clear...

> A wild guess, maybe you meant to split to two changes, one per each macro group?

No, doing TX and RX in one commit is fine.

> > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

What part of the above change is replacing _NO_ with _MUST_?

--SoPr26CyLWhD+5za
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSr6hIACgkQJNaLcl1U
h9AMOgf+KMPcMsJntwEWI8UJ7/re0uGZ3D9fX1qeb76OfxTqQ5bt1PsIzRULHkqL
pEOuOVnEu3HTSuNnMgEyy0ms1PA7+yFFiMWSdYlZy02GpNeD8FY/VFwOM9dR4pte
UWnlYD6vJK8wffaEnxtKF5F2gOah96lH3Yws15T1IN8/YbK5wzCnJ2R5XWgm5Ka6
zIFhD0cZ077/Z1hO9SJrqAKPpTLLr1KtyC7ZHsvN2YE5+bzvELKFqPSyt3HPy61r
v+QdG7vRj8/tNW2Hn4lpLR8g9tz5JSMFLhxcyg9TRz67jSiOxM/utfw2IY+Q8DB8
YvmjuYpF+tbhIo7G3bYNULQS39HNSQ==
=ZD6G
-----END PGP SIGNATURE-----

--SoPr26CyLWhD+5za--

--===============9066410010358712284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9066410010358712284==--
