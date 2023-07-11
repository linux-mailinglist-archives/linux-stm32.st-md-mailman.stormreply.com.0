Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D99274EC3F
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 13:06:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC045C6B457;
	Tue, 11 Jul 2023 11:06:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 674ABC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 11:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689073600; x=1720609600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RVFLgj8cxsWZyvySjgaprTvsCfpSOgqQ4kC3+s/s1Fk=;
 b=ebN7DF92pBUJJ4mzMbenRAkGfIFoL4T56t8L9eBkSLoCiVCNPbHM/zM3
 IcfJKU+xNIB9AHYBZGtCJ5KEmC/8GFhLDPmZm1xcaSESy6pPO7sAL/ptb
 bBAdSR1CDtttM/MNUBEG8VlslWooL4gYCYoK+vHC9hFMwjnApjy+JDKV9
 Ydrlf3XX4btz0DwMgpl5KsxmO7WAz9PjWNw2fRt8IMfa+50enq62tZl1u
 3TD+t1fck7lh0klBjVs6SP6qoPeqtHQSYeTbrkt4USDwZsjfHwiX9BUFI
 scrFMTtuVhQUmgiWwvQDsK9RQ/NsPI3V5mMLXZuo5Ni6eu/Jb2eLzeM7b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450950711"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="450950711"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="721057401"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="721057401"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 04:06:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qJBCG-001pDs-2n; Tue, 11 Jul 2023 14:06:20 +0300
Date: Tue, 11 Jul 2023 14:06:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Message-ID: <ZK03rBqoQ0IZz617@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
 <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
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

On Mon, Jul 10, 2023 at 06:16:22PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:22PM +0300, Andy Shevchenko wrote:
> > Seems by unknown reason, probably some kind of mis-rebase,
> > the commit 0c79378c0199 ("spi: add ancillary device support")
> > adds a dozen of duplicating lines of code. Drop them.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/spi/spi.c | 11 -----------
> >  1 file changed, 11 deletions(-)
> > 
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index c99ee4164f11..46cbda383228 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -712,17 +712,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
> >  static int spi_add_device_locked(struct spi_device *spi)
> >  {
> >  	struct spi_controller *ctlr = spi->controller;
> > -	struct device *dev = ctlr->dev.parent;
> > -
> > -	/* Chipselects are numbered 0..max; validate. */
> > -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> > -		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
> > -			ctlr->num_chipselect);
> > -		return -EINVAL;
> > -	}
> > -
> > -	/* Set the bus ID string */
> > -	spi_dev_set_name(spi);
> 
> I see that this is duplicating spi_add_device() (and we really could do
> better with code sharing there I think) but I can't immediately see
> where the duplication that's intended to be elimiated is here - where
> else in the one call path that spi_add_device_locked() has would we do
> the above?  Based on the changelog I was expecting to see some
> duplicated code in the function itself.

Oh, by some reason Sebastian wasn't in this rather long Cc list.
Added him.

Reading again I don't see any useful explanation why that piece of code has to
be duplicated among these two functions. It's 100% a copy.

Sebastian, can you shed some light here?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
