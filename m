Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D38C4E11
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 10:51:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B871BC6B476;
	Tue, 14 May 2024 08:51:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5878C5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 08:51:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9CB9E60C8C;
 Tue, 14 May 2024 08:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404FDC4DE12;
 Tue, 14 May 2024 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715676679;
 bh=dl9xK7NMauuyzjNTNgcvu+mipCW/bKmup0pxO3DFFko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W5GvxS3jvoInC+tPo/qJ0nW9Vfq+0oFTT9NxWgMVjQe7Eg7l7j7LhFr/hZoaTzRkb
 btxK7WRl+TeQ/wXm4no7rFxrNOZUvcB9xjsxbspOar/rmGFNVdxIGt9BSuNOvOdqUv
 BTrrDdIF+5tzbB7hZ4hiDj4G0abLOyaa4hycmSWCblITved3A0NU6bwl94YL41izYP
 biDE0e8kAzLsT+Pco/2Ehkf+AV2NtFKpiE+bY/ulT3xBXKQ5UE4ZmZIIZ7XpY+hx6l
 77a0v/YTVuEgKPOkr2bN9OY0Gtsp0Ao9SeItld0fCG6kC7Usb59mFyzrZD1rLfECOB
 Zr1B5vboceM4g==
Date: Tue, 14 May 2024 09:51:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <32d2be34-07e5-4f99-bd31-12aeb9bdce09@sirena.org.uk>
References: <20240424135237.1329001-2-ben.wolsieffer@hefring.com>
 <39033ed7-3e57-4339-80b4-fc8919e26aa7@pengutronix.de>
 <ZkJBqSbJakye6BBc@dell-precision-5540>
MIME-Version: 1.0
In-Reply-To: <ZkJBqSbJakye6BBc@dell-precision-5540>
X-Cookie: In the war of wits, he's unarmed.
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: enable controller before
	asserting CS
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
Content-Type: multipart/mixed; boundary="===============0384537502327631101=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0384537502327631101==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qd3XkgjD6LiVNaV5"
Content-Disposition: inline


--Qd3XkgjD6LiVNaV5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 12:36:57PM -0400, Ben Wolsieffer wrote:
> On Mon, May 13, 2024 at 10:29:49AM +0200, Leonard G=F6hrs wrote:

> > Reverting this commit fixes the issue for me. It may be some time before
> > I get around to investigating the issue in detail, so I thought I should
> > ask if anyone else has already noticed this as well.

> Sorry about that; it looks like the STM32H7/MP platforms require the
> controller to be enabled later. I agree that it should be reverted and
> I'll try to think of another approach.

Can one of you please send a patch with the revert and a changelog
explaining the issue?

> The STM32H7/MP devices are significantly different from the F4/7
> devices, which makes it difficult to change shared code without causing
> problems like this. I wonder if it might be better to split the F4/7
> support into a separate driver. This would duplicate a bit of code,
> namely the initialization in probe, the baud rate divider calculation
> and the SPI mode config, but would make testing easier and get rid of
> the indirection that handles the different register offsets and field
> masks on each platform. The code for actually transcieving data and
> handling IRQs is already platform specific.

That might make sense.

--Qd3XkgjD6LiVNaV5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZDJgEACgkQJNaLcl1U
h9AzgwgAgs2oYQ4OnaMxz5ePCOZWtN8efc/rTzOMHKcGBE5yg1KaEr5ZsAB+m+nm
uE6aHtctR6iZkebjfWUjAPCTCIxSBMOqZZcDvJpAz6Vyg4knJCWuwd9ZJNW+/7xr
CeDdED9zn9UC92dYCaP0f6v9P4O/DPsoKf/A4OnhH/4AF+umWPAdRi06BQThEhDM
yljfm3v4Odbuf1YadUqsNgb9Kd5iHwL9lhjTWImT+KjNhT4h7xKX9K33c1STBy9F
mKgOkzHnTJt+f7whV+hSQkP549BZxql15/PXADZOytyC+D/n66YXx2WZKcWITA/E
61OwRBpdr3KpqxnnzwnzB5LLeCnRQQ==
=wxj6
-----END PGP SIGNATURE-----

--Qd3XkgjD6LiVNaV5--

--===============0384537502327631101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0384537502327631101==--
