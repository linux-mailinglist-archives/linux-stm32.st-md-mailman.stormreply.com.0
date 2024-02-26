Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F597867724
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 14:48:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56342C6B46B;
	Mon, 26 Feb 2024 13:48:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA9FC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 13:48:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 095D5611C8;
 Mon, 26 Feb 2024 13:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5260FC433C7;
 Mon, 26 Feb 2024 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708955286;
 bh=L67kHgGCs3Cvh/Ei0DU5lrJ2B7SBYL1CCN3r0aBSxi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rutwcfwO+1mZuPVh6Ci4AcY7Ya4wOx1sky29F46LrI2lonSlcnrvFy9RjBONyMTwA
 k9va0k3b3hBTuoGx/ddvBD3XrePARb3WpZ56M+/YCXPxxQarwpfu/UBwfFU/pUj+RN
 Uc6barYERG9ipNDYsIp1+Fe/9erC3pLShGA+SyQNP88OYU5XtnMBJXcgRRfZY12fzE
 2P3Nur+CTXqYaRgZkNegjaYduiK59Y/Zqgpup2hnN452xKB2281z8LC2Ko0BmhzNZp
 vrPjbNjMSuXsKrs1H9/yft788udGXbcCLd3MBBmdMZvONR4Zg9RzBC/CGbCGsH6K59
 UgHUa1KFYjrDQ==
Date: Mon, 26 Feb 2024 13:48:00 +0000
From: Mark Brown <broonie@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <4a593988-52bb-4013-84fb-d1a51c8005c3@sirena.org.uk>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <20240219-mainline-spi-precook-message-v2-1-4a762c6701b9@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240219-mainline-spi-precook-message-v2-1-4a762c6701b9@baylibre.com>
X-Cookie: Nobody knows the trouble I've been.
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/5] spi: add spi_optimize_message()
	APIs
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
Content-Type: multipart/mixed; boundary="===============4078261709050740599=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4078261709050740599==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FPOaDaMVfIrc5CmE"
Content-Disposition: inline


--FPOaDaMVfIrc5CmE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 19, 2024 at 04:33:18PM -0600, David Lechner wrote:
> This adds a new spi_optimize_message() function that can be used to
> optimize SPI messages that are used more than once. Peripheral drivers
> that use the same message multiple times can use this API to perform SPI
> message validation and controller-specific optimizations once and then
> reuse the message while avoiding the overhead of revalidating the
> message on each spi_(a)sync() call.

This doesn't apply against current code, please check and resend.

--FPOaDaMVfIrc5CmE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXclo8ACgkQJNaLcl1U
h9DzSgf+L8IJqP9QTipdvVCKI4xrZNaK+TzwF6i23M+QYOOAK+4hq0fRRSva44uc
kkh1+iGYBYbxuQpN35y3lMkueSvMVPQgUyBSe2q9SOVzykwxfrvIZKwv5I9eULi7
itkQUHeceYVLOoH2nD5dKIA7Jd/p9W5z3tC6yh/xqXwFuldwT9+Y7eqM8SUISwXW
d36mL+h1mj+ZerR70EsYYipUH0J8r/dJ035AeZRkWXV5YGicaHna9WJBT8hN5H5v
73vjAsnxohg1/wS6B7KvfXg6NekWfTWcde7eWkgkaJqgz4eKzNgUgBDUdhfGRXNa
4G15gBS0jIs/UHLyXcbalpTOdzH4Uw==
=5Wju
-----END PGP SIGNATURE-----

--FPOaDaMVfIrc5CmE--

--===============4078261709050740599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4078261709050740599==--
