Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4695B925
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 16:58:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D9B9C71287;
	Thu, 22 Aug 2024 14:58:20 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A227EC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 14:58:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 98C49CE0C65;
 Thu, 22 Aug 2024 14:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD805C32782;
 Thu, 22 Aug 2024 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724338690;
 bh=Bj+Yrsv0zLoxJiQB3tANzn1xKu5HVSY1AdAXVzJxuO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tM6ilSH4HBJRpOK1zAJJmcsiHCcE5dbLSp11N7aT+RNDIybd0nm+lK5oOzSZhoJrb
 LW13yqbfvG52RMcGF2Dx3XKUHldPuBmSaRbmLtbhUsGWv4KiPY2mskfWNdSB21Jke8
 3OuJFcqtdBrg/EueNBG5SPcisUHeioOKP9QJUqcMeB+lZ3eevDHFJigOA2+GyrktVt
 0+CqqF7iGPTLbAflCUlQJTUR6AKpy6c6C7L3VI7YmrrWBIB+vuMA63K/NaI4BudXEJ
 TWHTDQ41zdkRNtHN6LLakNLEcWz74EuL9elqikX3pKKXSMU3P74qljf1UVyt9Nf0IF
 pUUDNGQR6Y0bA==
Date: Thu, 22 Aug 2024 15:58:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Message-ID: <ZsdR-G9S5nYbQX4s@finisterre.sirena.org.uk>
References: <20240820123707.1788370-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20240820123707.1788370-1-ruanjinjie@huawei.com>
X-Cookie: You need not be present to win.
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] spi: stm32-qspi: Simpify resource
	lookup
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
Content-Type: multipart/mixed; boundary="===============2899746142083888363=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2899746142083888363==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6s/GAhPIkOk69QT9"
Content-Disposition: inline


--6s/GAhPIkOk69QT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 08:37:07PM +0800, Jinjie Ruan wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.

This breaks boot on the Avenger96 board, it causes a NULL pointer
dereference:

[    2.350480] Unable to handle kernel NULL pointer dereference at virtual =
address 00000000 when read

=2E..

[    2.695787] Call trace:
[    2.695807]  stm32_qspi_probe from platform_probe+0x5c/0xb0
[    2.703914]  platform_probe from really_probe+0xc8/0x2c8
[    2.709284]  really_probe from __driver_probe_device+0x88/0x19c
[    2.715145]  __driver_probe_device from driver_probe_device+0x30/0x104

https://lava.sirena.org.uk/scheduler/job/650792

> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi");
> -	qspi->io_base =3D devm_ioremap_resource(dev, res);
> +	qspi->io_base =3D devm_platform_ioremap_resource_byname(pdev, "qspi");
>  	if (IS_ERR(qspi->io_base))
>  		return PTR_ERR(qspi->io_base);
> =20
>  	qspi->phys_base =3D res->start;
> =20
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mm");
> -	qspi->mm_base =3D devm_ioremap_resource(dev, res);
> +	qspi->mm_base =3D devm_platform_ioremap_resource_byname(pdev, "qspi_mm"=
);
>  	if (IS_ERR(qspi->mm_base))
>  		return PTR_ERR(qspi->mm_base);

I can't identify any obvious error here, these look like a direct
subsitution - the implementation of devm_platform_ioremap_resource_byname()
looks to be the same as the replaced code and dev is set to &pdev->dev
but I'm seeing the above behaviour.

--6s/GAhPIkOk69QT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbHUfcACgkQJNaLcl1U
h9CN8Af8DY4LE/KzrL+ENEN0vrqUzAsXF0kFyjft3xYuOnC0JEMBmrZ6/QtgG2JV
oWwmu82T2kkirx3dgWZn3U6ig9+wTWrdu9mPFPDKzDgl/l7TtO60iojlCNk61c82
O4Ki59eHrRFKOKffBDCREilTuj7zGUSIp8hfc2oPD8JVWQ7ENQ6nTQ0AZJwUmWuA
aEhxVuL9+I+IQ+IeG8fzc6S+AAMpaj142AsB5Rft84YRBPWFmt4wnQuaLpVC4SvW
ftXzNetwjfeTC47eS5B9Ygaslz4pxfxYSVab7VzMSgcBxKl8QBKwXmH+9lSl7yjJ
cMHHn+8fvbJP2MyGPJ33A/l6U3/HEA==
=kpgY
-----END PGP SIGNATURE-----

--6s/GAhPIkOk69QT9--

--===============2899746142083888363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2899746142083888363==--
