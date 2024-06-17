Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D790B623
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 18:19:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52D3EC6B460;
	Mon, 17 Jun 2024 16:19:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0133EC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 16:19:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83FB4CE12B7;
 Mon, 17 Jun 2024 16:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D95CC2BD10;
 Mon, 17 Jun 2024 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718641186;
 bh=kq0sP/MpDIUvWkzVHv03Hs2cqjHxapUk5etdJnS5N3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KSt0rxFsTWZkZE0C9KPZLORhT7pm/Bf7yNzXY2hHC/mKYgEl0Qiehc3Mrwtkbtb0T
 MrZD/EJYhcm0qB5Z+kFTBoTnI9MLE0XHEGZH8N6rvmwjunDem1zNfzKY9U868NV/5h
 FBCrhYilKel0BqqOp2vNrahbi1oItZlfX8DwK/r+doyQH7rFiE3iHft6ydPG0b0y9O
 Bvl3Nl1aT1/2d0YPbNN9Sp9tU7qXCz12XrQoSI5KcuC2h8EFO1CusDylFIUqXX6alW
 dWvViMyveZVqgLuMkyPn+RYR3QV/7M83oiEs49bUnTQpn1Qr3311ipBWkicb1FnYax
 lyQX2iB5i7+Eg==
Date: Mon, 17 Jun 2024 17:19:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240617-spoils-trailside-99adaea88604@spud>
References: <20240617154516.277205-1-christophe.roullier@foss.st.com>
 <20240617154516.277205-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240617154516.277205-2-christophe.roullier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH v2 1/2] dt-bindings: net: add STM32MP25 compatible in
 documentation for stm32
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
Content-Type: multipart/mixed; boundary="===============6283760934107011689=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6283760934107011689==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CPXMyFh3qeMMXI35"
Content-Disposition: inline


--CPXMyFh3qeMMXI35
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 05:45:15PM +0200, Christophe Roullier wrote:
> New STM32 SOC have 2 GMACs instances.
> GMAC IP version is SNPS 5.30
>=20
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--CPXMyFh3qeMMXI35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBiHAAKCRB4tDGHoIJi
0jsuAP9lhc+oKhgHut5k2kN1bwEeV4Ln+08RJ/mFc3/VkuvCtwEAjRVAXhN2+8Ju
mmIlzsAaCHubydzbWNH3FOCXsRH2KQ0=
=RElg
-----END PGP SIGNATURE-----

--CPXMyFh3qeMMXI35--

--===============6283760934107011689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6283760934107011689==--
