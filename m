Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE774EC51
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 13:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 156D7C6B457;
	Tue, 11 Jul 2023 11:10:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76C3CC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689073821; x=1720609821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pnPOejrtBmciSuneX2GIuca/d8m7aJiJ68yCzAIAa8Y=;
 b=DBQISlQ6Um2P5Nj3jFhDckSEjINUJ4cDrlZbu+EVKUn2NHgMQZ7L+3yw
 /oCOjzqO4gAEIwkIf0RvG8rIhcyFJ7hvsHVf9+ht+NAfEZMYe5UpOn5PS
 rHd4KLri9Cxzmsu7Sj+Xt3hX4Jc/uRFo0NtEea7M1rVT/P+UfZTZlu7fT
 Hgkvw0dvD/IIjowWi09TbMEEey6M5gluO0/4YH4Zl32I+i70K8xXL2IPk
 XByxcKcDczCiLzndgi8LYhqw//kfluXVeJU26Yu1CmYHMv/WgosrZEx+E
 h6LhNRl5anVyxsp0j853ArtgdRC7jpwWgCeEKc/FWA9RKXkDwHJJhagiY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344909474"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="344909474"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="834644461"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="834644461"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 04:10:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qJBFs-001pGf-16; Tue, 11 Jul 2023 14:10:04 +0300
Date: Tue, 11 Jul 2023 14:10:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZK04jEIo9ovLzF0e@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
 <da48f031-d93b-4a30-bad6-f80f58b35853@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da48f031-d93b-4a30-bad6-f80f58b35853@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Richard Cochran <richardcochran@gmail.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-trace-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 08/15] spi: Clean up headers
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

On Tue, Jul 11, 2023 at 09:26:46AM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:25PM +0300, Andy Shevchenko wrote:
> > There is a few things done:
> > - include only the headers we are direct user of
> > - when pointer is in use, provide a forward declaration
> > - add missing headers
> > - group generic headers and subsystem headers
> > - sort each group alphabetically
> 
> This breaks an x86 allmodconfig build:

Yeah, it was too brave to go. That's actually the answer why I left
mod_devicetable.h included. (However the mod_devicetable.h probably should
stay to be similar to i2c.h.

Let's postpone this one, but it's good to have the build report so we know
which drivers are missing GPIO header to be included.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
