Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A992C9818B
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 16:49:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16F19C2909A;
	Mon,  1 Dec 2025 15:49:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04D23C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764604182; x=1796140182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1c9J4q1neG1gudKs5OVJ1JNCeSTxftP6emxXSKcTElw=;
 b=BzgJb0+iXIKy86h0SUbfKV/Af6fPFdgqbNfCvwmJq4Yw/4Zs4VoySZPL
 u8tl1UK6TZQElW4DNHBPgusJHE2FhC6v3QM47upxvzrzm6+TxpoO6qbmT
 YEKHcOysUZtsk4UIADMiZwUmbmi+AEQoCOgDOh5Byvl2T/6PYMn3l4ool
 W494zgjtDa0jsc9b18iBvtVHmjkh2U2uBoMnFYjacCOp/IyhEhe4rC+ub
 8JWK0UOlERWzEpf6fSftrmVWmpG/502Bt7NYo1Add/KVyCZ0VwXjnpkxz
 inJknX0DGNxgvOc4/DRSHJC+gvMsAvJo+DblNuE86P/Q4hlesVux5z8Kr w==;
X-CSE-ConnectionGUID: sCwhUMccRJ6PDDwUrTaFdA==
X-CSE-MsgGUID: dS5mgPfmQAOy/DCjZmWquA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="83939836"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="83939836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 07:49:39 -0800
X-CSE-ConnectionGUID: 4pEW9aM1QU+ohR0hYSrNMg==
X-CSE-MsgGUID: dd6uz1+4QC+N72HOYq53oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194531575"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 07:49:27 -0800
Date: Mon, 1 Dec 2025 17:49:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <aS25Beoq8YWfqLzU@smile.fi.intel.com>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-phy@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 linux-hwmon@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] iio: inkern: Use namespaced exports
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

On Mon, Dec 01, 2025 at 11:59:43AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.

Thanks! You probably also want to explain that due to nature of the change
it may not be split to a separate patches.

...

So far we have IIO_BACKEND and IIO_GTS_HELPER, this one introduces
IIO_CONSUMER. I have briefly looked at the names of the APIs and taking into
account that they are all in inkern.c with the consumer.h header to provide
an API for the users. That said, I found the choice and implementation sane
and consistent. If we need any changes in the future it will require anyway
more than just namespace shuffling.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
