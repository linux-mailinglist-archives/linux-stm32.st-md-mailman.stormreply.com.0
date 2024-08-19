Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4009571A2
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 19:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AB67C6DD72;
	Mon, 19 Aug 2024 17:10:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EB57C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 17:10:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C0AD60684;
 Mon, 19 Aug 2024 17:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361CAC32782;
 Mon, 19 Aug 2024 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724087417;
 bh=tvkLKPfhnq+Dnv1tlgVWFGm3TpmRLkA2ElQqNmnlHro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IB/N4JBK7fXxX7UhoH3nnoB+wlcfSuRKms8mE8imDwiTdH5XLhetGXekNGlyxDWCf
 StZ6nuHMO6vK6auDgSUirJd4MDk0qMSe1Wsq+hS7yTXi3/rZbMeDWVyjEcA3RYXuGK
 oZm5LAA958WoDAHW5e4LN1aTBRNsOuiFNH2QSKnKfhMjt00mAGQArW++4IUgu/dMpS
 ZdvNX+pP+k87820wCkq5pBh+rPm9IDSKduWXwlwgdAvhdwDIgGw+Xk/m4ghnPSzGRh
 02i3/jbryMj1Xj1QXqXjZ3el+bfbU1DzlBYdGzLT5Iugdk1mOQ6fjEMVloGfqZFvbr
 M5tgV5fJohOuA==
Date: Mon, 19 Aug 2024 18:10:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240819-skipping-chip-55b0e252434c@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH 2/5] dt-bindings: clock: cirrus,
 lochnagar: add top-level constraints
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
Content-Type: multipart/mixed; boundary="===============3946267383642967524=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3946267383642967524==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l+jfm2awHlfu3Eit"
Content-Disposition: inline


--l+jfm2awHlfu3Eit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:11PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.  Drop also redundant assigned-clocks properties, because
> core dtschema allows them if clocks are provided.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/clock/cirrus,lochnagar.yaml         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yam=
l b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
> index 59de125647ec..ccff74eda9fb 100644
> --- a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
> @@ -67,9 +67,9 @@ properties:
>      minItems: 1
>      maxItems: 19
> =20
> -  clocks: true
> -  assigned-clocks: true
> -  assigned-clock-parents: true
> +  clocks:
> +    minItems: 1
> +    maxItems: 19
> =20
>  additionalProperties: false
> =20
> --=20
> 2.43.0
>=20

--l+jfm2awHlfu3Eit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8cwAKCRB4tDGHoIJi
0jnTAQCPbV4r9ep02lDb2S1N3Anztw9Q8g+dehpk36H3+f3iXwD+M3LSx5qb+UCB
gOhNqjjY3N0OMTXDxDo76CN0GeoJwg0=
=KkuM
-----END PGP SIGNATURE-----

--l+jfm2awHlfu3Eit--

--===============3946267383642967524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3946267383642967524==--
