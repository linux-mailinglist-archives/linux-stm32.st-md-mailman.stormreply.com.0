Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F80714F26
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 20:05:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA41C6A614;
	Mon, 29 May 2023 18:05:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C346C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 18:05:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE024616E7;
 Mon, 29 May 2023 18:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533C5C433D2;
 Mon, 29 May 2023 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685383552;
 bh=AZRdPQt1r/FGQvfF0fX+wuaBd3GnTe6Njx9eZY7jpB8=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=tp2VEC5vSXC0t5v9H5aNkz+JINl418Pu+gxnuexZPReHEPbcF5Bbrld8dCN7gF/oX
 bSAmkLbjxxrZEYlAXfts5hIgPPvc2SiMU8XuReW1/kgtJuynrdgV9/2/BJBikOyoCF
 WAhaMYt3VXlGxgvCFgRBuVAWsvtq1ycl3bQpXgSg5LE5NTSrYy7zoeFKrMCKNxGcen
 gohuS5UdR17D24k7jH/AhMtT95GnTKcDttegWMO8RFErMmGKXGpWx72PYwBnEc+eXU
 L2vvYl0PghdDidZHXmquZeBFKOdcXMA1KzX2Y7mwiUTV1ztm103acnhXW1uZuW9fly
 X5pTesP2+PAQw==
Date: Mon, 29 May 2023 19:05:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20230529-backlit-dealing-b099e4eb5210@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-5-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230529162034.20481-5-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/11] dt-bindings: stm32: add st,
 stm32mp25 compatibles to the stm32 family
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
Content-Type: multipart/mixed; boundary="===============7671502767638402000=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7671502767638402000==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g/aPNMyoKyHSJ2S4"
Content-Disposition: inline


--g/aPNMyoKyHSJ2S4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 06:20:27PM +0200, Alexandre Torgue wrote:
> STM32 family is extended by the addition of the STM32MP25 SoCs. It is com=
posed
> of 4 SoCs: STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>=20
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Doc=
umentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 4af5b8f4f803..7d7ca33d2e61 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -161,6 +161,15 @@ properties:
>            - const: phytec,phycore-stm32mp157c-som
>            - const: st,stm32mp157
> =20
> +      - items:
> +          - const: st,stm32mp251
> +      - items:
> +          - const: st,stm32mp253
> +      - items:
> +          - const: st,stm32mp255
> +      - items:
> +          - const: st,stm32mp257

I assume the slightly odd format is just to avoid churn when adding
the board compatibles.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +
>  additionalProperties: true
> =20
>  ...
> --=20
> 2.17.1
>=20

--g/aPNMyoKyHSJ2S4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTpegAKCRB4tDGHoIJi
0ubOAQDekXaYZ/amJx7D8FUr2DifW+kUXwNrdgGFzxAkuR459wD/ao13mBBk4zRX
4oklgSPdn0wVI3rlVxTNozxPyp3mmwY=
=BwAV
-----END PGP SIGNATURE-----

--g/aPNMyoKyHSJ2S4--

--===============7671502767638402000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7671502767638402000==--
