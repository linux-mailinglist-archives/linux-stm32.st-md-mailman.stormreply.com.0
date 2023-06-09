Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3333728D45
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 03:49:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65494C65E70;
	Fri,  9 Jun 2023 01:49:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F93BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 01:49:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1925652AF;
 Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41180C433EF;
 Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686275370;
 bh=5yCCx637qN6JiLW7I6+8zEHQGblEuFICtzq96prQWME=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=K6IhUHPIMyX6G51Gvg9LBUJ3F+NMA6t6yEqi3fTeDTd+AJzCCvvookTr/6vQqGmIn
 YHm6xCzH29XDY1RxhGUWWRXRiWAz+w4FinVcWL9BZIaqu935rDcsd9srsnN7LexnGZ
 GCkr6cL3K8SIP7mxO9yA8OMPuNRkbBGzshyF7AScJsc0Echnlzdy6HrJq2B3P6eqEB
 C/vA6phGnqUiPVssfsHiLNKrmW37L5wDKBSmCLTQDZ9XlTE9d38MUMidr99RQRsQ6o
 iveJTt876EEgX7IN09+I3JVakkYPpa1Fbdci55u3kgBWbiPwoqFEOp6SBpvW+XcWiw
 hoc+eH+MLB+dw==
Message-ID: <431d1ae3993d1fc78decbcd065442f29.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 08 Jun 2023 18:49:28 -0700
User-Agent: alot/0.10
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, Pawel Moll <pawel.moll@arm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdw ood <lgirdwood@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Miles Chen <miles.chen@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Beguin <liambeguin@gmail.com>, alsa-devel@alsa-project.org,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH v4 00/68] clk: Make determine_rate
	mandatory for muxes
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

Quoting Maxime Ripard (2023-05-05 04:25:02)
> Hi,
> 
> This is a follow-up to a previous series that was printing a warning
> when a mux has a set_parent implementation but is missing
> determine_rate().
> 
> The rationale is that set_parent() is very likely to be useful when
> changing the rate, but it's determine_rate() that takes the parenting
> decision. If we're missing it, then the current parent is always going
> to be used, and thus set_parent() will not be used. The only exception
> being a direct call to clk_set_parent(), but those are fairly rare
> compared to clk_set_rate().
> 
> Stephen then asked to promote the warning to an error, and to fix up all
> the muxes that are in that situation first. So here it is :)
> 

I've applied this to clk-next after squashing in an export. Thanks for
taking this on.

I'll have to monitor for wreckage with any in-flight drivers. I suspect
I'll have to take out the last commit, but maybe we can just let those
in-flight drivers get fixed up later.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
