Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D226CF3A7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 21:51:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF54C69069;
	Wed, 29 Mar 2023 19:51:01 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4700BC65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 19:51:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B22DC2B05BE1;
 Wed, 29 Mar 2023 15:50:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Mar 2023 15:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680119453; x=1680126653; bh=S0
 0Xp8JXjn19UH995q1FPsxfz6/qb923iCtN7jshDa0=; b=bjfu/u+3WNSfLMbwG8
 kgDlb33yFeBpTyDn26O0i5sMcaQYMH5k+w0P2n88u/CL6nmHobkHURfCmf1/C29t
 U0Qh1AeatQqCeBn6lka/dn10E2764ErqPqb3njkwCEp0gR+damC3mrcUvTxoLGFt
 C8YUuH43zoflGPvolh5JgeGOuMjpcUVK2XMglwkAj5Jbl90JOiW6MmIBfFxsj47Z
 LmLClTdxuUi8kFNiCE0STmAKXFF18XHkXI+HXgSXZYmlUiBbZLpqDOcow+ybw2xE
 2FoegJ/5RU8yvTqRDV9YushjRc122S3DH00UzJnafvUsGPLUeJnt1P45+mZXlwwx
 9r5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680119453; x=1680126653; bh=S00Xp8JXjn19U
 H995q1FPsxfz6/qb923iCtN7jshDa0=; b=mDHZlaVnXucLsPRdtiP08QfOw0gbw
 L+tUMJhcynxctO/kzDo9N9LThihIenJjo53qM0euM2lsFwMzIIJmLZaKDMEQ9gKS
 btQwIniilAJ2KR0keHWJin00kBMMw6Fvxj0Tqr2fZDydPMLtTJ9/sGRArw3nvLEJ
 Inl8nRAJ+p1On2TOo/Jkf5NvgfFrgD8xiz+wUxe+OLxZLqgad7dL+FZKdxkOCpJr
 jXFB1C2jlktQjz7Pf5BdwXfRgXBHnZg2CeqLIpNinGTcVjw+BWRP0a6XnT9W3OK0
 vrpjM1vniY/j4v5fsA1EOzPEQz9MwxVgK2edMj2xcjAO4WZgtdvUtY6ug==
X-ME-Sender: <xms:mpYkZD7Ox3zkaNg9OIbaq_Geirriia0AyR5zsctORI6EJu7ND1ZsRQ>
 <xme:mpYkZI6gfNEQJJATGLF-jP5tejftDvf4e2pRhn5b30pSmUBJQi8Q22RK3CYpCbdPk
 nljkuFaqJebKdIGblI>
X-ME-Received: <xmr:mpYkZKdImEiijk94na28hpIQuEi3cQuAMkQWm0nzJyixb0OJnKMRnOXbcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgudeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mpYkZEJl9MrKZSU_H62ZAJfDV2fQB_Dukmg12b6sz6GsGnrs1I7MQA>
 <xmx:mpYkZHItJM6rTbcj4kioTn3BMkpHiPds2sYYICneLW9ubA5TBI5WRQ>
 <xmx:mpYkZNxhOoittDkCw7hbXZnCUDUd-FuZ-EKLeSqNz8AN2-VxFNYVfA>
 <xmx:nZYkZIRJx8oRJdN_mOMdRd18Mh8SZ8lDvg6OQ5KdOS-_17hhw45Pa7Wurdo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 15:50:49 -0400 (EDT)
Date: Wed, 29 Mar 2023 21:50:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Message-ID: <20230329195049.lbdbkbqu6zbq5xii@penduick>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
 <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk>
 <20221107152603.57qimyzkinhifx5p@houat>
 <5819b1362f35ce306e1b6d566bfd44e5.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <5819b1362f35ce306e1b6d566bfd44e5.sboyd@kernel.org>
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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
Content-Type: multipart/mixed; boundary="===============2897426517277963144=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2897426517277963144==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bx2st77tq2vvri5u"
Content-Disposition: inline


--bx2st77tq2vvri5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Mar 22, 2023 at 04:31:04PM -0700, Stephen Boyd wrote:
> > It's also replacing one implicit behavior by another. The point of this
> > series was to raise awareness on that particular point, so I'm not sure
> > it actually fixes things. We'll see what Stephen thinks about it.
> >=20
>=20
> Right. A decade ago (!) when determine_rate() was introduced we
> introduced CLK_SET_RATE_NO_REPARENT and set it on each mux user (see
> commit  819c1de344c5 ("clk: add CLK_SET_RATE_NO_REPARENT flag")). This
> way driver behavior wouldn't change and the status quo would be
> maintained, i.e. that clk_set_rate() on a mux wouldn't change parents.
> We didn't enforce that determine_rate exists if the set_parent() op
> existed at the same time though. Probably an oversight.
>=20
> Most of the replies to this series have been "DT is setting the parent",
> which makes me believe that there are 'assigned-clock-parents' being
> used.

Yes, that's my understanding as well.

> The clk_set_parent() path is valid for those cases. Probably nobody
> cares about determine_rate because they don't set rates on these clks.
> Some drivers even explicitly left out determine_rate()/round_rate()
> because they didn't want to have some other clk round up to the mux
> and change the parent.
>=20
> Eventually we want drivers to migrate to determine_rate op so we can get
> rid of the round_rate op and save a pointer (we're so greedy). It's been
> 10 years though, and that hasn't been done. Sigh! I can see value in
> this series from the angle of migrating, but adding a determine_rate op
> when there isn't a round_rate op makes it hard to reason about. What if
> something copies the clk_ops or sets a different flag? Now we've just
> added parent changing support to clk_set_rate(). What if the clk has
> CLK_SET_RATE_PARENT flag set? Now we're going to ask the parent clk to
> change rate. Fun bugs.
>=20
> TL;DR: If the set_parent op exists but determine_rate/round_rate doesn't
> then the clk is a mux that doesn't want to support clk_set_rate(). Make
> a new mux function that's the contents of the CLK_SET_RATE_NO_REPARENT
> branch in clk_mux_determine_rate_flags() and call that directly from the
> clk_ops so it is clear what's happening,
> clk_hw_mux_same_parent_determine_rate() or something with a better name.
> Otherwise migrate the explicit determine_rate op to this new function
> and don't set the flag.
>=20
> It may be possible to entirely remove the CLK_SET_RATE_NO_REPARENT flag
> with this design, if the determine_rate clk_op can call the inner
> wrapper function instead of __clk_mux_determine_rate*() (those
> underscores are awful, we should just prefix them with clk_hw_mux_*()
> and live happier). That should be another patch series.

Sorry but it's not really clear to me what you expect in the v2 of this
series (if you even expect one). It looks that you don't like the
assignment-if-missing idea Mark suggested, but should I just
rebase/resend or did you expect something else?

Maxime

--bx2st77tq2vvri5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCSWmAAKCRDj7w1vZxhR
xQXTAP0bPg2EVQxPktgSpE4coaiyyn0Cu6Bba/x8MkUcPgNRVQEAxpbYr0uDsXMC
CE9ojO6fXNwPgqHm5ELQGJgnrvcQQQg=
=B5xn
-----END PGP SIGNATURE-----

--bx2st77tq2vvri5u--

--===============2897426517277963144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2897426517277963144==--
