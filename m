Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9EE23ECEC
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 13:51:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 154DCC36B3A;
	Fri,  7 Aug 2020 11:51:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DA3DC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 11:51:51 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1BDB2075D;
 Fri,  7 Aug 2020 11:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596801110;
 bh=cKfNzVoedQVmKvHvqaEn1VyOBUd+uYh5+G/kG05O8i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HEftQRvX29huLFXq9+TWsNE8Qe8nvmo3X6O+cCG15qzk3KbIHm1/xYVzzdOQOTNAb
 /NrTFQqRiYzNbASVAiDemSygf9K4zF/2u8pqVJIEv4GdrdxciPSEbYj6D0ZpgueVAF
 sxeWJt2cvD2K9Qo6/01yY0iBndmuMSPXg2ZVlPVA=
Date: Fri, 7 Aug 2020 12:51:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200807115125.GG5435@sirena.org.uk>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-28-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200806182059.2431-28-krzk@kernel.org>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 28/41] ARM: s3c24xx: move iis pinctrl
 config into boards
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
Content-Type: multipart/mixed; boundary="===============7556335500904026903=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7556335500904026903==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Content-Disposition: inline


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 08:20:45PM +0200, Krzysztof Kozlowski wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The s3c_gpio_cfgall_range() function is an internal interface of the
> samsung gpio driver and should not be called directly by drivers, so
> move the iis pin initialization into the boards.

Well, it is now - that wasn't the case at the time.

Acked-by: Mark Brown <broonie@kernel.org>

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tQD0ACgkQJNaLcl1U
h9CqCwf+JA5FnrUTEVVBDbW47geQe42Qnc9Xm8NStwfOPmjgajYfUNeCXBA/hmac
FXu0yRKfw64NF52gC92PURaKRq+ZVG+3zWYf+jfKxABUiS5FZGLgQjQ7pUEtrZMc
FxspnPqX4H57ZJXAg+q3Eq76iR132c4eX7s20jBiHJrEfEnIc86n4R5+aZ+F1HSM
kYVzZacjdpEzter1onhkgDbwAR+HT9RdPsyefvCKxtrdgW1h28TvjI9s2XgNHgAz
J5BNRa7ohL/qZnXYd9Z041846uXa6CQcoU51hejVbDSkXk9hprkwVwsrkGCBar2n
58ZhRIsY5a+CLanhjLZCZoMPR6GFAQ==
=U67M
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--

--===============7556335500904026903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7556335500904026903==--
