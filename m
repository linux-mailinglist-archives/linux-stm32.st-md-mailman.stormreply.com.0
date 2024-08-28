Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A1962DDE
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 18:47:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C75FC6C855;
	Wed, 28 Aug 2024 16:47:35 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E8B0C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 16:47:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47276A428B6;
 Wed, 28 Aug 2024 16:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC89C4CABF;
 Wed, 28 Aug 2024 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724861477;
 bh=9CtFrh3gKyelJvHQtwXVoL7gTTFZNFMEbrIHkpQX020=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=guNWp2bD47/n92FQffLtDnx3F/38XLD7Q9FpHV2RCXj3jzotPNdPUO5BN+pHTfu69
 EW4MmLD5CEf3UXMqKMeS6UDdhEH2v6vFNL0fsdGp1Iz+Qgb0+IIa0pfk2D4yuHTXFF
 6LJhk6iD+rWsuaQ67bNl8uKCVi2ykNQLf9Ibmu5j9HqHq7/2aEvHeRRMphWNlobXkP
 WkgcHxUTV+M2fC0FlDCqLN4IcEHUU2M5OCSaBiBuyYkx3NRAxMOjdvryiHPNYxtmy6
 LDID3U86Onq4+mMmfPEqQRnguSDzZYjCBP8ugKTLsAktMs35GZMxKn9Ym3aygxWYij
 C1I9T80hbocoQ==
Date: Wed, 28 Aug 2024 17:11:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20240828-handsfree-overarch-cd1af26cb0c5@spud>
References: <20240828143452.1407532-1-christian.bruel@foss.st.com>
 <20240828143452.1407532-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240828143452.1407532-2-christian.bruel@foss.st.com>
Cc: kishon@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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
Content-Type: multipart/mixed; boundary="===============5890785782869848487=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5890785782869848487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZqexDgeCbf5zKW3c"
Content-Disposition: inline


--ZqexDgeCbf5zKW3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 04:34:48PM +0200, Christian Bruel wrote:
> Document the bindings for STM32 COMBOPHY interface, used to support
> the PCIe and USB3 stm32mp25 drivers.
> Following entries can be used to tune caracterisation parameters
>  - st,output-micro-ohms and st,output-vswing-microvolt bindings entries
> to tune the impedance and voltage swing using discrete simulation results
>  - st,rx-equalizer register to set the internal rx equalizer filter value.
>=20
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/phy/st,stm32mp25-combophy.yaml   | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32mp25-co=
mbophy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.=
yaml b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
> new file mode 100644
> index 000000000000..8d4a40b94507
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/st,stm32mp25-combophy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32MP25 USB3/PCIe COMBOPHY
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  Single lane PHY shared (exclusive) between the USB3 and PCIe controlle=
rs.
> +  Supports 5Gbit/s for USB3 and PCIe gen2 or 2.5Gbit/s for PCIe gen1.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-combophy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: apb Bus clock mandatory to access registers.
> +      - description: ker Internal RCC reference clock for USB3 or PCIe
> +      - description: pad Optional on board clock input for PCIe only. Ty=
pically an
> +                     external 100Mhz oscillator wired on dedicated CLKIN=
 pad. Used as reference
> +                     clock input instead of the ker
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: apb
> +      - const: ker
> +      - const: pad
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: phy
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description: interrupt used for wakeup
> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2

Can you please describe the items here?

> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the SYSCON entry required for configuring PC=
Ie
> +      or USB3.

Why is a phandle required for this lookup, rather than doing it by
compatible?

> +
> +  st,ssc-on:
> +    type: boolean

flag, not boolean, for presence based stuff. And in the driver,
s/of_property_read_bool/of_property_present/.

> +    description:
> +      A boolean property whose presence indicates that the SSC for commo=
n clock
> +      needs to be set.

And what, may I ask, does "SSC" mean? "Common clock" is also a bit of a
"linuxism", what does this actually do in the hardware block?

> +
> +  st,rx-equalizer:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    default: 2
> +    description:
> +      A 3 bit value to tune the RX fixed equalizer setting for optimal e=
ye compliance
> +
> +  st,output-micro-ohms:
> +    minimum: 3999000
> +    maximum: 6090000
> +    default: 4968000
> +    description:
> +      A value property to tune the Single Ended Output Impedance, simula=
tions results
> +      at 25C for a VDDP=3D0.8V. The hardware accepts discrete values in =
this range.
> +
> +  st,output-vswing-microvolt:
> +    minimum: 442000
> +    maximum: 803000
> +    default: 803000
> +    description:
> +      A value property in microvolt to tune the Single Ended Output Volt=
age Swing to change the
> +      Vlo, Vhi for a VDDP =3D 0.8V. The hardware accepts discrete values=
 in this range.
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +  - resets
> +  - reset-names
> +  - st,syscfg

The order here should reflect the ordering in a node, so compatible and
reg first, rather than sorted alphanumerically.=20

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    combophy: phy@480c0000 {

You can drop the label here, it ain't used by anything.

Cheers,
Conor.

> +        compatible =3D "st,stm32mp25-combophy";
> +        reg =3D <0x480c0000 0x1000>;
> +        #phy-cells =3D <1>;
> +        clocks =3D <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>;
> +        clock-names =3D "apb", "ker";
> +        resets =3D <&rcc USB3PCIEPHY_R>;
> +        reset-names =3D "phy";
> +        st,syscfg =3D <&syscfg>;
> +        access-controllers =3D <&rifsc 67>;
> +        power-domains =3D <&CLUSTER_PD>;
> +        wakeup-source;
> +        interrupts-extended =3D <&exti1 45 IRQ_TYPE_EDGE_FALLING>;
> +    };
> +...
> --=20
> 2.34.1
>=20

--ZqexDgeCbf5zKW3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs9MIAAKCRB4tDGHoIJi
0rh1AQCPLBp07OqC6pb/M6pgsgJC3wD1Sth/EdmLd/aA+HbfbQD/UrdgsGoXy9Qq
CdxZUx/rJtHiFAP20+3XyjwVb1Gy1gU=
=onYf
-----END PGP SIGNATURE-----

--ZqexDgeCbf5zKW3c--

--===============5890785782869848487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5890785782869848487==--
