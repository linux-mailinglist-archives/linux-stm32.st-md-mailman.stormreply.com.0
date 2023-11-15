Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF17ED654
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 22:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5258CC6C837;
	Wed, 15 Nov 2023 21:54:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AB7CC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 21:54:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFFE36181E;
 Wed, 15 Nov 2023 21:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CAFC433C8;
 Wed, 15 Nov 2023 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700085284;
 bh=3cBd6zL0s3h4kc7XKXxRxiqowOHUr5irsv4JVBuw1nY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oOphkJaT+WdFxmy0sEobuHa8sWkWajxR3hcgekEZ5VqhwSUInN3NLHh3WnpEgVZgQ
 bmmfqnZgKipYPucr9Ol3YgXaxNeMVMUZ0QpioCjMj7QIJSHugSGiWuEunA3raGD0HR
 UD21lbtWuZYjc+pDmH2dUO+k8gLFbPUZS7QjQYWbk2JYmYXN/rSA1QYxYvRXBMgej1
 urP9+TzGCDldfsE725L8hrTlO6FznJMs4c74MfJ/zRnnTeuOQPFQ21fsjc7+dJGLIB
 nuRxf2ulQz8/WymkTw9UAzttlgTp3PmqyRvAZu7foJRasQuw/bnLMCnPKoYdORuVxr
 ODZJcG1dLc5ug==
Date: Wed, 15 Nov 2023 21:54:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <20231115-hertz-buffoon-aeb2c8d9e7ee@squawk>
References: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
	Document RZ/Five SoC
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
Content-Type: multipart/mixed; boundary="===============5088042564218994754=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5088042564218994754==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C2xlhivywdgGtokx"
Content-Disposition: inline


--C2xlhivywdgGtokx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 09:29:08PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The OSTM block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,r9a07g043-ostm" compatible string will be used on the RZ/Fi=
ve
> SoC so to make this clear and to keep this file consistent, update the
> comment to include RZ/Five SoC.
>=20
> No driver changes are required as generic compatible string "renesas,ostm"
> will be used as a fallback on RZ/Five SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor,

> ---
>  Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/=
Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> index 7207929e5cd6..8b06a681764e 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -23,7 +23,7 @@ properties:
>        - enum:
>            - renesas,r7s72100-ostm  # RZ/A1H
>            - renesas,r7s9210-ostm   # RZ/A2M
> -          - renesas,r9a07g043-ostm # RZ/G2UL
> +          - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
>        - const: renesas,ostm        # Generic
> --=20
> 2.34.1
>=20

--C2xlhivywdgGtokx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVU+HAAKCRB4tDGHoIJi
0pq/AP4o7Kn1vZAS5Npud5TKjsoeBea2Y+96WybgzEbbT6yq/QD/Y54HBIxOvFDl
nup41Y2l91Jks1pCXbP1AfdRkAvqJw0=
=CfMI
-----END PGP SIGNATURE-----

--C2xlhivywdgGtokx--

--===============5088042564218994754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5088042564218994754==--
