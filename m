Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5BC0309D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 20:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07EABC5EC67;
	Thu, 23 Oct 2025 18:42:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6095CC5EC62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 18:42:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 24A05601B3;
 Thu, 23 Oct 2025 18:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92E7C4CEE7;
 Thu, 23 Oct 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761244943;
 bh=7cg1XT3E5PgSjEeikeZ9kqIVrBH3X8dSeokFRv7rNPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZlEhJnahRlAztC+puvhNXPiKdE2U1thO894TnL/x3rf2GRYv8es3HLzcXaT/T8T/Q
 LXKexrtFE8vvdJW+VtDlR7HcrG+5wIJPi/t1z6Xyi7Y35lzCnXM/MJMGgdOKHxSqFH
 A/Kv+OLOenPYYFhx9dRrrEVmBbqqmP3i0TNJZLmSj/SMj7SMeXUoHrLdyB2PM9hadp
 rrXKAC8Ln68DcI1Gf0gjjOF7g4Mxsmf+yOY7/BnMZx+iQ+xbrIB2zp7jYWHhChk/gt
 NGxYQt8IvsITdpgWeVmYdHQp0BnhpKxcvKYnVEJ6nGg5zJ/yPRJOlu99ZphVd9h12k
 OcQQuMSbDdYVA==
Date: Thu, 23 Oct 2025 19:42:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251023-twice-brisket-fb7a3f439a13@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-11-antonio.borneo@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251023132700.1199871-11-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 10/12] dt-bindings: pinctrl: stm32: Use
 properties from pincfg-node.yaml
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
Content-Type: multipart/mixed; boundary="===============2473463815644134011=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2473463815644134011==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bU1dAtIe/+VxJvoH"
Content-Disposition: inline


--bU1dAtIe/+VxJvoH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 03:26:58PM +0200, Antonio Borneo wrote:
> Don't re-declare the standard pincfg properties; take them from
> the default schema.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

I acked this one in v3:
https://lore.kernel.org/all/20251014-privatize-unnerving-bb26a0626276@spud/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 27 ++++++++-----------
>  1 file changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 961161c2ab62b..27c0dd7a8df01 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -151,6 +151,8 @@ patternProperties:
>            pinctrl group available on the machine. Each subnode will list=
 the
>            pins it needs, and how they should be configured, with regard =
to muxer
>            configuration, pullups, drive, output high/low and output spee=
d.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
>          properties:
>            pinmux:
>              $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -195,26 +197,19 @@ patternProperties:
>                            pinmux =3D <STM32_PINMUX('A', 9, RSVD)>;
>                 };
> =20
> -          bias-disable:
> -            type: boolean
> +          bias-disable: true
> =20
> -          bias-pull-down:
> -            type: boolean
> +          bias-pull-down: true
> =20
> -          bias-pull-up:
> -            type: boolean
> +          bias-pull-up: true
> =20
> -          drive-push-pull:
> -            type: boolean
> +          drive-push-pull: true
> =20
> -          drive-open-drain:
> -            type: boolean
> +          drive-open-drain: true
> =20
> -          output-low:
> -            type: boolean
> +          output-low: true
> =20
> -          output-high:
> -            type: boolean
> +          output-high: true
> =20
>            slew-rate:
>              description: |
> @@ -222,8 +217,8 @@ patternProperties:
>                1: Medium speed
>                2: Fast speed
>                3: High speed
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -            enum: [0, 1, 2, 3]
> +            minimum: 0
> +            maximum: 3
> =20
>          required:
>            - pinmux
> --=20
> 2.34.1
>=20

--bU1dAtIe/+VxJvoH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp3CgAKCRB4tDGHoIJi
0tg3AQD8bWKk/YfN5ZMpkKgIGbTc19jQ0QsVxpdvLl3aEu+5XgEAs6z0D7RrT691
W6QkYi0onTlPEu0LmNwdPXMp2aDCAQM=
=954d
-----END PGP SIGNATURE-----

--bU1dAtIe/+VxJvoH--

--===============2473463815644134011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2473463815644134011==--
