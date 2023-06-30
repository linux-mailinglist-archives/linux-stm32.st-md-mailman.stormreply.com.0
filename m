Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C07441D0
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jun 2023 20:06:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4B77C6B453;
	Fri, 30 Jun 2023 18:06:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAAEFC04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 18:06:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A87D617D2;
 Fri, 30 Jun 2023 18:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44654C433CC;
 Fri, 30 Jun 2023 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688148415;
 bh=yz5t1GiipNFNh1NtxgqisnUQ1CD8Mwvmr2prkm+aqsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8BVS2sR9N6T9w9CrLbGEkLtZUN8hymR5Yfqq38a/aJIH/8+cN3LhWC1qe0ABBgYh
 +WqBRGYdoQU6Nt3Hxgu274LZGxuj3dXTjUFC0gpadKnR24KWnwNss6TUOYs5HzPAgL
 69DWTSkPmvlyIGijGGtVsdNgq93wlUFCgrMlNUyUbtwMMbYkbBTmdNaNRMd8a9wsOh
 HHDYDzKOmi2CTL7ac6HlH4x3ONaT6UQE/kzzOtQfsAzzW63ScznY5jFrNSUqpfzIhG
 AoZkWNd9IQDpbsm4pGf/Gu3vudY9yeH3x7B7zrg0vngrABIfRCyWMgg5e+S/ARWYIe
 MIrXoY3Cv3KjA==
Date: Fri, 30 Jun 2023 19:06:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Message-ID: <20230630-oppressor-circulate-1a2e5631d0dc@spud>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-8-fb6ab3dea87c@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-8-fb6ab3dea87c@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-oxnas@groups.io, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 08/15] dt-bindings: net: oxnas-dwmac:
 remove obsolete bindings
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
Content-Type: multipart/mixed; boundary="===============7215182666188197505=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7215182666188197505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BvTA36mVIWDn/yrV"
Content-Disposition: inline


--BvTA36mVIWDn/yrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:58:33PM +0200, Neil Armstrong wrote:
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 dwmac glue.
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--BvTA36mVIWDn/yrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8ZtgAKCRB4tDGHoIJi
0n34AQCaqt+oiyrpU/1VK5nJptp1QM1CruwCYZ4Kyxm+cqFlRAEA/3ZXE+gSBEOw
+/4RXjuoc0d0lEczRHPZqKqBpZdabgU=
=8KMl
-----END PGP SIGNATURE-----

--BvTA36mVIWDn/yrV--

--===============7215182666188197505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7215182666188197505==--
