Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC36D81A4
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 17:22:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39834C6A606;
	Wed,  5 Apr 2023 15:22:16 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A8BBC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 15:22:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 44E3B2B06652;
 Wed,  5 Apr 2023 11:22:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 05 Apr 2023 11:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680708123; x=1680715323; bh=pK
 RyJ3lKqA73HVF+J+BLBZfn9tTi/QA1JWsG5UbLsgo=; b=HNFiZqD6BMKLLUdk4a
 jvumOtPI1wMaeYZ9emMcv3MIDqsAmugHZhZg6XddCn+XieaYQF8kknupj/+QI/0M
 5g4x3VL4atV9vN9FSJKWSQJUWzlMwRONbXlaBGpzw0YQUE1oVargvc8NSqFkeS9V
 WI0+siiq3+OV8MTZvKxm9OU7H9bGXZiFO3BZ4bB4zcHzgpOctkwv5KlwgLmphz0r
 CQjeSOf2bKqNeYzWVct12l4i9+N7MXJ8fE0o20TA8nwGvQJMyJ3z+ebBzInmD+NP
 8QYbJbECukFunRjqN1V/v1aYHfWiJCayniEw0L315wY9WS3PxScIVXMX5HXvh3NV
 4bMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680708123; x=1680715323; bh=pKRyJ3lKqA73H
 VF+J+BLBZfn9tTi/QA1JWsG5UbLsgo=; b=Hir41yb5yrIxwVzQ0v7Hv1ArNLUJ3
 dt30Y+Q1eoFQzLwbLNIVU1Wi0pTfOatnRn4xBlGCXakq1yEl06w2i96GbUiw3nPM
 QGhnwY+nc6n4iU94/YTOOsGyhNyiQgyRVu9gcyen2deiH7Zt4sBCrNRccBvJghE1
 N8mgaAkPxeQiNUvuxjTGKDTb83lhcU5hBacBsggj5S0ujgqUTx6me5a2GHQV0gdS
 haoJbbYBpViZdQpcR2pFkaxuXyk6QdEgEkjBb/dWDoZ69zkEvNtd14SepBBsqcLY
 IBu6A0NXYDkcMSsbPPUOtreCJZseg2mQcdA6DtDkFfNubUZXOJCYOgvaA==
X-ME-Sender: <xms:G5ItZLxeHHK_eTCVjATebYYo1AaIqNiZEhaplXhmnBLJw-YO4zvmLg>
 <xme:G5ItZDRad7hA709xL5uKzDOhNvq9EO3ciomh0AGrR2_hMONGAWNyBv4p_PHPgbC8C
 uPiaw5y2POd3vWjD_4>
X-ME-Received: <xmr:G5ItZFV4LP01QvZi02OU4bjtm8GmWldCVoBamdd7-ZTxJ_2RLSuOzw1d6wPOD5FLcbjYX_Op5Mj0X2PBGWwmHGtnNiFrLvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G5ItZFgGS6noxvNPwbBCIO0jSt4hlpt4AFYOjkrFocvlXR_denwyzw>
 <xmx:G5ItZNCHCOLtn7NhDKmDotimGUASIJZM9jVedAioJwFaTF6vQmBBag>
 <xmx:G5ItZOJPTfy5mgnINzNPD9HbdE_SkJoUrkPtMEPCZyzGI6UmGPzz_w>
 <xmx:G5ItZBJwDDkJ9kYGlGCnFQEtmja1Xv1D1EQjUEZ1DsADYHK59J_LLPJ_hTs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:22:01 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:22:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: David Lechner <david@lechnology.com>
Message-ID: <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-54-9a1358472d52@cerno.tech>
 <04f5d305-9992-bcdc-cd54-111eb8254155@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <04f5d305-9992-bcdc-cd54-111eb8254155@lechnology.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 54/65] clk: da8xx: clk48: Switch to
	determine_rate
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
Content-Type: multipart/mixed; boundary="===============3124520686616937659=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3124520686616937659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26z4voptekiisgxx"
Content-Disposition: inline


--26z4voptekiisgxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Apr 05, 2023 at 10:03:24AM -0500, David Lechner wrote:
> On 4/4/23 5:11 AM, Maxime Ripard wrote:
> > The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
>=20
> As mentioned in my previous review, parent is selected by device
> tree and should never be changed after init.

Great minds think alike then, because the driver implements exactly
that, either before or after that patch.

That patch makes the current behaviour explicit but doesn't change it in
any way.

So I guess that means that I can add your Acked-by on the three patches
you reviewed with the same message?

Maxime

--26z4voptekiisgxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2SGAAKCRDj7w1vZxhR
xX3HAP9VZpkTPwIoFKEvz2QkqD5aN3JRLL2FZfZs1GkS6VKwPwEAwCQO12uyUnoP
Ll/lRVK0qmUZkdyj49c7sQMgZB33awc=
=2nao
-----END PGP SIGNATURE-----

--26z4voptekiisgxx--

--===============3124520686616937659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3124520686616937659==--
