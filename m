Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF691BF59B
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 12:35:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE94CC36B0D;
	Thu, 30 Apr 2020 10:35:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98C7AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 10:35:38 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96A7F20838;
 Thu, 30 Apr 2020 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588242937;
 bh=L8QqziWQ9h7WeebjkgKpp4eKtoL5iK1ZJnBVu8WfcFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bqMAJNVeQMD/5NkPOqWvlor4qXznpXKcAukYXSOyriNGdcA5irT1ASbwbNljdScUo
 5ouwfFgYNh87lpGTVc8HFy93WdA7aR+yd7jPUsOgnv7CkwMgjgy7693U1REDvdMZ6n
 7Bs5gSMjC7eNLfqsOmKcss+bDLtRp0ZrayfinjeE=
Date: Thu, 30 Apr 2020 11:35:34 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20200430103534.GA4633@sirena.org.uk>
References: <1588239840-11582-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1588239840-11582-1-git-send-email-dillon.minfei@gmail.com>
X-Cookie: Sign here without admitting guilt.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] add SPI_SIMPLEX_RX/SPI_3WIRE_RX
 support for spi-stm32f4
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
Content-Type: multipart/mixed; boundary="===============7009670659959012650=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7009670659959012650==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 05:44:00PM +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
>=20
> add SPI_SIMPLEX_RX/SPI_3WIRE_RX in spi-stm32f4.c
> for SPI_SIMPLEX_RX , as we running kernel in sdram, so
> that the performance is not as good as internal flash,
> need add send dummy data out while in rx,
> otherwise will get many overrun errors.

I only have patch 4 here, what's going on with dependencies?

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6qqfMACgkQJNaLcl1U
h9AMyQf7Bb85zBnGwJCAzPQNAwLw/QzSq+VE7JtXHycImjg0XeyDqyfqdjx5ATdZ
Cv0cL9opaIRgNlkKYP5Pht4BnWLbdIJRGMfSyKL8G+4GvrtqxGqG1rfYDrXt/KgK
2lsB45S1YQ95TCPivpAT23RsYaP228a+xuSQLFGfD+1y/vgxlzPz9CrmKOoAccY7
ZVj1I1f/tzgBh/OPMa363EEs+w3EB4GxIHEjwEb2kJulioCLjllV3MiVK+RQdWC9
k8SNdtE16QX7FWk34V6DXls9wFnmncODf6tzUx/gBblRHjRC/zETeDiVatBdQBDy
yaav0TQppa0lz8MY8vwMfj/kQtY4iw==
=piIt
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

--===============7009670659959012650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7009670659959012650==--
