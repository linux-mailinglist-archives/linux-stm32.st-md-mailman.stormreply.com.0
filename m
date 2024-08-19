Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4AE9571BD
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 19:13:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77822C6DD72;
	Mon, 19 Aug 2024 17:13:36 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF540C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 17:13:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34C86CE0B01;
 Mon, 19 Aug 2024 17:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EE3C4AF0E;
 Mon, 19 Aug 2024 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724087607;
 bh=rdULt6pgnvPdbgLF9J0oo7ynjstIM78aVEn7qoTMvlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGHhgwcM5zdbEbDwWVOPRrGY+xiK7S9IECv7bn41EQee+3AciVq4D4+usNFP7lZU8
 d+dQ9UkCqNzKGLOLquIMhQeveDC7s9ZD0j7TThhbVP7IZcB376EJBTBitm02Qfz3iB
 hJc+ahNk7ZDm8svys76EeRB2fHeF+bY0KjwxLHrx2XikIIOFKofmFLTrG49CIx8L6G
 NLsVYskRSsgArVMOWiFILC7f/69wrk7Z54VibC6Fy7CUUQXecgXBBzYmOGVYysQo6Z
 xqAA1oG5/jfnOxLb1V3JctQ39GWo9CaEvZ4mwxvBurm9HX8KFXS65NrtlsBlas7I4f
 qhvVYjg1Tyf4A==
Date: Mon, 19 Aug 2024 18:13:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240819-outflank-variety-3fcb7ca0338a@spud>
References: <20240818172951.121983-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240818172951.121983-1-krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: st,
	stm32-adc: add top-level constraints
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
Content-Type: multipart/mixed; boundary="===============2854004656861982628=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2854004656861982628==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y0beHK2OB/Ya0e9O"
Content-Disposition: inline


--Y0beHK2OB/Ya0e9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:29:51PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml =
b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index ec34c48d4878..ef9dcc365eab 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -54,7 +54,9 @@ properties:
>            It's not present on stm32f4.
>            It's required on stm32h7 and stm32mp1.
> =20
> -  clock-names: true
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> =20
>    st,max-clk-rate-hz:
>      description:
> --=20
> 2.43.0
>=20

--Y0beHK2OB/Ya0e9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN9MgAKCRB4tDGHoIJi
0lWSAP4r3VaV8vxUGxyk/Gd68syU0Qbdc0hMEQWz/zPKArLpjgEAkmLmOnGOUeXx
T1faMHwgTOz4iMURjAUYjB9JJX301wI=
=/tpI
-----END PGP SIGNATURE-----

--Y0beHK2OB/Ya0e9O--

--===============2854004656861982628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2854004656861982628==--
