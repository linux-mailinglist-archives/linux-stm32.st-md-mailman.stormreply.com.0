Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16459910B1F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 18:06:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C48F5C7128D;
	Thu, 20 Jun 2024 16:06:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EF73C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 16:06:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9E7B3CE2646;
 Thu, 20 Jun 2024 16:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40576C2BD10;
 Thu, 20 Jun 2024 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718899577;
 bh=i2WiRp5EABtITG9AK2TqTOt26g3jSkXUUxnTNfCVMq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKmk0EwTNoxOWGlH2v07DF2unWqqSgPHL2w7MXJlzVc9I7chXRxKjQe/L2NGXZupG
 UNj4Vdtd58q5X7sr7M7bQwWpAATyud7JONka7ePDgfbmS4QS6aHv/1H6Jea/GI0wsr
 cS0oovA/BCovyaDtviZt7P0g0xC7oi/OBJURoHgtNJ41/tMbhmix7alKH5eaGDTlHU
 UwqsvgNkb/rDdwiBSIajxDLFHk4/sZT9zybz22d88QbqxxQuLNaoA+GhVKq8RnSMhr
 mC/1CYGO5Jsc3hEeYRYiCS6eTAAxYwlu4yaXaLbn7VzvQAhu5uu1p1Ksh0gjdKr41x
 MFzAKhEG/iZlA==
Date: Thu, 20 Jun 2024 17:06:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240620-reggae-caucasian-11dcb3244161@spud>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
 <20240620-dt-bindings-i2c-clean-v1-2-3a1016a95f9d@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-2-3a1016a95f9d@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh R <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Guenter Roeck <groeck@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sergiu Moga <sergiu.moga@microchip.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Doug Anderson <dianders@chromium.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/7] dt-bindings: i2c: google,
 cros-ec-i2c-tunnel: correct path to i2c-controller schema
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
Content-Type: multipart/mixed; boundary="===============2448808713945464859=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2448808713945464859==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K6ixJu9bGXFv18P9"
Content-Disposition: inline


--K6ixJu9bGXFv18P9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 01:34:50PM +0200, Krzysztof Kozlowski wrote:
> The referenced i2c-controller.yaml schema is provided by dtschema
> package (outside of Linux kernel), so use full path to reference it.
>=20
> Cc: <stable@vger.kernel.org>

I'd question whether this needs to go to stable (given the validation
seems to work anyway) but it'll get picked up automagically so why
not...

> Fixes: 1acd4577a66f ("dt-bindings: i2c: convert i2c-cros-ec-tunnel to jso=
n-schema")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml | 2=
 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tun=
nel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.=
yaml
> index ab151c9db219..580003cdfff5 100644
> --- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> +++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> @@ -21,7 +21,7 @@ description: |
>    google,cros-ec-spi or google,cros-ec-i2c.
> =20
>  allOf:
> -  - $ref: i2c-controller.yaml#
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> =20
>  properties:
>    compatible:
>=20
> --=20
> 2.43.0
>=20

--K6ixJu9bGXFv18P9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRTcAAKCRB4tDGHoIJi
0kXLAQCZRJ/FW5eVYlFgLQVwdTw60zRLbB5U2phtfe/39Y26eQD/aIyvkdWib7L7
pxarPTgkzcG7Mkqn187N9Xy+9dcxJgc=
=MMCH
-----END PGP SIGNATURE-----

--K6ixJu9bGXFv18P9--

--===============2448808713945464859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2448808713945464859==--
