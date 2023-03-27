Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8E86CAE82
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 21:24:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EB7DC6A5F2;
	Mon, 27 Mar 2023 19:24:38 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6435C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 19:24:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A10135821C9;
 Mon, 27 Mar 2023 15:24:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Mar 2023 15:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1679945075; x=1679952275; bh=rUuK9HXT1QKP+JaV2sHZBw1jLvvNj/LeTVl
 Vzz2mgnE=; b=Gbu8P4udsMzoUHOjBbc5vfZkP8tmap7dDKr2UbNlg1rixDocDy1
 FxnzMOf4IOE2QfpQC16ztGYJPxILJkIxjIgvAYZvE6YKh8ByrZaG/DwGgBebbWeR
 u897wwvNEQblafmWFWlheo89ARPXU3Y8oogaRB7FitYdT+Ut11wADq6gdu2WovDh
 Xkmp8I7I9FIQMArX6acMwEXaNFUqd2HKMXcH43MHmPOzshN26/iirV1eH6W3dVXI
 8/qFTx4K/XYsgt3TO6s0Awb2KVJUO/QYpQYZyPru8lsOFL1AaMAGCylG/7RBI5k9
 jN2zsyhGhjzCZHGorsCFbB/6Ikisoduw5rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679945075; x=1679952275; bh=rUuK9HXT1QKP+JaV2sHZBw1jLvvNj/LeTVl
 Vzz2mgnE=; b=SHHB4k7bT/dpA/WpBJ4y6Me/WnLbpnFXIndTiaB8/gRhPh84gMh
 BWWBeQ2XwYOIN72SfXrmMvw1Fp7uf/LOu2PSFypexIyJHggZzMGs7l6ee1zSHLSh
 oDdQ+vdPBe9KNPXErhfHevDOs1nDqM2OVelCWFp97TAwMIVY0/2/h3xlmXqOtiYf
 EVwH2yJfjFhnXvgqDRNyzHjPstZZOaYq3QFTE2qxYXpu0A46u0Mm1LUIMjT71nea
 MN2+d/lsVf8chYLWOQNX2owgkOwLov/Ep9ne8iDdinid6yyrileqeAyQzZn48c9N
 Q0qZYiL21tuinlqT4OtghVeAeGKaikoV2ow==
X-ME-Sender: <xms:ce0hZIdM24euIGEUtoe65OkBtoRYVeI3ONUCSPWoGVW_5JO4kFnMXA>
 <xme:ce0hZKP7isXAj98ojUZU3qfBX3AC7TN1qwun_tqjjRNsKWlTzcp_QsyECQ0whwQwo
 rwnun8onbXM8eXunNI>
X-ME-Received: <xmr:ce0hZJju5UXKYf1ZB4-cgid8Z7MS1h-PShHiUVPZRgduIHmJvBnjnu1tYdV9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
 teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ce0hZN-SRmDaQe-0vFu3eAyHD4JPegYDiDKo-JQR5BGerdxYpxnFaQ>
 <xmx:ce0hZEun2Gmy0YnOs-3_4-7t5O9t6z8MgMYrxxX_G44CPUvCVCr81Q>
 <xmx:ce0hZEE5l3ugjz44F874HhjsOZZjibqjYjw1zy4XvsjTYlW2FEW9Yg>
 <xmx:c-0hZFMocL39774IjxJ1l8UQZNiYw8FCE5ns7VU4Jf79p3npVDrKMQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 15:24:32 -0400 (EDT)
Date: Mon, 27 Mar 2023 21:24:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-ID: <20230327192430.b2cp3yyrkzy4g4vw@penduick>
References: <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
 <20230324111959.frjf4neopbs67ugd@houat>
 <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
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
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 56/65] clk: ingenic: cgu: Switch to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Mar 24, 2023 at 08:58:48PM +0000, Aidan MacDonald wrote:
> >> My suggestion: add a per-clock bitmap to keep track of which parents
> >> are allowed. Any operation that would select a parent clock not on the
> >> whitelist should fail. Automatic reparenting should only select from
> >> clocks on the whitelist. And we need new DT bindings for controlling
> >> the whitelist, for example:
> >>
> >>     clock-parents-0 = <&clk1>, <&pll_c>;
> >>     clock-parents-1 = <&clk2>, <&pll_a>, <&pll_b>;
> >>
> >> This means that clk1 can only have pll_c as a parent, while clk2 can
> >> have pll_a or pll_b as parents. By default every clock will be able
> >> to use any parent, so a list is only needed if the machine needs a
> >> more restrictive policy.
> >>
> >> assigned-clock-parents should disable automatic reparenting, but allow
> >> explicit clk_set_parent(). This will allow clock drivers to start doing
> >> reparenting without breaking old DTs.
> >
> > I'm generally not a fan of putting all these policies in the device
> > tree. Do you have an example where it wouldn't be possible to do exactly
> > this from the driver itself?
> 
> I'm confused. What's implicit in the example is clk1 and clk2 might
> have *other* possible choices of parent clock and the device tree is
> limiting what the OS is allowed to choose.
>
> Why would you put such arbitrary limitations into the driver?

Why would we put such arbitrary limitations in the firmware? As this
entire thread can attest, people are already using the device tree to
work around the limitations of the Linux driver, or reduce the
features of Linux because they can rely on the device tree. Either
way, it's linked to the state of the Linux driver, and any other OS or
Linux version could very well implement something more dynamic.

> They would be different from machine to machine, unless the clock
> tree is so simple there is only *one* meaningful way to configure
> it.

If we look at the device trees we have in-tree, most of the users of
assigned-clocks are the same from one board to another.

> Most SoCs are complicated enough that there will be tradeoffs
> depending on what peripherals you are using (typically a single
> machine will not use *every* peripheral device provided by the SoC).

We already have APIs to lock parents or rates on a given clock from
the consumer. It's far superior (feature-wise) than what the device
tree will ever offer because it's code, and it depends on the usage
already since an unused driver won't probe.

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
