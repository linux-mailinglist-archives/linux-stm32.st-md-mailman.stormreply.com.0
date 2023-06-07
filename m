Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B646272674F
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 19:30:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48544C6A5E7;
	Wed,  7 Jun 2023 17:30:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 388F2C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 17:30:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0784463A0C;
 Wed,  7 Jun 2023 17:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34026C433D2;
 Wed,  7 Jun 2023 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686158998;
 bh=qUqourH5uc4ji7oEk2SQQPg4PPUxxGGcwLfKI9xx2pU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYi8gEC8jaQFLmTpx+SOQZoh/p41OWLw3bc8+P4uA145tlTL3DM2W9OolFWIgfZJH
 bwxz0vTvSG5opKrhIr8G/N7ww68bchAkhmrr9RuAy28/Z0xBUDu92NrIcT4Yiubdkh
 TIIeN5vXeJV9+RaKSuuk6DK12U2gOD6MjTwt7t4O0Vz5TmpkUMg76J/6VD8YrPril5
 WpcPsOiOGkpDdgf0V3qzrUUqCsOZe5iCGKL/4UL+1yxdstGDj0PEOzByMSGUEXJrwP
 r/eaeUtwBNeSvq9KJ+s6HGrLEO1P3oTHwJFxQqV0ZXO/fjUEb9872X3s/S5SdO0Wjy
 a+GOtZ15PKs3A==
Date: Wed, 7 Jun 2023 18:29:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>
Message-ID: <20230607-nineteen-juggle-ce240df8815e@spud>
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
 <20230607115508.2964574-7-l.goehrs@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230607115508.2964574-7-l.goehrs@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 7/8] dt-bindings: arm: stm32: Add
 compatible string for Linux Automation LXA TAC
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
Content-Type: multipart/mixed; boundary="===============4721120612550578644=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4721120612550578644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vXO1s5rpo0+jzojb"
Content-Disposition: inline


--vXO1s5rpo0+jzojb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 01:55:06PM +0200, Leonard G=F6hrs wrote:
> Add DT compatible string for Linux Automation GmbH Test Automation
> Controllers (LXA TAC).
> LXA TACs are a development tool for embedded devices with a focus on
> embedded Linux devices.
>=20
> As of now there are two STM32MP157 based hardware generations (Gen 1 and
> Gen 2) that have most of their hardware config in common.
> In the future there will also be a STM32MP153 based hardware generation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Leonard G=F6hrs <l.goehrs@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Doc=
umentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 13e34241145b4..11f8706101eca 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -143,7 +143,9 @@ properties:
>        - description: Octavo OSD32MP15x System-in-Package based boards
>          items:
>            - enum:
> -              - lxa,stm32mp157c-mc1 # Linux Automation MC-1
> +              - lxa,stm32mp157c-mc1      # Linux Automation MC-1
> +              - lxa,stm32mp157c-tac-gen1 # Linux Automation TAC (Generat=
ion 1)
> +              - lxa,stm32mp157c-tac-gen2 # Linux Automation TAC (Generat=
ion 2)
>            - const: oct,stm32mp15xx-osd32
>            - enum:
>                - st,stm32mp157
> --=20
> 2.39.2
>=20

--vXO1s5rpo0+jzojb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIC+kQAKCRB4tDGHoIJi
0lf0AP48pRw+p/nwEiqZAGvkiPn8nlVnQ17FS8JChPdQ9Yc/BQEAzSCZjdBpjF5u
s6ODLBfJNtdez0O+nzjJv/e5ktym3A4=
=c8oD
-----END PGP SIGNATURE-----

--vXO1s5rpo0+jzojb--

--===============4721120612550578644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4721120612550578644==--
