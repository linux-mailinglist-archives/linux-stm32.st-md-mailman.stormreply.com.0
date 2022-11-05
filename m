Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75861D96C
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Nov 2022 11:34:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7AA6C65048;
	Sat,  5 Nov 2022 10:34:17 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89951C65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Nov 2022 10:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667644455; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDaskHbQLkzLxZhbc0A77T82ys2sKHjzGtgSbl/eTqE=;
 b=3fY3IZ0hJPiRN8vNazn9bcQMqR2JrjTIi9AXqwxwIe42aFOkSxs8/LodJeR17HX6gwP6nU
 mZNm0vTVRbGLApx4Wl/flL8cOh+VgCBw+PxQes5goKWi15jShjtTx3YJEDgMNwV2KlXCJe
 TCPPbMNaz+6Yvnpx7NfiTwQwJoNtT18=
Date: Sat, 05 Nov 2022 10:33:54 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>
Message-Id: <IOEVKR.TWFKJND2FJ473@crapouillou.net>
In-Reply-To: <20221104145946.orsyrhiqvypisl5j@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
MIME-Version: 1.0
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
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
 Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>,
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Maxime,

Le ven. 4 nov. 2022 =E0 15:59:46 +0100, Maxime Ripard =

<maxime@cerno.tech> a =E9crit :
> Hi Paul,
> =

> On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
>>  Le ven. 4 nov. 2022 =E0 14:18:13 +0100, Maxime Ripard =

>> <maxime@cerno.tech> a
>>  =E9crit :
>>  > The Ingenic CGU clocks implements a mux with a set_parent hook, =

>> but
>>  > doesn't provide a determine_rate implementation.
>>  >
>>  > This is a bit odd, since set_parent() is there to, as its name =

>> implies,
>>  > change the parent of a clock. However, the most likely candidate =

>> to
>>  > trigger that parent change is a call to clk_set_rate(), with
>>  > determine_rate() figuring out which parent is the best suited for =

>> a
>>  > given rate.
>>  >
>>  > The other trigger would be a call to clk_set_parent(), but it's =

>> far less
>>  > used, and it doesn't look like there's any obvious user for that =

>> clock.
>>  >
>>  > So, the set_parent hook is effectively unused, possibly because =

>> of an
>>  > oversight. However, it could also be an explicit decision by the
>>  > original author to avoid any reparenting but through an explicit =

>> call to
>>  > clk_set_parent().
>>  >
>>  > The driver does implement round_rate() though, which means that =

>> we can
>>  > change the rate of the clock, but we will never get to change the
>>  > parent.
>>  >
>>  > However, It's hard to tell whether it's been done on purpose or =

>> not.
>>  >
>>  > Since we'll start mandating a determine_rate() implementation, =

>> let's
>>  > convert the round_rate() implementation to a determine_rate(), =

>> which
>>  > will also make the current behavior explicit. And if it was an
>>  > oversight, the clock behaviour can be adjusted later on.
>> =

>>  So it's partly on purpose, partly because I didn't know about
>>  .determine_rate.
>> =

>>  There's nothing odd about having a lonely .set_parent callback; in =

>> my case
>>  the clocks are parented from the device tree.
>> =

>>  Having the clocks driver trigger a parent change when requesting a =

>> rate
>>  change sounds very dangerous, IMHO. My MMC controller can be =

>> parented to the
>>  external 48 MHz oscillator, and if the card requests 50 MHz, it =

>> could switch
>>  to one of the PLLs. That works as long as the PLLs don't change =

>> rate, but if
>>  one is configured as driving the CPU clock, it becomes messy.
>>  The thing is, the clocks driver has no way to know whether or not =

>> it is
>>  "safe" to use a designated parent.
>> =

>>  For that reason, in practice, I never actually want to have a clock
>>  re-parented - it's almost always a bad idea vs. sticking to the =

>> parent clock
>>  configured in the DTS.
> =

> Yeah, and this is totally fine. But we need to be explicit about it. =

> The
> determine_rate implementation I did in all the patches is an exact
> equivalent to the round_rate one if there was one. We will never ask =

> to
> change the parent.
> =

> Given what you just said, I would suggest to set the
> CLK_SET_RATE_NO_REPARENT flag as well.

But that would introduce policy into the driver... The fact that I =

don't want the MMC parented to the PLLs, doesn't mean that it's an =

invalid configuration per se.

Cheers,
-Paul

>> =

>>  > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>  > ---
>>  >  drivers/clk/ingenic/cgu.c | 15 ++++++++-------
>>  >  1 file changed, 8 insertions(+), 7 deletions(-)
>>  >
>>  > diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>>  > index 1f7ba30f5a1b..0c9c8344ad11 100644
>>  > --- a/drivers/clk/ingenic/cgu.c
>>  > +++ b/drivers/clk/ingenic/cgu.c
>>  > @@ -491,22 +491,23 @@ ingenic_clk_calc_div(struct clk_hw *hw,
>>  >  	return div;
>>  >  }
>>  >
>>  > -static long
>>  > -ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
>>  > -		       unsigned long *parent_rate)
>>  > +static int ingenic_clk_determine_rate(struct clk_hw *hw,
>>  > +				      struct clk_rate_request *req)
>>  >  {
>>  >  	struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
>>  >  	const struct ingenic_cgu_clk_info *clk_info =3D
>>  > to_clk_info(ingenic_clk);
>>  >  	unsigned int div =3D 1;
>>  >
>>  >  	if (clk_info->type & CGU_CLK_DIV)
>>  > -		div =3D ingenic_clk_calc_div(hw, clk_info, *parent_rate, =

>> req_rate);
>>  > +		div =3D ingenic_clk_calc_div(hw, clk_info, req->best_parent_rate,
>>  > +					   req->rate);
>> =

>>  Sorry but I'm not sure that this works.
>> =

>>  You replace the "parent_rate" with the "best_parent_rate", and that =

>> means
>>  you only check the requested rate vs. the parent with the highest =

>> frequency,
>>  and not vs. the actual parent that will be used.
> =

> best_parent_rate is initialized to the current parent rate, not the
> parent with the highest frequency:
> https://elixir.bootlin.com/linux/v6.1-rc3/source/drivers/clk/clk.c#L1471
> =

> Maxime


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
