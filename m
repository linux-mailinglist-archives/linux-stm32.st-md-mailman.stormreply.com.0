Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B3D7B2375
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 19:14:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D245C6B474;
	Thu, 28 Sep 2023 17:14:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3F60C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 17:14:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C0FD61D47;
 Thu, 28 Sep 2023 17:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AF6C433CA;
 Thu, 28 Sep 2023 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695921258;
 bh=tXrtMWlwOkfqKNhjWq3vR9L4n6dBzGkeLZc+XQRiVK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWpDdv3+ksAvGEbNOJjqpj7q/5jMHatTKJ6it5aZ7nm2U87e6YhGkdg2q43rVdojX
 syggjiJg5ofTPT4ATJLWCuz47QSHmXFDJDhLEGRk1OuahUyYkwlVZi6lmjC5+Dh1mQ
 67LUx4MmVrgVgHKK8ylOt8LjMq3shKSUja7kpoc6Df4kVVvr21dYUAtqmYmkdVuWva
 PS5yDmUx+0w9nPgivh0w+5vaSp9XfsdcRFb9kkRDhAaXoRi5lrJGPcHoHr9wvVGf+U
 Cu04xLMuPz3yw7g2+EXxkqrrZPbxHdkL2HkUsDfA/NW+0lEIMECd0ohKE5Jo1WD+pR
 KmRdxOVEncZsA==
Date: Thu, 28 Sep 2023 18:14:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20230928-pelvis-outhouse-28bb691bd790@spud>
References: <20230928151512.322016-1-christophe.roullier@foss.st.com>
 <20230928151512.322016-4-christophe.roullier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230928151512.322016-4-christophe.roullier@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 03/12] dt-bindings: net: add phy-supply
 property for stm32
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
Content-Type: multipart/mixed; boundary="===============9101755296765498382=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9101755296765498382==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z+Q9ArmXRwc2oCyE"
Content-Disposition: inline


--z+Q9ArmXRwc2oCyE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 05:15:03PM +0200, Christophe Roullier wrote:
> Phandle to a regulator that provides power to the PHY. This
> regulator will be managed during the PHY power on/off sequence.
>=20
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Tjanks,
Conor.

> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Doc=
umentation/devicetree/bindings/net/stm32-dwmac.yaml
> index 67840cab02d2d..8114c325a4eed 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -78,6 +78,9 @@ properties:
>        encompases the glue register, the offset of the control register a=
nd
>        the mask to set bitfield in control register
> =20
> +  phy-supply:
> +    description: PHY regulator
> +
>    st,ext-phyclk:
>      description:
>        set this property in RMII mode when you have PHY without crystal 5=
0MHz and want to
> --=20
> 2.25.1
>=20

--z+Q9ArmXRwc2oCyE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRW0YwAKCRB4tDGHoIJi
0p4/AP9+zFrcdUG4lft9L0yl+zWXuhbkd/AOM7N86NFMT57JlgEAh0jws3IZ/Vty
dGXkDN6EFYwVjejcIawKvNSaWv29VQI=
=2LGR
-----END PGP SIGNATURE-----

--z+Q9ArmXRwc2oCyE--

--===============9101755296765498382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9101755296765498382==--
