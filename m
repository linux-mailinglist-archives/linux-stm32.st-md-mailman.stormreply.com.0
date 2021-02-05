Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C76C310E0A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 17:42:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43E24C57B51;
	Fri,  5 Feb 2021 16:42:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C60BC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 16:42:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6668964EE0;
 Fri,  5 Feb 2021 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612543364;
 bh=Z2xR3YEsMozd9AyI+P+EUP0GmbkPKQfSuwpY0Cq0H9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=swGUw+mQ4bIYUUhZhteYutOf+pkR0+VMNeyWaPIohGmo55Bg6ribIYoWtTST+wZbH
 zZ68lQGIK1hp/cOI26fD/DYSV327ZrkLP17UBW7EdO3V/7Gs6dvWuDUFigaPYuQ2KQ
 pvnojUsPq4fMlg/sMPV8wtuwgfPF93b3hBr/vh4OwSwknOoNMnYy6g3NRLORfmfqlM
 afaCFvHKBTdmYu+BiVMOgjxWjjnxgVV9CEiWu5mNks8KmcovTTy6/DSmuSIS2Vxgbr
 NvVzKFhur3LxTh3Ow4mR+5jfgaelPVCAza8via4uxDW5+pIQcSBopgqzSH6ZXs0c5u
 YRUQ2OujKo1Fg==
Date: Fri, 5 Feb 2021 16:41:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210205164154.GA8179@sirena.org.uk>
References: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
 <1612523342-10466-6-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1612523342-10466-6-git-send-email-alain.volmat@foss.st.com>
X-Cookie: Sentient plasmoids are a gas.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/8] spi: stm32: defer probe for reset
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
Content-Type: multipart/mixed; boundary="===============3273573668430952796=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3273573668430952796==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 12:08:59PM +0100, Alain Volmat wrote:
> Defer the probe operation when a reset controller device is expected
> but have not yet been probed.
>=20
> This change replaces use of devm_reset_control_get_exclusive() with
> devm_reset_control_get_optional_exclusive() as reset controller is
> optional which is now explicitly stated.

This has trouble building an x86 allmodconfig build:

/mnt/kernel/drivers/spi/spi-stm32.c: In function 'stm32_spi_prepare_msg':
/mnt/kernel/drivers/spi/spi-stm32.c:1022:9: error: 'STM32H7_SPI_TSIZE_MAX' =
undeclared (first use in this function); did you mean 'STM32H7_SPI_CR1_MASR=
X'?
         STM32H7_SPI_TSIZE_MAX,
         ^~~~~~~~~~~~~~~~~~~~~
         STM32H7_SPI_CR1_MASRX
/mnt/kernel/drivers/spi/spi-stm32.c:1022:9: note: each undeclared identifie=
r is reported only once for each function it appears in

This may be due to an earlier patch in the series, my script is working
back through the patch series.

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAddVEACgkQJNaLcl1U
h9D5ngf/U0NKtBGQTpM/vYV8lyZzpsFLniAZnJzyq4E6SXXJQeY6+VmQt/7XWygG
t8Q0KgHNLRep+Ks7DeqdFPbTQU2dzJ6hExzybysoHSyzsEz+Tbjvt7qaoQq9jnY5
WQwFDz5Xsurc8zbWoSlZmKv9DhGPxxGaUAnMt6z0WjNcc5XQr8EboNJO6piMXMkY
uMKmHUI/zRiFRm0vpgodW2dKa/Y4InIoRg9IESu2+p4Gv5fa3mVAApx5LWB0oFg4
qMwbjllQl6XUuCJySDPQk/GjIXFN0h4nrE98uZAi8P6zgceT+6q2p3jWl+LvyBQZ
MzLSVjaf7lv3SPp3b2/pFO2jeGt98A==
=JrV5
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============3273573668430952796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3273573668430952796==--
