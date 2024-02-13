Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF869853A4B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 19:55:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 524B9C6DD69;
	Tue, 13 Feb 2024 18:55:10 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E60CAC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 18:55:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 94166CE1E13;
 Tue, 13 Feb 2024 18:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB2BC43390;
 Tue, 13 Feb 2024 18:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707850505;
 bh=BB95l+0BhbUBCzSMMBSz+FS9RLul9PCTuuXwE/NiX3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b79rEpbeOnYlLR6qA2l55tXC7SrxWaQWIlUtg/o6nJVbazaXfqA4k2C+Gbm1WjeeX
 0vxrS83UYCoYt79EDTAawzhwkfHJ1nF5L5pfRAuE3dF5QFYILTet9Zwcn0906ZdMT7
 c5zojMTKjMdv/mJh3gSooWOKFtQ+nQtcrmNhWCxW0YmhQ7DJ1QLDmEJUkPBtBkqI/b
 BeAPLjeV2MCb1Sho/JBcPUVBCIczdKbh6Kb2kG9fTtFxtrapLEbRK3gzxmvAzG0OpA
 lqwuUV4DBh8cTqdDOYoJqeySd4VjzljqPLRd5RWbh/djjJzGk+4U/M4cQJ4xJ8Tsjm
 /D0jQE0bW29dg==
Date: Tue, 13 Feb 2024 18:55:00 +0000
From: Mark Brown <broonie@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <54623b74-872a-41dc-992f-71a586d145ec@sirena.org.uk>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
X-Cookie: Does not include installation.
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] spi: add spi_optimize_message() APIs
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
Content-Type: multipart/mixed; boundary="===============4805297930626385088=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4805297930626385088==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1x94l0akyl18zoOC"
Content-Disposition: inline


--1x94l0akyl18zoOC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 12, 2024 at 05:26:41PM -0600, David Lechner wrote:

> This adds a new spi_optimize_message() function that can be used to
> optimize SPI messages that are used more than once. Peripheral drivers
> that use the same message multiple times can use this API to perform SPI
> message validation and controller-specific optimizations once and then
> reuse the message while avoiding the overhead of revalidating the
> message on each spi_(a)sync() call.

This looks basically fine.  Some small comments:

> +/**
> + * __spi_unoptimize_message - shared implementation of spi_unoptimize_message()
> + *                            and spi_maybe_unoptimize_message()
> + * @msg: the message to unoptimize

There's no need for kerneldoc for internal only functions and it can
make the generated documentation a bit confusing for users.  Just skip
the /** for /*.

> +static int __spi_optimize_message(struct spi_device *spi,
> +				  struct spi_message *msg,
> +				  bool pre_optimized)
> +{
> +	struct spi_controller *ctlr = spi->controller;
> +	int ret;
> +
> +	ret = __spi_validate(spi, msg);
> +	if (ret)
> +		return ret;
> +
> +	if (ctlr->optimize_message) {
> +		ret = ctlr->optimize_message(msg);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	msg->pre_optimized = pre_optimized;

It would probably be clearer to name the parameter pre_optimising rather
than pre_optimized, as it is the logic is a bit confusing.  Either that
or some comments.  A similar issue applies on the cleanup path.

--1x94l0akyl18zoOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXLuwMACgkQJNaLcl1U
h9Bnrgf/WeeHvY6OP79eR9psCOmCmEFE7LyYK3KbHMD6KHn9UrE1fMVqnbazXiT+
/ALDeTCkov7jcu1uUMZZuSVyfv+JpM71kKEZ0L2p/Mbn6qwWfriempoqr7Jh9RiQ
m8IH2XIEfX3/rWvRFdxK4H3i//gqVwEaf3Tf9pyBPosblP5bim2GT3h0ci0h5D+S
zC7VK+2Zbb+S5x1uqH07Cq/ApUwUYXsIDur5pK6r0MkHjJCkq+5v0aRUUdMSx4PC
naHKWpPHFqI4IhzU6UrpGUcOQ6Pfq/WNZ2kdm7+bjKJXDZdxkkGQ5sZbhvlUEkoM
Xxvql0q/x39T42ahhk5bHCFqIhb2HA==
=lAcK
-----END PGP SIGNATURE-----

--1x94l0akyl18zoOC--

--===============4805297930626385088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4805297930626385088==--
