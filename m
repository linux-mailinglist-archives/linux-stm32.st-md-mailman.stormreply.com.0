Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 365C39F6BDD
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 18:05:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7BC0C78012;
	Wed, 18 Dec 2024 17:05:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE113C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 17:05:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A99F95C1B99;
 Wed, 18 Dec 2024 17:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B563C4CECD;
 Wed, 18 Dec 2024 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734541534;
 bh=vdCGcaMayzhDEz8c0LDs81VDSkOesnvIbxDPEyYGWXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qwaxwWxbAZQkrVs7P4XNx3LVJhXjA7NCYHNRzFdn+0OamVDIUQNm3wptViBHeVAp9
 vqeNlVy8ms4bU1UFGbYnqB3umTWeEOtqA/X3N8+EMyn24tylg087xQwKSrZ3JfwpHa
 DOkF+gtazUmJLJir111SbohFjqlA1k6nfO6Urqwa33LiZgemwdhuc8uigS8nLxWY2I
 DLeIKIsbERhGaqjHlMmDoFKcJnALw2YxuiCZgPk7liH+5wVB6Z6Cit3k1aAuHpO6Fw
 fDQZ73alDWiSiUQB/qX+wd8kfPUodNrTk8mVp4qq3O9B7feZGpoSL9JhGoZDMMIzHD
 5nA4/D3BgnX4A==
Date: Wed, 18 Dec 2024 17:05:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20241218-debating-campus-1d92c4fb5730@spud>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
 <20241218090153.742869-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20241218090153.742869-2-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/9] dt-bindings: mfd: stm32-timers: add
 support for stm32mp25
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
Content-Type: multipart/mixed; boundary="===============1515310841327705300=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1515310841327705300==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EoOWfOi1n9QKUU+q"
Content-Disposition: inline


--EoOWfOi1n9QKUU+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:01:45AM +0100, Fabrice Gasnier wrote:
> Add a new stm32mp25 compatible to stm32-timer dt-bindings in order to
> support the STM32MP25 SoC. Some features has been added or updated in
> the stm32-timer timer such as:
> - hardware configuration and identification registers to read the timer
>   version and capabilities (counter width, number of channels...)
> - dithering mode (can be used to extend PWM resolution)
> - input triggers list
> - new counter modes
> - various bit-field updates
> - power-domains property
> Timer trigger identifier can be up to 19 (from timer 20)
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--EoOWfOi1n9QKUU+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MA2AAKCRB4tDGHoIJi
0vUcAQDHt1a291qOikCk+YbFAxxytC/jHrnDcNjqTbJpnfpkxwEA/WPnp/cnmyv9
ApGtO9lFz3BQAdvpCZ2662o9jnd3OAw=
=h9U4
-----END PGP SIGNATURE-----

--EoOWfOi1n9QKUU+q--

--===============1515310841327705300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1515310841327705300==--
