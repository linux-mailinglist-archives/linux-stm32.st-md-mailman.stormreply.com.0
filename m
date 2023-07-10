Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15574D467
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 13:19:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41B73C6B457;
	Mon, 10 Jul 2023 11:19:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DC51C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688987995; x=1720523995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h3akaffE4c4ikxI/bpe287xBwIcWxxQpigcUNq0Wefs=;
 b=Fxe/LG2sA+n6eQrW/zkyPTAGtYbU1EebPcCtlQ75l3yXwj/WG5vyO6Pq
 vNDbbE5qXr/2H8BFbdqiy1E4h+QYDxKuJlpUT4wjUjeO5rjhnoGnpMfv0
 AtllPmJvUIXS0IluEGGigVRUPPcjrdI2HGzN9EYxaearmTPxCXArSHrxA
 iSqzbpA3swFxyddzZZezlcm5XQf8HYclSjxbFRKOQ6JZ8hWhfbmP/04HN
 VoDVp424sAPWS0buotG1YMalet2J4srwbUijWS3NJgodg+m2Z/35Vza+V
 nWWwrP4lC4t/Ysd0jvT0lBizg32sdxHEUlxPsU6izJqDISdNxyMm2OXrV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="343910844"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="343910844"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 04:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="720666509"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="720666509"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 04:19:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qIovf-001XRG-1b; Mon, 10 Jul 2023 14:19:43 +0300
Date: Mon, 10 Jul 2023 14:19:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZKvpT9M5B8QmyGo+@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <bb3b9ef2-0a32-4f8a-8d92-06d47875b562@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb3b9ef2-0a32-4f8a-8d92-06d47875b562@sirena.org.uk>
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

On Mon, Jul 10, 2023 at 12:10:03PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> > > 
> > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > and kill the not used anymore definitions.
> 
> > > The above is not what this change does:
> 
> > How to improve it? I was sure that the form of "converting to something and
> > something" is clear...
> 
> > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> 
> The change here is not the change that is described above.

Okay, than you for elaboration and review. With the assumed split it should be
addressed. Besides that, should I resend the entire series or only this one?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
