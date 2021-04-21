Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 628A8366EB9
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 17:05:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07F81C58D5C;
	Wed, 21 Apr 2021 15:05:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89FBDCFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 15:05:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E61FB6144D;
 Wed, 21 Apr 2021 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619017537;
 bh=nfD4SW2pUDpqbkiRD2gBMWPIOHPXr915NNTI0fU3FB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rMe1oWvbaNQXPNMnRswTPL9c4Q5r5c9WqA6dTL7xczH6iTditPo0VP2ln/xiCzlvY
 Bhu4RTFI5xQY8Wcdj2leqiNkfnCakGQbzn59F5/E4idO1bpFWONlZN4dgHM7rs5kmT
 PyHTue3M2b1Bh49IP4LcZQdfkuwrBW741EZsmUzuwAnJi7VWtpllpkdiEMrKIYGHj3
 S7ozaYL6amLmvnZF155TdA4fQPj3bwWNSuGTvmhnspcmrv94eafvKbu7ew9EcY7FPg
 232NoPiZql6lFrMpzneeyITYJBO2o/cjbdjpWuhgQJtn+YWpvVHTK0T+m1uh+2q96x
 nKwsA1NW67Sgg==
Date: Wed, 21 Apr 2021 16:05:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20210421150510.GA36785@sirena.org.uk>
References: <20210421140653.3964725-1-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210421140653.3964725-1-arnd@kernel.org>
X-Cookie: Tell me what to think!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Zhang Qilong <zhangqilong3@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: fix debug format string
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
Content-Type: multipart/mixed; boundary="===============4542697918656081428=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4542697918656081428==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 04:06:48PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Printing size_t needs a special %zd format modifier to avoid a
> warning like:

This doesn't apply against current code, please check and resend.

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCAPyUACgkQJNaLcl1U
h9Coogf/R7NTfXnqSMK+6GxbfAfEwF48TROZhMO5m95NKkXRByuOSq/2QIWrEVP7
FdOwLifiRbZ/re3cDx36ZFesHYsfeAea56rPkL/q8ntwu5a10A/GNYSEym+A0H0h
+IenL6VFoWm6yCL/rFAb02kpbz9NFx0WpTT/SK2heCKHb8CH/eIYtXmzALicrBvj
MCwhCuMVtpm9dBU3IR0jU7M9S0vtqZMNXyB4mNoqKkC9hFLA7vdqmK4m3Oaui0Yi
e5N7Q/rB+N6+iPIzjOJJL57h/9s2/4rinmBOJXcVg6jSn/MsZSdBHssSSz/tTKpV
3zg4lAvtiX7hiVXjElq77+SxD7/dgA==
=8/No
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--

--===============4542697918656081428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4542697918656081428==--
