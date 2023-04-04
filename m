Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE06D6738
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 17:26:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44A48C6A606;
	Tue,  4 Apr 2023 15:26:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8476C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 15:26:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E2866351D;
 Tue,  4 Apr 2023 15:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166DCC4339B;
 Tue,  4 Apr 2023 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680621994;
 bh=S5RX+65IdJoFD1RV6kPG02G0jupKJXUIf9T04GMrChI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=juLKZrGeWUX9d0oOR/CCL+88qbCAb/xWCfYJOewm4RggCItQtMsffW8KgmQJXRJdf
 wIGDohsQC49Uu+Ack+4kjWMLAjsoMV3eb751vy96HTaqKD91T/UUKbpSlW86M8yyWU
 kzibdkPn/HM0qi9cV+Pg+vpi80+5XFQ+v5x9mDGc2lQrl4NnUSCzI4lyIjnRln2nSD
 O5kE/0LQwnVa4MaO8VpBvXstlEflZ23NPK1LSMQlUuVw1QtKT/IAOLsLs/T1N/El4F
 IlKMU2toIuXW4dsXuO5nqayGgzbPTQ/Kz+zZdF9SFWy3SohdZ+M+0IoBj9mTyg+9sZ
 lTrq/E6gLN+BQ==
Date: Tue, 4 Apr 2023 16:26:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <01f32440-8dd2-4030-9006-a3123be55845@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
X-Cookie: Being ugly isn't illegal.  Yet.
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
Subject: Re: [Linux-stm32] [PATCH v3 43/65] ASoC: tlv320aic32x4: Add a
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
Content-Type: multipart/mixed; boundary="===============5305919185201520765=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5305919185201520765==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pRxU5n1hMJtSd1CQ"
Content-Disposition: inline


--pRxU5n1hMJtSd1CQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 12:11:33PM +0200, Maxime Ripard wrote:
> The tlv320aic32x4 clkin clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.

> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.

> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.

It could be configured from device tree as well couldn't it?

> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

Historically clk_set_rate() wouldn't reparent IIRC.

> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.

> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.

To be honest it's surprising that we'd have to manually specify this, I
would expect to be able to reparent.  I suspect it'd be better to go the
other way here and allow reparenting.

--pRxU5n1hMJtSd1CQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsQZoACgkQJNaLcl1U
h9C4KAf9FbCqTcQH5npaqJcyqXkbkD2B/+L43dup6TDsW3MJ6KnGh7YONz0DFQtI
yTePWQzrTp7lltc9dQ8/QOvh4Xj3HSYJ30m5Ok0oX7lCLwy3LjEHtJiou/laIivq
v+hAN2lVJPs0oOLwI+1tyi2p+UjtHzWUJcD37bHzIsY4esaL/B/Bp7m6z1JNpyoj
rIleJHkETKjUABBzN/UR62y6TPaPPm/hSUcy0eudfmZZhPOWkuX/iBrFcXcUgc+c
XOAtB0+uAsDUhULdGhXZSInCoKu0mdVwLr1QoZOB7q7J3Tl83t/8Mxuk8Dr+XEWh
JBFDNPB3HM8uQvBR5j9pbnSLt/7E/A==
=Jkqi
-----END PGP SIGNATURE-----

--pRxU5n1hMJtSd1CQ--

--===============5305919185201520765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5305919185201520765==--
