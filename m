Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D787261F82B
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Nov 2022 17:02:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB6DC6410B;
	Mon,  7 Nov 2022 16:02:48 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8806C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Nov 2022 16:02:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 17F89CE1712;
 Mon,  7 Nov 2022 16:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F88C433D6;
 Mon,  7 Nov 2022 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667836963;
 bh=Q/9M3qSa1bFKeX3VjOKXXNeZQ8B6sH7ewCOsQSJl+z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XOmgvny4UUp7BZnQahaV6KsWUNhmwIhMxpmcOq3tw9+9teYm6GP3wrPKa3hZGoLnw
 E8JjujtcqktG/KkrpbyyurTKPktTQdPK912YFUTtXWMPkM5Mc8ahGVOnmMw4Uhs9uI
 cTBlpsSY6QMvq4ve9Z36ouACRIQs64gqbTRuCpXHF7tFc/7x4f8H/Qv0fo1LJXDNr9
 JzeHD9nkKpifY1CmMZpd4sb8KMqk3fuEl3XqfTd7Ru1lKOsEk7X40/JP1ugM9/6yCX
 WursSOfQ18hBTkSv25XwIi5vVUTkBzpxlLxQrxg8iYZ3853WT5wCALjP37Nihp0/J3
 NEZKY1McJ+eyw==
Date: Mon, 7 Nov 2022 16:02:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <Y2ksFHGNIEVm1ldF@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
 <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk>
 <20221107152603.57qimyzkinhifx5p@houat>
MIME-Version: 1.0
In-Reply-To: <20221107152603.57qimyzkinhifx5p@houat>
X-Cookie: Minimum charge for booths.
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a
	determine_rate hook
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
Content-Type: multipart/mixed; boundary="===============7731809896055460665=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7731809896055460665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hTyRvcr/YAY3aApU"
Content-Disposition: inline


--hTyRvcr/YAY3aApU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2022 at 04:26:03PM +0100, Maxime Ripard wrote:
> On Mon, Nov 07, 2022 at 12:06:07PM +0000, Mark Brown wrote:
> > On Mon, Nov 07, 2022 at 09:43:22AM +0100, Maxime Ripard wrote:

> > The series does fill in __clk_mux_determine_rate for everything though -
> > if it was just assumed by default the only thing that'd be needed would
> > be adding the flag.

> The behavior assumed by default was equivalent to
> __clk_mux_determine_rate + CLK_SET_RATE_NO_REPARENT. We could indeed set
> both if determine_rate is missing in the core, but that's unprecedented
> in the clock framework so I think we'll want Stephen to comment here :)

> It's also replacing one implicit behavior by another. The point of this
> series was to raise awareness on that particular point, so I'm not sure
> it actually fixes things. We'll see what Stephen thinks about it.

We could also just set the operation and still require the flag to be
specified.  I'm a little surprised to learn that it's something you
might want to override, never mind that the API didn't have a default -
it feels like a bit of a landmine that this is the case and is probably
why there's so many cases to fix up.

--hTyRvcr/YAY3aApU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNpLBMACgkQJNaLcl1U
h9BS0gf/chIMp6chtu1p8LwUn+lniQOfOjVm2GoGAQ06qSr9+3KsWgvPO3J4pFNa
l036gwiNNFPM5gXlEj19YU0NgiAQIt2hoh9q92PY1kN8vmSQutr8U6QVxq27pphZ
5T2AVdZG2/L1Za5fy+qtwzx6ji1EENFmdLOF/NRrtc1zJPm/bT9E14uqwH7vmK0f
Jh1uBONY+x2wM44EMNgt3p4HTS/37ARwT9njBao9UUdt1uFWnUx05o0lerkyk4Xg
QlkvyC2hU+mXML3s6FVEbx0TQImsJItRx7Fk4E0Pij30qxWDtd0uybSJOzuWo16R
emQv+2HsLgl0L3qkctPVJREpPwCQuQ==
=mfv5
-----END PGP SIGNATURE-----

--hTyRvcr/YAY3aApU--

--===============7731809896055460665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7731809896055460665==--
