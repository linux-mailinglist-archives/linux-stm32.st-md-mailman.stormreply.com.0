Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F774EC5F
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 13:12:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C940C6B457;
	Tue, 11 Jul 2023 11:12:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8D1DC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689073938; x=1720609938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=twR4kdv8R+UGB+uDynfbksgxMKi2k7OVYCc9yUjloq8=;
 b=jIzMuWNPXaS8H/Op/XT5BDeqm+c7DdfUuPZ1/zN8mfYM25YSnnCSHuYQ
 zlW8U7TezfloqaPAq9O7YhMoi/k4tHcJB69esvpdJT54CbdqylnmUCn7W
 Q4NSxE/BEDz1fdIn3o/tnP+bK9yQbO7gsxSHdlzqful3v6/vskCUBZyFE
 aMHXwxsdOitK/Kp9PImyn/jIUD7I3O+teoVF6DCnXbj5M2c5et0G0n6E1
 znDkRXXU0Wa7N6Zln38GGtE6C4bFU+dRpQflreyG4uZLj99XBmPKvjJA/
 Zi/BFgpJcCPUVfKOKkfLfGkJwfKa4zAIFVr+AGbzoRKgk94TltFIKmTUx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="362053711"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="362053711"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="845225511"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="845225511"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 04:12:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qJBHj-001pIO-15; Tue, 11 Jul 2023 14:11:59 +0300
Date: Tue, 11 Jul 2023 14:11:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZK04/8UQEaNinLoK@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <58c6f76a-8028-4ce8-a101-d5feb3b40897@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58c6f76a-8028-4ce8-a101-d5feb3b40897@sirena.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH v2 00/15] spi: Header and core clean up
	and refactoring
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

On Mon, Jul 10, 2023 at 06:31:12PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:17PM +0300, Andy Shevchenko wrote:
> > Various cleanups and refactorings of the SPI header and core parts
> > united in a single series. It also touches drivers under SPI subsystem
> > folder on the pure renaming purposes of some constants.
> 
> I've queued 1-3, 6-8 and 11- for CI thanks.

Thank you!
Do you think patch 9 deserves to be proceeded?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
