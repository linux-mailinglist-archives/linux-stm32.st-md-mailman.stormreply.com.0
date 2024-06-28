Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10591BE5B
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 14:17:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3CB9C71289;
	Fri, 28 Jun 2024 12:17:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA636C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 12:17:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F8F462156;
 Fri, 28 Jun 2024 12:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0990C116B1;
 Fri, 28 Jun 2024 12:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719577064;
 bh=lPJqidH6rh/hlQuWyzH6JWqpzeGhRdafVAMs4oSHz4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F2GYbI1nQ/yRuFUoE73M98TleeFTikguAos6EIvQhQHMmeptwXiBxBZu97ptu8dRC
 ZGFHqwpYzKjKOYqx7iszA/QHESDYTXOqKJeVKfmrgIr/bmf992ebpNrUEKX5Ob/QKK
 8qIl6Hfov8OaIqS5yN08WC7bUgnrg1xW1KIaH8gLNO1JY+mnqWq1ybNWDvL/jvklWK
 qfPM1sfex6KWU4vttFtXTlUje4z6efY3Uo3A82rVXk6W8VGtJg38sJIoA0SFRwOHfH
 A7ghmVbjUc/wNQguxLYcQgDWcOidHQNUI/MeP3XEZ+8IBVd2z33vhrCuwUYL+OCb4Y
 mSG1TTbQP9vbw==
Date: Fri, 28 Jun 2024 13:17:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <15effa16-696a-4cc5-941b-375d1bbc31df@sirena.org.uk>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <Zn6HMrYG2b7epUxT@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <Zn6HMrYG2b7epUxT@pengutronix.de>
X-Cookie: divorce, n:
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Julien Stephan <jstephan@baylibre.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-spi@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/5] spi: add support for pre-cooking
	messages
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
Content-Type: multipart/mixed; boundary="===============2268694447970800267=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2268694447970800267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HJ5q/Xqa/ExsXZ/6"
Content-Disposition: inline


--HJ5q/Xqa/ExsXZ/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2024 at 11:49:38AM +0200, Oleksij Rempel wrote:
> On Mon, Feb 19, 2024 at 04:33:17PM -0600, David Lechner wrote:

> I have a regression after this patch set. My system explodes with
> following trace:

Not looked at this at all but were you able to try a bisect?

>  Call trace:
>   0x64f69bfd319200
>   spi_async+0xac/0x110
> 9H0[]6 spi_mux_transfer_one_message+0xb8/0xf0

Could you run this through addr2line please?

--HJ5q/Xqa/ExsXZ/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+qeEACgkQJNaLcl1U
h9DIsQf+LObiaHYQilaxnoCMNm6d/Ie3c221fUY6BfaRAVRU7kBHxpM1/DtRXMzN
B+OJxgTKmT726SMZoT+JX+fRfF4GWYQhPpM47Ic6leC/uwk8EjhNGT5rHXCUutIN
58EmKsfMBn2KI/L4avav/nigQE0hsB7EJK8QnjsYEi29TdZVWXEGiRTJRK3VoDTI
Xd1vroVy2Y2NCVjkW6QvxeSmdYtcoYtH/SUH5omPJTDea3+5kyLnHO2Ufftsluo5
C0hJrSchIpWOPBU704f0MQ8ZscKPsVEa8Cjuqf2w3qyBcs0ORGWlD7HJdtfP8BGB
vCyX+tJs4JccE01WgzZGfEQoreK5Jg==
=vIz6
-----END PGP SIGNATURE-----

--HJ5q/Xqa/ExsXZ/6--

--===============2268694447970800267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2268694447970800267==--
