Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C216C7D03
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 12:09:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3C14C6A603;
	Fri, 24 Mar 2023 11:09:41 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 260F8C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 11:09:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id i9so1386703wrp.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 04:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679656180;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
 b=hzyILuXnSZ7lMaDYB5rhB/bnNUkufwU6fB5inzHRnGwGUpJquemA3X84Lzp++Y2YJ+
 xX92fJNLk8xQHwS1+YxTda7OSm5DtCOvp4pDLhNSgUC+z/fJXup9nphjXvyJHgvtZySv
 Ing1oEJUNGaC5fkPShiXmhVhP4ZVm14D3SAO1J3Mw26nhpiPZuGPtANkaXRqnth94OzX
 eWmkntp/5aW21aNCDZJKirG9vn5GmZabE2CYZSk/g1dEY9qxrgIgg/yw5kqOFSzwoNBS
 JwX3UeufEHb7ANEt7KtJeAKptHBPlTmLr2bfmp8WEFpNkr4PD3Q/FNi6OhewGezr1Z61
 Chlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679656180;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
 b=sevfqjB9HZnx1gSf5J4cFAIIg1iepGKxQ7UWDl03A+oagcMggnzGMgDYwtCmtZxvVD
 iETmDRUONIhAxpo1MIX75HDJFOkgFqiaKTMeVFUVVMWwxVOiPr9ghgUbJGqCq1ENezf8
 wBVL/c3esoE6McZgXcNDw6dszzUbjvR6qE/rF8ufkvGNVWrfV/UTdpwziJZGyr1Tp2LI
 v/ymkEuKx8OeNmCrhWPUcQ6AlIsfnnnQRVui/5ElWdcgk4+f11jb84puH2zB1o7Sbxnc
 EfoOejQtCSvOt2uD5qBPhp4YR/swe3k6o5KOW23MLZIzl5thb+UzUUD1+7P3vEKhWlS6
 Y/NQ==
X-Gm-Message-State: AAQBX9flmsqkDHm/IWIs9SjQSislO+GalA69Laf4ijfJzACm4rC2bAnG
 tJmVwNPvgx3GqYaYT35MuCg=
X-Google-Smtp-Source: AKy350ZmBQJTJNYHdzNhp0Qvsm2ha5bci7Pffhjn47i2N4HkGJnSU/0GajVbD8LVTLhlg10uq2ysNw==
X-Received: by 2002:a5d:6290:0:b0:2da:53e3:57cf with SMTP id
 k16-20020a5d6290000000b002da53e357cfmr1959487wru.71.1679656180460; 
 Fri, 24 Mar 2023 04:09:40 -0700 (PDT)
Received: from localhost (188.28.8.105.threembb.co.uk. [188.28.8.105])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a056000100800b002d8566128e5sm9760336wrx.25.2023.03.24.04.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 04:09:39 -0700 (PDT)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 23 Mar 2023 15:35:30 +0000
In-reply-to: <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
Message-ID: <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
MIME-Version: 1.0
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
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
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


Stephen Boyd <sboyd@kernel.org> writes:

> Quoting Maxime Ripard (2022-11-09 03:00:45)
>> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
>> >
>> > Maxime Ripard <maxime@cerno.tech> writes:
>> >
>> > > Hi,
>> > >
>> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
>> >
>> > Assigning the parent clock in the DT works once, at boot, but going off
>> > what you wrote in the commit message, if the clock driver has a
>> > .determine_rate() implementation that *can* reparent clocks then it
>> > probably *will* reparent them, and the DT assignment will be lost.
>>
>> Yes, indeed, but assigned-clock-parents never provided any sort of
>> guarantee on whether or not the clock was allowed to reparent or not.
>> It's just a one-off thing, right before probe, and a clk_set_parent()
>> call at probe will override that just fine.
>>
>> Just like assigned-clock-rates isn't permanent.
>>
>> > What I'm suggesting is a runtime constraint that the clock subsystem
>> > would enforce, and actively prevent drivers from changing the parent.
>> > Either explicitly with clk_set_parent() or due to .determine_rate().
>> >
>> > That way you could write a .determine_rate() implementation that *can*
>> > select a better parent, but if the DT applies a constraint to fix the
>> > clock to a particular parent, the clock subsystem will force that parent
>> > to be used so you can be sure the clock is never reparented by accident.
>>
>> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
>> too far off from this, it's just ignored by clk_set_parent() for now. I
>> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
>> clk_set_parent handle it, and set that flag whenever
>> assigned-clock-parents is set on a clock.
>>
>> It's out of scope for this series though, and I certainly don't want to
>> deal with all the regressions it might create :)
>>
>
> This sounds like a new dt binding that says the assigned parent should
> never change. It sounds sort of like gpio hogs. A clock-hogs binding?

Ideally we want the clock driver to be able to reparent clocks freely
to get the best rate. But we also need some control over that to stop
consumers from being reparented in undesired ways. Eg. you might want
to make sure the GPU gets its own PLL so it can be reclocked easily,
and putting another device on the GPU's PLL could prevent that.

The only way to achieve this today is (1) never do any reparenting in
the clock driver; and (2) use assigned-clock-parents in the DT to set
up the entire clock tree manually.

Maxime said that (2) is basically wrong -- if assigned-clock-parents
provides no guarantee on what the OS does "after boot" then the OS is
pretty much free to ignore it.

My suggestion: add a per-clock bitmap to keep track of which parents
are allowed. Any operation that would select a parent clock not on the
whitelist should fail. Automatic reparenting should only select from
clocks on the whitelist. And we need new DT bindings for controlling
the whitelist, for example:

    clock-parents-0 = <&clk1>, <&pll_c>;
    clock-parents-1 = <&clk2>, <&pll_a>, <&pll_b>;

This means that clk1 can only have pll_c as a parent, while clk2 can
have pll_a or pll_b as parents. By default every clock will be able
to use any parent, so a list is only needed if the machine needs a
more restrictive policy.

assigned-clock-parents should disable automatic reparenting, but allow
explicit clk_set_parent(). This will allow clock drivers to start doing
reparenting without breaking old DTs.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
