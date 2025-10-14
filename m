Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19137BDAE2D
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 20:05:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78A2FC56608;
	Tue, 14 Oct 2025 18:04:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 936BEC56607
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 18:04:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D2294429E;
 Tue, 14 Oct 2025 18:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06192C4CEE7;
 Tue, 14 Oct 2025 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760465097;
 bh=XkTcoOEhikNfdYenQLoMD9cYANodz0P4ptRHT0QHziE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/lNTyQTzb3SyPdkaaWt6zYajhsIj9ue5ZW3m4AoH1QSaO1cyKOV/F+vFemY/qQuL
 p9jqcYtb7P2yBuPbsh8H3fYdPegq73HDq+kg+cDAxtMiHtrMaCkbTjmRiHYKGut1YB
 c1z/aSN0KLwwYDrfjKAoJeBWXjxTUN0MQ/KnXTIUZfwRCLfdPABADNZYQ2EWhYP7Dg
 GABee502iJOBShuJ1xHVMit13DhyyiOb0+hk3Rh7w8Mc/1hZCAMrKHE9LvJQS3zoRb
 qJXQFGcKsG9ySjQNX65Nc/KYtujILQbuCWnasJSciwib8fRTxLcAlKk05FtphzQYyo
 Kj/US40GGssFg==
Date: Tue, 14 Oct 2025 19:04:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251014-barbecue-crewman-717fe614daa6@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251014140451.1009969-3-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: pincfg-node: Add
 properties 'skew-delay-{in, out}put'
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
Content-Type: multipart/mixed; boundary="===============1433299844800362803=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1433299844800362803==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="797F+UieUNy4iCeD"
Content-Disposition: inline


--797F+UieUNy4iCeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 04:04:43PM +0200, Antonio Borneo wrote:
> Add the properties 'skew-delay-input' and 'skew-delay-output' to
> specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/pincfg-node.yaml         | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index cbfcf215e571d..c3deb103d816b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -153,4 +153,26 @@ properties:
>        pin. Typically indicates how many double-inverters are
>        used to delay the signal.
> =20
> +  skew-delay-input:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      this affects the expected clock skew on input pins.
> +      Typically indicates how many double-inverters are used to
> +      delay the signal.

This property seems to be temporal, I would expect to see a unit of time
mentioned here, otherwise it'll totally inconsistent in use between
devices, and also a standard unit suffix in the property name.
pw-bot: changes-requested

> +
> +  skew-delay-output:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      this affects the expected delay before latching a value to an
> +      output pins. Typically indicates how many double-inverters are
> +      used to delay the signal.
> +
> +if:
> +  required:
> +    - skew-delay
> +then:
> +  properties:
> +    skew-delay-input: false
> +    skew-delay-output: false
> +
>  additionalProperties: true
> --=20
> 2.34.1
>=20

--797F+UieUNy4iCeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6QwwAKCRB4tDGHoIJi
0vcqAP9GGuk9psTaHkfPXjaUQtfxqAsXqRhqDaXExHqvhEHf5QD9FGn7+lMqWTn3
gkgqoVZu1cClK8lWAtm67p7nBAiJ1gs=
=upTw
-----END PGP SIGNATURE-----

--797F+UieUNy4iCeD--

--===============1433299844800362803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1433299844800362803==--
