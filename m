Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC2C813C1
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 16:07:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2117C0693F;
	Mon, 24 Nov 2025 15:07:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA9BFC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763996871; x=1795532871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z56v9C0Rg97jOdx0MwIq/SrG80i12igOo1dqKgEs9Ik=;
 b=AqnIF07eKtSPZcDyo2nY8YjcWpX+0rYTKSuU+b9WInrGtqL9Gssryy7e
 XsD5W+6sdN0K4I5A7336MoyFUA6nkbIu3Tt7VD5FwiC3NIKgWL918H++M
 khVyBthrurkFJ66Pl6lRFSJlOXptcdlyS2s2ZKrluKxj04QJIw67rHGSJ
 keUyab254ZSe3f/fq8ImZLNSBpyEVkvNnFAf4Xo4XMyC4POShWHnkNKi8
 ZLACFWbNrzBBvf/WLalSmRAhYv/jQCn2ZHXNGJXb62iIlpjeICfGpY7aT
 JTFNceDT+moZ1kJ+aIjMbH5thIoUC4XshddMTg4ZiZ5toI6PjWUYkVtbC Q==;
X-CSE-ConnectionGUID: PlzKIKlqQBaF0Q5omVKnxg==
X-CSE-MsgGUID: dxYY4f5/TGaLhlBriaWybg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88647367"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="88647367"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 07:07:49 -0800
X-CSE-ConnectionGUID: P/h9s0EiQjK4ZI/Rp7ebrQ==
X-CSE-MsgGUID: gvu9jDc3QauPN63N7QPpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192595689"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.5])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 07:07:35 -0800
Date: Mon, 24 Nov 2025 17:07:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <aSR0tcV0ULNYvf7t@smile.fi.intel.com>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <24527d76-4f6a-4008-a369-23510d492a94@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24527d76-4f6a-4008-a369-23510d492a94@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: linux-hwmon@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
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

On Mon, Nov 24, 2025 at 06:57:41AM -0800, Guenter Roeck wrote:
> On 11/24/25 06:48, Romain Gantois wrote:
> > 
> > This is version four of my series which adds initial support of the Linear
> > Technology LTM8054 voltage regulator. The driver supports a fixed voltage
> > and a tunable output current limit using a DAC-controlled pin.
> > 
> > I'd say that the most unusual part of this series is the usage of the IIO
> > consumer API in a regulator driver. I think this makes sense here, since
> > the regulator driver has to access a DAC to read/set the output current
> > limit.
> 
> I don't think that is a valid reason. Literally every driver measuring voltages
> or current uses a DAC to do it. How else would one convert an analog value
> into a digital value ?

While I'm not objecting your vision on this, the ADC is also possible to use to
"measure" the analog signal. DAC approach IIRC considered cheaper solution, but
require an analogue comparator.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
