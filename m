Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6113390A04
	for <lists+linux-stm32@lfdr.de>; Tue, 25 May 2021 21:54:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FE73C5978D;
	Tue, 25 May 2021 19:54:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52805C5978A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 May 2021 19:54:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D2ED6124C;
 Tue, 25 May 2021 19:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621972442;
 bh=t14QEyABKq/zZGTByNLce4SMsRjYOXpYyP1Q+wEP5/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uyur4GF54f32odFQaFHlZ6KDMDPTmQWdBIaxMZ47ZMnx+RUfa73Eyqm2ojeouFkWS
 bnlJAI/C7aK4ug0y1F54LhprLSQ6fUN/Yc01L3pBIcpfI1rtr/ir7U6JWVy69CC6ki
 iVMw3L4kThsatp0DJnEk6pSa3aSWhTheP1uC/gAB4R8PAYCKXSkwN7bQCQbKQdJ7A7
 RFjIWs37T7sdIbsuJ+HcE5TNErWYUBdtZVC2E/k6UziNZk5G8tEBmzZPjd8Km+srdz
 URQzOYZcJpEVYw3B2468Ch+hRgbGVnnsd6Zv4Rd9US0rbdDAgKedY+y/YIbd4YEoqU
 K/6R9BD26X7Ww==
Date: Tue, 25 May 2021 21:53:59 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YK1V13YcZZnnyAPF@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
 <1620220479-2647-3-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1620220479-2647-3-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] i2c: stm32f7: add SMBus-Alert
	support
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
Content-Type: multipart/mixed; boundary="===============6751974565353347506=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6751974565353347506==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MSiyfM2VW1p0450H"
Content-Disposition: inline


--MSiyfM2VW1p0450H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 03:14:39PM +0200, Alain Volmat wrote:
> Add support for the SMBus-Alert protocol to the STM32F7 that has
> dedicated control and status logic.
>=20
> If SMBus-Alert is used, the SMBALERT# pin must be configured as alternate
> function for I2C Alert.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--MSiyfM2VW1p0450H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtVdcACgkQFA3kzBSg
KbYEiw/+JhJHZ4ZfSzLSrsAk5zvjs4Hh/DUGlBX1E5J4JmLbjcMzTrLVbH+sPF/R
eOQxmufvZAsV8h1KX7TeB1WoGdAjP6R/lOWjPyHls6BjLSHYRJxQSNvoCgXgi/zo
Eyf9Od2FQ7xc9XxtchvuEo+6ggzKJMLb6qnHs8ewq48Z+Iji+hsxyO/lUlEVRk66
xNmyBb9KU3BY4GZs58ItZc0j1Ch4ki4pa9HoSA+E9gWRdo+0k/sM6fxHP3cEHgel
2TY0sH5y9MxWr4J8WGoBC89JR26IiVzFv9M9bxOiNupPL0vWGSnVSa9FuZIV17vL
mPVNwe3/YShpyUE3DEhZU+hOK59QJq4hs8D0fBg/tQFQzsUjhP+ZOfGPvISugMhC
AkWpHPL1km5Wf93lmcE6AvxvhZfV+WRwZZsjSOxxy1IGrJEyL/nvgBA26kfR1AN3
93UeW3HdIyXvYy1IMh6Yaf5Lsp+UfBVEUE/A0HYvXFjBAMKeR0eFUHWAdEfypOVx
F6vmC2Im8OYvYB2WsTlnKpwBnp3GUT55JVxiEcHI/5E6pFG9uFc+WS+EIwdvVfGK
tHX/KikaQ4C02m+xYMhGaFCByLfAfMv3sGQlDEyszx7MI3CQFF3icCVusmCro7/X
dlVdIX8eq5Rx3bCAredY55DJMDaQEbTQzUiCkAbNoL7ig8Q+NCk=
=Yvx5
-----END PGP SIGNATURE-----

--MSiyfM2VW1p0450H--

--===============6751974565353347506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6751974565353347506==--
