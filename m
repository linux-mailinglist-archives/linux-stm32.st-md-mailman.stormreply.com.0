Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7823CA1F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 13:03:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FD83C36B3C;
	Wed,  5 Aug 2020 11:03:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42D97C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 11:03:17 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63E2B22CAF;
 Wed,  5 Aug 2020 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596625395;
 bh=DoGeIX/K/WQD2EoWJAPc85XT/sRceZfwp6Sz/3mnlng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Du6bqzA3op+rhWbEOcffwkqeDbF9QjzE4OhhZHo/OCE/EET8cOJ1FLk/RF1WI8ZrI
 RvgjJkSCpYJkk2FCpPSdwPcQoEU30xWNzoShioOeQHzGh2GPaylKH7ZTf/1OH1wfwQ
 m8gFsJJ6VUuhj2TjSGtd2j98uhiOK8bghTctsaLs=
Date: Wed, 5 Aug 2020 12:02:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805110253.GI5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-16-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-16-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 15/18] spi: stm32: fix
 stm32_spi_prepare_mbr in case of odd clk_rate
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
Content-Type: multipart/mixed; boundary="===============2620376775231540717=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2620376775231540717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2nTeH+t2PBomgucg"
Content-Disposition: inline


--2nTeH+t2PBomgucg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 09:02:10AM +0200, Alain Volmat wrote:
> From: Amelie Delaunay <amelie.delaunay@st.com>
>=20
> Fix spi->clk_rate when it is odd to the nearest lowest even value because
> minimum SPI divider is 2.

This is a fix too.

--2nTeH+t2PBomgucg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qkdwACgkQJNaLcl1U
h9AVmwf/Wo06/OERR2lAw0RzRYSOlfhuvCH5xOIV/kCFaXFkYkWrIVh3Rs95o++S
fAWl6VIdj7+20v+gOTalGTMtGp2ok8CJ30YDU0D0gPgQ+w09fZCY+TFF6W6hn2mQ
UbQ7pXIEDnzm0dF8yX2kqKYF8TYFFPp7HHG/fuSDbNmdKKUc+koTISwehYUlIfpX
Q7gmZIIQiOecel4hdaQk9aN1owlGoAVUJf5JiO3n/xw5UOpVtYTgkwlL/xYCg07N
2fmaMI9Hyfn0ZySzWe5e0FtM58vnIhLg11B7iKmyT8eem/Up+ombyZmXpFAPL78j
dmT4X0Rh2clIu/4tRNY6mLp7QBcYFg==
=cEJW
-----END PGP SIGNATURE-----

--2nTeH+t2PBomgucg--

--===============2620376775231540717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2620376775231540717==--
