Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E31E3E0C
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 11:51:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DAF7C36B21;
	Wed, 27 May 2020 09:51:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05855C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 09:51:12 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8B3520B80;
 Wed, 27 May 2020 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590573071;
 bh=0vToCKDKiiwhvCQ/ZH06T4deAF0FOse4LBq9EGr0Hdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVI+eY/sUvYRSX+c+Adp5mbuGsFalnf0pXTPCNoiZDzr18dCfz9a0UVW1SQjVdQOT
 +GPqBAiQlp1MZCLnbvrTSC1VicjdfKmeCzHwVVwfMOOVW1nCw1H+fYqzrff1b1L/MY
 tRakSOtkBjQYqVrvvfLbmRmqcEhRvThMG5/cDsK4=
Date: Wed, 27 May 2020 10:51:09 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20200527095109.GA5308@sirena.org.uk>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, noralf@tronnes.org, dillonhua@gmail.com,
 p.zabel@pengutronix.de, linux-clk@vger.kernel.org, airlied@linux.ie,
 mturquette@baylibre.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, sboyd@kernel.org, andy.shevchenko@gmail.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, mcoquelin.stm32@gmail.com,
 daniel@ffwll.ch, sam@ravnborg.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 8/9] spi: stm32: Add 'SPI_SIMPLEX_RX',
 'SPI_3WIRE_RX' support for stm32f4
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
Content-Type: multipart/mixed; boundary="===============8087805703076903444=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8087805703076903444==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 03:27:32PM +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
>=20
> in l3gd20 driver startup, there is a setup failed error return from
> stm32 spi driver

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OOAkACgkQJNaLcl1U
h9BjiAf9Ffv3ggcuNoWfvMQqMqMQaCF/81yq+JEuOCOw+nSFwBift/d6Q7Z7HWCh
k0/gPFT+7ED90XyQWUYuDOrUuQWiqQn8UP5p2IhQDAbvY9Zr3jnDTScTPx4FSf9m
xGGbKV0iWy7z78mHngcLf++zQtDzzZLjhK+U4CxVz5htfuOkTdDeIorLUZJnYdBH
tZKEYJ92tDX3perBnTRtca5zIEIo7JWv6ITSh6UTFELxx0D44W6NOS7z2W3kZ7HO
KeUa7lsUfxWs5hF11j959HVj5BG0CFVa/cA4o2dGd5aaDwXjeASUzngGM0DqNPhY
KPzFjTZ70Yj4eNCZVnKrXNGoe9KAoQ==
=8sEd
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============8087805703076903444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8087805703076903444==--
