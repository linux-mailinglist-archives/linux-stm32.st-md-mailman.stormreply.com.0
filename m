Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA69D7E0328
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Nov 2023 13:51:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41C5EC6B44D;
	Fri,  3 Nov 2023 12:51:00 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EDF6C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Nov 2023 12:50:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F0C80B81F1D;
 Fri,  3 Nov 2023 12:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635ADC433C8;
 Fri,  3 Nov 2023 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699015858;
 bh=tpVeCHb6HdnxG19HyK4tr17TCWu8QGpwvVyw91n0C3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dU+t/8GP5PWYnJ3mF/RPJxShcO4CJguARUQx6z/D274XFk1AH0mwXfXZaKyEgi5rC
 qrcOu3uAtFjIoLBqWjVAEmrm+Zw5ReArNCVPDwkgK6s/ZllN1EgVoWrYnUPVpzVGNO
 0f037jv0cGrJANLx3qRS06HCxXy7qaL6BrJVLSlILENz+zP/QLkxcfhn9BQjIu9mbZ
 HEPyYwCbWeDH+kHR5Hz6kQe7Zuu8IC83FNCeI+TRcMKaOzPe5Xoan/ol/Q5o5Hyd2G
 Wv5y5lPcovvDC6SXyfT2JFiEZI4IHsGKVpFKeNG+P1FXEMO1fe9KhTmHPx/ftZlmxt
 fGXqi4BNH13CQ==
Date: Fri, 3 Nov 2023 12:50:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20231103-recognize-unwashed-b8f1a83fe851@spud>
References: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
 <20231102193722.3042245-4-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
In-Reply-To: <20231102193722.3042245-4-ben.wolsieffer@hefring.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: spi: add stm32f7-spi
	compatible
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
Content-Type: multipart/mixed; boundary="===============1487367986175748492=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1487367986175748492==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xFgagCuWH1g6GYrR"
Content-Disposition: inline


--xFgagCuWH1g6GYrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 03:37:20PM -0400, Ben Wolsieffer wrote:
> The STM32F7 SPI peripheral is nearly identical to the STM32F4, with the
> only significant differences being support for a wider range of word
> sizes and the addition of 32-bit transmit and receive FIFOs.

A wider range of supported word sizes and some additional buffers,
implies that the F4 could be used as a fallback compatible. Does the
register map change incompatibly in the process of widening the FIFOs or
something like that?

Cheers,
Conor.

>=20
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Do=
cumentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index ae0f082bd377..5754d603f34f 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -23,6 +23,7 @@ properties:
>    compatible:
>      enum:
>        - st,stm32f4-spi
> +      - st,stm32f7-spi
>        - st,stm32h7-spi
> =20
>    reg:
> --=20
> 2.42.0
>=20

--xFgagCuWH1g6GYrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUTsrQAKCRB4tDGHoIJi
0hFgAQDn41RZMbwCjYlwJX5Iqbm4K/r3lki7VmpwDMCGGJwkkQD/Xgytkq5TEODG
DyLPUNhil6uYE+5x8ylXmqmrv8T72gU=
=liLb
-----END PGP SIGNATURE-----

--xFgagCuWH1g6GYrR--

--===============1487367986175748492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1487367986175748492==--
