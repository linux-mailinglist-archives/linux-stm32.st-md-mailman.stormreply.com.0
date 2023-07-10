Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8C74D42E
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 13:04:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC8BC6B457;
	Mon, 10 Jul 2023 11:04:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B5AEC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 11:04:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E6AB60FD0;
 Mon, 10 Jul 2023 11:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D578C433C7;
 Mon, 10 Jul 2023 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688987084;
 bh=TwtuDKEbyYTJYwb5YfWy40545UzZJ3eX6HtXjCq2/DY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F1hoO4AmByvX1+/WmpbkKZwew5eudKc1FQfa/lRAOOwiXQ8zRshL+Oq9bFoJQeu7s
 LcEcu9oephfIQANzA4/3cifEEgUeal19PEixt2fvddV8g2XCmGK0fFh3Uc4W+J5uOn
 XEO983Rlb7MGqbsEKGjwJjCaRtJ44jxPCT5CF+Iau9ZSof+GY2neKJt0KjAvaY/9jd
 RBqd+kDX18tFNSlYceBbrvR3r37PvxSvj3S5DjVmlQqBMkOMXeP2JrMR5z6F5rg6jE
 qp2ogGv8JQb+t32ZmOV4oiKG0GwgxT5l0kEjeNVOqRmXVjkyf2EUtnmSnqitny5s3z
 HoqJaUtvZLO7w==
Date: Mon, 10 Jul 2023 12:04:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============9210508568417524193=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9210508568417524193==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kWZTJCyyxQE+byGQ"
Content-Disposition: inline


--kWZTJCyyxQE+byGQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:

> Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> and kill the not used anymore definitions.

The above is not what this change does:

> -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

--kWZTJCyyxQE+byGQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSr5cIACgkQJNaLcl1U
h9Ah2wf+KmkGI9qlUKgHUSNXh1DbqoLxbTpYFnFP5xpasapdwBa05UYP3eghOigF
R9RLm+Z+cOhxpxkEijdYqYKOu94px87YE9vU9+e00ZWaz+X+R8C17kt4hk+9x5pI
n6ln7unk1TDzZww8TWx81WkEqR6E4uMcYhMfsfjKKDcC6ZOxJu6+h3wWjhkj8q35
k8NbtIo8bz2TzLqTuNjWsA64H1AxpRqwoT1fLLiZRPrng7Zc4wIP68cX17WSWwqj
+Tn8sO3EBbpYl4vuJircRmezY6Roo1TuLU4M7iIGhGoUrt+jdmoqIDsjQVU4IKIv
kRGC3WQT0+LuWsoU8vUp0PFt+ntu4w==
=03Nv
-----END PGP SIGNATURE-----

--kWZTJCyyxQE+byGQ--

--===============9210508568417524193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9210508568417524193==--
