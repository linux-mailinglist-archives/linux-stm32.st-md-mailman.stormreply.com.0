Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8EC9E5CC5
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 18:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D9ABC78020;
	Thu,  5 Dec 2024 17:16:28 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB0F2C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 17:16:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1F5DBA43856;
 Thu,  5 Dec 2024 17:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A18C4CED1;
 Thu,  5 Dec 2024 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733418979;
 bh=ll/pqBlh7VQdZrfl40Y3GRd2AxpRWeO2O5BqSRhjrXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UGxelnSmP2fi+QBtv0TaH/Q9nACsWEbMiXTzcVD8FSQHtVUZmxSLiisduv91ug+sS
 Ax5e/T0z+6bvflbNCWXVu47JOFQRYk7k6HmJYDoCCwditaCWxk4O2fJ3AWlSo4fzua
 Uf7/+C9qjPN37R2kGgv6k78I5ZLIOtoJ6vVrYqkLT78lSYMkOJpmBAT4mTRI+QFIwM
 tv555atqTSfiYtDUEe4wuTnR8GZCmULXsaUg6uMaBo2IbSWPqD+opXDzaQwGbFNsqb
 vH+pPl3AQa3oSI8fHxfOqVisVWNpp9sHWglYH14WkcCIzTkdajm+dEi57YY+zUQbvB
 f7QmOrNvl4H6A==
Date: Thu, 5 Dec 2024 17:16:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20241205-hamstring-mantis-b8b3a25210ef@spud>
References: <20241205125640.1253996-1-o.rempel@pengutronix.de>
 <20241205125640.1253996-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20241205125640.1253996-3-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 2/5] dt-bindings: vendor-prefixes: Add
	prefix for Priva
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
Content-Type: multipart/mixed; boundary="===============3791500725662627562=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3791500725662627562==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RfxN6UD6pYJLj5Ip"
Content-Disposition: inline


--RfxN6UD6pYJLj5Ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 01:56:37PM +0100, Oleksij Rempel wrote:
> Introduce the 'pri' vendor prefix for Priva, a company specializing in
> sustainable solutions for building automation, energy, and climate
> control.  More information about Priva can be found at
> https://www.priva.com
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index da01616802c7..9a9ac3adc5ef 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1198,6 +1198,8 @@ patternProperties:
>      description: Primux Trading, S.L.
>    "^probox2,.*":
>      description: PROBOX2 (by W2COMP Co., Ltd.)
> +  "^pri,.*":
> +    description: Priva

Why not "priva"? Saving two chars doesn't seem worth less info.

--RfxN6UD6pYJLj5Ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1Hf3gAKCRB4tDGHoIJi
0vCCAPsHVLh5ARoGVS/2vGmP95xh8i6OPSPvwg87l4tT5DQKGAD+OrSsG3fRMkAH
BhsrJpztvvaJq8afTPZtjQh4PQEPlQc=
=4PKr
-----END PGP SIGNATURE-----

--RfxN6UD6pYJLj5Ip--

--===============3791500725662627562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3791500725662627562==--
