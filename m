Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7407F7B26B1
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 22:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1517BC6B476;
	Thu, 28 Sep 2023 20:39:13 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B515C6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 20:39:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4886FB81C1C;
 Thu, 28 Sep 2023 20:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D00C433C8;
 Thu, 28 Sep 2023 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695933550;
 bh=xINXDKcTe6ijRIqT/PemFdRIVgJJnLG488c56JbijgA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwGeJcBnI4vzd0lgEzuKqStNzmqnNABTX3xmghorXxnqzGNG6fOsKS0yoXIjFGHX8
 hoRJRFEQau+i9BA8D5FUzu0TlSKY/OJeMI4mxDGOYphFOnFGBLTJu3z62TJkdw7M8o
 sBnzZaGl5t+KCMwnxVfd4WVh0oH0myH1whk9T9wT6uBC38H5H+dL5oJtYA+8HvsYIc
 7f7mWXomZ4TwjnMJRUYY5JQibY7xFJlsyh5Yvw0G2JVxXnbk36zYjIO0Jl0znRPkG5
 8TgGEbUNYa62BWEKEBKY6JSM1w1j7x//N1I9tPJOhBgtzgsEyqKrAEs/rWAlPwIXQ8
 OERuE5KGkNnXQ==
Date: Thu, 28 Sep 2023 21:39:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20230928-footwork-padlock-524173c3e205@spud>
References: <20230928151512.322016-1-christophe.roullier@foss.st.com>
 <20230928151512.322016-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230928151512.322016-2-christophe.roullier@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 01/12] dt-bindings: net: add STM32MP13
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
Content-Type: multipart/mixed; boundary="===============3187503042976057760=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3187503042976057760==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8U54nw6WVDXbYGlQ"
Content-Disposition: inline


--8U54nw6WVDXbYGlQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Sep 28, 2023 at 05:15:01PM +0200, Christophe Roullier wrote:
> New STM32 SOC have 2 GMACs instances.
> GMAC IP version is SNPS 4.20.
>=20
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  .../devicetree/bindings/net/stm32-dwmac.yaml  | 78 +++++++++++++++++--
>  1 file changed, 70 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Doc=
umentation/devicetree/bindings/net/stm32-dwmac.yaml
> index fc8c96b08d7dc..ca976281bfc22 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -22,18 +22,17 @@ select:
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
>        - items:
>            - enum:
>                - st,stm32mp1-dwmac
> +              - st,stm32mp13-dwmac
>            - const: snps,dwmac-4.20a
>        - items:
>            - enum:
> @@ -74,13 +73,10 @@ properties:
> =20
>    st,syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      - items:
> -          - description: phandle to the syscon node which encompases the=
 glue register
> -          - description: offset of the control register
>      description:
>        Should be phandle/offset pair. The phandle to the syscon node which
> -      encompases the glue register, and the offset of the control regist=
er
> +      encompases the glue register, the offset of the control register a=
nd
> +      the mask to set bitfield in control register
> =20
>    st,eth-clk-sel:
>      description:
> @@ -101,6 +97,38 @@ required:
> =20
>  unevaluatedProperties: false
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
> +          items:
> +            items:
> +              - description: phandle to the syscon node which encompases=
 the glue register
> +              - description: offset of the control register

These descriptions should, IMO, be moved back out to the st,syscon
definition. If you put the 3 descriptions there, with "minItems: 2" &
put "maxItems: 2" and "minItems: 3" in each of the if/then clauses.
Also, it should be sufficient to simplify to if/then/else.

Cheers,
Conor.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp13-dwmac
> +    then:
> +      properties:
> +        st,syscon:
> +          items:
> +            items:
> +              - description: phandle to the syscon node which encompases=
 the glue register
> +              - description: offset of the control register
> +              - description: field to set mask in register
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -161,3 +189,37 @@ examples:
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
> +     };
> --=20
> 2.25.1
>=20

--8U54nw6WVDXbYGlQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRXkaAAKCRB4tDGHoIJi
0opWAP9JSnWhMjiIcX6Vc/XK2po8UfJBgrzDdpbxtFfTG/BmvwEA3JncB06h6fKE
ThgDVUqVEGxr4yKfVfIj32yBSVdxXwU=
=awMY
-----END PGP SIGNATURE-----

--8U54nw6WVDXbYGlQ--

--===============3187503042976057760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3187503042976057760==--
