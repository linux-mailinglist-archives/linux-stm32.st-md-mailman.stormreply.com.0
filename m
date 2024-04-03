Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73310897462
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 17:49:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F7BC69067;
	Wed,  3 Apr 2024 15:49:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4CD0C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 15:49:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B8A96148B;
 Wed,  3 Apr 2024 15:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECF8C433C7;
 Wed,  3 Apr 2024 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712159367;
 bh=UzhIYoxj/GeUq1Zwp8VWt8eQlrVFRAAjBbLXufD7S1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iokMOfxMA3K/TB6FKWFIK0O7s2zq9aTtls09nLxeUk6PRr6Z60BQud79hycqKEjQS
 F2HF0BeyukIj5qydY11CNYd3p1AQY5H0UJf1+SPKTJYMa91oijQJlPi2iC9x7YoZSv
 enYPM4R+oka/GAq9UxpBKwGke/aXce6Xr4CaZbrTt+YooAe/ataCz/2t2Sq7VaY4/W
 wSf4CL8M23uZrbYBJHpaKS78mRBqbwWWHDrdXGSS1kIteJSz5cvTJm+kgSTcn2B6DW
 G5Kl7+x/QvP2PTALxe6WIXRScUUhaHfwCHbiGSRKSojnp5dBZARsKUiKKCNphr8Jni
 C5BjRi7WSaSMg==
Date: Wed, 3 Apr 2024 16:49:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Tan Chun Hau <chunhau.tan@starfivetech.com>
Message-ID: <20240403-curfew-baked-a0feef40cd92@spud>
References: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
 <20240403100549.78719-2-chunhau.tan@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240403100549.78719-2-chunhau.tan@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jee Heng Sia <jeeheng.sia@starfivetech.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 1/1] dt-bindings: net: starfive,
 jh7110-dwmac: Add StarFive JH8100 support
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
Content-Type: multipart/mixed; boundary="===============1408509726458614199=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1408509726458614199==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5QPyn77z4oCLNx4w"
Content-Disposition: inline


--5QPyn77z4oCLNx4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 03:05:49AM -0700, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
>=20
> Please refer to below:
>=20
>   JH8100: reset-names =3D "stmmaceth";
>   JH7110: reset-names =3D "stmmaceth", "ahb";
>   JH7100: reset-names =3D "ahb";
>=20
> Example usage of JH8100 in the device tree:
>=20
> gmac0: ethernet@16030000 {
>         compatible =3D "starfive,jh8100-dwmac",
>                      "starfive,jh7110-dwmac",
>                      "snps,dwmac-5.20";
>         ...
> };
>=20
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>

How come you didn't pick up Rob's r-b?
https://lore.kernel.org/all/20240328204202.GA308290-robh@kernel.org/

Thanks,
Conor.

--5QPyn77z4oCLNx4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg16fwAKCRB4tDGHoIJi
0rVTAPwPbHnemqIv++C11B6NjvmKObocsG2d4g/9l+VTGUcEcwD/dnqiJI0Edddc
A2TIMXnBN8NBZKR6OjdPOBQe3BmioQI=
=ysgy
-----END PGP SIGNATURE-----

--5QPyn77z4oCLNx4w--

--===============1408509726458614199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1408509726458614199==--
