Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 545DC389671
	for <lists+linux-stm32@lfdr.de>; Wed, 19 May 2021 21:19:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBFCAC57B69;
	Wed, 19 May 2021 19:19:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 983C2C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 19:19:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CC79610E9;
 Wed, 19 May 2021 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621451961;
 bh=CxcjeXZphMX8ikSAW2LO8uJN2ihmCuUCEEwRVbN9D64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rSd5m9KJyLTnId6P36+q7OP6uzbpi1F5D6EjClmCZnsqr8IO1MPqHe6OIIuMT4KGT
 KpPRqvNevSsYV1A/VFjEbTG9aBAu4AylNczwHnCAHhA/k4JnCp7So1ZmFCXohu1lvU
 XlHrJjrcjUpc3+2mhqHYkOUYmeMp5diczczM+DBI+QETaguAEYOEKbwvDXc/B4xaB4
 7Lgvww82oDmgsrLZSLWdAwznDoGFvZKODayku9Sa6lAjHcIHgRlTKm6y71fV3fENQr
 nbCW4brWMJRvJGz0vUwTWhYYvI3udKVUio3bOjzYPGXS43xQKRkEle0LyWPN6j4P+f
 9sErHwMiDcYow==
Date: Wed, 19 May 2021 20:18:36 +0100
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <20210519191836.GH4224@sirena.org.uk>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210518162754.15940-1-patrice.chotard@foss.st.com>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/3] MTD: spinand: Add
	spi_mem_poll_status() support
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
Content-Type: multipart/mixed; boundary="===============6925830248902281774=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6925830248902281774==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline


--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 06:27:51PM +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> This series adds support for the spi_mem_poll_status() spinand
> interface.
> Some QSPI controllers allows to poll automatically memory=20
> status during operations (erase, read or write). This allows to=20
> offload the CPU for this task.
> STM32 QSPI is supporting this feature, driver update are also
> part of this series.

The SPI bits look good to me - should we merge via MTD or SPI?

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmClZIsACgkQJNaLcl1U
h9DUugf+L02+HoVRB3gbN5ZpyjjoHmHs9up8UEcNStI4z5NEGfSDlLbFbODRNFlP
E3sFR+ORhCM9vziPNYxXzkt6iqlVMmxNDyKntLntzno7g3v37ycpdpo1EVfRqCst
Zgi7FauC4EhvCQcWdh4MZZJw27U8T/zhoGNK8X8J6+eZkz/TWfTPZETa7C/p31pB
F3+Z8Nfd6EFKMJ++dJLmjgDpQPkcUV8xdiQIqKAAQFp8GTWNk5bKk3rZvA35VNcm
ERAEJyYhESA4iIBzVQMTdsZp1mPZUW2zOWTMgYuqsha766iYTz1DcM3tCwtPs/4I
1F+iui8vnadvaJxuv0ckWb+cZpfCGA==
=WZaQ
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--

--===============6925830248902281774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6925830248902281774==--
