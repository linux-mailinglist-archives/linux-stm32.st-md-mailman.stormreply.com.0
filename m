Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF9574EF44
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 14:48:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB55EC6B457;
	Tue, 11 Jul 2023 12:48:16 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18606C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689079695; x=1720615695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nee+8F3UgjHiHBrgA29lPenNEyq01aBvrZNu0iQvTPs=;
 b=NEmE17Tc0vIf1VBg7HnWuiBu+tSK8Jvwc78FqnXn3SaOQrR+VqYGz+L/
 NWtaQzticGj7fYslpsc6lvne5EiWvB42PDO2qvtyfmPXBpEo1PI+6mmta
 FZS4vDvMJBc8t2Li6j21wA2gTpC0RhZ++1NHd/hyjJ4zB+sQ+FDpUD40Q
 8ONL/PawXyWBASE/Q6YUHW/5v6huLdY3RaNesrMyV6mfQPwHy1tEK/Hba
 6c5fiTSqFRCAVqmmOKCivhpjCEzTRm0Gdpb4MUVxkk3CFOO2Brx8nXRMH
 VUZGx0GRi832FuXYVqgVYh7C77vnjG84kFYF1EEZ3uumM8c1bAYkEesO+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430694929"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="430694929"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="967787376"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="967787376"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jul 2023 05:48:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qJCmb-001qkh-0z; Tue, 11 Jul 2023 15:47:57 +0300
Date: Tue, 11 Jul 2023 15:47:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Message-ID: <ZK1PfXsUJipjcCH6@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
 <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
 <ZK03rBqoQ0IZz617@smile.fi.intel.com>
 <20230711120133.45drgk46y4cz7aut@mercury.elektranox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711120133.45drgk46y4cz7aut@mercury.elektranox.org>
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
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
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
Subject: Re: [Linux-stm32] [PATCH v2 05/15] spi: Remove code duplication in
 spi_add_device_locked()
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

On Tue, Jul 11, 2023 at 02:01:33PM +0200, Sebastian Reichel wrote:
> On Tue, Jul 11, 2023 at 02:06:20PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 06:16:22PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 06:49:22PM +0300, Andy Shevchenko wrote:

...

> > > > -	struct device *dev = ctlr->dev.parent;
> > > > -
> > > > -	/* Chipselects are numbered 0..max; validate. */
> > > > -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> > > > -		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
> > > > -			ctlr->num_chipselect);
> > > > -		return -EINVAL;
> > > > -	}
> > > > -
> > > > -	/* Set the bus ID string */
> > > > -	spi_dev_set_name(spi);
> > > 
> > > I see that this is duplicating spi_add_device() (and we really could do
> > > better with code sharing there I think) but I can't immediately see
> > > where the duplication that's intended to be elimiated is here - where
> > > else in the one call path that spi_add_device_locked() has would we do
> > > the above?  Based on the changelog I was expecting to see some
> > > duplicated code in the function itself.
> > 
> > Oh, by some reason Sebastian wasn't in this rather long Cc list.
> > Added him.
> > 
> > Reading again I don't see any useful explanation why that piece of code has to
> > be duplicated among these two functions. It's 100% a copy.
> > 
> > Sebastian, can you shed some light here?
> 
> The patch in this thread is obviously wrong. It results in the
> checks never beeing called for spi_add_device_locked(). The copy is
> in spi_add_device() and those two are not calling into each other.

Ah, now I see, I missed __ in the name.
Thank you for opening my eyes!

> But it should be fine to move the code to the start of
> __spi_add_device(), which allows removing the duplication. In that
> case the code will be run with the add_lock held, which is probably
> what I was worried about two years ago. Looking at it again, the
> lock is held anyways in case of spi_add_device_locked().

Right, I will re-do that.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
