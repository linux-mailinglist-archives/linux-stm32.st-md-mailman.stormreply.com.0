Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16774D7E2
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 15:37:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF21CC6B457;
	Mon, 10 Jul 2023 13:37:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56A79C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688996225; x=1720532225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HA2So+NjBTWAY2fjVnTJJii4ARFTRIerq07ZS5EB7BI=;
 b=KfZPMRJNBQU17/B8gXME+aw9WeAsrodvag7qG0hSSCJxy+Uw22gSJvci
 FM1tSrbZabz9tfS66INeCKkLiDZuaRrEjon+HvsmZKPh5IyducGPf+qe9
 77uaqgvdFQay2zhg1BWxeUBJ0RSq50pnH/pNGFza7+5FJrkHEbRby6MVq
 61l2yONai77+joX/PDd8vHTeu4ah9fKSuWoGALNYogFfwRBgpQXR497R6
 4oZd401ueSAkC//s1BuyzfhaCL1hb1urMHBx+FfIq69GqBzI1+RlYrwpV
 gLpZtIzNgAqVcUXy2iM5INn7ESriumxOP41Xz/b0W5ZivNQ17gdIAr21i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450701148"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="450701148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 06:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894774244"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="894774244"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP; 10 Jul 2023 06:36:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qIr4P-001ZC8-1X; Mon, 10 Jul 2023 16:36:53 +0300
Date: Mon, 10 Jul 2023 16:36:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Kris Bahnsen <kris@embeddedts.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Message-ID: <ZKwJdb0rJCmH5cBA@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Richard Cochran <richardcochran@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v1 0/8] spi: Header and core clean up and
	refactoring
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

On Mon, Jul 10, 2023 at 01:27:43PM +0300, Andy Shevchenko wrote:
> Various cleanups and refactorings of the SPI header and core parts
> united in a single series.
> 
> Patches 1 & 2, 5 & 6 & 8 are dependent inside each group.
> 
> No functional change intended.

I will resend the entire series.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
