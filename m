Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED75CAB923
	for <lists+linux-stm32@lfdr.de>; Sun, 07 Dec 2025 19:48:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B47AAC1A977;
	Sun,  7 Dec 2025 18:48:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F05D9C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Dec 2025 18:48:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 717FD600AA;
 Sun,  7 Dec 2025 18:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25EFC4CEFB;
 Sun,  7 Dec 2025 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765133327;
 bh=i3PBFrjGBQBs0q3+aqCj3KcAnStBM/0oVzLp8ZbqdoA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CD8ThFBZDwJ9StM2NbaV5N6iNe4+vc30b3pEXddJ5Oo65Cmj3O9bdmORFW1sVXtmY
 LC/YL4KVbdSODRsPq83UcIlFRUV8IxF24wvCw72ErJXBTWIKUELAKR6tJw5w6IEP85
 u3p6oLIwTosCFTBxreZudIHlbc0hdl5qjEyo/KOIM2hpuUz13Rdh8WpILW6/CZt0mV
 R0lUYB8JffGNoMwacw1v8aPFjO2IteAyUgyGJkJDp1ZeWQ2Qp7Ep5lfFeHVGV2rAPv
 lFbDuPO+C5+12PXhp6ElYyqcAL4Eikvf9mV28JoGOOAxynDEG2QMAwLtpRwxlTSlUn
 Rq/8Du/Y5ngFA==
Date: Sun, 7 Dec 2025 18:48:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20251207184818.2ad7cef7@jic23-huawei>
In-Reply-To: <9b43da0b-61e1-49bb-acc2-392de3817db7@roeck-us.net>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <4053840.MHq7AAxBmi@fw-rgant>
 <732D3F12-0361-4800-8981-EF629B4C491F@goldelico.com>
 <3021060.e9J7NaK4W3@fw-rgant>
 <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
 <9b43da0b-61e1-49bb-acc2-392de3817db7@roeck-us.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v4 0/6] Add support for the LTM8054
	voltage regulator
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

On Tue, 25 Nov 2025 08:37:20 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On 11/25/25 02:25, H. Nikolaus Schaller wrote:
> ...
> > Another suggestion: what extending the "regulator-fixed", "regulator-gpio",
> > "regulator-fixed-clock" pattern by some "regulator-gpio-iio-dac-current-limiter"
> > driver to make it independent of your specific chip?
> >   
> The name is terrible ;-), but that is what I would have suggested as well.
> I don't see anything chip specific in this code. If there is a need for
> a regulator driver which uses gpio to enable it and a DAC for current limiting,
> it should be made generic.

Agreed - something generic is the ideal way to go.

However, before going too far it is worth exploring what are common circuits with
these things to identify what parameters we need to describe how the DAC channel
is used - e.g is linear scaling enough?  You'll need to that to define a DT
binding. If it turns out to be too complex, then fallback to specific
compatibles in a generic driver to cover the ones that don't fit with a common
scheme.  A similar case we already have is discrete components as analog front
ends for ADCs - mostly they fall into a few categories and we have drivers
covering those, but some are very odd indeed and for those ones we do have a
driver even though they don't have anything to control as such - most extreme
case being when it's a non linear analog sensor. 

The mention of a DAC as part of the analog feedback circuit sounds harder
too generalise but that's specific to this particular buck-boost device,
it's board specific so probably doesn't change the above.

> 
> > By the way, are you aware of this feature of the regulator-gpio driver?
> > 
> > https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/regulator/gpio-regulator.c#L97
> > 
> > Just to note: I am neither maintainer nor doing any decisions on this, just asking
> > questions for curiosity and from experience and giving hints for alternative approaches,
> > where I hope they help to find the really best solution.
> >   
> Same here.

Only covering the thing you are consuming so not my problem to maintain either ;)

Jonathan

> 
> Thanks,
> Guenter
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
