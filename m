Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFCA6D8174
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 17:17:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0DD2C6A606;
	Wed,  5 Apr 2023 15:17:37 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99039C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 15:17:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id CFB322B06725;
 Wed,  5 Apr 2023 11:17:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 05 Apr 2023 11:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680707845; x=1680715045; bh=4g
 3Y3WtpEmHJBlHmaZSfRkusN6Gsi4T8SDJHzgHkAHw=; b=L4vZO5QE1gCVJJlu2o
 r6vojScB4+ZzvhrGxAnCgZw8q3iEvd5m35SZkx+KC1V9nR1oJrFdkv+ey7bHZjCL
 h7ZEBk9Gmy/3C1A/1qdft9MpePUYhTf2LMdsCjgEXC/wq8oDjffPfKya8bL0vOhv
 zM4glmn3aahZ0fd/tWPeXFJVlzfG49xJGig3f3S4nIf2yKej0KUqRbtf9U4HO7U4
 Fca3KFRY0boUta2nyK/ZvwIoPXjc0uR7jRie7ubda+6o8LFTmR3EQPKCjDxKPY69
 q+rnuCjeiU34JIwElnik7ZIFhfh2uCaJ5k3L+G6Ma8lMgJQI3qmYO86jMfQxx5Ci
 VdNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680707845; x=1680715045; bh=4g3Y3WtpEmHJB
 lHmaZSfRkusN6Gsi4T8SDJHzgHkAHw=; b=VEkZsmfrmM6qqrbSYR67T7b6tnqGF
 AvhJD3Y4WLLq1tU2AX/t6uAgHsNHwJpXvwtS4GnhhmEJ7XPVKNwRq+9WMhmmzML+
 RG6DEdWr2hNUhcl8o0yOuq3CX2GqoiuaH9MsBOokOxVfwovgwExj8beYgt4/HxuA
 a96LoWlzOcRy23htu+pg7NjQwIET42Hppt8MLtacCrxmqqy1yW4bPHimBOxOQWfJ
 wAwezgR/QID/T8H8Ty1cHIhdRLrfE64Z96wSdoJclrB780/8YTOOdsPEANPT/KF4
 SSABADpffcDQPX+mkREx6UEIjxMxopVCUSw91MvdZ2vn4nW1L5oPr6aSQ==
X-ME-Sender: <xms:BJEtZAuMkk6wnab4QseDQgMYaxs-ZoalWk6ba9JDW-N_MwUR-r-0_g>
 <xme:BJEtZNeeUQqDS514Kh75x4vjSF_5nb0vlfH8K6OmRPlsGhffGSlMHsAhdX_0tWg6m
 1rxuj_wVXQehW37VVk>
X-ME-Received: <xmr:BJEtZLwjCpHui3RPPt2Zh-h4Q5a1KUTc9johjdZpp-INV-i7TjtqsffumjLDSjqJRIBhpUDe69m60CBw6P-vuyAbTZVw17w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BJEtZDOLnxucnvKx3FD6J-fSLSIdKT1u6WKBdKX_FeKFrkbQnefb_g>
 <xmx:BJEtZA_bReMUs9Hnw0kWbI8p_MC65dZMSzDb9-uV0n2-sq5SiGHLpg>
 <xmx:BJEtZLVbSPxoi4qvWklXjQcQFOKJSC341u3oT8-2Qg5yq0Cm5T0yJQ>
 <xmx:BZEtZFFxxiKux8gHULwGp3q2GhoxRfghXYlW4d0UO9AUrD_vtD7rQM5gvGo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:17:22 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:17:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Message-ID: <erm4iq3mygnrr4h2gd5cag3sfuovv47ibdqsbmxcfabngvnwy4@z63ksvj55zuu>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
 <01f32440-8dd2-4030-9006-a3123be55845@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <01f32440-8dd2-4030-9006-a3123be55845@sirena.org.uk>
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
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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
Content-Type: multipart/mixed; boundary="===============8496474174606718380=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8496474174606718380==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l2rp74o6ajwb6i7x"
Content-Disposition: inline


--l2rp74o6ajwb6i7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Apr 04, 2023 at 04:26:18PM +0100, Mark Brown wrote:
> On Tue, Apr 04, 2023 at 12:11:33PM +0200, Maxime Ripard wrote:
> > The tlv320aic32x4 clkin clock implements a mux with a set_parent hook,
> > but doesn't provide a determine_rate implementation.
>=20
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
>=20
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
>=20
> It could be configured from device tree as well couldn't it?

Yep, indeed.

> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call to
> > clk_set_parent().
>=20
> Historically clk_set_rate() wouldn't reparent IIRC.
>=20
> > The latter case would be equivalent to setting the flag
> > CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> > to __clk_mux_determine_rate(). Indeed, if no determine_rate
> > implementation is provided, clk_round_rate() (through
> > clk_core_round_rate_nolock()) will call itself on the parent if
> > CLK_SET_RATE_PARENT is set, and will not change the clock rate
> > otherwise. __clk_mux_determine_rate() has the exact same behavior when
> > CLK_SET_RATE_NO_REPARENT is set.
>=20
> > And if it was an oversight, then we are at least explicit about our
> > behavior now and it can be further refined down the line.
>=20
> To be honest it's surprising that we'd have to manually specify this, I
> would expect to be able to reparent.  I suspect it'd be better to go the
> other way here and allow reparenting.

Yeah, I think I'd prefer to allow reparenting too, but as can be seen
=66rom the other reviewers in that thread, it seems like we have a very
split community here, so that doesn't sound very realistic without some
major pushback :)

Maxime

--l2rp74o6ajwb6i7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2RAQAKCRDj7w1vZxhR
xRegAPwLq9rAf2gXBh+S5NNzglDB7jF/equjD6dhO2iJfkonFgD+OuUuIkBhvEAH
dy14syHvUOJJRm7L8hscnDwFHJrXQA0=
=mQrD
-----END PGP SIGNATURE-----

--l2rp74o6ajwb6i7x--

--===============8496474174606718380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8496474174606718380==--
