Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 139EE910B25
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 18:06:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D00BFC7128D;
	Thu, 20 Jun 2024 16:06:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B767C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 16:06:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 674D4621F8;
 Thu, 20 Jun 2024 16:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEA2C32786;
 Thu, 20 Jun 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718899601;
 bh=LGtv35FvlZB5cEXYAShER66SaKuyixPdIhslDnimU3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VPz12hTETnK/PrEGksITL4CZmnHLn1Nn60h6hvQKC6HMzxtbt8pQ398l1iyRpj946
 7l8qs1MckalfmTKkaRGyTS4gmPOYa72VFgY5endeozOaSxV/hTV4z2e+49OrI0nmio
 JTIAOuKJXI0AdLbLgiuEFYuUu/R/Mf/kVWUq5weg8cHEHj1OmNPKp5qYuO0/8bp5nV
 1iAwA/Tqcruvz3CbliVU0gAyN9dAhv9C8kVCearBtImJb3AFTDeN5ZrZXBZT8YjRp3
 iudTOQgRgLkqOEt1N5VAbhiec9NtlM5T9ThkgzrYbhwxNjJjrqpqWclf7lJSwp7mbi
 CHWpD/VEvHyBQ==
Date: Thu, 20 Jun 2024 17:06:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240620-recite-deeply-ec4aa7458d45@spud>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH 0/7] dt-bindings: i2c: few fixes and
	cleanups
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
Content-Type: multipart/mixed; boundary="===============5040311473532863408=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5040311473532863408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OWprGERt14zJA7P2"
Content-Disposition: inline


--OWprGERt14zJA7P2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2024 at 01:34:48PM +0200, Krzysztof Kozlowski wrote:
> Few fixes for I2C controller schemas. The third patch (atmel,at91sam)
> depends on first, so I suggest not splitting this into fixes branch but
> take as is via next branch.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--OWprGERt14zJA7P2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRThwAKCRB4tDGHoIJi
0qmFAP4qVsTO5fhoHDH/KxLOQ9oIndV8aFx4pmYEmgmRLGL9OQEArGLygc2tOMFb
gTTMxW9UouX8OISj6ZTyIyS1QKmpIgI=
=vTRs
-----END PGP SIGNATURE-----

--OWprGERt14zJA7P2--

--===============5040311473532863408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5040311473532863408==--
