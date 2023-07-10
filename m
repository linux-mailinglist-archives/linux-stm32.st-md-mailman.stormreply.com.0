Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5C74D7A7
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 15:32:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 741F0C6B457;
	Mon, 10 Jul 2023 13:32:25 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B81C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688995944; x=1720531944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PcgdfCqBIbPTu4JqQZu5q+HYQGpr7DWOm49hDVjk5i0=;
 b=M+b6XZw/OXehX/c3Cmi09IN8iTHYBE7Cb5JC+4vQXidDgFRQzLLvHMwV
 eaZj7KcHS3qPMrHWmj/0XNeqJKp0OBwHwoTijRvw062MlU505sNmT6vzH
 gY6b9gJLvBZVvkbLmwuUNpm4Qcvp+PGpWcSctvYUtgHxf9Ops/cL+JAHe
 aK2qYW8ZBzFpjLokUrqE0LQfqUfSPbcqM2O7vcxqkBT++GFx3ypUIBXXN
 mlKtEtXxNfjL4P0fGo1aGqRuFblZIgnFNzYRRtM3ZgaIENJzg+MO0KHds
 qIiviU+tXXqwheLNEPcaw3eh+mOy8TFxZMofkKrvXSMDOWzm6TCZbEIGy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428037968"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="428037968"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 06:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="790802176"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="790802176"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 06:32:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qIqzq-001Z8L-0E; Mon, 10 Jul 2023 16:32:10 +0300
Date: Mon, 10 Jul 2023 16:32:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZKwIWUeqD/otnSFM@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
 <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
 <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Kris Bahnsen <kris@embeddedts.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 4/8] spi: Get rid of old
 SPI_MASTER_NO_.X and SPI_MASTER_MUST_.X
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

On Mon, Jul 10, 2023 at 02:21:05PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 03:37:59PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:

...

> > > > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > > > and kill the not used anymore definitions.

...

> > > > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> 
> > > What part of the above change is replacing _NO_ with _MUST_?
> 
> > None, that's why assuming the split by name should be fine.
> 
> That's what the above changelog sounds like it's trying to do (I'm not
> sure the change itself makes sense but the first thing I ran into when
> reviewing the patch), AFIACT you're missing a "from" in the changelog?

I see, I will elaborate better in v2.
But still, I will split on per macro and add one for GPIO_SS.
Seems to me better that way.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
