Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A960E6D8126
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 17:10:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C622C6A60A;
	Wed,  5 Apr 2023 15:10:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18D01C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 15:10:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D947E625CB;
 Wed,  5 Apr 2023 15:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41DAC433D2;
 Wed,  5 Apr 2023 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680707447;
 bh=D4YX5DK0pun7qG4OSMVc8e9vaDN+H7CmPuWpZRhiBTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H++unxUb7nt0bWB0cZRIpirjyl6fMUIanjR0IybKKbOFCDZQ7fl3nGRfgXxHBmOTc
 aLr8pCNoVrScF3nXsYVeVlit6tFVqt3RTHudqPjdJeU4XNb3Fm+L6FyB4ZGRpA8mku
 uHDprHNH/IIWooGinODcsKEp00ZKOvzTS5e+wLSdqGlH/MPkZGOJVa2hJjKHooD4a0
 m1oiZgR8OnAyymsDZMT9AjB6JLhQsxqkpcXhI/shb8qZ4C8ggWEHL6au6GNGlms1bf
 2LcKx7iD5BDrkm8i9BaGwlDiJoOZSwNIUEO5nDNUcLF6Xb9gQmEcDK0dMfWFuHYUX9
 29DfTcAe3KLQg==
Date: Wed, 5 Apr 2023 16:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <692983f2-4aef-4ab9-9777-43f46b9cb4ba@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-64-9a1358472d52@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20221018-clk-range-checks-fixes-v3-64-9a1358472d52@cerno.tech>
X-Cookie: 1 bulls, 3 cows.
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 64/65] ASoC: tlv320aic32x4: div: Switch
 to determine_rate
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
Content-Type: multipart/mixed; boundary="===============7032784879571823550=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7032784879571823550==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Lzv7qB7yUCBJADV"
Content-Disposition: inline


--3Lzv7qB7yUCBJADV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 12:11:54PM +0200, Maxime Ripard wrote:

> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.

> However, It's hard to tell whether it's been done on purpose or not.

> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.

Similar comments to the other patch, I'm pretty sure this is just
surprising design on the part of the clock API and we should just allow
reparenting.

--3Lzv7qB7yUCBJADV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtj2AACgkQJNaLcl1U
h9C6nwf/eAXWoy2nqSW5TGkiJhKHJv8x94Toi8TRODFF+R/hoCeBiwbDpLoGU2W+
XtYiCa4AsVVTQShMscEuygSt4HqR2Hm7gaw+SoRwfdX/dEpqMCCF1Uzc9IAgRRv/
3aWJLZtx/5Mpyu3eaA6b7ul2tFP8PDE90ePyk1zHCZGUE189FK95s3Xc6zmVnuy2
Es8Td9JeVAZhnxCyLYGLVjoUw8/LsBEXAQWpSr/ayacNPTQa9PlPM3k/HCggwR7g
3NRnovXN1XYJ2pkkaN9RB9yifiB9Doz8KnLhSJVYG2lIaFMyYDSuYFu2zEIa8M/y
YabesVhSGONiNYKoP8QmdjTZqKi2nw==
=i5C8
-----END PGP SIGNATURE-----

--3Lzv7qB7yUCBJADV--

--===============7032784879571823550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7032784879571823550==--
