Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8864F7AB11A
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 13:43:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D7DDC6A5EF;
	Fri, 22 Sep 2023 11:43:18 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B00C9C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 11:43:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 76187CE245D;
 Fri, 22 Sep 2023 11:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9C7C433C8;
 Fri, 22 Sep 2023 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695382992;
 bh=UL8TH12yxhaIMYvyUi/thvzlbWtFsgDinsXcxmzB5uA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5j69VsppTky9oLNhaaNt7S9yZ8FTOTxkyDyKDzfbrKb1yeXrzLzHjw8r4jZWPAmq
 dYVRdIMzUWVC1o3rmhaRK0EA/BAPl1F3QFP+S9wB0MB3kzjXvgGF4o8bo1OwA6G2Z/
 XSXjsseo7vWGeZtHEsaP2Tz7+/sFlQtAPUcQUeUP750ScNPcjB0qFk+PjPuTYU9/ze
 37p7LaL35yaXqVglDgrwxxRw/pL+S3UuJCCeH5lvZJtnp8oEn/mJRtyVQpOmB1n0zK
 y4BNOl6kjKD7UiIKjF5VFgV4zmZT3/JHPENsh+kdi5SAHJvcGtl+E/QfJ0xHGClrnT
 CL5dEyCIS9DSQ==
Date: Fri, 22 Sep 2023 12:43:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20230922-surface-graduate-a269a700e5c5@spud>
References: <20230921150622.599232-1-christophe.roullier@foss.st.com>
 <20230921150622.599232-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230921150622.599232-2-christophe.roullier@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: net: add STM32MP13
 compatible in documentation for stm32
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
Content-Type: multipart/mixed; boundary="===============3131555932287846808=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3131555932287846808==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y7/hylnc6AQ95TsF"
Content-Disposition: inline


--y7/hylnc6AQ95TsF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Thu, Sep 21, 2023 at 05:06:16PM +0200, Christophe Roullier wrote:
> New STM32 SOC have 2 GMACs instances.
> GMAC IP version is SNPS 4.20.
>=20
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  .../devicetree/bindings/net/stm32-dwmac.yaml  | 140 +++++++++++++++---
>  1 file changed, 118 insertions(+), 22 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Doc=
umentation/devicetree/bindings/net/stm32-dwmac.yaml
> index fc8c96b08d7d..75836916c38c 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -22,15 +22,17 @@ select:
>          enum:
>            - st,stm32-dwmac
>            - st,stm32mp1-dwmac
> +          - st,stm32mp13-dwmac
>    required:
>      - compatible
> =20
> -allOf:
> -  - $ref: snps,dwmac.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - st,stm32mp13-dwmac
> +          - const: snps,dwmac-4.20a

The enum just below this is also for the 4.20a, no? Why not just put
this mp13 compatible into that enum?

>        - items:
>            - enum:
>                - st,stm32mp1-dwmac
> @@ -72,27 +74,69 @@ properties:
>          - eth-ck
>          - ptp_ref
> =20
> -  st,syscon:

Please try to avoid defining properties inside if/then/else sections and
only move the variable bits if possible.

> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      - items:
> -          - description: phandle to the syscon node which encompases the=
 glue register
> -          - description: offset of the control register
> +  phy-supply:
> +    description: PHY regulator
> +
> +  st,ext-phyclk:
>      description:
> -      Should be phandle/offset pair. The phandle to the syscon node which
> -      encompases the glue register, and the offset of the control regist=
er
> +      set this property in RMII mode when you have PHY without crystal 5=
0MHz and want to
> +      select RCC clock instead of ETH_REF_CLK. or in RGMII mode when you=
 want to select
> +      RCC clock instead of ETH_CLK125.
> +    type: boolean
> =20
>    st,eth-clk-sel:
> +    deprecated: true

Why have these been marked as deprecated? That doesn't appear to be
mention in the commit message & sounds like it should be a different
commit.

>      description:
>        set this property in RGMII PHY when you want to select RCC clock i=
nstead of ETH_CLK125.
>      type: boolean
> =20
>    st,eth-ref-clk-sel:
> +    deprecated: true

Ditto.

>      description:
>        set this property in RMII mode when you have PHY without crystal 5=
0MHz and want to
>        select RCC clock instead of ETH_REF_CLK.
>      type: boolean
> =20
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp1-dwmac
> +              - st,stm32-dwmac
> +    then:
> +      properties:
> +        st,syscon:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array
> +          items:
> +            - items:
> +                - description: phandle to the syscon node which encompas=
es the glue register
> +                - description: offset of the control register
> +          description:
> +            Should be phandle/offset pair. The phandle to the syscon nod=
e which
> +            encompases the glue register, and the offset of the control =
register
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp13-dwmac

You've got 2 if/then sections containing tests for 3 compatibles. There
are only 2 compatibles total right now & 3 with the patch, so it looks
like you'd get away with if/then/else instead.

> +    then:
> +      properties:
> +        st,syscon:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array
> +          items:
> +            - items:
> +                - description: phandle to the syscon node which encompas=
es the glue register
> +                - description: offset of the control register
> +                - description: field to set mask in register
> +          description:
> +            Should be phandle/offset pair. The phandle to the syscon nod=
e which
> +            encompases the glue register, the offset of the control regi=
ster and
> +            the mask to set bitfield in control register
> +
>  required:
>    - compatible
>    - clocks
> @@ -112,24 +156,36 @@ examples:
>             compatible =3D "st,stm32mp1-dwmac", "snps,dwmac-4.20a";

I don't understand why this existing example is changing.

Thanks,
Conor.

>             reg =3D <0x5800a000 0x2000>;
>             reg-names =3D "stmmaceth";
> -           interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> -           interrupt-names =3D "macirq";
> +           interrupts-extended =3D <&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH=
>,
> +                                 <&exti 70 IRQ_TYPE_LEVEL_HIGH>;
> +           interrupt-names =3D "macirq",
> +                             "eth_wake_irq";
>             clock-names =3D "stmmaceth",
> -                     "mac-clk-tx",
> -                     "mac-clk-rx",
> -                     "ethstp",
> -                     "eth-ck";
> +                         "mac-clk-tx",
> +                         "mac-clk-rx",
> +                         "eth-ck",
> +                         "ptp_ref",
> +                         "ethstp";
>             clocks =3D <&rcc ETHMAC>,
> -                <&rcc ETHTX>,
> -                <&rcc ETHRX>,
> -                <&rcc ETHSTP>,
> -                <&rcc ETHCK_K>;
> +                    <&rcc ETHTX>,
> +                    <&rcc ETHRX>,
> +                    <&rcc ETHCK_K>,
> +                    <&rcc ETHPTP_K>,
> +                    <&rcc ETHSTP>;
>             st,syscon =3D <&syscfg 0x4>;
> +           snps,mixed-burst;
>             snps,pbl =3D <2>;
> +           snps,en-tx-lpi-clockgating;
>             snps,axi-config =3D <&stmmac_axi_config_0>;
>             snps,tso;
>             phy-mode =3D "rgmii";
> -       };
> +
> +           stmmac_axi_config_0: stmmac-axi-config {
> +                                snps,wr_osr_lmt =3D <0x7>;
> +                                snps,rd_osr_lmt =3D <0x7>;
> +                                snps,blen =3D <0 0 0 0 16 8 4>;
> +           };
> +     };
> =20
>    - |
>      //Example 2 (MCU example)
> @@ -161,3 +217,43 @@ examples:
>             snps,pbl =3D <8>;
>             phy-mode =3D "mii";
>         };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    #include <dt-bindings/mfd/stm32h7-rcc.h>
> +    //Example 4
> +     ethernet3: ethernet@5800a000 {
> +           compatible =3D "st,stm32mp13-dwmac", "snps,dwmac-4.20a";
> +           reg =3D <0x5800a000 0x2000>;
> +           reg-names =3D "stmmaceth";
> +           interrupts-extended =3D <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH=
>,
> +                                 <&exti 68 IRQ_TYPE_LEVEL_HIGH>;
> +           interrupt-names =3D "macirq",
> +                             "eth_wake_irq";
> +           clock-names =3D "stmmaceth",
> +                         "mac-clk-tx",
> +                         "mac-clk-rx",
> +                         "eth-ck",
> +                         "ptp_ref",
> +                         "ethstp";
> +           clocks =3D <&rcc ETHMAC>,
> +                    <&rcc ETHTX>,
> +                    <&rcc ETHRX>,
> +                    <&rcc ETHCK_K>,
> +                    <&rcc ETHPTP_K>,
> +                    <&rcc ETHSTP>;
> +           st,syscon =3D <&syscfg 0x4 0xff0000>;
> +           snps,mixed-burst;
> +           snps,pbl =3D <2>;
> +           snps,axi-config =3D <&stmmac_axi_config_1>;
> +           snps,tso;
> +           phy-mode =3D "rmii";
> +
> +           stmmac_axi_config_1: stmmac-axi-config {
> +                                snps,wr_osr_lmt =3D <0x7>;
> +                                snps,rd_osr_lmt =3D <0x7>;
> +                                snps,blen =3D <0 0 0 0 16 8 4>;
> +           };
> +     };
> --=20
> 2.25.1
>=20

--y7/hylnc6AQ95TsF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ19ygAKCRB4tDGHoIJi
0uJ2AQDYMHSxhPUAaxKOHWJ6DyhZftPWpUilt+MV/PUTA3814gEAqkENVdWxZsMn
IiIRijrOe3RpmdB14TsJ6QPhUyr+mgg=
=e7lu
-----END PGP SIGNATURE-----

--y7/hylnc6AQ95TsF--

--===============3131555932287846808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3131555932287846808==--
