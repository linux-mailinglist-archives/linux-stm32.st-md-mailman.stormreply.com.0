Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0F74D5C5
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 14:38:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47882C6B457;
	Mon, 10 Jul 2023 12:38:14 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00A4EC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688992693; x=1720528693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2I7Ns5P9Fqk5itIQUPMwgPj6Db+DdMBwViqY3DgUc6U=;
 b=Uj6CpEVkxCgemU0TKZNq2lJyYw/admV6EsHehGtNOf6Giqjh1HaA7IR0
 dngi/m1fknQ/TGtFeLqu2I8Kr47sQeIskLyYcFqIzT89EnpFLGj/2HqZz
 /7yQUfyDoVDNOAIzMsnKIDBZ3EEghxC4dwEY1ZwiyEnKpq8A3lxn4BCBi
 njILngPq5pHpu7+ztf+tEJjIM+koAhdPNPFRc31FINKR+9P1OhmjmC3vw
 5e/c9QdXfmz6aO+BaNm5f1pjNfmjjLRGcOlMXebrdJyOSwKqrgTnVq+tL
 vF5lMWOixSqC6nGkNXnLow1jijHO7ezVHSNAfnYKkeM3Ijs5D6/D5i7La w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="428025535"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="428025535"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 05:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755983743"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755983743"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 05:38:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qIq9Q-001YUr-0L; Mon, 10 Jul 2023 15:38:00 +0300
Date: Mon, 10 Jul 2023 15:37:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
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

On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > > > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> 
> > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > and kill the not used anymore definitions.
> 
> > > > The above is not what this change does:
> 
> > > How to improve it? I was sure that the form of "converting to something and
> > > something" is clear...
> 
> > A wild guess, maybe you meant to split to two changes, one per each macro group?
> 
> No, doing TX and RX in one commit is fine.

No, I meant one per _NO_ and _MUST_.

> > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> 
> What part of the above change is replacing _NO_ with _MUST_?

None, that's why assuming the split by name should be fine.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
