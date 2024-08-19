Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04D957198
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 19:09:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F6E4C6DD72;
	Mon, 19 Aug 2024 17:09:39 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F618C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 17:09:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D01ACE0AD0;
 Mon, 19 Aug 2024 17:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961A4C32782;
 Mon, 19 Aug 2024 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724087374;
 bh=oARwwlUGy47zMdBNGONRSrSMzd7r+lf6SHLoiVjpEJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8tBrYGYakBo+U0t83osHpxSrmFXE5mmLVvLsdo8VCQjhSdzsVMlsd6UYxj/M4knD
 9sngdrRadvBzj64sOEqEcmJOHX8uSj7Kvt6vFR9XMpiIrou7Q+lBEaYib5OsQPKNaw
 VGRlFa0jYm1oJ6WH2px+0CAu8CsPZO6x5RhQCc3rBXhg55Na6wYYmX2uhJIC3sBW/t
 A0ZYjAsEHiDTqxZ+hl27zAfCbS1wdndeH+AcTahqHG8tLFDe1uXn2fvRj6kcmi1YTR
 4fZfEuCon7edSvXp1VrKWX9s+Sk47I5Y9BOwxlFAECzWykwbnjgMOe7yFs0fl1d9/N
 LmjROnL0a7+hg==
Date: Mon, 19 Aug 2024 18:09:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240819-collector-sketch-4c3ab4c1d1ab@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240818173014.122073-4-krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 4/5] dt-bindings: clock: rockchip,
 rk3588-cru: drop unneeded assigned-clocks
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
Content-Type: multipart/mixed; boundary="===============5158609443710732586=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5158609443710732586==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/mrW46uSLR2cSfa2"
Content-Disposition: inline


--/mrW46uSLR2cSfa2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:13PM +0200, Krzysztof Kozlowski wrote:
> assigned-clocks property is redundant, because core dtschema allows them
> if clocks are provided.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> index 74cd3f3f229a..4ff175c4992b 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> @@ -42,10 +42,6 @@ properties:
>        - const: xin24m
>        - const: xin32k
> =20
> -  assigned-clocks: true
> -
> -  assigned-clock-rates: true
> -
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: >
> --=20
> 2.43.0
>=20

--/mrW46uSLR2cSfa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8RwAKCRB4tDGHoIJi
0m3bAP9xPiuQp4KWRWFA1tEdvt5BlUb6PlruxmLJlIG9YqOgCgEAhT+aTF9E4YZF
39FaPSji+VLZRr3eSEA4KAMUTEx++wA=
=uDkF
-----END PGP SIGNATURE-----

--/mrW46uSLR2cSfa2--

--===============5158609443710732586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5158609443710732586==--
