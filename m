Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A795719E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 19:10:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30DEEC6DD72;
	Mon, 19 Aug 2024 17:10:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6D29C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 17:10:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D5C46CE0B00;
 Mon, 19 Aug 2024 17:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A86CC32782;
 Mon, 19 Aug 2024 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724087398;
 bh=y0BPApxZk4aDhMX97Jwl8VXXrKnby22KdqpU7J1bQkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pa+h8DrxLeHfDGJrBQVitsYHqB/pyw1h/FU0HbRVRFVEk4hghLNNTBVKgDOWYPEuN
 2uVkgPVbgel/8HaR5+UTrszeOkYA79Ma3wUzx4flbhRf2KyLXMQoO5KFi7GmsV9wRg
 8DJve+xTwvD9HqTnl8lU7kMKalPzevXJ2XaUj68fOEdHNKCuQlElpz2LQunfj/Uy/j
 cFVyiuG29X10hY61G2aQGwfGVKih4ZNLyPQYyeXcuDGjLW5cGKArqIFAtCNpN0gSKF
 iM4BMKPTN1SIQRBwZ3VZGfbCaTcu4cU1/kfmr/rrJht7nlMj89/APVdA+cR3Ravw6p
 xP7SCYrgGG6TA==
Date: Mon, 19 Aug 2024 18:09:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240819-troubling-player-29e310e19708@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH 3/5] dt-bindings: clock: renesas,
 cpg-clocks: add top-level constraints
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
Content-Type: multipart/mixed; boundary="===============0202007092297754850=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0202007092297754850==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sVIeHr/i4zviJEQI"
Content-Disposition: inline


--sVIeHr/i4zviJEQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:12PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-output-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--sVIeHr/i4zviJEQI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8YAAKCRB4tDGHoIJi
0lwuAQDKkWVinmbagVwudZnRiljGI+aqE2s4bM/77Eu7ju0UkgEAro7GK2SEKlT1
Y+3SDLYFT01P134qXysfSawdu8ozOgo=
=ekTV
-----END PGP SIGNATURE-----

--sVIeHr/i4zviJEQI--

--===============0202007092297754850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0202007092297754850==--
