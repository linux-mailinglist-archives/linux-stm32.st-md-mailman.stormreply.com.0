Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875C853916
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 18:55:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9157C6DD69;
	Tue, 13 Feb 2024 17:55:53 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 556D9C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 17:55:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31AFCCE1D83;
 Tue, 13 Feb 2024 17:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A31C433B2;
 Tue, 13 Feb 2024 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707846949;
 bh=aFUTRfWPd5A5BcBrutUwYob7cONVtIUJ2AARzRcrfr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8L4GOs2Io2KLsFwrgFXp5QIdrCEZhJa1U0h20O4wROD7rUhHTQ5P3T7Uf3ClEsai
 zaY9RqrrXk8tu8TvxpaNRBEXwuDeZU5cS8TMM7/MFEDn0qRhd/iuXVVR4RKFczVW3v
 FbMFcjUMecNZCJPNwyn99J7so94l6aTGoCC7+fNtByI//jQzvYqkmCPGSJrcglbxHY
 sGPOZqIo4+yRj1y0xvdlEMdKm9/cshAQ9dD84bsuXJqHj+tmrJYjgGmfZ0LFhO2N1f
 rF0ohMMII6eZJ5NQpOoKmnqoSAeP4SEkmMcJho3BqxBfwu8kvzWlzsqE/HJ+NxNMlx
 7ga+BUbzqbnOQ==
Date: Tue, 13 Feb 2024 17:55:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Message-ID: <890cc62c-9ae3-41b7-98a8-2c3245570045@sirena.org.uk>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
 <92e7e0acf6d8746a07729924982acbfea777c468.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <92e7e0acf6d8746a07729924982acbfea777c468.camel@gmail.com>
X-Cookie: Does not include installation.
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
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
Content-Type: multipart/mixed; boundary="===============6948796210555849630=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6948796210555849630==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+0uhG4FWQ18FZmwB"
Content-Disposition: inline


--+0uhG4FWQ18FZmwB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 10:53:56AM +0100, Nuno S=E1 wrote:
> On Mon, 2024-02-12 at 17:26 -0600, David Lechner wrote:
> > This adds a new spi_optimize_message() function that can be used to
> > optimize SPI messages that are used more than once. Peripheral drivers
> > that use the same message multiple times can use this API to perform SPI
> > message validation and controller-specific optimizations once and then
> > reuse the message while avoiding the overhead of revalidating the

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--+0uhG4FWQ18FZmwB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXLrR8ACgkQJNaLcl1U
h9AICQf9EfUz5AuSoWRn8XL1IupJA3HL7p0laFINvbncTuz94ipcA9dkZJdiNBw1
06RNd4VaCsrv6F8MxB3cmEKaJ/gVL+VqopQLzmzbBd8LoCDc04KH9nb0Q2e5uVXm
faWUyheED0rGuOJJyL6XJgIHMUM0PXif6bM/X/UGOna8zRZgbCAxuON+hFAo6bQM
eaueKdLrcFVjfEvOnuRoGT17IQj3GCxsYNjSVk3X8fC8f93fyWIpaYbbT6ouoxaz
FvtmYXuhXyIoFHMtqQtsKp849RavJ9LiqiUae8Aml5UsvEViNxDJNGE9nI5n9W2i
K4OINM1BqmC9Mo8Poiojv4BnzdCljA==
=AnHQ
-----END PGP SIGNATURE-----

--+0uhG4FWQ18FZmwB--

--===============6948796210555849630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6948796210555849630==--
