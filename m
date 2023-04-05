Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122A6D8190
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 17:19:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04C50C6A606;
	Wed,  5 Apr 2023 15:19:23 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BE28C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 15:19:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 95FF22B06725;
 Wed,  5 Apr 2023 11:19:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 05 Apr 2023 11:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680707950; x=1680715150; bh=N4
 c3eeJxURi8JXim3XKJyPapEGBJUqAqBrR8m8X2c4U=; b=gKmMuTGX4nhOP5LI8Y
 E+p/fl+lzjYAUVjkZAxOcgMyfnvceh+EPXSaK4hHdklMDKUo+7X8uDlGKLDM7YrF
 sGg+TkumCGduStemV3hSEOod80SRIuqnVBjPCz57RbgXyt/JCsea9kGlEGHD9ZHH
 4uYBmeLVKiWZRuqWeUmq4vUsloGrTNXrcZHyz42mXBY+jnF6RqsUJfP3g+hbx4CH
 JR626fKDz3Kx91OKG6zoAb0lhAY8BRj2kyH+aSBqRWk3fBm+tmycjA9BvxMtFwK2
 /uN/4REMsnOfiA8YkWEUr9NvX5awfUPDqecs/KGItASKIgB/OjRZa6JP4GBtcIV6
 ixhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680707950; x=1680715150; bh=N4c3eeJxURi8J
 Xim3XKJyPapEGBJUqAqBrR8m8X2c4U=; b=us63aUQDG8MBsBWKxVkd677OWUlyf
 GvyT2ZsDR/MSDXYyBEFPCLr1u77TLVEliJJkxnFOHOryhOssawtom9Fx/GCxXE4Z
 g9WMcBZDBFFA0M55NPj/afG79rH+QSlgwKxHdEscFKqJAGzLCKXM08O4CAyNZ2oY
 92l1EUMRUsxYBOKTBCNAueUm0hLDh9wXQ1aH2hSa0Pyqo+ic5Vn/E1K8RUuJ+Akx
 niaY+kBJb8HA94y9MapEeW9khd6W27wz6/o4LBZwUwC1yikHIaKv9+Y3YHHV23Ax
 Pbttvpu2mHJMkMEb/nmxw4VL5SFuEUD85xEXcsCOFmUo4Ir1bozXJcnQw==
X-ME-Sender: <xms:bZEtZNE5d3frgjNyqfY4l4F96Ieu8m-0_ET2EQHW54skrpLdDPxMkg>
 <xme:bZEtZCWAV86vqtY8x0YAOfOyxP_Bjovfu1KEbcIJIGQZNkI_NskC3Z69zIE7bSKWK
 uPorUWm3E5jHLYZiX0>
X-ME-Received: <xmr:bZEtZPIl36enYyRYWtnwtZFjoGIm56RgFEgNNgHuHH1AdVooqXLB1xvAQ3eU8FqyhyfYmeQzT8INbzvXCyXiYFQA7dPIxNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeefjeeiueeiheevtddvgfeluedufeeigeeijefhveelfeevueefieehuefg
 ffetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bZEtZDEAFhIsFMFa_rlEYJjQtmNAX1yXFgltj8Nc2M4E7IronNQkYQ>
 <xmx:bZEtZDXf-V7X3wB2ItBeZXqRwyUd7foTYp81_5ZftvCbRnJ1NVcG-A>
 <xmx:bZEtZONDsCr9vCSxxuST4o6jdEcH6VhtDEUAn3vwkAzrVLVhcbzMRw>
 <xmx:bpEtZHehzz9o1Op1NisRQXvvRBZ08CdWKapQjpWmxXPTk9Z4sCWpZcg2CZ8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:19:07 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:19:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <o6odr3i3ypj6p6vxuiwgymll3bew544mwzcgs6hjzum5uix43j@galqy4lxjdvx>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-56-9a1358472d52@cerno.tech>
 <3c1c42baf7d764bf6429b470f534fd9ec46ddedd.camel@crapouillou.net>
MIME-Version: 1.0
In-Reply-To: <3c1c42baf7d764bf6429b470f534fd9ec46ddedd.camel@crapouillou.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH v3 56/65] clk: ingenic: cgu: Switch to
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
Content-Type: multipart/mixed; boundary="===============6497190519119199330=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6497190519119199330==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7run534ck55yr3bz"
Content-Disposition: inline


--7run534ck55yr3bz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, Apr 05, 2023 at 03:04:05PM +0200, Paul Cercueil wrote:
> Le mardi 04 avril 2023 =E0 12:11 +0200, Maxime Ripard a =E9crit=A0:
> > The Ingenic CGU clocks implements a mux with a set_parent hook, but
> > doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name
> > implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
> > The other trigger would be a call to clk_set_parent(), but it's far
> > less
> > used, and it doesn't look like there's any obvious user for that
> > clock.
> >=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call
> > to
> > clk_set_parent().
>=20
> As I said in the v2 (IIRC), clk_set_parent() is used when re-parenting
> from the device tree.

Yep, it's indeed an oversight in the commit log.

> > The driver does implement round_rate() though, which means that we
> > can
> > change the rate of the clock, but we will never get to change the
> > parent.
> >=20
> > However, It's hard to tell whether it's been done on purpose or not.
> >=20
> > Since we'll start mandating a determine_rate() implementation, let's
> > convert the round_rate() implementation to a determine_rate(), which
> > will also make the current behavior explicit. And if it was an
> > oversight, the clock behaviour can be adjusted later on.
>=20
> So just to be sure, this patch won't make clk_set_rate() automatically
> switch parents, right?
>=20
> Allowing automatic re-parenting sounds like a huge can of worms...

The behaviour is strictly equivalent before that patch and after: the
driver will not reparent on a rate change. It just makes it explicit.

Maxime

--7run534ck55yr3bz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2RagAKCRDj7w1vZxhR
xXf2AP4nVXXgdZbFLKpfLcLqHQU/yEaza+nOToxguQnpy3rPiAD/VqJ8EWDR1dkZ
KO3BzBJio00Kuw94FyundvDtvxXOygg=
=yU4q
-----END PGP SIGNATURE-----

--7run534ck55yr3bz--

--===============6497190519119199330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6497190519119199330==--
