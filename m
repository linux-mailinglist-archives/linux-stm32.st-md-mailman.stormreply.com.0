Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F0C8CEA12
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 20:55:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2FA3C6DD6D;
	Fri, 24 May 2024 18:55:39 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72DD6C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 18:55:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5285BCE1940;
 Fri, 24 May 2024 18:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE30C2BBFC;
 Fri, 24 May 2024 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716576928;
 bh=V55crGx9DJS5MiBJVv/+LEY0ZPYPpfjGvUfBJMEw2h8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NSUslT03br2Zde0/wO+jMVdw6sK7NAOIuEh4K1LUO6Loi6/dV7aaBHppO7dblbAUw
 BWx6lqAoWYfImY9bA9iA/FFycLRyYvWxZ63byq1VLzEupR7NBOteKJlPJ6uF1KDOzN
 sfa8AcqlKS+amQnLqTc6jkaWxq724BT2jmvdMFqfgOfXLgBEY4E1gvLRGBFbd+T3ce
 VFW+QkpBxVJ/vgOBRv+ieMzaUC46u18LNf5Vad3/SLXcRG3JWunFqjrskBY3xfUZ8p
 7dqeFkE5i5zke9aMHvAMqto/yNU3n6F06wRQYtoWw8FooJaXhKAWDfKCohezy0Qwus
 ijwmLFwU0fuUw==
Date: Fri, 24 May 2024 19:55:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20240524-reorder-tattoo-13af5d569e3f@spud>
References: <20240523180435.583257-1-patrick.delaunay@foss.st.com>
 <20240523200353.v4.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
MIME-Version: 1.0
In-Reply-To: <20240523200353.v4.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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
Content-Type: multipart/mixed; boundary="===============3074199601394065158=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3074199601394065158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C5nojw+CH6iHfaud"
Content-Disposition: inline


--C5nojw+CH6iHfaud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 08:04:33PM +0200, Patrick Delaunay wrote:
> Add new compatible "st,stm32mp13-pwr-reg" for STM32MP13 SoC family.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--C5nojw+CH6iHfaud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDimwAKCRB4tDGHoIJi
0qMMAQCifoMtFkXnySZ7EmWtDmoZFR86d/CLsf2nWTYn2dAs5wEAmlR2PAW4Z2ic
GAGmr55uU4Ay8/FGlfegcoU/KbXmKQg=
=HKMv
-----END PGP SIGNATURE-----

--C5nojw+CH6iHfaud--

--===============3074199601394065158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3074199601394065158==--
