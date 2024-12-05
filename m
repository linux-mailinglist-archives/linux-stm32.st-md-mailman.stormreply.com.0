Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D35449E5CE3
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 18:19:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB9DC7802B;
	Thu,  5 Dec 2024 17:19:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93B88C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 17:19:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 95F4A5C5FDB;
 Thu,  5 Dec 2024 17:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20443C4CED1;
 Thu,  5 Dec 2024 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733419145;
 bh=VsHwaUKv8NduryaYVZPPWuh8ZJKhLgoxE8VFqbLnXXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqXVxizwcvQkD9rq3KFgJyvFuOdHzgaQO8kBF39WBbeNcav25kluxu3pPGntKJaig
 RkxMrbzDY2Ei5bHfBWTbiSjbGLfW8YfebfXURg+CmduSThPpYppBvMCF1hWyvhgB2c
 WC0sQEbkPUAWMx7+yvX35+GzorEtlc81sGCYWQM06OOFKJps0L9JOCFjdDCiQjVhbg
 nc2JRnQ+jThNFzZRjA/degil7VDUjEwBPIdvD8C6zBqWnPAqMzTLgKZ6DDmCXIqZWh
 R1BdL5pKk5U87ncZ7HQZI8boarF//m8eYLDzEnASkmevuobDXSMv2pKIym8COqD35P
 HwdRhC/5PC3YQ==
Date: Thu, 5 Dec 2024 17:18:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20241205-immortal-sneak-8c5a348a8563@spud>
References: <20241205125640.1253996-1-o.rempel@pengutronix.de>
 <20241205125640.1253996-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20241205125640.1253996-2-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 1/5] dt-bindings: net: Add TI DP83TD510
	10BaseT1L PHY
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
Content-Type: multipart/mixed; boundary="===============1805166083360074105=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1805166083360074105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mjIsdWncN73NzB2k"
Content-Disposition: inline


--mjIsdWncN73NzB2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 01:56:36PM +0100, Oleksij Rempel wrote:
> Introduce devicetree binding for the Texas Instruments DP83TD510
> Ultra Low Power 802.3cg 10Base-T1L Single Pair Ethernet PHY.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/net/ti,dp83td510.yaml | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,dp83td510.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83td510.yaml b/Do=
cumentation/devicetree/bindings/net/ti,dp83td510.yaml
> new file mode 100644
> index 000000000000..cf13e86a4017
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,dp83td510.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,dp83td510.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI DP83TD510 10BaseT1L PHY
> +
> +maintainers:
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description:
> +  DP83TD510E Ultra Low Power 802.3cg 10Base-T1L 10M Single Pair Ethernet=
 PHY
> +
> +allOf:
> +  - $ref: ethernet-phy.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ethernet-phy-id2000.0181

There's nothing specific here, can someone remind me why the generic
binding is not enough?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet-phy@0 {
> +            compatible =3D "ethernet-phy-id2000.0181";
> +            reg =3D <0>;
> +        };
> +    };
> --=20
> 2.39.5
>=20

--mjIsdWncN73NzB2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1HggwAKCRB4tDGHoIJi
0mbBAQCXfiVmatNc13W2wjQPVHIfWlcAcWN2O6DRjLQbv3T9bgD9HC5cLIkqrx8y
ta22P06gmsmSfDEpMhRxajj8S8YG7AM=
=lKMn
-----END PGP SIGNATURE-----

--mjIsdWncN73NzB2k--

--===============1805166083360074105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1805166083360074105==--
