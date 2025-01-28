Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B1A21037
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 19:02:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65D35C78026;
	Tue, 28 Jan 2025 18:02:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7D97C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 18:02:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 811A35C5E29;
 Tue, 28 Jan 2025 18:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1C5C4CED3;
 Tue, 28 Jan 2025 18:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738087353;
 bh=17sm+X5zyYge664zgijjG3INLik8MXrleSdffgx7+sM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XMuWqg4RYnrqYMaIA/ZcIhJErUloNcadylvAlyJ4i9jsnhEmcRFaEO2o7xl8Ja3iy
 tBWkCZAQ5y5NziPO2hZOgxCC3JFFI/rJxezpT8UBtHs3SIVOszdw4j6Sa7qhAa7qn/
 WiYbmsI7ax4600FToUWN2gu2ivn4HCCaenBf2WxpCFKyUr437gEGFDggU65b6vkxgd
 LK4Xy3n2XBXGHn2gbCBBvyMU+WFdhFU4j09xNsRVjagaGFRX92Nk8jQywRUleI6Skk
 L/wXxLWnMaElYz1nZoTyWrAaUPRu9tMWIyIYrzcQHeFu+hwDWquzTQmYp/FyRyZ09e
 nbXueTytgVkCA==
Date: Tue, 28 Jan 2025 18:02:27 +0000
From: Conor Dooley <conor@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <20250128-panama-manly-a753d91c297c@spud>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250128081731.2284457-2-patrice.chotard@foss.st.com>
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
Content-Type: multipart/mixed; boundary="===============4216149720310388753=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4216149720310388753==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xfUYpCROzbnYgVkv"
Content-Disposition: inline


--xfUYpCROzbnYgVkv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 09:17:23AM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Add device tree bindings for the STM32 OSPI controller.
>=20
> Main features of the Octo-SPI controller :
>   - support sNOR / sNAND / HyperRAM=E2=84=A2 and HyperFlash=E2=84=A2 devi=
ces.
>   - Three functional modes: indirect, automatic-status polling,
>     memory-mapped.
>   - Up to 4 Gbytes of external memory can be addressed in indirect
>     mode (per physical port and per CS), and up to 256 Mbytes in
>     memory-mapped mode (combined for both physical ports and per CS).
>   - Single-, dual-, quad-, and octal-SPI communication.
>   - Dual-quad communication.
>   - Single data rate (SDR) and double transfer rate (DTR).
>   - Maximum target frequency is 133 MHz for SDR and 133 MHz for DTR.
>   - Data strobe support.
>   - DMA channel for indirect mode.
>   - Double CS mapping that allows two external flash devices to be
>     addressed with a single OCTOSPI controller mapped on a single
>     OCTOSPI port.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/spi/st,stm32mp25-ospi.yaml       | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32mp25-os=
pi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml=
 b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
> new file mode 100644
> index 000000000000..f1d539444673
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/st,stm32mp25-ospi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Octal Serial Peripheral Interface (OSPI)
> +
> +maintainers:
> +  - Patrice Chotard <patrice.chotard@foss.st.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-ospi
> +
> +  reg:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1

Whatever about not having descriptions for clocks or reg when there's
only one, I think a memory region should be explained.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: phandle to OSPI block reset
> +      - description: phandle to delay block reset
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  st,syscfg-dlyb:
> +    description: phandle to syscon block
> +      Use to set the OSPI delay block within syscon to
> +      tune the phase of the RX sampling clock (or DQS) in order
> +      to sample the data in their valid window and to
> +      tune the phase of the TX launch clock in order to meet setup
> +      and hold constraints of TX signals versus the memory clock.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Why do you need a phandle here? I assume looking up by compatible ain't
possible because you have multiple controllers on the SoC? Also, I don't
think your copy-paste "phandle to" stuff here is accurate:
      st,syscfg-dlyb =3D <&syscfg 0x1000>;
There's an offset here that you don't mention in your description.

> +    items:
> +      maxItems: 1
> +
> +  access-controllers:
> +    description: phandle to the rifsc device to check access right
> +      and in some cases, an additional phandle to the rcc device for
> +      secure clock control

This should be described using items rather than a free-form list.

> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - st,syscfg-dlyb
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +    spi@40430000 {

nit: you missing a blank line here.

> +      compatible =3D "st,stm32mp25-ospi";
> +      reg =3D <0x40430000 0x400>;
> +      memory-region =3D <&mm_ospi1>;
> +      interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +      dmas =3D <&hpdma 2 0x62 0x00003121 0x0>,
> +             <&hpdma 2 0x42 0x00003112 0x0>;
> +      dma-names =3D "tx", "rx";
> +      clocks =3D <&scmi_clk CK_SCMI_OSPI1>;
> +      resets =3D <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSP=
I1DLL>;
> +      access-controllers =3D <&rifsc 74>;
> +      power-domains =3D <&CLUSTER_PD>;
> +      st,syscfg-dlyb =3D <&syscfg 0x1000>;
> +
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      flash@0 {
> +        compatible =3D "jedec,spi-nor";
> +        reg =3D <0>;
> +        spi-rx-bus-width =3D <4>;
> +        spi-max-frequency =3D <108000000>;
> +      };
> +    };
> --=20
> 2.25.1
>=20

--xfUYpCROzbnYgVkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5kbswAKCRB4tDGHoIJi
0lcIAQDU7HTXvB+po6yvcl9praNiHvh+3GS9lcFqfp1k7eAIrwD/Vghbo+R30BML
AU87FB9nIF3rIe0J6yZGyW+mcijJaws=
=Sliy
-----END PGP SIGNATURE-----

--xfUYpCROzbnYgVkv--

--===============4216149720310388753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4216149720310388753==--
