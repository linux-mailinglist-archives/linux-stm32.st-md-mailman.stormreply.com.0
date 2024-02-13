Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97A853AEA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 20:28:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70A00C6DD69;
	Tue, 13 Feb 2024 19:28:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F047C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 19:28:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4DDA6168D;
 Tue, 13 Feb 2024 19:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4268C433C7;
 Tue, 13 Feb 2024 19:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707852525;
 bh=5NZfHEpoK2pgvpQmn+zBq28sPSpp5q49Kr7YjoVCrtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LoIAR+JMQSh6rKubrC77HEUuM9i9+9xusFm3mBbMPEZB1zFVC8WAi+P79P7vP2pV0
 HYIegRCXj+SAa+EHRdiaAKW5gyoYrkZ+zAMfjDw0wmww4tkaAQnVpqjjKSjFIQZuoL
 nifq2fKz2moHoxjc+3SMXRtWSbUO5vCnGZUtJF0jsJnZffXO/479UNLFEtBMHZlS0F
 3dOWR+l8eciIKzvkpTrQQDtgGwNQpRFztz/zUa53hiXsBb1uzCtkIB57/3LdNYvU2s
 X42U/t63AKQNyYVRpYA3ZlFTSIICRmKwO8cOHujz84MWgffPZUxColMHkE1uscdVpL
 SXmpn8n6AGonQ==
Date: Tue, 13 Feb 2024 19:28:39 +0000
From: Mark Brown <broonie@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <6900e726-dac7-45c0-a88f-7830c1c7e43f@sirena.org.uk>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
 <54623b74-872a-41dc-992f-71a586d145ec@sirena.org.uk>
 <CAMknhBGt0EyA_FcpXbmT-PStZqmZ_PUENHbVfgDFOwWcv5gTAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMknhBGt0EyA_FcpXbmT-PStZqmZ_PUENHbVfgDFOwWcv5gTAw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2403663724097577194=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2403663724097577194==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vu/aZ+4oRClrdlxp"
Content-Disposition: inline


--Vu/aZ+4oRClrdlxp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 01:26:02PM -0600, David Lechner wrote:
> On Tue, Feb 13, 2024 at 12:55=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > It would probably be clearer to name the parameter pre_optimising rather
> > than pre_optimized, as it is the logic is a bit confusing.  Either that
> > or some comments.  A similar issue applies on the cleanup path.

> Per Jonathan's suggestion, I plan to remove the parameter from this
> function and handle this flag at the call site instead.

That works too.

--Vu/aZ+4oRClrdlxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXLwuYACgkQJNaLcl1U
h9B13Af/Sg7oS1FfB9/Qrl4jfMCRKLNMs8JEHKGOd1M5Nu8SfTT/K0LA3Vb2rrJu
SkpFl8U+gGFaJAOFpTbKbAAC8wd6iKfOxQH34JpDm+SIXmFMTYYDkt1NcSgkU5j+
h0kIbOy/GVPz7k7+t529BYiXucPTAio/6ege1DTlYhfVRtFuteRJ6xBPzqHXkycV
7Dr81PGaY0NMa2cqjGwVQo/8oCf971g3IuixqBuXQZ0LSPbJgNWjXUz+1fd+D00v
qq2DK5pcYd5FUps3k60zKGz4bch/rq7hQ9WqlMdhOSC6YYGNLMiBmfGFP5NwuhvG
dRLiDxfQR2dRKO0HuKvTFw833Fn/RA==
=1RwK
-----END PGP SIGNATURE-----

--Vu/aZ+4oRClrdlxp--

--===============2403663724097577194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2403663724097577194==--
