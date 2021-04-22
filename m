Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2CD367F96
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 13:33:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 077F3C58D5C;
	Thu, 22 Apr 2021 11:33:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 647C7CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 11:33:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E7AE61437;
 Thu, 22 Apr 2021 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619091191;
 bh=xDI5eBS6F8rcLcIPh61XOe2+dJaGm9SUWLO+i/3wDEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=klqkOjqP58KBuOUzOjZcbTqU+IHWbHLgD5mNITfHiV5MOR/IesC1BiJE+k7oi/Eqo
 YNLecqUr1s9bsU3G9DerapMvLI2O/Gl3x6o0VMAuj5meWORdeGeqhjecXbABqYPv5N
 pW2tA5dvxfqR4BbZMZQEt8GhQRshGm829PrAYSYznvMz7W/dkhUPe8J+5ckN4Hu5+1
 ifdoxXowq0CI4Y7zd1ss7RF6YY0ZA1JGU5OgCFPCAaFyvsG3UgH4z9BKatpw3mWtTp
 vGlqu1odNCkXTwQ46J+a0ZkqG8AXg4udisj4WuSHmRxDVWQ1ZfUIel1zrGjEXKqolL
 zXeY39LnOvKtg==
Date: Thu, 22 Apr 2021 12:32:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20210422113243.GA4572@sirena.org.uk>
References: <20210421140653.3964725-1-arnd@kernel.org>
 <20210421150510.GA36785@sirena.org.uk>
 <CAK8P3a0CWp_H-tm2QcZyH1FDXwzMgxY_9dc1Y8pA28MQKT-q=A@mail.gmail.com>
 <b970a557-b869-c867-3825-370a36feef68@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <b970a557-b869-c867-3825-370a36feef68@foss.st.com>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arnd Bergmann <arnd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
Content-Type: multipart/mixed; boundary="===============8888691404165984591=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8888691404165984591==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 09:30:16AM +0200, Patrice CHOTARD wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> Regarding this issue, how do you prefer to proceed ?=20

To repeat my original mail:

> > On Wed, Apr 21, 2021 at 5:05 PM Mark Brown <broonie@kernel.org> wrote:

> >> This doesn't apply against current code, please check and resend.

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBXtoACgkQJNaLcl1U
h9DZQwgAhkjv/7njL5nJTDc2PAZGesegUWMrkNDFhg1F/m51cNUxuvc8HAp7J/es
m6enbXoKdkgnjrXhH5dxirBRFwssxZlcrG75ijEkdxrjMWbMapSGEzCtGm/QB+9r
x+cCm7JbvSPF4CCnCjXC208uoSAfG6WPp/rLLKAWaY/WBaZyoQhvTJl5sp/MAMdC
p4taxgGXF/h5E+TLy3HeBlaPTldnBgfxPql0UNWDkwsfjM3ti/HWmHQ2G5MiwdJ5
zoasbWnlDJi3FDIWRF+qKIx1c6FraYEZCRe19dz2yWpLH2OblrFGqgFTkQG/5IxR
hDvxq5PzgaZV7UrC49z5T9fLI00kQA==
=H99h
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

--===============8888691404165984591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8888691404165984591==--
