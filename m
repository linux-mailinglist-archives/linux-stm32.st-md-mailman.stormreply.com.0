Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92145BDAE88
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 20:10:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAB7CC5660B;
	Tue, 14 Oct 2025 18:10:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DCFCC56607
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 18:10:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EBE6040AAB;
 Tue, 14 Oct 2025 18:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC1C4CEE7;
 Tue, 14 Oct 2025 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760465432;
 bh=BSoSmYgtZ9AesO3u1tMwafkyE42czTGEgpGza7+Fu6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKKRJ/OUsXrUymQ+jPoIkuuywzRbnANEGOkO+8SUH2NBHJhdK3DIWqvEJh7B/xlYh
 c9dbXKOmi07TLXV1prDdV+tJYlBPwcpnpsnNDmd6PRakAOQepQGh8gMqOdeFr6U9UJ
 jGEjNCeEHQRWHynn2za/1jqV3NS5yVqNDnJdSqpqzRKKh2s/Yrk5EkV2NBy2rHPAbB
 3JYHSvpHYnYSOqEP6s3ztEWE5wGCTuSUlOiXjHwn+xZCCvBQ81SZEBMGZ9e26vNUKW
 C+dEmmRQ3OF95jC25AhTpbO0J1c8/E+YmAkqkZSN+fyUVV5iIaIevxdSYh+hYZRgm9
 8pvR8xuTKQXzw==
Date: Tue, 14 Oct 2025 19:10:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251014-affection-voltage-8b1764273a06@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251014140451.1009969-10-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 09/10] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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
Content-Type: multipart/mixed; boundary="===============6220209325116038903=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6220209325116038903==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WUAPWDm9VxqWJrOr"
Content-Disposition: inline


--WUAPWDm9VxqWJrOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 04:04:50PM +0200, Antonio Borneo wrote:
> Document the support of the I/O synchronization parameters:
> - skew-delay-input;
> - skew-delay-output;
> - st,io-sync.
>=20
> Forbid 'skew-delay-input' and 'skew-delay-output' to be both
> present on the same pin.
> Allow the new properties only with compatibles that support them.
> Add an example that uses the new properties.
>=20
> Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 2df141ed7222d..0010762127c05 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -220,12 +220,89 @@ patternProperties:
>              minimum: 0
>              maximum: 3
> =20
> +          skew-delay-input:
> +            description: |
> +              IO synchronization skew rate applied to the input path
> +              0: No delay
> +              1: Delay 0.30 ns
> +              2: Delay 0.50 ns
> +              3: Delay 0.75 ns
> +              4: Delay 1.00 ns
> +              5: Delay 1.25 ns
> +              6: Delay 1.50 ns
> +              7: Delay 1.75 ns
> +              8: Delay 2.00 ns
> +              9: Delay 2.25 ns
> +              10: Delay 2.50 ns
> +              11: Delay 2.75 ns
> +              12: Delay 3.00 ns
> +              13: Delay 3.25 ns
> +            minimum: 0
> +            maximum: 13
> +
> +          skew-delay-output:
> +            description: |
> +              IO synchronization latch delay applied to the output path
> +              0: No delay
> +              1: Delay 0.30 ns
> +              2: Delay 0.50 ns
> +              3: Delay 0.75 ns
> +              4: Delay 1.00 ns
> +              5: Delay 1.25 ns
> +              6: Delay 1.50 ns
> +              7: Delay 1.75 ns
> +              8: Delay 2.00 ns
> +              9: Delay 2.25 ns
> +              10: Delay 2.50 ns
> +              11: Delay 2.75 ns
> +              12: Delay 3.00 ns
> +              13: Delay 3.25 ns
> +            minimum: 0
> +            maximum: 13

Same comments here as on the earlier patch. I would like to see times
used natively.
pw-bot: changes-requested

> +
> +          st,io-sync:
> +            description: |
> +              IO synchronization through re-sampling or inversion
> +              0: data or clock GPIO pass-through
> +              1: clock GPIO inverted
> +              2: data GPIO re-sampled on clock rising edge
> +              3: data GPIO re-sampled on clock falling edge
> +              4: data GPIO re-sampled on both clock edges
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3, 4]

I really don't like this kinds of properties that lead to "random"
numbers in devicetree. I'd much rather see a string list here.

> +
>          required:
>            - pinmux
> =20
> +        # Not allowed both skew-delay-input and skew-delay-output
> +        if:
> +          required:
> +            - skew-delay-input
> +        then:
> +          properties:
> +            skew-delay-output: false
> +
>  allOf:
>    - $ref: pinctrl.yaml#
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - st,stm32mp257-pinctrl
> +                - st,stm32mp257-z-pinctrl
> +    then:
> +      patternProperties:
> +        '-[0-9]*$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                skew-delay-input: false
> +                skew-delay-output: false
> +                st,io-sync: false
> +
>  required:
>    - compatible
>    - '#address-cells'
> @@ -306,4 +383,25 @@ examples:
>                  pinctrl-names =3D "default";
>      };
> =20
> +  - |
> +    #include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +    //Example 4 skew-delay and st,io-sync
> +      pinctrl: pinctrl@44240000 {
> +              compatible =3D "st,stm32mp257-pinctrl";
> +              #address-cells =3D <1>;
> +              #size-cells =3D <1>;
> +              ranges =3D <0 0x44240000 0xa0400>;
> +
> +              eth3_rgmii_pins_a: eth3-rgmii-0 {
> +                      pins1 {
> +                              pinmux =3D <STM32_PINMUX('A', 6, AF14)>;
> +                              st,io-sync =3D <4>;
> +                      };
> +                      pins2 {
> +                              pinmux =3D <STM32_PINMUX('H', 2, AF14)>;
> +                              skew-delay-output =3D <2>;
> +                      };
> +              };
> +      };
> +
>  ...
> --=20
> 2.34.1
>=20

--WUAPWDm9VxqWJrOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6SEwAKCRB4tDGHoIJi
0jCsAPwLkMNVF458mbc2zWVRT6LxatpnJfRRuZJlEdA05pbWEAEAz4z8RejXvyPP
ECXLoXPiLCdURtPzFPKuEqQ4nRt+HQw=
=CNDr
-----END PGP SIGNATURE-----

--WUAPWDm9VxqWJrOr--

--===============6220209325116038903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6220209325116038903==--
