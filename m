Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29F9026A9
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 18:26:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3743C6C838;
	Mon, 10 Jun 2024 16:26:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFF36C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 16:26:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 61AFC60B50;
 Mon, 10 Jun 2024 16:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A21EC2BBFC;
 Mon, 10 Jun 2024 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718036779;
 bh=3UIaTShxInkjQ1pe5ZJloG0WAaJI7u1kBfrsEMbDQZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IiMbKDcMuesDyvDpScf+uzY9N15WDFL2TEbbvcXbuaDQi4quSO4LZSZgDoHDo+vJf
 XLXvRyXSb9tKLQwwjW3fO/1ZhK2sixRt88ZKibbFE/keLp9nCivgZRs3+MGJawIKnF
 RbwW2JEWe1kgbgqp0POECn9HZdpCNM2jQGJv/cBkXYipGs9libJJ50+AHvwyS41xtg
 qFA3JOqi4msxRDtdliZz+mpChRqxWMC4evZs5SjYuuThDaF6riZJ3UbNDHDpaHsTTw
 ygnhdXrDTKTOiDIM+OSTyUSNaVjdgZaogn5nJhxzMag6c9P08frv9sf8m6Mk8KA2V3
 oh2PYNQ5V3Mlw==
Date: Mon, 10 Jun 2024 17:26:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240610-relay-vanquish-b939690775dc@spud>
References: <20240610071459.287500-1-christophe.roullier@foss.st.com>
 <20240610071459.287500-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240610071459.287500-2-christophe.roullier@foss.st.com>
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
 PATCH v6 1/8] dt-bindings: net: add STM32MP13 compatible in
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
Content-Type: multipart/mixed; boundary="===============7941535464596989544=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7941535464596989544==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="chgm6HB084fcCxg1"
Content-Disposition: inline


--chgm6HB084fcCxg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 09:14:52AM +0200, Christophe Roullier wrote:
> New STM32 SOC have 2 GMACs instances.
> GMAC IP version is SNPS 4.20.
>=20
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  .../devicetree/bindings/net/stm32-dwmac.yaml  | 43 ++++++++++++++++---
>  1 file changed, 36 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Doc=
umentation/devicetree/bindings/net/stm32-dwmac.yaml
> index 7ccf75676b6d5..f6e5e0626a3fb 100644
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
> @@ -75,12 +74,15 @@ properties:
>    st,syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
> -      - items:
> +      - minItems: 2
> +        items:
>            - description: phandle to the syscon node which encompases the=
 glue register
>            - description: offset of the control register
> +          - description: field to set mask in register
>      description:
>        Should be phandle/offset pair. The phandle to the syscon node which
> -      encompases the glue register, and the offset of the control regist=
er
> +      encompases the glue register, the offset of the control register a=
nd
> +      the mask to set bitfield in control register
> =20
>    st,ext-phyclk:
>      description:
> @@ -112,12 +114,39 @@ required:
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
> +            minItems: 2
> +            maxItems: 2
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
> +            minItems: 3
> +            maxItems: 3
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/stm32mp1-clks.h>
> -    #include <dt-bindings/reset/stm32mp1-resets.h>
> -    #include <dt-bindings/mfd/stm32h7-rcc.h>

Unrelated change. Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>      //Example 1
>       ethernet0: ethernet@5800a000 {
>             compatible =3D "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
> --=20
> 2.25.1
>=20

--chgm6HB084fcCxg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcpJQAKCRB4tDGHoIJi
0tffAQDMCZd4Y8qJBiuAkUt0ppGvuLVuiB+9OHGL+/fRrxrGNQD/XXHMOtOGzn7O
9e8VAL9hwogjnLKXF/R6ClOO4Hj/ZgI=
=LIXm
-----END PGP SIGNATURE-----

--chgm6HB084fcCxg1--

--===============7941535464596989544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7941535464596989544==--
