Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD874EC11
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 12:58:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F28FDC6B457;
	Tue, 11 Jul 2023 10:58:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4E0CC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689073110; x=1720609110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lIHyBeHEaNenp9Q/l2JAcaQuyI3ymSNUAckdiFell2M=;
 b=lRABrF/cEY7nQUciARdU5300ecSA5i9ZC5WfrB4esC41QT63wjJrX8Sl
 ZEpWH/fDLzarEsVacn/ZlKrpGbYM1bSESL8cv4fGfWB67/JkMhQmdZX5c
 Vb+C7FXCB0ZHRhGLiqqhJh+dYio41I0XF7q1YfhtqoAkY/3/LDcJ/vz/+
 bJYiaiHJpHMn5vDnlFumsO3z+Hv2hOSR5v2ODBfL7rBcBbv0rFfzVEv8f
 59WCefD2GURzfG8no6d9B9JpgrcRPVpEN2gxxDB1cr8nJHI/v8OT5s3tw
 SUR8uUuANhFK7JD+CoNJVadPXamN1ehrLBQa6DJro4NARCMX2AvTB4Eiu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368087279"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="368087279"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724404293"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="724404293"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 03:58:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qJB4O-001p51-1q; Tue, 11 Jul 2023 13:58:12 +0300
Date: Tue, 11 Jul 2023 13:58:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZK01xAqLc8AGFDo/@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-3-andriy.shevchenko@linux.intel.com>
 <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH v2 02/15] spi: Drop duplicate IDR
 allocation code in spi_register_controller()
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

On Mon, Jul 10, 2023 at 06:09:00PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:19PM +0300, Andy Shevchenko wrote:
> 
> > Refactor spi_register_controller() to drop duplicate IDR allocation.
> > Instead of if-else-if branching use two sequential if:s, which allows
> > to re-use the logic of IDR allocation in all cases.
> 
> For legibility this should have been split into a separate factoring out
> of the shared code and rewriting of the logic, that'd make it trivial to
> review.

Should I do that for v3?

> > -		mutex_lock(&board_lock);
> > -		id = idr_alloc(&spi_master_idr, ctlr, first_dynamic,
> > -			       0, GFP_KERNEL);
> > -		mutex_unlock(&board_lock);
> > -		if (WARN(id < 0, "couldn't get idr"))
> > -			return id;
> > -		ctlr->bus_num = id;
> > +		status = spi_controller_id_alloc(ctlr, first_dynamic, 0);
> > +		if (status)
> > +			return status;
> 
> The original does not do the remapping of return codes that the previous
> two copies do...

Yes, I had to mention this in the commit message that in my opinion this makes
no difference. With the dynamically allocated aliases the absence of the slot
has the same effect as in the other cases.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
