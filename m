Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323C7A5D6C
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 11:08:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20C58C6C821;
	Tue, 19 Sep 2023 09:08:36 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCEF6C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 09:08:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 562E1B8111A;
 Tue, 19 Sep 2023 09:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21AB4C433C8;
 Tue, 19 Sep 2023 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695114513;
 bh=OQZef8z+kIgFiCbCVHJQY0MMB8Z8QFuCUTXdKb6EscM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SL1NMV3vZsxrHBHLSVYwxJtpXlWaoQdoui7krjpv3vNzI9QEyJG4pAmPMdoHnex2B
 t1rk/9v7YODfNvs8fG/FBfTuWdj8PVR3P7odwfKIyVH/zvo8gN+diPi6QEEK8g1iMO
 GbA3GPg7h1YiiJYB8hxenrEZU3fwP1Cf2t4nu5HGrpjrJMbe0b53ht7pINf3RJuI6K
 Mc7xtG69hbaeVhO5ZSyPBvvt8QprnA38elBqJ6sOy5FO5uqyQr087czP+yyBCzXrGC
 V8cXZQ0dMJGXaq/VX5Pk5E4vk8fHUAEh/qWxfpVD3stY7NDc0yiibDGm5bFKmvqfRA
 XvNWW9PY40QZg==
Date: Tue, 19 Sep 2023 10:08:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Message-ID: <20230919-98b276afdbc85d62815da0b9@fedora>
References: <20230919083553.35981-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230919083553.35981-1-eagle.alexander923@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: stm32: document
 MYD-YA151C-T development board
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
Content-Type: multipart/mixed; boundary="===============6884398437018425685=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6884398437018425685==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nWA3m4scrPtkTyCU"
Content-Disposition: inline


--nWA3m4scrPtkTyCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 11:35:52AM +0300, Alexander Shiyan wrote:
> Add new entry for MYD-YA151C-T development board.
>=20
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Doc=
umentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 4bf28e717a56..5252b9108ddc 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -140,6 +140,11 @@ properties:
>            - const: engicam,microgea-stm32mp1
>            - const: st,stm32mp157
> =20
> +      - description: MyirTech MYD-YA15XC-T SoM based Boards
> +        items:
> +          - const: myir,myd-ya151c-t   # MYIR MYD-YA151C-T STM32MP151C
> +          - const: st,stm32mp151

It appears that this file is sorted by soc part number, which would put
this entry now in the wrong location.
With that changed,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +
>        - description: Octavo OSD32MP15x System-in-Package based boards
>          items:
>            - enum:
> --=20
> 2.39.1
>=20

--nWA3m4scrPtkTyCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQllCAAKCRB4tDGHoIJi
0lKfAP4mCqN9Rg3GdJJO6EcWaj0UJipSMm6zPywqG4RSRGA03wD/Xe7TPPf1heeq
yYRzHGy1IdpHmtwwIlwfTGRSvXYROQk=
=Oi1g
-----END PGP SIGNATURE-----

--nWA3m4scrPtkTyCU--

--===============6884398437018425685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6884398437018425685==--
