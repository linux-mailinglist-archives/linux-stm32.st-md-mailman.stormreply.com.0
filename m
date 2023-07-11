Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E835474F36E
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 17:30:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94305C6B457;
	Tue, 11 Jul 2023 15:30:27 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB8EC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689089425; x=1720625425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WtKHEzd9TLb1fy9g0AvI3P/4wH5wHUCXn6+ARbR9U1s=;
 b=aHxo5lO7I6QXKDu21IKBmaPDi2NgG7KY6pKiYlC1+OWTU78g09sLyIIJ
 l5EBtZXT0YeOo299LtdFjOBIe877c68fj4/DuYtWr3XzSdab7GNp1adrL
 exFiVp8c07t5VJDEooQRglnSmL5M2BF60OwjKwxLkRsXYHPZCMjAc1HBh
 3cdnLR+vTNLcTQ5befzZO5lHnehqUxs+ESazcfJQdDjhDXAutjP+gB56w
 t6WtsP9xwvlCqed3Mt92ziGsFhYK2mRpezGaAMRjzwvDljjaQ1iAuu1vL
 E6Q7buJNTgmY9tH+bDS5yRI94Sh8JjKUPtMHz1N3c8CKoGIfOaaSzc/9x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="428346807"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="428346807"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="698462660"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="698462660"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP; 11 Jul 2023 08:30:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qJFJX-001swf-0G; Tue, 11 Jul 2023 18:30:07 +0300
Date: Tue, 11 Jul 2023 18:30:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZK11flZf/1grJ1Bd@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
 <ZK02efTYxV3czigr@smile.fi.intel.com>
 <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
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

On Tue, Jul 11, 2023 at 03:14:54PM +0100, Mark Brown wrote:
> On Tue, Jul 11, 2023 at 02:01:13PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 06:30:32PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:
> 
> > > > + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> 
> > > You didn't mention this bit in the changelog, and I'm not 100% convinced
> > > it was the best idea in the first place.  It's going to result in some
> > > very big timeouts if it goes off, and we really should be doing
> > > validation much earlier in the process.
> 
> > Okay, let's drop this change.
> 
> Like I say we *should* be fine with the refactoring without this, or at
> least if it's an issue we should improve the validation.

For the speeds < 1000 Hz, this change will lead to the div by 0 crash.
It seems that the current code which this one removes is better than
the spi_controller_xfer_timeout() provides.

If anything, the spi_controller_xfer_timeout() should be improved first.
So, for now I drop this for sure. Maybe in the future we can come back
to it.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
