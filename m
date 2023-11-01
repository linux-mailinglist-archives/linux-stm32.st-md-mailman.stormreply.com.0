Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A57097DE3FA
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Nov 2023 16:46:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5270CC6B44C;
	Wed,  1 Nov 2023 15:46:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B39C0C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 15:46:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3E3DBCE1282;
 Wed,  1 Nov 2023 15:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92E9C433C9;
 Wed,  1 Nov 2023 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698853561;
 bh=zC6yCSHfmh/5iy8QMdqt6xIA4t9dtbOuSLusujn7SVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mWMB4AvihWsKGWwjurOuzwdRqzNULefFKmUiqmsaHTTL67JKrTUQ7psqTRz3s0YAw
 N5LxbqivEksNvydQh7iElu6/jHL85KAqv6oyXXRlnfdweREq9l2Pd0Lep/uvYJXh2Z
 i1pF2nxyVEKZZpovp2bRnwNm81PovjzNqHnw6waydYvqdNWGllgVe73h+j7uZqx2FT
 zBxVxB5PXfivEMGSQ4Z3+Q4keuSKBOg+JsytpYUPehktjdqW2NAoP2efNjerUVyVqS
 2SlzqkYJNvmdYZRFslAxEkhueliWOFpXZvvxFOgEyHWw8H6CmxJa2YTGcI7x+JAqA8
 X4XQT49Jiggrw==
Date: Wed, 1 Nov 2023 15:45:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20231101-pushup-kindle-c1021251807d@spud>
References: <20231101150811.2747455-1-ben.wolsieffer@hefring.com>
 <20231101150811.2747455-4-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
In-Reply-To: <20231101150811.2747455-4-ben.wolsieffer@hefring.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/5] dt-bindings: spi: add stm32f7-spi
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
Content-Type: multipart/mixed; boundary="===============8925058820713907753=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8925058820713907753==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o5NKLOVaCjgEnBEo"
Content-Disposition: inline


--o5NKLOVaCjgEnBEo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 11:08:08AM -0400, Ben Wolsieffer wrote:

Missing commit body. The information from the driver patch about the
differences between this and other versions of the IP would be suitable.

Cheers,
Conor.

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

--o5NKLOVaCjgEnBEo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUJytAAKCRB4tDGHoIJi
0jOqAP9VAhg5Emh5oBVcWb1OF1NyxbQvPULlwVSEjp+kb6vcaAD8DQHua20iE9dd
t4Ri/6/mMJ3luNjvNDy0TwpSjulGAwk=
=nL8h
-----END PGP SIGNATURE-----

--o5NKLOVaCjgEnBEo--

--===============8925058820713907753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8925058820713907753==--
