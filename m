Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75883A22371
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 18:54:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EE2EC7803C;
	Wed, 29 Jan 2025 17:54:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBC30C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 17:54:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26D76A407BF;
 Wed, 29 Jan 2025 17:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454BFC4CED1;
 Wed, 29 Jan 2025 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738173243;
 bh=Zyf2Hutc5cy0T89YVPvTglk6LxkQN6P68b7+zGZ837w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BU+nGcuTtFSX63zvw1OdWg01bkYPv85CIq9lThHNzW8t3mpk5pTpn0NqgjviFTmRG
 9uVfhz8se45xyyaEoJqxNWNjKuRHlArPi8QK/gm8W4zzZRChSe5OMBBJs4YmF6Xk01
 sPPyyCDIlHHO8uk0UwfddpjuVyJA/DKOtpq6iajj1opHiHc44poT3PnxtTO9Wvohzn
 lL6dN2TRIQYh2GV3Uk1SIrsvbOp91L6c7FJTLx3O2QtGJ7nQ+mVSh+Ti7kAb9zQvj2
 Q4jA3SJG9OJICbc50j21pWb8Of7cSotac9oTJ3OYI880BfnboqeSHWj3FWLzUXsC/j
 HDAusBlf+F/iw==
Date: Wed, 29 Jan 2025 17:53:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20250129-feminize-spotlight-2cee53f8b463@spud>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
 <e3d01bce-a7d4-4690-8a2f-3bbb1ee5ccb7@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <e3d01bce-a7d4-4690-8a2f-3bbb1ee5ccb7@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI
	controller
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
Content-Type: multipart/mixed; boundary="===============7933265041518175468=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7933265041518175468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="klBchq5Iv61GqXw7"
Content-Disposition: inline


--klBchq5Iv61GqXw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 06:40:23PM +0100, Patrice CHOTARD wrote:
> On 1/28/25 19:02, Conor Dooley wrote:
> > On Tue, Jan 28, 2025 at 09:17:23AM +0100, patrice.chotard@foss.st.com w=
rote:
> >> +  memory-region:
> >> +    maxItems: 1
> >=20
> > Whatever about not having descriptions for clocks or reg when there's
> > only one, I think a memory region should be explained.
>=20
> ok i will add :
>=20
>     description: |

The | isn't needed here.

>       Memory region to be used for memory-map read access.

I don't think that's a good explanation, sorry. Why's a memory-region
required for read access?

> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    items:
> >> +      - description: phandle to OSPI block reset
> >> +      - description: phandle to delay block reset
> >> +
> >> +  dmas:
> >> +    maxItems: 2
> >> +
> >> +  dma-names:
> >> +    items:
> >> +      - const: tx
> >> +      - const: rx
> >> +
> >> +  st,syscfg-dlyb:
> >> +    description: phandle to syscon block
> >> +      Use to set the OSPI delay block within syscon to
> >> +      tune the phase of the RX sampling clock (or DQS) in order
> >> +      to sample the data in their valid window and to
> >> +      tune the phase of the TX launch clock in order to meet setup
> >> +      and hold constraints of TX signals versus the memory clock.
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >=20
> > Why do you need a phandle here? I assume looking up by compatible ain't
> > possible because you have multiple controllers on the SoC? Also, I don't
>=20
> Yes, we got 2 OCTOSPI controller, each of them have a dedicated delay blo=
ck
>  syscfg register.

:+1:=20

> > think your copy-paste "phandle to" stuff here is accurate:
> >       st,syscfg-dlyb =3D <&syscfg 0x1000>;
> > There's an offset here that you don't mention in your description.
>=20
> I will add it as following:
>=20
>   st,syscfg-dlyb:
>     description:
>       Use to set the OSPI delay block within syscon to
>       tune the phase of the RX sampling clock (or DQS) in order
>       to sample the data in their valid window and to
>       tune the phase of the TX launch clock in order to meet setup
>       and hold constraints of TX signals versus the memory clock.
>     $ref: /schemas/types.yaml#/definitions/phandle-array
>     items:
>       - description: phandle to syscfg
>       - description: register offset within syscfg

:+1:

> >> +  access-controllers:
> >> +    description: phandle to the rifsc device to check access right
> >> +      and in some cases, an additional phandle to the rcc device for
> >> +      secure clock control
> >=20
> > This should be described using items rather than a free-form list.
>=20
>   access-controllers:
>     description: phandle to the rifsc device to check access right
>       and in some cases, an additional phandle to the rcc device for
>       secure clock control
>     items:
>       - description: phandle to bus controller or to clock controller
>       - description: access controller specifier
>      minItems: 1
>      maxItems: 2

These updates look fine to me.

--klBchq5Iv61GqXw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5prNQAKCRB4tDGHoIJi
0tiOAQDd9BF6yvC5/EHySEFWBLCC14sZW3m0j9Y5sHG+IFLYJQD/SiGc3aoOaqRR
GvI0wjS/7qTgY+FgXginJwblZbIzNAs=
=C2X+
-----END PGP SIGNATURE-----

--klBchq5Iv61GqXw7--

--===============7933265041518175468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7933265041518175468==--
