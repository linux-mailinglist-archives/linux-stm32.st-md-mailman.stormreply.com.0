Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F81622AA6
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 12:37:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 404D9C6504E;
	Wed,  9 Nov 2022 11:37:08 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C481C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 11:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667993821; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HeCzuAd5DrGQl3yX0PoEWG+18EHx/4Mkssb32++3BI=;
 b=WwCPTNJPOIDWtdzd5piGmEgZU4J4b1t9NVy+qRbY3+ISBvVQ6apE6t+8jx2p/zEgIxnja5
 9nWJEIf1duGHYh5JmCtFyh2CbFVaBUveP5Si2RGhwuWsnzKNfsXmdpkN0q+yUABhtgFuRh
 Y+C1HQZU871ihv7USL4Dk3I6J/l65gU=
Date: Wed, 09 Nov 2022 11:36:35 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>
Message-Id: <Z8W2LR.DTD355V5EAE02@crapouillou.net>
In-Reply-To: <20221109105301.ueus7o3b75j5yeff@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <IOEVKR.TWFKJND2FJ473@crapouillou.net>
 <20221109105301.ueus7o3b75j5yeff@houat>
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

Le mer. 9 nov. 2022 =E0 11:53:01 +0100, Maxime Ripard =

<maxime@cerno.tech> a =E9crit :
> Hi Paul,
> =

> On Sat, Nov 05, 2022 at 10:33:54AM +0000, Paul Cercueil wrote:
>>  Hi Maxime,
>> =

>>  Le ven. 4 nov. 2022 =E0 15:59:46 +0100, Maxime Ripard =

>> <maxime@cerno.tech> a
>>  =E9crit :
>>  > Hi Paul,
>>  >
>>  > On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
>>  > >  Le ven. 4 nov. 2022 =E0 14:18:13 +0100, Maxime Ripard
>>  > > <maxime@cerno.tech> a
>>  > >  =E9crit :
>>  > >  > The Ingenic CGU clocks implements a mux with a set_parent =

>> hook,
>>  > > but
>>  > >  > doesn't provide a determine_rate implementation.
>>  > >  >
>>  > >  > This is a bit odd, since set_parent() is there to, as its =

>> name
>>  > > implies,
>>  > >  > change the parent of a clock. However, the most likely =

>> candidate
>>  > > to
>>  > >  > trigger that parent change is a call to clk_set_rate(), with
>>  > >  > determine_rate() figuring out which parent is the best =

>> suited for
>>  > > a
>>  > >  > given rate.
>>  > >  >
>>  > >  > The other trigger would be a call to clk_set_parent(), but =

>> it's
>>  > > far less
>>  > >  > used, and it doesn't look like there's any obvious user for =

>> that
>>  > > clock.
>>  > >  >
>>  > >  > So, the set_parent hook is effectively unused, possibly =

>> because
>>  > > of an
>>  > >  > oversight. However, it could also be an explicit decision by =

>> the
>>  > >  > original author to avoid any reparenting but through an =

>> explicit
>>  > > call to
>>  > >  > clk_set_parent().
>>  > >  >
>>  > >  > The driver does implement round_rate() though, which means =

>> that
>>  > > we can
>>  > >  > change the rate of the clock, but we will never get to =

>> change the
>>  > >  > parent.
>>  > >  >
>>  > >  > However, It's hard to tell whether it's been done on purpose =

>> or
>>  > > not.
>>  > >  >
>>  > >  > Since we'll start mandating a determine_rate() =

>> implementation,
>>  > > let's
>>  > >  > convert the round_rate() implementation to a =

>> determine_rate(),
>>  > > which
>>  > >  > will also make the current behavior explicit. And if it was =

>> an
>>  > >  > oversight, the clock behaviour can be adjusted later on.
>>  > >
>>  > >  So it's partly on purpose, partly because I didn't know about
>>  > >  .determine_rate.
>>  > >
>>  > >  There's nothing odd about having a lonely .set_parent =

>> callback; in
>>  > > my case
>>  > >  the clocks are parented from the device tree.
>>  > >
>>  > >  Having the clocks driver trigger a parent change when =

>> requesting a
>>  > > rate
>>  > >  change sounds very dangerous, IMHO. My MMC controller can be
>>  > > parented to the
>>  > >  external 48 MHz oscillator, and if the card requests 50 MHz, it
>>  > > could switch
>>  > >  to one of the PLLs. That works as long as the PLLs don't change
>>  > > rate, but if
>>  > >  one is configured as driving the CPU clock, it becomes messy.
>>  > >  The thing is, the clocks driver has no way to know whether or =

>> not
>>  > > it is
>>  > >  "safe" to use a designated parent.
>>  > >
>>  > >  For that reason, in practice, I never actually want to have a =

>> clock
>>  > >  re-parented - it's almost always a bad idea vs. sticking to the
>>  > > parent clock
>>  > >  configured in the DTS.
>>  >
>>  > Yeah, and this is totally fine. But we need to be explicit about =

>> it. The
>>  > determine_rate implementation I did in all the patches is an exact
>>  > equivalent to the round_rate one if there was one. We will never =

>> ask to
>>  > change the parent.
>>  >
>>  > Given what you just said, I would suggest to set the
>>  > CLK_SET_RATE_NO_REPARENT flag as well.
>> =

>>  But that would introduce policy into the driver...
> =

> I'm not sure why you're bringing policies into that discussion. =

> There's
> plenty of policy in the driver already, and the current code doesn't =

> do
> something that the old wasn't doing (implicitly).

Yes, I was just talking about the CLK_SET_RATE_NO_REPARENT flag adding =

policy. The fact that there's plenty of policy in the driver already is =

not an argument for adding some more.

> And there's plenty of policies in drivers in general. Whether you =

> limit
> the rate or not, whether you allow reparenting or not, even the
> CLK_SET_RATE_NO_REPARENT flag mentioned above is a policy decision set
> by drivers.

Allowing reparenting and not limiting the rates is not a policy, it's =

just following what the hardware allows you to do. The absence of =

policy means that the driver allows you to configure the hardware in =

any way you might want to.

Limiting rates, forbidding reparenting, that's policy, and it doesn't =

belong in a driver.

You can argue that choosing not to reparent on rate change is a policy, =

and it is. That's why we need a way to enforce these policies outside =

the driver.

>>  The fact that I don't want the MMC parented to the PLLs, doesn't =

>> mean
>>  that it's an invalid configuration per se.
> =

> Sure, and that's another policy :)

A policy that is not enforced by the driver.

Going back to the patch itself... I am fine with the change, although =

the patch description should probably be updated. We have .set_parent =

callbacks to configure clocks from DT, there's nothing more to it.

Cheers,
-Paul


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
