Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DAB7FD931
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Nov 2023 15:23:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9ECC6B475;
	Wed, 29 Nov 2023 14:23:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA14C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Nov 2023 14:23:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF7EA61BBB;
 Wed, 29 Nov 2023 14:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4E8C433C8;
 Wed, 29 Nov 2023 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701267817;
 bh=uEINnHilNNToAZ1GUBzJz7tVwPdn3y3/jPZhz8a3h3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L80lP7/DmFjx490yhyox7mwpHFUwjNzTYtOjS2so9TvD4ri5AnHVF3lE0FbCWeVpX
 riTz70eyypHC9pvz2VTcNGuSaKjNgAqPV7b3nhobMqbe0tc860r0tI2NrIyRUgjnO9
 DRK5oFj7Dd+jtzQMWsgBgs43xVCPA9l0odYE6PX2f7Wb5hkQcIzM3S7kpImE/bopUX
 QojwpElox1iuTbWfjDCPqion/nebzRC1EJX3PkPK1Z9M0Pz7gAHMbHNfiqvMB8vPHx
 8e6Lflr9nevBFjB3KuP7Pd9w+VzqAjCBvfOIaRJTMliS3wJpDx5136pJRNTHh7CUxF
 W2+7eVJkjqL8w==
Date: Wed, 29 Nov 2023 14:23:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231129-haste-emperor-3a8ba335b267@spud>
References: <20231129125920.1702497-1-alain.volmat@foss.st.com>
 <20231129125920.1702497-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231129125920.1702497-4-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: i2c: document st,
 stm32mp25-i2c compatible
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
Content-Type: multipart/mixed; boundary="===============9002906164105992961=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9002906164105992961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zQpTz0PrtyWzX5co"
Content-Disposition: inline


--zQpTz0PrtyWzX5co
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 01:59:12PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 49 +++++++++++++++----
>  1 file changed, 39 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Do=
cumentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index 94b75d9f66cd..6a69bb6de23e 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -19,6 +19,7 @@ allOf:
>                - st,stm32f7-i2c
>                - st,stm32mp13-i2c
>                - st,stm32mp15-i2c
> +              - st,stm32mp25-i2c
>      then:
>        properties:
>          i2c-scl-rising-time-ns:
> @@ -41,6 +42,43 @@ allOf:
>          clock-frequency:
>            enum: [100000, 400000]
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32f4-i2c
> +              - st,stm32f7-i2c
> +              - st,stm32mp13-i2c
> +              - st,stm32mp15-i2c
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: interrupt ID for I2C event
> +            - description: interrupt ID for I2C error
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +            - const: error
> +

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp25-i2c
> +    then:

Should this not just be "else:"?

> +      properties:
> +        interrupts:
> +          items:
> +            - description: common interrupt for events and errors
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +

Cheers,
Conor.

--zQpTz0PrtyWzX5co
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdJYAAKCRB4tDGHoIJi
0g/dAQD+vb0YxP+0kOTPgO9Ix2HQBWIP8nOO1XqZgVw+O7daxQD9HemclzlDL37e
tMu44zbX0HySlWbw3cPX0YDONRIM3Q8=
=2fR5
-----END PGP SIGNATURE-----

--zQpTz0PrtyWzX5co--

--===============9002906164105992961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9002906164105992961==--
